# Get-DeckPairCensus.ps1
#
# WHAT IT COUNTS, and what the numbers mean:
#
#   For ONE course chapter, it locates the two files that chapter owns - the flashcard deck
#   ("<CODE> Begrepp - Kap NN ...") and the exam-answer note ("<CODE> Tentafragor och Svar - Kap NN ...")
#   - and reports, per file:
#
#     cards single    lines containing '::'  (single-line, one-directional card)
#     cards reversed  lines containing ';;'  (single-line, REVERSED - two schedules per card)
#     cards multi     lines that ARE exactly '||' or '??' (multi-line card separators)
#     cards total     the sum of the three above
#     SR markers      occurrences of the literal '<!--SR:' - live review schedule state
#     CR chars        occurrences of carriage return; non-zero means the file is CRLF
#     lines           physical line count, for the 150-250 line target on notes
#     double blanks   runs of two or more consecutive blank lines (the MD012 signature)
#
#   The card counts are deliberately the SAME arithmetic the authoring workflow uses. They are counted
#   per LINE, so one line is one card - that is intentional for this vault's syntax.
#   This script does NOT judge the count against a target. The 40-60 cards per deck agreed on
#   2026-09-09 was superseded on 2026-09-26: the rule is now "as few as possible, as concentrated on
#   the exam questions as possible", and 40 is not a floor. See .kiro/steering/product.md. The 150-250
#   line target for the exam-answer NOTE still stands.
#
#   IN SCOPE: exactly two files, both named in the output. Everything else in the vault is ignored.
#   This answers "are these two files in the shape I think they are", not "is the vault healthy".
#
# WHY IT EXISTS: two chapters of exam material were measured by hand and the numbers disagreed. It also
#   enforces traps.md T19 - a filter without the course code matches a second course, and -First 1 then
#   silently measures the wrong file. This script puts the course code in the filter, REFUSES to guess
#   when a pattern matches more than one file, and PRINTS THE RESOLVED FILENAME next to the numbers.
#
# WHAT IT DOES NOT DO: it does not judge. A deck of 90 cards and a note of 900 lines produce a clean
#   exit. Card and marker drift across the whole vault belongs to Get-SRIntegrity.ps1; Markdown syntax
#   belongs to markdownlint. This is a per-pair sanity check, nothing more.
#
# EXIT: 0 when both files were resolved and measured. 1 when either could not be resolved
#   unambiguously - zero matches or several - which is the only thing this script can call wrong.
#
# Pure ASCII on purpose: PowerShell 5.1 reads .ps1 as ANSI, so Swedish literals here would match
# nothing (traps.md T1). The note filename contains 'Tentafragor' with an a-ring, so the filter
# wildcards across that character instead of spelling it.

[CmdletBinding()]
param(
  [string]$Root,
  [Parameter(Mandatory = $true)][string]$Course,
  [Parameter(Mandatory = $true)][string]$Chapter,
  [string]$OutFile
)

if (-not $Root -or $Root -eq '') {
  # This script lives in <root>\Meta\Obsidian Plugins\Scripts, so the root is four levels up.
  $Root = Split-Path -Parent $PSCommandPath           # ...\Scripts
  $Root = Split-Path -Parent $Root                    # ...\Obsidian Plugins
  $Root = Split-Path -Parent $Root                    # ...\Meta
  $Root = Split-Path -Parent $Root                    # vault root
}
# Canonicalise before any path arithmetic - an 8.3 short-name root shifts every derived
# path segment and silently skips files (traps.md T10).
$Root = (Get-Item -LiteralPath $Root).FullName

$searchRoot = Join-Path $Root 'KTH'
if (-not (Test-Path -LiteralPath $searchRoot)) {
  Write-Output ('ERROR: no KTH folder under ' + $Root)
  exit 1
}

$deckPattern = $Course + ' Begrepp - Kap ' + $Chapter + '*.md'
$notePattern = $Course + ' Tentafr*Kap ' + $Chapter + '*.md'

$deckHits = @(Get-ChildItem -LiteralPath $searchRoot -Recurse -File -Filter $deckPattern)
$noteHits = @(Get-ChildItem -LiteralPath $searchRoot -Recurse -File -Filter $notePattern)

# Resolution is checked here, not in a helper. A function that both prints and returns would
# fold its own messages into the return value, so the failure path would hand back a string
# instead of nothing - and the caller's null check would pass.
$failed = $false
foreach ($probe in @('deck', 'note')) {
  if ($probe -eq 'deck') { $hits = $deckHits; $pattern = $deckPattern }
  else { $hits = $noteHits; $pattern = $notePattern }
  if ($hits.Count -eq 0) {
    Write-Output ('ERROR: no ' + $probe + ' matched ' + $pattern)
    $failed = $true
  }
  elseif ($hits.Count -gt 1) {
    Write-Output ('ERROR: ' + $hits.Count + ' files matched ' + $pattern + ' - refusing to guess:')
    foreach ($h in $hits) { Write-Output ('       ' + $h.Name) }
    $failed = $true
  }
}
if ($failed) { exit 1 }

$deck = $deckHits[0]
$note = $noteHits[0]

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add('deck = ' + $deck.Name)
$lines.Add('note = ' + $note.Name)

$single = 0; $reversed = 0; $multi = 0
foreach ($ln in [System.IO.File]::ReadAllLines($deck.FullName)) {
  if ($ln -eq '||' -or $ln -eq '??') { $multi++ }
  elseif ($ln.Contains(';;')) { $reversed++ }
  elseif ($ln.Contains('::')) { $single++ }
}
$lines.Add('deck cards: single=' + $single + ' reversed=' + $reversed + ' multi=' + $multi +
           ' TOTAL=' + ($single + $reversed + $multi))

foreach ($label in @('deck', 'note')) {
  if ($label -eq 'deck') { $path = $deck.FullName } else { $path = $note.FullName }
  $text = [System.IO.File]::ReadAllText($path)
  $lines.Add($label + ' SR markers = ' + ([regex]::Matches($text, '<!--SR:')).Count)
  $lines.Add($label + ' CR chars = ' + ([regex]::Matches($text, "`r")).Count)
  $lines.Add($label + ' lines = ' + ([System.IO.File]::ReadAllLines($path)).Count)
  # \r? on purpose: (?m)$ does not absorb \r, so an anchored pattern skips CRLF files (traps.md T12).
  $lines.Add($label + ' double blank lines = ' +
             ([regex]::Matches($text, '\r?\n[ \t]*\r?\n[ \t]*\r?\n')).Count)
}

foreach ($l in $lines) { Write-Output $l }

if ($OutFile -and $OutFile -ne '') {
  # Never use '>' here: PowerShell 5.1 writes UTF-16LE and anything expecting UTF-8 then fails.
  [System.IO.File]::WriteAllLines($OutFile, $lines, (New-Object System.Text.UTF8Encoding($false)))
  Write-Output ('written to ' + $OutFile)
}

exit 0
