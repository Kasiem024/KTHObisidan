#
# Get-NoteStructureCensus.ps1 - the concept-note shape figures that several docs quote.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail        list the notes behind each figure
#   ... -Root <path>
#
# WHAT THIS COUNTS
#   Scope is notes IN SCOPE per Meta/Vault Standard.md section 6 - the same scope
#   Vault-Audit.ps1 reports as notesInScope. Everything under Filer/ or Litteraturlista/,
#   every *.excalidraw.md, every note whose frontmatter carries the excalidraw tag, _index.md,
#   *.opt.md / *.ai.md, Ericsson/, Kurs Mapp Mall/ and the Meta templates are excluded.
#
#     notesInScope        all in-scope notes (should equal the audit's own figure)
#     conceptNotes        of those, tagged `begrepp`
#     withDefinition      concept notes having an H2 exactly "Definition"
#     withFlashcards      ... having an H2 exactly "Flashcards"
#     withKopplatTill     ... having an H2 exactly "Kopplat till"
#     withTentaFokus      ... having an H2 exactly "Tenta-fokus"
#     flashcardsLast      ... where "Flashcards" is the LAST H2 (a hard invariant)
#     conceptCollections  concept notes with cards but no "## Definition" - the recognised
#                         exception (e.g. "HI1025 Begrepp Foerelaesning 2")
#     cardsOutsideSection notes (any type) holding a card separator with no "## Flashcards"
#                         heading at all - the site converts cards anywhere, so these are
#                         legal, but the count is quoted and was never checked
#     boldOpeningDef      concept notes whose Definition opens with bold - house style is
#                         plain prose, so this is a style census, not an error
#
# WHY IT EXISTS
#   Meta/Vault Standard.md section 4, llms.txt and .kiro/steering/product.md all quote these
#   figures - "342 of 396", "## Tenta-fokus 42", "53 concept collections", "62 notes keep
#   their cards elsewhere", "15 notes open with a bold term". Every one was measured by hand
#   on 2026-08-27 and nothing has re-measured them since. A confident wrong number is worse
#   than no number, because it gets quoted instead of checked.
#
#   This script has no opinion about what the numbers SHOULD be. Rule violations belong in
#   Vault-Audit.ps1, which already enforces the two hard ones (Flashcards present, and last).
#   This is the census that keeps the prose honest.
#
# READ-ONLY. This script never writes to the vault. Always exits 0 - it reports, it does not
# judge.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI, so the Swedish heading names
# below are built from char codes rather than typed literally.
#
param(
  [string]$Root,
  [switch]$Detail
)
$ErrorActionPreference = 'Stop'

if (-not $Root) {
  $d = Get-Item -LiteralPath $PSScriptRoot
  while ($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))) { $d = $d.Parent }
  if ($d) { $Root = $d.FullName }
}
if (-not $Root -or -not (Test-Path -LiteralPath (Join-Path $Root 'KTH'))) {
  throw "Vault root (folder containing KTH) not found - pass -Root explicitly"
}
$Root = (Get-Item -LiteralPath $Root).FullName
$enc = New-Object System.Text.UTF8Encoding($false)

# "Tenta-fokus" and "Kopplat till" are ASCII; no char-code juggling needed for these two.
$hDefinition = 'Definition'
$hFlashcards = 'Flashcards'
$hKopplat    = 'Kopplat till'
$hTenta      = 'Tenta-fokus'

function Read-VaultText($path) {
  $b = [System.IO.File]::ReadAllBytes($path)
  if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) { return $enc.GetString($b, 3, $b.Length - 3) }
  return $enc.GetString($b)
}

# Mirrors Vault-Audit.ps1's InScope. Kept in step deliberately: if the audit's scope changes,
# this must change with it or the two will quote different populations.
function Test-InScope($full, $name) {
  if ($full -match '\\\.obsidian\\' -or $full -match '\\\.trash\\' -or $full -match '\\node_modules\\') { return $false }
  if ($full -match '\\\.kiro\\')             { return $false }
  if ($full -match '\\Filer\\')              { return $false }
  if ($full -match '\\Litteraturlista\\')    { return $false }
  if ($full -match '\\Ericsson\\')           { return $false }
  if ($full -match 'Obsidian Plugins\\Templates') { return $false }
  if ($full -match '\\Kurs Mapp Mall\\')     { return $false }
  if ($name -match '\.(opt|ai)\.md$')        { return $false }
  if ($name -match '\.excalidraw\.md$')      { return $false }
  if ($name -eq '_index.md')                 { return $false }
  return $true
}

$all = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md)
$counts = [ordered]@{
  notesInScope        = 0
  conceptNotes        = 0
  withDefinition      = 0
  withFlashcards      = 0
  withKopplatTill     = 0
  withTentaFokus      = 0
  flashcardsLast      = 0
  conceptCollections  = 0
  cardsOutsideSection = 0
  boldOpeningDef      = 0
}
$members = @{}
foreach ($k in $counts.Keys) { $members[$k] = New-Object System.Collections.Generic.List[string] }

function Note($bucket, $rel) {
  $script:counts[$bucket] = $script:counts[$bucket] + 1
  $script:members[$bucket].Add($rel) | Out-Null
}

foreach ($f in $all) {
  if (-not (Test-InScope $f.FullName $f.Name)) { continue }
  $text = Read-VaultText $f.FullName
  # Excalidraw drawings are identified by tag, not only by filename. Confine the test to the
  # FIRST frontmatter block: with (?s) a pattern like '\A---.*?excalidraw.*?---' runs to any
  # later --- rule, so every note merely MENTIONING excalidraw would be skipped. That exact
  # bug hid two Meta docs from the audit entirely.
  $fmEarly = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---')
  if ($fmEarly.Success -and $fmEarly.Groups[1].Value -match 'excalidraw') { continue }
  $rel = ($f.FullName.Substring($Root.Length + 1) -replace '\\', '/')
  Note 'notesInScope' $rel

  $tags = @()
  $body = $text
  $fm = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---')
  if ($fm.Success) {
    $body = $text.Substring($fm.Length)
    $am = [regex]::Match($fm.Groups[1].Value, '(?m)^tags:[ \t]*\[(.*?)\]')
    if ($am.Success) { foreach ($x in ($am.Groups[1].Value -split ',')) { $v = $x.Trim().Trim('"').Trim("'"); if ($v) { $tags += $v } } }
  }

  $h2 = @([regex]::Matches($body, '(?m)^##[ \t]+(.+?)[ \t]*\r?$') | ForEach-Object { $_.Groups[1].Value.Trim() })
  $hasCard = [regex]::IsMatch($body, '(?m)^[^\|\r\n]+?(::|;;)') -or [regex]::IsMatch($body, '(?m)^\s*(\|\||\?\?)\s*\r?$')

  if ($hasCard -and ($h2 -notcontains $hFlashcards)) { Note 'cardsOutsideSection' $rel }

  if ($tags -notcontains 'begrepp') { continue }
  Note 'conceptNotes' $rel

  $hasDef = $h2 -contains $hDefinition
  if ($hasDef)                        { Note 'withDefinition'  $rel }
  if ($h2 -contains $hFlashcards)     { Note 'withFlashcards'  $rel }
  if ($h2 -contains $hKopplat)        { Note 'withKopplatTill' $rel }
  if ($h2 -contains $hTenta)          { Note 'withTentaFokus'  $rel }
  if ($h2.Count -gt 0 -and $h2[$h2.Count - 1] -eq $hFlashcards) { Note 'flashcardsLast' $rel }
  if (-not $hasDef -and $hasCard)     { Note 'conceptCollections' $rel }

  if ($hasDef) {
    # Text between "## Definition" and the next H2.
    $m = [regex]::Match($body, '(?ms)^##[ \t]+' + [regex]::Escape($hDefinition) + '[ \t]*\r?\n(.*?)(?=^##[ \t]|\z)')
    if ($m.Success) {
      $first = @($m.Groups[1].Value -split "`r?`n" | Where-Object { $_.Trim() -ne '' })
      if ($first.Count -gt 0 -and $first[0].TrimStart() -match '^\*\*') { Note 'boldOpeningDef' $rel }
    }
  }
}

Write-Output "Note structure census - $Root"
Write-Output ("markdown files seen: {0}" -f $all.Count)
Write-Output ""
Write-Output ("{0,-22} {1,-8} {2}" -f 'MEASURE', 'COUNT', 'OF')
Write-Output ("-" * 74)
Write-Output ("{0,-22} {1,-8} {2}" -f 'notesInScope', $counts['notesInScope'], 'all markdown files')
Write-Output ("{0,-22} {1,-8} {2}" -f 'conceptNotes', $counts['conceptNotes'], 'notesInScope')
foreach ($k in @('withDefinition', 'withFlashcards', 'withKopplatTill', 'withTentaFokus', 'flashcardsLast', 'conceptCollections', 'boldOpeningDef')) {
  Write-Output ("{0,-22} {1,-8} {2}" -f $k, $counts[$k], 'conceptNotes')
}
Write-Output ("{0,-22} {1,-8} {2}" -f 'cardsOutsideSection', $counts['cardsOutsideSection'], 'notesInScope')
Write-Output ""

if ($Detail) {
  foreach ($k in $counts.Keys) {
    if ($k -eq 'notesInScope' -or $k -eq 'conceptNotes') { continue }
    Write-Output ("--- " + $k + " (" + $counts[$k] + ") ---")
    foreach ($p in ($members[$k] | Sort-Object)) { Write-Output ("    " + $p) }
    Write-Output ""
  }
}

Write-Output "notesInScope should match Vault-Audit.ps1's own figure. If it does not, this"
Write-Output "script's Test-InScope has drifted from the audit's InScope - fix that first,"
Write-Output "because every other number here is a subset of it."
exit 0
