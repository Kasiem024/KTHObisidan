#
# Test-ScriptHygiene.ps1 - checks this folder against the rules .kiro/steering/scripts.md sets
# for it. The rules were documented and unenforced, and one of them was already broken: line 1
# of Vault-Audit.ps1 carried an em dash (3 bytes, in a comment) for as long as the file existed.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail    show every check, not only the failures
#
# WHAT THIS CHECKS, and what each check is worth
#   ascii        Every .ps1 is pure ASCII. PowerShell 5.1 reads .ps1 as ANSI, so a Swedish
#                literal in the source silently matches nothing (traps T1). HARD rule.
#                The Templater .js files are deliberately exempt: Obsidian reads them as UTF-8
#                and three of them legitimately contain Swedish (71, 25 and 19 non-ASCII bytes).
#   encoding     .ps1 files are LF with no BOM, like the rest of the repo.
#   header       The file states WHAT ITS NUMBERS MEAN in a header comment, not just what it
#                does (scripts.md rule 2). Checked by looking for a `# WHAT THIS`/`# WHAT IT`
#                block - presence, not quality.
#   rootParam    A script that scans the vault takes -Root, so it can be pointed at a copy.
#                Test-*.ps1 are exempt: they build their own throwaway vault under %TEMP%.
#   exitCodes    Contains an explicit `exit 0`, and its exit convention matches the row it has
#                in scripts.md: a script with `exit 1` must not be documented as "always 0".
#   indexed      Every file here is named in scripts.md, and every script scripts.md names
#                still exists. Drift in either direction is a finding (scripts.md rule 5).
#
#   Writes are REPORTED, not judged. Static analysis cannot prove a write sits behind a switch,
#   so the write calls in each file are listed for a human to eyeball rather than pretending to
#   verify scripts.md rule 3. A check that claims more than it verified is worse than no check -
#   that is the lesson of the write hook that measured the wrong file.
#
# READ-ONLY. It opens files and never writes one.
#
# Exit 0 = clean, 1 = at least one finding.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI.
#
param(
  [switch]$Detail
)
$ErrorActionPreference = 'Stop'

$dir = $PSScriptRoot
$d = Get-Item -LiteralPath $dir
while ($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))) { $d = $d.Parent }
if (-not $d) { throw "vault root (folder containing KTH) not found above $dir" }
$root = $d.FullName
$indexFile = Join-Path $root '.kiro\steering\scripts.md'
if (-not (Test-Path -LiteralPath $indexFile)) { throw "index not found: $indexFile" }
$index = [System.IO.File]::ReadAllText($indexFile, [System.Text.Encoding]::UTF8)

$findings = New-Object System.Collections.Generic.List[string]
$passes   = New-Object System.Collections.Generic.List[string]
$writes   = New-Object System.Collections.Generic.List[string]

function Add-Finding([string]$file, [string]$check, [string]$why) {
  $findings.Add(("  {0,-12} {1,-30} {2}" -f $check, $file, $why)) | Out-Null
}
function Add-Pass([string]$file, [string]$check, [string]$what) {
  $passes.Add(("  {0,-12} {1,-30} {2}" -f $check, $file, $what)) | Out-Null
}

$files = @(Get-ChildItem -LiteralPath $dir -File | Sort-Object Name)
$ps1   = @($files | Where-Object { $_.Extension -eq '.ps1' })

Write-Output "=== SCRIPT HYGIENE  $(Get-Date -Format 'yyyy-MM-dd HH:mm') ==="
Write-Output "folder: $dir"
Write-Output ("files: {0} total, {1} .ps1" -f $files.Count, $ps1.Count)
Write-Output ""

foreach ($f in $files) {
  $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
  $nonAscii = @($bytes | Where-Object { $_ -gt 127 }).Count
  $hasBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
  $text = (New-Object System.Text.UTF8Encoding($false)).GetString($bytes)
  $crlf = [regex]::Matches($text, "`r`n").Count

  # indexed - applies to every file in the folder, generated artifacts included
  if ($index.Contains($f.Name)) { Add-Pass $f.Name 'indexed' 'named in scripts.md' }
  else { Add-Finding $f.Name 'indexed' 'not named in .kiro/steering/scripts.md (rule 5)' }

  if ($f.Extension -ne '.ps1') {
    if ($f.Extension -eq '.js') { Add-Pass $f.Name 'ascii' ("exempt (Templater, UTF-8) - " + $nonAscii + " non-ASCII bytes") }
    continue
  }

  if ($nonAscii -eq 0) { Add-Pass $f.Name 'ascii' 'pure ASCII' }
  else {
    $at = -1
    for ($i = 0; $i -lt $bytes.Length; $i++) { if ($bytes[$i] -gt 127) { $at = $i; break } }
    Add-Finding $f.Name 'ascii' ("$nonAscii non-ASCII byte(s), first at offset $at - PowerShell 5.1 reads .ps1 as ANSI (T1)")
  }

  if (-not $hasBom -and $crlf -eq 0) { Add-Pass $f.Name 'encoding' 'LF, no BOM' }
  else { Add-Finding $f.Name 'encoding' ("bom=$hasBom crlf=$crlf - expected LF and no BOM") }

  if ($text -match '(?m)^#\s+WHAT (THIS|IT)') { Add-Pass $f.Name 'header' 'declares what its numbers mean' }
  else { Add-Finding $f.Name 'header' 'no "# WHAT THIS ..." header block (rule 2)' }

  $isHarness = $f.Name -like 'Test-*'
  if ($isHarness) {
    Add-Pass $f.Name 'rootParam' 'exempt - builds its own vault under %TEMP%'
  } elseif ($text -match '\[string\]\$Root') {
    Add-Pass $f.Name 'rootParam' 'takes -Root'
  } else {
    Add-Finding $f.Name 'rootParam' 'no -Root parameter, so it cannot be run against a copy'
  }

  $hasExit0 = [regex]::IsMatch($text, '(?m)^\s*exit 0')
  $hasExit1 = [regex]::IsMatch($text, '(?m)^\s*exit 1')
  if (-not $hasExit0) {
    Add-Finding $f.Name 'exitCodes' 'no explicit "exit 0" (rule 4)'
  } else {
    # the row this script has in the index, if any
    $row = ''
    foreach ($line in ($index -split "`n")) { if ($line.Contains($f.Name) -and $line.Contains('|')) { $row = $line; break } }
    if ($row -eq '') {
      Add-Pass $f.Name 'exitCodes' 'explicit exit 0 (no table row to cross-check)'
    } elseif ($hasExit1 -and $row -match 'always 0') {
      Add-Finding $f.Name 'exitCodes' 'contains "exit 1" but scripts.md documents it as always 0'
    } elseif ((-not $hasExit1) -and ($row -notmatch 'always 0')) {
      Add-Finding $f.Name 'exitCodes' 'never exits 1, but scripts.md documents a failure code'
    } else {
      Add-Pass $f.Name 'exitCodes' 'exit convention matches its scripts.md row'
    }
  }

  # A file's own detector pattern would match every token in it, so skip self-analysis here.
  if ($f.Name -eq $MyInvocation.MyCommand.Name) {
    $writes.Add(("  {0,-30} self - not scanned (its own pattern lists these verbs)" -f $f.Name)) | Out-Null
  } else {
    $wc = @([regex]::Matches($text, 'WriteAllText|WriteAllLines|WriteAllBytes|Set-Content|Add-Content|Out-File|Remove-Item|Move-Item|Copy-Item'))
    if ($wc.Count -gt 0) {
      $kinds = ($wc | ForEach-Object { $_.Value } | Sort-Object -Unique) -join ', '
      $writes.Add(("  {0,-30} {1,3} call(s): {2}" -f $f.Name, $wc.Count, $kinds)) | Out-Null
    }
  }
}

# the other direction: a script the index names that is not here any more. The negative
# lookahead matters - without it `sr-baseline.json` in the prose matched as `sr-baseline.js`
# and the check invented a missing file.
foreach ($m in [regex]::Matches($index, '[A-Za-z0-9\-]+\.(ps1|js)(?![\w])')) {
  $name = $m.Value
  if (-not (Test-Path -LiteralPath (Join-Path $dir $name))) {
    Add-Finding $name 'indexed' 'named in scripts.md but not present in this folder'
  }
}

if ($Detail) {
  Write-Output "--- checks that passed ---"
  foreach ($p in $passes) { Write-Output $p }
  Write-Output ""
}

Write-Output "--- files that write something (reported, not judged) ---"
if ($writes.Count -eq 0) { Write-Output "  none" }
foreach ($w in $writes) { Write-Output $w }
Write-Output ""

if ($findings.Count -gt 0) {
  Write-Output "--- findings ---"
  foreach ($x in $findings) { Write-Output $x }
  Write-Output ""
  Write-Output ("RESULT: {0} finding(s) across {1} file(s)." -f $findings.Count, $files.Count)
  exit 1
}
Write-Output ("RESULT: clean - {0} files, {1} checks passed, no deviation from scripts.md." -f $files.Count, $passes.Count)
exit 0
