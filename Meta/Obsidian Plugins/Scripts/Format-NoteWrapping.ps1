#
# Format-NoteWrapping.ps1 - join hard-wrapped lines so a paragraph is one line again.
#
# Usage (PowerShell 5.1+):
#   ... -Filter "HI1031 Tentafr*"     REQUIRED unless -All: which notes, by file-name wildcard
#   ... -All                          every note in scope (deliberately awkward - see below)
#   ... -Apply                        actually write. Default is a dry run that changes nothing
#   ... -Detail                       show a sample of the joins, and why files were skipped
#   ... -Force                        also process notes containing flashcard-like syntax
#   ... -Root <path>                  run against a different vault, or a copy
#
# WHAT THIS COUNTS, and what it changes
#   It reports, per file, the number of LINE JOINS - places where a hard line break sits inside
#   one paragraph or one list item. Obsidian's "Strict line breaks" defaults to OFF
#   (`strictLineBreaks: !1` in the app bundle), so a single newline renders as a VISIBLE break,
#   unlike the Markdown spec. A note wrapped at 100 columns therefore reads as if every line
#   ended a sentence. Joining the lines fixes the rendering without changing a word.
#
#   Two kinds of break are joined:
#     paragraph   consecutive unindented prose lines
#     listItem    an indented continuation line following a list item
#   The second dominates: in the notes this was written for, list continuations outnumbered
#   plain paragraph lines roughly five to one.
#
# WHAT PROTECTS YOU, honestly stated
#   1. A STRUCTURAL COUNT CHECK. Before and after, it counts headings, list items, table rows,
#      table delimiter rows, fence lines, blockquote lines and blank lines. If any count moves,
#      the file is REFUSED and not written. This is the check that matters, because it catches a
#      block being swallowed into a paragraph.
#   2. A token-sequence check. This one is WEAK BY CONSTRUCTION and is kept only to catch a
#      coding error that drops or duplicates text: since every join is `previous + ' ' + line`,
#      the whitespace-split token sequence is identical whenever the joins are the only edit. It
#      cannot tell a correct join from a wrong one. An earlier version of this header claimed it
#      made the script safe to run unread; an adversarial review showed that was false.
#   3. Files with MIXED line endings are skipped, not normalised - rewriting every line ending
#      would bury the real change in a whole-file diff.
#   4. Files containing `<!--SR:` or a flashcard separator are skipped unless -Force, because a
#      card runs from its separator to the next blank line and joining inside one merges a
#      question into its answer (conventions.md section 1). Note that a Dataview inline field
#      (`key:: value`) looks identical to a single-line card, so it triggers the same skip; the
#      matched line is printed with -Detail so you can judge.
#   5. -Filter or -All is required. Reflowing the whole vault by accident is the largest
#      foreseeable mistake this script could make, so it cannot be the default.
#
#   It NEVER joins across: a blank line, a heading, any table row or delimiter, a fenced block,
#   a blockquote or callout, a horizontal rule, a list marker at any indent, a footnote or
#   link-reference definition, a card separator, or a line ending in an explicit hard break
#   (two trailing spaces, or a backslash). Frontmatter is copied through untouched.
#
# KNOWN LIMITS
#   A blockquote's lazy continuation line - a wrapped line with no leading ">" - is left alone
#   rather than joined into the quote. That is a missed join, not damage.
#
# WRITES ONLY WITH -Apply, backing up every file it touches first, and preserving BOM and line
# endings.
#
# Exit 0 = every file processed or skipped cleanly. Exit 1 = at least one file was REFUSED by
# the structural or token check, which means the reflow was not safe on it.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI. File contents are read and
# written as UTF-8 explicitly, and files are located by wildcard on the ASCII part of the name
# (traps T1, T2).
#
param(
  [string]$Root,
  [string]$Filter,
  [switch]$All,
  [switch]$Apply,
  [switch]$Detail,
  [switch]$Force,
  [string]$BackupDir
)
$ErrorActionPreference = 'Stop'

if (-not $Filter -and -not $All) {
  throw "Refusing to run without a scope: pass -Filter '<name wildcard>' or -All"
}

if (-not $Root) {
  $d = Get-Item -LiteralPath $PSScriptRoot
  while ($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))) { $d = $d.Parent }
  if ($d) { $Root = $d.FullName }
}
if (-not $Root -or -not (Test-Path -LiteralPath (Join-Path $Root 'KTH'))) {
  throw "Vault root (folder containing KTH) not found - pass -Root explicitly"
}
$Root = (Get-Item -LiteralPath $Root).FullName
if (-not $BackupDir) {
  $BackupDir = Join-Path $env:TEMP ('note-wrapping-backup-' + (Get-Date -Format 'yyyy-MM-dd-HHmmss'))
}

$notes = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md -Force -ErrorAction SilentlyContinue | Where-Object {
  $p = $_.FullName
  ($p -notmatch '\\Filer\\') -and ($p -notmatch '\\\.obsidian\\') -and ($p -notmatch '\\\.trash\\') -and
  ($p -notmatch '\\\.kiro\\') -and ($p -notmatch '\\node_modules\\') -and ($p -notmatch '\\\.git\\') -and
  ($_.Name -notlike '*.excalidraw.md')
})
if ($Filter) { $notes = @($notes | Where-Object { $_.Name -like $Filter }) }
$notes = @($notes | Sort-Object FullName)

Write-Output "=== NOTE WRAPPING  $(Get-Date -Format 'yyyy-MM-dd HH:mm') ==="
Write-Output "root=$Root"
if ($Filter) { Write-Output "filter=$Filter" } else { Write-Output "scope=-All" }
if ($Apply) { Write-Output "mode=APPLY (backups in $BackupDir)" } else { Write-Output "mode=DRY RUN - nothing will be written" }
Write-Output ("notes in scope: {0}" -f $notes.Count)
Write-Output ""

# ------------------------------------------------------------------ classification
function Test-DelimiterRow {
  param([string]$line)
  # a GFM table delimiter, with or without leading pipe: | --- | :--: |   or   --- | ---
  if ($line -notmatch '-') { return $false }
  if ($line -notmatch '\|') { return $false }
  return ($line -match '^\s*\|?[\s:\-]*\|[\s:\-|]*$')
}
function Get-TableLineFlags {
  param($lines)
  # Mark table regions by finding delimiter rows, then claiming the row above and the
  # consecutive pipe-bearing rows below. This catches tables written WITHOUT leading pipes,
  # which a `^\s*\|` test misses entirely.
  $flags = New-Object 'bool[]' $lines.Count
  for ($i = 0; $i -lt $lines.Count; $i++) {
    if (-not (Test-DelimiterRow $lines[$i])) { continue }
    $flags[$i] = $true
    if ($i -gt 0 -and $lines[$i - 1] -match '\|') { $flags[$i - 1] = $true }
    for ($j = $i + 1; $j -lt $lines.Count; $j++) {
      if ($lines[$j] -match '\|' -and $lines[$j].Trim() -ne '') { $flags[$j] = $true } else { break }
    }
  }
  # a leading-pipe row is always a table row even without a delimiter nearby
  for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match '^\s*\|') { $flags[$i] = $true }
  }
  return $flags
}
function Test-HardBreak {
  param([string]$line)
  if ($line -match '[ ]{2,}$') { return $true }
  if ($line -match '\\$') { return $true }
  return $false
}
function Get-StructureCounts {
  param([string]$body)
  $lines = @([regex]::Split($body, "\r?\n"))
  $tbl = Get-TableLineFlags $lines
  $c = @{ heading = 0; list = 0; table = 0; delim = 0; fence = 0; quote = 0; blank = 0; hr = 0 }
  for ($i = 0; $i -lt $lines.Count; $i++) {
    $ln = $lines[$i]
    if ($ln -match '^\s*(```|~~~)') { $c.fence++; continue }
    if ($ln.Trim() -eq '') { $c.blank++; continue }
    if ($ln -match '^\s*#{1,6}\s') { $c.heading++; continue }
    if (Test-DelimiterRow $ln) { $c.delim++; continue }
    if ($tbl[$i]) { $c.table++; continue }
    if ($ln -match '^\s*>') { $c.quote++; continue }
    if ($ln -match '^\s*(---+|\*\*\*+|___+)\s*$') { $c.hr++; continue }
    if ($ln -match '^\s*([-*+]|\d+[.)])\s') { $c.list++; continue }
  }
  return $c
}
function Compare-Counts {
  param($a, $b)
  foreach ($k in @('heading', 'list', 'table', 'delim', 'fence', 'quote', 'blank', 'hr')) {
    if ($a[$k] -ne $b[$k]) { return ("{0} {1} -> {2}" -f $k, $a[$k], $b[$k]) }
  }
  return ''
}
function Get-Tokens {
  param([string]$s)
  return ,@([regex]::Split($s, '\s+') | Where-Object { $_ -ne '' })
}

$totalJoins = 0; $filesChanged = 0; $refused = 0; $skipped = 0; $applied = 0
$report = New-Object System.Collections.Generic.List[string]

foreach ($f in $notes) {
  $raw = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
  $hadBom = ($raw.Length -gt 0 -and [int][char]$raw[0] -eq 0xFEFF)
  $text = $raw
  if ($hadBom) { $text = $raw.Substring(1) }

  $crlf = ([regex]::Matches($text, "`r`n")).Count
  $lfOnly = ([regex]::Matches($text, "(?<!`r)`n")).Count
  if ($crlf -gt 0 -and $lfOnly -gt 0) {
    $skipped++
    $report.Add(("  SKIP  {0} - mixed line endings (CRLF {1}, LF {2}); normalise first" -f $f.Name, $crlf, $lfOnly)) | Out-Null
    continue
  }
  $eol = "`n"
  if ($crlf -gt 0) { $eol = "`r`n" }

  $cardHit = ''
  if ($text.Contains('<!--SR:')) { $cardHit = '<!--SR:' }
  elseif ([regex]::IsMatch($text, '(?m)^.+::.+$')) { $cardHit = ':: on a line' }
  elseif ([regex]::IsMatch($text, '(?m)^.+;;.+$')) { $cardHit = ';; on a line' }
  elseif ([regex]::IsMatch($text, '(?m)^\s*\|\|\s*$')) { $cardHit = 'bare ||' }
  elseif ([regex]::IsMatch($text, '(?m)^\s*\?\?\s*$')) { $cardHit = 'bare ??' }
  if ($cardHit -ne '' -and -not $Force) {
    $skipped++
    if ($Detail) { $report.Add(("  SKIP  {0} - flashcard-like syntax ({1}); -Force to override" -f $f.Name, $cardHit)) | Out-Null }
    continue
  }

  $fm = ''
  $body = $text
  $m = [regex]::Match($text, '(?s)\A---\r?\n.*?\r?\n---\r?\n')
  if ($m.Success) { $fm = $m.Value; $body = $text.Substring($m.Length) }

  $lines = @([regex]::Split($body, "\r?\n"))
  $tbl = Get-TableLineFlags $lines
  $before = Get-StructureCounts $body

  $out = New-Object System.Collections.Generic.List[string]
  $kinds = New-Object System.Collections.Generic.List[string]
  $joins = 0
  $samples = New-Object System.Collections.Generic.List[string]
  $fenceMarker = ''   # '' = not in a fence; otherwise the exact opening marker

  for ($i = 0; $i -lt $lines.Count; $i++) {
    $ln = $lines[$i]
    $fm2 = [regex]::Match($ln, '^\s*(`{3,}|~{3,})')
    if ($fm2.Success) {
      $mk = $fm2.Groups[1].Value
      if ($fenceMarker -eq '') { $fenceMarker = $mk.Substring(0, 1) }
      elseif ($mk.StartsWith($fenceMarker)) { $fenceMarker = '' }
      $out.Add($ln) | Out-Null; $kinds.Add('fence') | Out-Null
      continue
    }
    if ($fenceMarker -ne '') { $out.Add($ln) | Out-Null; $kinds.Add('fence') | Out-Null; continue }

    $trim = $ln.Trim()
    $indented = ($ln -match '^\s+\S')
    $isBlank    = ($trim -eq '')
    $isHeading  = ($ln -match '^\s*#{1,6}\s')
    $isTable    = ($tbl[$i] -or (Test-DelimiterRow $ln))
    $isQuote    = ($ln -match '^\s*>')
    $isHr       = ($ln -match '^\s*(---+|\*\*\*+|___+)\s*$')
    $isList     = ($ln -match '^\s*([-*+]|\d+[.)])\s')
    $isRefDef   = ($ln -match '^\s*\[[^\]]+\]:\s')
    $isCardSep  = ($ln -match '^\s*(::|;;|\|\||\?\?)\s*$') -or $ln.Contains('<!--SR:')
    $startsBlock = $isBlank -or $isHeading -or $isTable -or $isQuote -or $isHr -or $isList -or $isRefDef -or $isCardSep

    $prevKind = ''
    if ($kinds.Count -gt 0) { $prevKind = $kinds[$kinds.Count - 1] }
    $prev = ''
    if ($out.Count -gt 0) { $prev = $out[$out.Count - 1] }

    $canJoin = $false
    if (-not $startsBlock -and $out.Count -gt 0 -and $prev.Trim() -ne '' -and -not (Test-HardBreak $prev)) {
      if ($prevKind -eq 'prose' -and -not $indented) { $canJoin = $true }
      elseif (($prevKind -eq 'list' -or $prevKind -eq 'listcont') -and $indented) { $canJoin = $true }
    }

    if ($canJoin) {
      $out[$out.Count - 1] = $prev.TrimEnd() + ' ' + $trim
      if ($prevKind -eq 'list') { $kinds[$kinds.Count - 1] = 'listcont' }
      $joins++
      if ($samples.Count -lt 3) {
        $s = $trim
        if ($s.Length -gt 58) { $s = $s.Substring(0, 58) + '...' }
        $samples.Add($s) | Out-Null
      }
      continue
    }

    $out.Add($ln) | Out-Null
    if ($isBlank) { $kinds.Add('blank') | Out-Null }
    elseif ($isList) { $kinds.Add('list') | Out-Null }
    elseif ($isHeading) { $kinds.Add('heading') | Out-Null }
    elseif ($isTable) { $kinds.Add('table') | Out-Null }
    elseif ($isQuote) { $kinds.Add('quote') | Out-Null }
    elseif ($isHr) { $kinds.Add('hr') | Out-Null }
    elseif ($indented) { $kinds.Add('listcont') | Out-Null }
    else { $kinds.Add('prose') | Out-Null }
  }

  if ($joins -eq 0) { continue }

  $newBody = ($out -join $eol)
  $newText = $fm + $newBody

  # --- guard 1: structure must be identical ---
  $after = Get-StructureCounts $newBody
  $delta = Compare-Counts $before $after
  if ($delta -ne '') {
    $refused++
    $report.Add(("  REFUSED {0} - structure changed: {1}. Nothing written." -f $f.Name, $delta)) | Out-Null
    continue
  }
  # --- guard 2: weak, but catches dropped or duplicated text ---
  $tb = Get-Tokens $text
  $ta = Get-Tokens $newText
  $same = ($tb.Count -eq $ta.Count)
  if ($same) { for ($k = 0; $k -lt $tb.Count; $k++) { if ($tb[$k] -ne $ta[$k]) { $same = $false; break } } }
  if (-not $same) {
    $refused++
    $report.Add(("  REFUSED {0} - token sequence changed ({1} -> {2}). Nothing written." -f $f.Name, $tb.Count, $ta.Count)) | Out-Null
    continue
  }

  $filesChanged++
  $totalJoins += $joins
  $report.Add(("  {0,5} joins  {1}" -f $joins, $f.FullName.Substring($Root.Length + 1))) | Out-Null
  if ($Detail) { foreach ($s in $samples) { $report.Add("           joined: $s") | Out-Null } }

  if ($Apply) {
    if (-not (Test-Path -LiteralPath $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }
    Copy-Item -LiteralPath $f.FullName -Destination (Join-Path $BackupDir $f.Name) -Force
    [System.IO.File]::WriteAllText($f.FullName, $newText, (New-Object System.Text.UTF8Encoding($hadBom)))
    $applied++
  }
}

foreach ($r in $report) { Write-Output $r }
Write-Output ""
Write-Output ("files with joins: {0}   total joins: {1}   skipped: {2}   refused: {3}" -f $filesChanged, $totalJoins, $skipped, $refused)
if ($Apply) { Write-Output ("files written: {0}   backups: {1}" -f $applied, $BackupDir) }
else { Write-Output "nothing written - dry run. Re-run with -Apply." }
Write-Output ""

if ($refused -gt 0) {
  Write-Output ("RESULT: {0} file(s) refused by a safety check." -f $refused)
  exit 1
}
Write-Output "RESULT: clean - structure and token counts identical in every file processed."
exit 0
