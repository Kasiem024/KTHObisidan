#
# Get-SRIntegrity.ps1 - count the spaced-repetition markers that must never change by accident.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Save        write the current counts to Meta\Obsidian Plugins\Scripts\sr-baseline.json
#   ... -Compare     diff the current counts against that file and exit 1 on any change
#   ... -Detail      per-file breakdown for files that carry any marker
#   ... -Root <path>
#
# WHAT THIS COUNTS
#   Two families of measure, because the deck has two legitimate units and mixing them is how
#   a wrong figure spreads.
#
#   RAW = occurrences of a literal anywhere in the file:
#     <!--SR:                  one per scheduling comment
#     ::  ;;  ||  ??           the four card separators
#     ==DISABLEDFLASHCARD==    a single card switched off
#   Raw counts include prose and table rows, so they are only meaningful as a BEFORE/AFTER
#   pair. That is the point: they prove nothing moved, they do not count cards.
#
#   CARD = one per card LINE, using the patterns that were tuned for this vault's real
#   syntax. `card_single` and `card_reversed` exclude table rows by rejecting a `|` before
#   the separator, and `card_multi`/`card_multiRev` match a bare separator alone on its line.
#   These are the numbers the backlog quotes when it says a sweep changed `;;` 440 -> 458.
#
#   Two scopes are reported for every measure and they are NOT interchangeable:
#     studyNotes - everything except Meta/, .kiro/, README.md and index.md. Meta docs and
#                  this repo's change log QUOTE the syntax when documenting it, and those
#                  quotes are not cards. A naive count produced a false "1273 vs 1270"
#                  mismatch once.
#     wholeVault - every .md outside .obsidian/, .trash/, .git/ and node_modules/.
#   Quoting a figure without its scope name and its family is the F58 mistake in miniature.
#
#   DECK SCOPE, reported over studyNotes only. A note tagged `nosr` is excluded from review
#   entirely - the plugin skips its whole card set (F64) - so the cards still exist, still
#   count above, and are never scheduled again:
#     nosrNotes      notes carrying the tag
#     activeCards    card lines in notes WITHOUT it
#     excludedCards  card lines in notes WITH it
#   Total cards can be unchanged while `activeCards` falls by a whole chapter. That is not
#   hypothetical: on 2026-09-06 a deck rewrite added `nosr` to an 87-card note that F64 had
#   deliberately kept in the active deck, and every count in the table above stayed put.
#
#   MARKER PLACEMENT. The counts cannot see a marker that MOVED. Copying an
#   <!--SR:--> comment onto a reworded or brand-new question keeps every total identical and
#   silently applies a schedule earned by the old question to a different item - the edit
#   .kiro/skills/write-flashcards/SKILL.md rule 11 exists to forbid. So the snapshot also
#   stores, per file, a map from each marker's own text to the card it sits under, and
#   -Compare reports any marker that survived verbatim but changed cards. A review does NOT
#   trip this: a review rewrites the marker text (new due date), so the old text is simply
#   gone.
#
#   PER FILE. The snapshot stores per-file card and marker counts, so -Compare NAMES the
#   files that moved instead of only the vault totals. A whole-vault total cannot tell your
#   edit from a phone review arriving mid-session (steering/environment.md), and it cannot
#   see 3 markers lost in one note while 3 arrive in another.
#
# WHY IT EXISTS
#   The four separators are not interchangeable - ";;" and "??" generate a reverse card as
#   well, so rewriting one form into another silently deletes half the deck, and an
#   <!--SR:--> comment carries a live review schedule. Every bulk edit in this vault is
#   required to prove these counts are byte-identical afterwards, and until now that proof
#   was re-typed by hand from a table in
#   .kiro/skills/vault-bulk-edit/references/verification.md. Two hand-maintained copies of a
#   regex is one copy too many: the single-line patterns were once too strict to see a third
#   of the deck, reporting ";;" as 269 both before and after 292 new cards appeared.
#
# READ-ONLY unless -Save is passed, and -Save only ever writes sr-baseline.json.
#
# -SelfTest proves the card patterns still fire on both line endings. 104 of this vault's .md
# files are CRLF and 51 of those carry cards, and an anchored pattern that forgets `\r` matches
# nothing in them without erroring (traps T12). The four card_* patterns end in `\s*$`, which
# absorbs the `\r`; the fixture is what keeps that true after an edit.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI.
#
param(
  [string]$Root,
  [switch]$Save,
  [switch]$Compare,
  [switch]$Detail,
  [switch]$SelfTest
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
$baselineFile = Join-Path $PSScriptRoot 'sr-baseline.json'
$enc = New-Object System.Text.UTF8Encoding($false)

function Read-VaultText($path) {
  $b = [System.IO.File]::ReadAllBytes($path)
  if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) { return $enc.GetString($b, 3, $b.Length - 3) }
  return $enc.GetString($b)
}

# name -> regex. Order is the order printed. The card_* patterns are the ones tuned for this
# vault's real syntax and are the figures the backlog quotes; the raw_* ones are a blunt
# byte-level fingerprint. Keep both: a sweep that moves one but not the other is informative.
$markers = [ordered]@{
  'raw_srComments'   = '<!--SR:'
  'raw_single'       = '::'
  'raw_reversed'     = ';;'
  'raw_multi'        = '\|\|'
  'raw_multiRev'     = '\?\?'
  'raw_disabled'     = '==DISABLEDFLASHCARD=='
  'card_single'      = '(?m)^[^\|\r\n]+?::'
  'card_reversed'    = '(?m)^[^\|\r\n]+?;;'
  'card_multi'       = '(?m)^\s*\|\|\s*$'
  'card_multiRev'    = '(?m)^\s*\?\?\s*$'
}
$literals = [ordered]@{
  'raw_srComments' = '<!--SR:'
  'raw_single'     = ':: anywhere'
  'raw_reversed'   = ';; anywhere'
  'raw_multi'      = '|| anywhere'
  'raw_multiRev'   = '?? anywhere'
  'raw_disabled'   = '==DISABLEDFLASHCARD=='
  'card_single'    = 'card line ::   (no | before it)'
  'card_reversed'  = 'card line ;;   (no | before it)'
  'card_multi'     = 'bare || alone on its line'
  'card_multiRev'  = 'bare ?? alone on its line'
}

# --- helpers for the placement and deck-scope parts of the fingerprint ---------------------

$sha1 = [System.Security.Cryptography.SHA1]::Create()
function Get-ShortHash([string]$s) {
  $bytes = [System.Text.Encoding]::UTF8.GetBytes($s)
  $h = $sha1.ComputeHash($bytes)
  ($h | ForEach-Object { $_.ToString('x2') }) -join '' | ForEach-Object { $_.Substring(0, 12) }
}

# A note tagged nosr has its whole card set skipped by the plugin (F64). Capture the
# frontmatter block ONCE and test the capture: an unanchored (?s) pattern runs on to the next
# `---` horizontal rule and matches any note that merely mentions the word (traps T13).
function Test-NosrNote([string]$text) {
  $m = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---')
  if (-not $m.Success) { return $false }
  return [regex]::IsMatch($m.Groups[1].Value, '(?<![\w-])nosr(?![\w-])')
}

# The identity of the card a marker belongs to. A card runs from its prompt line to the next
# blank line and the marker sits on the last line of that block, so the block's FIRST line is
# the card - the prompt of a || card, or the question half of a :: / ;; card. Emphasis is
# stripped so that a formatting-only edit does not read as a different card.
function Get-CardKey([string]$line) {
  $s = $line
  foreach ($sep in @('::', ';;')) {
    $i = $s.IndexOf($sep)
    if ($i -gt 0) { $s = $s.Substring(0, $i); break }
  }
  $s = $s -replace '==', '' -replace '\*', '' -replace '`', ''
  $s = ($s -replace '\s+', ' ').Trim()
  return $s
}

# Every (marker text, card) pair in a file, as a list - NOT a dictionary keyed by the marker.
# Identical marker texts are common: the legacy format writes fixed values, so
# `<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->` repeats across many cards in the older notes,
# and keying by the marker alone silently collapsed 221 of 1433 pairs when this was first
# written. Keyed by the marker's own hash *within a pair*: a review rewrites the marker (new due
# date), so an existing marker text turning up on a card it was not on before is a transplanted
# schedule rather than a review.
function Get-MarkerCardMap([string]$text) {
  $pairs = New-Object System.Collections.Generic.List[object]
  $lines = $text -split "`n"
  for ($i = 0; $i -lt $lines.Length; $i++) {
    $line = $lines[$i].TrimEnd("`r")
    if ($line -notmatch '<!--SR:') { continue }
    # first line of this blank-line-delimited block
    $j = $i
    while ($j -gt 0) {
      $prev = $lines[$j - 1].TrimEnd("`r")
      if ($prev.Trim() -eq '') { break }
      $j--
    }
    $cardKey = Get-CardKey $lines[$j].TrimEnd("`r")
    if ($j -eq $i) { $cardKey = '(marker with no card above it)' }
    foreach ($mm in [regex]::Matches($line, '<!--SR:.*?-->')) {
      $pairs.Add([ordered]@{ h = (Get-ShortHash $mm.Value); card = $cardKey }) | Out-Null
    }
  }
  return $pairs
}

if ($SelfTest) {
  # Every card pattern must count the same on LF and CRLF. 104 .md files here are CRLF and 51
  # of those carry cards, so a pattern that forgets \r fails silently on a fifth of the deck.
  $lf = @(
    '## Section', '',
    'Fraga ett::Svar ett',
    '<!--SR:!2000-01-01,1,250-->', '',
    '**Term**;;Definition', '',
    'Lista? (2)', '||', '- ett', '- tva',
    '<!--SR:!2000-01-02,1,250-->', '',
    'Bada? (2)', '??', '- ett', '- tva', '',
    '| tabell :: rad | x |', ''
  ) -join "`n"
  $crlf = $lf -replace "`n", "`r`n"
  $fails = 0
  foreach ($k in $markers.Keys) {
    $a = [regex]::Matches($lf, $markers[$k]).Count
    $b = [regex]::Matches($crlf, $markers[$k]).Count
    $verdict = if ($a -eq $b) { 'ok' } else { $fails++; 'DIVERGES' }
    Write-Output ("{0,-16} LF {1,-4} CRLF {2,-4} {3}" -f $k, $a, $b, $verdict)
  }
  foreach ($body in @($lf, $crlf)) {
    $ending = 'LF  '
    if ($body -match "`r`n") { $ending = 'CRLF' }
    $pairs = Get-MarkerCardMap $body
    $ok = ($pairs.Count -eq 2) -and ($pairs[0].card -eq 'Fraga ett') -and ($pairs[1].card -eq 'Lista? (2)')
    if (-not $ok) { $fails++ }
    $okWord = 'ok'
    if (-not $ok) { $okWord = 'WRONG' }
    Write-Output ("markerCardMap {0}  pairs {1}  -> [{2}] [{3}]  {4}" -f $ending, $pairs.Count, $pairs[0].card, $pairs[1].card, $okWord)
  }
  # identical marker texts on two cards must produce two pairs, not one
  $dup = @('A::one', '<!--SR:!2000-01-01,1,250-->', '', 'B::two', '<!--SR:!2000-01-01,1,250-->', '') -join "`n"
  $dupPairs = Get-MarkerCardMap $dup
  $dupOk = ($dupPairs.Count -eq 2) -and ($dupPairs[0].h -ceq $dupPairs[1].h) -and ($dupPairs[0].card -ne $dupPairs[1].card)
  if (-not $dupOk) { $fails++ }
  $dupWord = 'ok'
  if (-not $dupOk) { $dupWord = 'WRONG - identical markers collapsed' }
  Write-Output ("duplicate marker text on two cards  pairs {0} (expect 2)  {1}" -f $dupPairs.Count, $dupWord)
  $nosrYes = Test-NosrNote "---`ntags: [begrepp, nosr]`n---`nbody --- and a rule"
  $nosrNo  = Test-NosrNote "---`ntags: [begrepp]`n---`nthe word nosr appears in the body`n---"
  if (-not $nosrYes) { $fails++ }
  if ($nosrNo) { $fails++ }
  Write-Output ("nosr in frontmatter {0}   nosr only in body {1}  (expect True / False)" -f $nosrYes, $nosrNo)
  Write-Output ""
  if ($fails -gt 0) { Write-Output "RESULT: $fails self-test failure(s)."; exit 1 }
  Write-Output "RESULT: self-test clean - patterns agree on LF and CRLF, marker pairing and nosr detection behave."
  exit 0
}

$md = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md | Where-Object {
  $p = $_.FullName
  ($p -notmatch '\\\.obsidian\\') -and ($p -notmatch '\\\.trash\\') -and ($p -notmatch '\\\.git\\') -and ($p -notmatch '\\node_modules\\')
})

function Test-StudyNote([string]$relFwd) {
  if ($relFwd -match '^Meta/')  { return $false }
  if ($relFwd -match '^\.kiro/'){ return $false }
  if ($relFwd -eq 'README.md')  { return $false }
  if ($relFwd -eq 'index.md')   { return $false }
  return $true
}

$scopes = @{
  'studyNotes' = [ordered]@{}
  'wholeVault' = [ordered]@{}
}
foreach ($s in $scopes.Keys) { foreach ($k in $markers.Keys) { $scopes[$s][$k] = 0 } }
$fileCount = @{ 'studyNotes' = 0; 'wholeVault' = 0 }
$perFile = New-Object System.Collections.Generic.List[object]

# deck scope (studyNotes only), per-file counts, and marker -> card placement
$cardKeys  = @('card_single', 'card_reversed', 'card_multi', 'card_multiRev')
$deck      = [ordered]@{ nosrNotes = 0; activeCards = 0; excludedCards = 0 }
$fileMap   = [ordered]@{}
$markerMap = [ordered]@{}
$nosrNames = New-Object System.Collections.Generic.List[string]

foreach ($f in $md) {
  $rel = ($f.FullName.Substring($Root.Length + 1) -replace '\\', '/')
  $text = Read-VaultText $f.FullName
  $isStudy = Test-StudyNote $rel
  $fileCount['wholeVault']++
  if ($isStudy) { $fileCount['studyNotes']++ }
  $row = [ordered]@{ Path = $rel }
  $any = $false
  foreach ($k in $markers.Keys) {
    $n = [regex]::Matches($text, $markers[$k]).Count
    $row[$k] = $n
    if ($n -gt 0) { $any = $true }
    $scopes['wholeVault'][$k] += $n
    if ($isStudy) { $scopes['studyNotes'][$k] += $n }
  }
  if ($any) { $perFile.Add([pscustomobject]$row) | Out-Null }

  $cards = 0
  foreach ($k in $cardKeys) { $cards += $row[$k] }
  $isNosr = Test-NosrNote $text
  if ($isStudy) {
    if ($isNosr) {
      $deck['nosrNotes']++
      $deck['excludedCards'] += $cards
      $nosrNames.Add(("  {0,-5} cards  {1}" -f $cards, $rel)) | Out-Null
    } else {
      $deck['activeCards'] += $cards
    }
  }
  if ($any -or $isNosr) {
    $fileMap[$rel] = [ordered]@{ cards = $cards; sr = $row['raw_srComments']; nosr = [bool]$isNosr }
  }
  if ($row['raw_srComments'] -gt 0) {
    # @() matters: PowerShell unrolls a returned list, so a file with exactly ONE pair would
    # arrive as a bare hashtable whose .Count is 2 (its key count) and inflate every total.
    $mm = @(Get-MarkerCardMap $text)
    if ($mm.Count -gt 0) { $markerMap[$rel] = $mm }
  }
}

Write-Output "Spaced-repetition integrity - $Root"
Write-Output ("md files: studyNotes {0}, wholeVault {1}" -f $fileCount['studyNotes'], $fileCount['wholeVault'])
Write-Output ""
Write-Output ("{0,-16} {1,-14} {2,-14} {3}" -f 'MEASURE', 'studyNotes', 'wholeVault', 'WHAT IT MATCHES')
Write-Output ("-" * 92)
foreach ($k in $markers.Keys) {
  Write-Output ("{0,-16} {1,-14} {2,-14} {3}" -f $k, $scopes['studyNotes'][$k], $scopes['wholeVault'][$k], $literals[$k])
}
Write-Output ""
Write-Output "DECK SCOPE (studyNotes) - a note tagged nosr has its whole card set skipped (F64)"
Write-Output ("  notes tagged nosr        {0}" -f $deck['nosrNotes'])
Write-Output ("  cards in active deck     {0}" -f $deck['activeCards'])
Write-Output ("  cards excluded by nosr   {0}" -f $deck['excludedCards'])
Write-Output ("  markers placed on cards  {0}  (in {1} files)" -f ($markerMap.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum, $markerMap.Count)
Write-Output "  (that total counts complete <!--SR:...--> comments, so it is lower than raw_srComments:"
Write-Output "   the docs under Meta/ and .kiro/ mention the opening literal in prose without closing it)"
Write-Output ""

if ($Detail) {
  Write-Output "--- notes excluded from review by nosr ---"
  foreach ($n in $nosrNames) { Write-Output $n }
  Write-Output ""
}

if ($Detail) {
  Write-Output "--- files carrying at least one marker ---"
  $hdr = '  '
  foreach ($k in $markers.Keys) { $hdr += ($k -replace '^(raw|card)_', '').PadRight(8) }
  Write-Output ($hdr + 'PATH')
  foreach ($r in ($perFile | Sort-Object Path)) {
    $line = '  '
    foreach ($k in $markers.Keys) { $line += ([string]$r.$k).PadRight(8) }
    Write-Output ($line + $r.Path)
  }
  Write-Output ""
}

$snapshot = [ordered]@{
  schema      = 2
  takenAt     = (Get-Date).ToString('yyyy-MM-ddTHH:mm:sszzz')
  root        = $Root
  fileCount   = $fileCount
  studyNotes  = $scopes['studyNotes']
  wholeVault  = $scopes['wholeVault']
  deck        = $deck
  files       = $fileMap
  markerCards = $markerMap
}

if ($Save) {
  $json = $snapshot | ConvertTo-Json -Depth 6
  [System.IO.File]::WriteAllText($baselineFile, $json, $enc)
  Write-Output "baseline written: $baselineFile"
  Write-Output ("  {0} files, {1} marker placements recorded" -f $fileMap.Count, ($markerMap.Values | ForEach-Object { $_.Count } | Measure-Object -Sum).Sum)
  Write-Output "RESULT: baseline saved. Re-run with -Compare after the edit."
  exit 0
}

if ($Compare) {
  if (-not (Test-Path -LiteralPath $baselineFile)) {
    Write-Output "No baseline at $baselineFile - run with -Save BEFORE the edit, not after."
    exit 1
  }
  $old = [System.IO.File]::ReadAllText($baselineFile, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
  Write-Output ("baseline taken at {0}" -f $old.takenAt)
  $drift = 0
  foreach ($s in @('studyNotes', 'wholeVault')) {
    foreach ($k in $markers.Keys) {
      $before = [int]$old.$s.$k
      $after  = [int]$scopes[$s][$k]
      if ($before -ne $after) {
        $drift++
        Write-Output ("  CHANGED {0}.{1}: {2} -> {3}  ({4:+#;-#;0})" -f $s, $k, $before, $after, ($after - $before))
      }
    }
  }

  $oldProps = $old.PSObject.Properties.Name
  $schema = 1
  if ($oldProps -contains 'schema') { $schema = [int]$old.schema }

  if ($schema -lt 2) {
    Write-Output ""
    Write-Output "  NOTE: this baseline predates the per-file, deck-scope and marker-placement"
    Write-Output "        checks. Only vault totals were compared. Re-take it with -Save."
  } else {

    # --- deck scope: total cards can hold while a chapter leaves the review deck -------------
    foreach ($k in @('nosrNotes', 'activeCards', 'excludedCards')) {
      $before = [int]$old.deck.$k
      $after  = [int]$deck[$k]
      if ($before -ne $after) {
        $drift++
        Write-Output ("  CHANGED deck.{0}: {1} -> {2}  ({3:+#;-#;0})" -f $k, $before, $after, ($after - $before))
      }
    }

    # --- per file: a total cannot tell your edit from a phone review -------------------------
    $oldFiles = @{}
    foreach ($p in $old.files.PSObject.Properties) { $oldFiles[$p.Name] = $p.Value }
    $allRel = New-Object System.Collections.Generic.List[string]
    foreach ($r in $oldFiles.Keys) { $allRel.Add($r) | Out-Null }
    foreach ($r in $fileMap.Keys) { if (-not $oldFiles.ContainsKey($r)) { $allRel.Add($r) | Out-Null } }
    $fileLines = New-Object System.Collections.Generic.List[string]
    foreach ($r in ($allRel | Sort-Object)) {
      $oc = 0; $os = 0; $on = $false
      if ($oldFiles.ContainsKey($r)) { $oc = [int]$oldFiles[$r].cards; $os = [int]$oldFiles[$r].sr; $on = [bool]$oldFiles[$r].nosr }
      $nc = 0; $ns = 0; $nn = $false
      if ($fileMap.Contains($r)) { $nc = [int]$fileMap[$r].cards; $ns = [int]$fileMap[$r].sr; $nn = [bool]$fileMap[$r].nosr }
      $bits = New-Object System.Collections.Generic.List[string]
      if ($oc -ne $nc) { $bits.Add(("cards {0} -> {1}" -f $oc, $nc)) | Out-Null }
      if ($os -ne $ns) { $bits.Add(("markers {0} -> {1}" -f $os, $ns)) | Out-Null }
      if ($on -ne $nn) { $bits.Add(("nosr {0} -> {1}" -f $on, $nn)) | Out-Null }
      if ($bits.Count -gt 0) { $fileLines.Add(("  {0}: {1}" -f $r, ($bits -join ', '))) | Out-Null }
    }
    if ($fileLines.Count -gt 0) {
      $drift += $fileLines.Count
      Write-Output ""
      Write-Output "  per-file changes:"
      foreach ($l in $fileLines) { Write-Output $l }
    }

    # --- placement: an existing marker text now sitting on a card it was not on -------------
    # marker hash -> every place it was seen before. A review REWRITES the marker, so a hash
    # that is new is a review and is skipped; a hash that already existed turning up somewhere
    # new is a schedule that was copied onto a different question.
    $oldLoc = @{}
    foreach ($fp in $old.markerCards.PSObject.Properties) {
      foreach ($pair in @($fp.Value)) {
        $h = [string]$pair.h
        if (-not $oldLoc.ContainsKey($h)) { $oldLoc[$h] = New-Object System.Collections.Generic.List[string] }
        $oldLoc[$h].Add(("{0} :: {1}" -f $fp.Name, [string]$pair.card)) | Out-Null
      }
    }
    $moved = New-Object System.Collections.Generic.List[string]
    foreach ($r in $markerMap.Keys) {
      foreach ($pair in $markerMap[$r]) {
        $h = [string]$pair.h
        if (-not $oldLoc.ContainsKey($h)) { continue }
        $loc = ("{0} :: {1}" -f $r, [string]$pair.card)
        $seenBefore = @($oldLoc[$h] | Where-Object { $_ -ceq $loc }).Count
        if ($seenBefore -gt 0) { continue }
        $moved.Add(("  marker {0} is now on:  {1}" -f $h, $loc)) | Out-Null
        foreach ($was in $oldLoc[$h]) { $moved.Add(("      it was on:  {0}" -f $was)) | Out-Null }
      }
    }
    if ($moved.Count -gt 0) {
      $drift++
      Write-Output ""
      Write-Output "  MARKERS THAT MOVED TO A DIFFERENT CARD (same marker text, new question):"
      foreach ($l in $moved) { Write-Output $l }
      Write-Output "  A review never does this - it rewrites the marker. A schedule earned by the old"
      Write-Output "  question is now attached to a different one (write-flashcards SKILL.md rule 11)."
      Write-Output "  A pure typo or formatting fix on a carded line also trips this; check the diff."
    }
  }
  Write-Output ""
  if ($drift -gt 0) {
    Write-Output "RESULT: $drift change(s) found. If the edit was not supposed to touch cards,"
    Write-Output "        restore from the backup - a changed separator deletes a card's reverse"
    Write-Output "        half, an <!--SR:--> loss resets a live review schedule, a marker that"
    Write-Output "        moved transplants one, and nosr silently empties a whole deck."
    exit 1
  }
  Write-Output "RESULT: clean - counts, per-file counts, deck scope and marker placement all match."
  exit 0
}

Write-Output "RESULT: counts reported. Use -Save before a bulk edit and -Compare after."
exit 0
