#
# Test-SRIntegrity.ps1 - proves every check in Get-SRIntegrity.ps1 still fires.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Keep     leave the throwaway vault in place for inspection
#
# WHAT THIS PROVES
#   Same shape as Test-VaultAudit.ps1: build a throwaway vault under %TEMP%, take a baseline,
#   prove an untouched vault compares clean, then plant exactly one deliberate defect at a time
#   and require the script to report it and exit 1.
#
#   The defects are the ones that have actually happened in this vault, or that the script was
#   extended to catch because nothing else could see them:
#     1  a marker copied onto a reworded question - every count stays identical
#     2  `nosr` added to a deck - every count stays identical and the deck empties (F64, F69)
#     3  a card deleted - the per-file line has to name the file
#     4  an <!--SR:--> comment stripped
#     5  a real review - the marker text changes on the SAME card, which must NOT be reported
#        as a moved marker. A check that fires on an ordinary review would be turned off.
#     6  -SelfTest itself (LF/CRLF pattern parity, marker pairing, nosr frontmatter capture)
#
#   Assertion 2b is the point of the whole exercise: it asserts that the CARD COUNTS did not
#   move while the deck emptied. That is the state a totals-only fingerprint reported as clean.
#
# It runs the script from a COPY inside the throwaway directory, because -Save writes
# sr-baseline.json next to the script. That keeps the real baseline untouched.
#
# READ-ONLY with respect to the vault: it never opens it. Everything happens under %TEMP%.
#
# Exit 0 = all assertions pass, 1 = at least one failed.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI.
#
param(
  [switch]$Keep
)
$ErrorActionPreference = 'Stop'
$started = Get-Date

$src = Join-Path $PSScriptRoot 'Get-SRIntegrity.ps1'
if (-not (Test-Path -LiteralPath $src)) { throw "Get-SRIntegrity.ps1 not found next to this script" }

$work  = Join-Path $env:TEMP ("sr-selftest-" + [guid]::NewGuid().ToString('N').Substring(0, 8))
$vault = Join-Path $work 'vault'
$note  = Join-Path $vault 'KTH\2026 Host\XX1234 Kurs\Anteckningar\Deck.md'
New-Item -ItemType Directory -Force -Path (Split-Path $note) | Out-Null
$script = Join-Path $work 'Get-SRIntegrity.ps1'
Copy-Item -LiteralPath $src -Destination $script
$enc = New-Object System.Text.UTF8Encoding($false)

# The fixture note. ASCII only, and deliberately one of each card type.
$base = @(
  '---', 'tags: [begrepp, XX1234]', 'description: "x"', '---', '# Deck', '',
  '## Del ett', '',
  'Fraga A::Svar A',
  '<!--SR:!2026-09-10,3,250-->', '',
  '**Term B**;;Svar B',
  '<!--SR:!2026-09-11,4,260-->', '',
  'Lista? (2)', '||', '- ett', '- tva',
  '<!--SR:!2026-09-12,5,270-->', ''
)

function Set-Note([string[]]$lines) {
  [System.IO.File]::WriteAllText($note, (($lines -join "`n") + "`n"), $enc)
}
function Invoke-SR([string[]]$extra) {
  $out = & powershell -NoProfile -ExecutionPolicy Bypass -File $script -Root $vault @extra 2>&1
  return @{ code = $LASTEXITCODE; text = ($out -join "`n") }
}

$rows = New-Object System.Collections.Generic.List[string]
$fails = 0
function Assert([string]$name, [bool]$pass, [string]$detail) {
  if ($pass) { $script:rows.Add(("  PASS  {0,-48} {1}" -f $name, $detail)) | Out-Null }
  else       { $script:rows.Add(("  FAIL  {0,-48} {1}" -f $name, $detail)) | Out-Null; $script:fails++ }
}

Write-Output "Test-SRIntegrity - throwaway vault at $vault"
Write-Output ""

# 0 - baseline, and a clean compare
Set-Note $base
$r = Invoke-SR @('-Save')
Assert 'baseline is written' (($r.code -eq 0) -and ($r.text -match 'baseline saved')) ("exit=" + $r.code)
$r = Invoke-SR @('-Compare')
Assert 'untouched vault compares clean' (($r.code -eq 0) -and ($r.text -match 'RESULT: clean')) ("exit=" + $r.code)

# 1 - a marker left in place while its question is replaced
$moved = $base.Clone()
$moved[8] = 'Helt ny fraga X::Nytt svar X'
Set-Note $moved
$r = Invoke-SR @('-Compare')
Assert 'marker moved to another card is reported' (($r.code -eq 1) -and ($r.text -match 'MOVED TO A DIFFERENT CARD')) ("exit=" + $r.code)

# 2 - nosr added: cards intact, deck emptied
$nosr = $base.Clone()
$nosr[1] = 'tags: [begrepp, XX1234, nosr]'
Set-Note $nosr
$r = Invoke-SR @('-Compare')
Assert 'nosr added is reported as deck-scope drift' (($r.code -eq 1) -and ($r.text -match 'deck\.activeCards') -and ($r.text -match 'deck\.nosrNotes')) ("exit=" + $r.code)
Assert '  while every card count stayed identical' ($r.text -notmatch 'CHANGED studyNotes\.card_') 'this is what a totals-only check called clean'

# 3 - a card deleted
$del = @($base[0..7]) + @($base[11..18])
Set-Note $del
$r = Invoke-SR @('-Compare')
Assert 'deleted card is reported, per file, by name' (($r.code -eq 1) -and ($r.text -match 'Deck\.md: cards')) ("exit=" + $r.code)

# 4 - a marker stripped
$strip = @($base | Where-Object { $_ -notmatch '2026-09-11' })
Set-Note $strip
$r = Invoke-SR @('-Compare')
Assert 'stripped <!--SR:--> is reported' (($r.code -eq 1) -and ($r.text -match 'raw_srComments')) ("exit=" + $r.code)

# 5 - an ordinary review must not look like a transplant
$review = $base.Clone()
$review[9] = '<!--SR:!2026-10-01,7,250-->'
Set-Note $review
$r = Invoke-SR @('-Compare')
Assert 'a review is NOT reported as a moved marker' ($r.text -notmatch 'MOVED TO A DIFFERENT CARD') 'false-positive guard'

# 6 - a file with exactly ONE marker must yield exactly one pair. PowerShell unrolls a returned
#     list, so without @() the single pair arrived as a bare hashtable whose .Count is 2 (its key
#     count) and every placement total was inflated - 1574 reported against 1421 real pairs.
$one = @('---', 'tags: [begrepp, XX1234]', 'description: "x"', '---', '# Deck', '', 'Bara en::Ett svar', '<!--SR:!2026-09-10,3,250-->', '')
Set-Note $one
$r = Invoke-SR @()
$m = [regex]::Match($r.text, 'markers placed on cards\s+(\d+)')
$placed = -1
if ($m.Success) { $placed = [int]$m.Groups[1].Value }
Assert 'one marker in a file counts as one pair' ($placed -eq 1) ("reported $placed")

# 7 - the script's own pattern self-test
Set-Note $base
$r = Invoke-SR @('-SelfTest')
Assert 'Get-SRIntegrity -SelfTest passes' (($r.code -eq 0) -and ($r.text -match 'self-test clean')) ("exit=" + $r.code)

foreach ($l in $rows) { Write-Output $l }
Write-Output ""
Write-Output ("-" * 88)
$took = [math]::Round(((Get-Date) - $started).TotalSeconds, 1)
Write-Output ("{0} assertions, {1} failed, {2} s" -f $rows.Count, $fails, $took)
Write-Output ""

if ($Keep) { Write-Output "kept: $work" } else { Remove-Item -Recurse -Force $work }

if ($fails -gt 0) {
  Write-Output "RESULT: $fails assertion(s) failed. A check in Get-SRIntegrity.ps1 no longer fires,"
  Write-Output "        which means a -Compare that says clean is not evidence of anything."
  exit 1
}
Write-Output "RESULT: all $($rows.Count) assertions pass. Counts, per-file counts, deck scope and"
Write-Output "        marker placement each fire on a deliberate defect, and an ordinary review"
Write-Output "        does not trip any of them."
exit 0
