# Convert-TagsToList.ps1
#
# WHAT IT COUNTS AND WHAT IT CHANGES:
#
#   Rewrites a note's frontmatter `tags:` from the inline form to the YAML list form, which is the
#   form Obsidian's Properties panel writes and this vault's convention from F105 on. Only that one
#   line changes; every other byte of the file is kept exactly.
#
#       tags: [begrepp, HI1031, KTH, nosr]      becomes      tags:
#                                                              - begrepp
#                                                              - HI1031
#                                                              - KTH
#                                                              - nosr
#
#   Every file in scope lands in exactly one bucket, and the SUMMARY line prints all six:
#     convert      inline tags that can be converted safely (dry run), or were converted (-Apply)
#     alreadyList  tags already in list form - which is what makes a re-run a no-op
#     noTags       no frontmatter, or a frontmatter without a tags key
#     excalidraw   the frontmatter mentions excalidraw: a drawing, skipped exactly as the audit does
#     skipped      could not be converted safely and was NOT touched. Each one is listed with its
#                  reason. Expected 0: fix the file by hand, then re-run.
#     failed       -Apply only: the write threw or did not verify, and the original bytes were put
#                  back. Each one is listed. Expected 0.
#   It also prints how many converted files carry nosr, to eyeball against Get-SRIntegrity.ps1.
#
#   IN SCOPE: Vault-Audit.ps1's scope - InScope below is a verbatim copy of the audit's - plus every
#   _index.md, which the audit leaves out but whose tags follow the same rule. So never Filer/,
#   .obsidian/, .kiro/, .trash/ or the Templater templates, which are edited by hand.
#   -ExcludePath <substrings> drops any path containing one of them (case-insensitive), to leave a
#   folder another agent is editing completely alone. Empty by default.
#
# WHY IT EXISTS: editing a note's tags in Obsidian's own UI rewrites them into list form, so with an
#   inline standard every tag edit became an audit deviation and the pre-push hook refused the push,
#   six times. On 2026-10-22 the author chose to make list form the standard (F105), and this
#   converts the rest of the vault once. Format-FrontmatterTags.ps1 is the old opposite direction,
#   list to inline, kept untouched on the author's instruction and not to be run any more.
#
# WHAT IT PRESERVES, and how each one is proved rather than assumed:
#   - Tag ORDER and every VALUE, above all nosr (F64). Before anything is written, the new text is
#     re-parsed by a list reader that did not produce it and must give the same values, ordinal,
#     element for element. After the write the file is read back and must be the intended bytes.
#   - Every other byte. The original must equal prefix + old tags line + suffix exactly, and the new
#     text is prefix + new block + suffix; the decoding is checked to re-encode to the same bytes.
#   - The BOM, detected from the bytes (T9). It sits in the unchanged prefix.
#   - Line endings. The new lines reuse the replaced line's own terminator (T12).
#   It refuses rather than guesses. A value YAML would need quoted, an empty element, `tags: []`,
#   text after `]`, more than one tags key, mixed line endings or a lone CR, a closing fence that
#   is not exactly ---, bytes that are not valid UTF-8, or a symbolic link or junction anywhere in
#   the path all put the file in `skipped`.
#
# SAFETY: dry run by default; it prints what it would change and writes nothing. -Apply writes,
#   and first copies every file it is about to touch into a backup folder OUTSIDE %TEMP% and outside
#   Google Drive - %USERPROFILE%\KTHObsidian-backups\tags-to-list-<time> - keeping the relative
#   paths, with a manifest. -BackupDir overrides, but never into the vault, and it must be an ABSOLUTE
#   path: a relative one resolves against the process working directory, not the vault (T7), and that
#   once wrote 536 backups into an employer-synced OneDrive folder. Right before writing a
#   file it reads it again and skips it if anything changed it since the scan. -Apply refuses to run
#   while Obsidian is running and this folder is one of Obsidian's vaults, because the app holds the
#   notes in memory and can write a stale copy back.
#   -RestoreFrom <backup folder> puts every backed-up file back: a dry run on its own, -Apply writes.
#
# AFTER RUNNING WITH -Apply, in this order:
#   1. Get-SRIntegrity.ps1 -Compare -BaselinePath <yours>   (take -Save right before the run).
#      Every figure must be unchanged: this edit must not move a card, a marker or a deck's nosr.
#   2. Vault-Audit.ps1                inlineStyleTags must be gone.
#
# EXIT: 0 when nothing needs converting and nothing was skipped or failed. 1 otherwise - files to
#   convert (dry run), files converted (-Apply), or anything skipped or failed - so read the RESULT
#   line, not the exit code, to see whether a run went well. -RestoreFrom: 0 when every file
#   already matches its backup, 1 when files would be or were restored, or anything failed.
#
# Pure ASCII on purpose: PowerShell 5.1 reads .ps1 as ANSI, so a Swedish literal here would match
# nothing (T1). Values are classified with \p{L} and copied from the file, never compared with a
# literal. Paths come from Get-ChildItem, never from git or the console (T2).

[CmdletBinding()]
param(
  [string]$Root,
  [string]$BackupDir,
  [string]$RestoreFrom,
  [string[]]$ExcludePath = @(),
  [switch]$Apply
)
$ErrorActionPreference = 'Stop'

if (-not $Root) {
  $d = Get-Item -LiteralPath $PSScriptRoot
  while ($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))) { $d = $d.Parent }
  if ($d) { $Root = $d.FullName }
}
if (-not $Root -or -not (Test-Path -LiteralPath (Join-Path $Root 'KTH'))) {
  Write-Output 'ERROR: vault root (the folder containing KTH) not found - pass -Root'
  exit 1
}
# Canonicalise before any path arithmetic: an 8.3 short-name root shifts every Substring (T10).
$Root = (Get-Item -LiteralPath $Root).FullName.TrimEnd('\')

$utf8Strict   = New-Object System.Text.UTF8Encoding($false, $true)
$utf8Plain    = New-Object System.Text.UTF8Encoding($false)
$manifestName = 'tags-to-list-manifest.txt'

function Test-SameBytes([byte[]]$a, [byte[]]$b) {
  if ($a.Length -ne $b.Length) { return $false }
  return [System.Linq.Enumerable]::SequenceEqual($a, $b)
}

# ---------------- restore ----------------
if ($RestoreFrom) {
  $rf = (Get-Item -LiteralPath $RestoreFrom).FullName.TrimEnd('\')
  $mf = [System.IO.Path]::Combine($rf, $manifestName)
  if (-not [System.IO.File]::Exists($mf)) { Write-Output ('ERROR: no ' + $manifestName + ' in ' + $rf); exit 1 }
  $ml = [System.IO.File]::ReadAllLines($mf, [System.Text.Encoding]::UTF8)
  if ($ml.Count -lt 1 -or -not $ml[0].StartsWith('# root: ', [System.StringComparison]::Ordinal)) {
    Write-Output 'ERROR: the manifest has no root line'
    exit 1
  }
  $mroot = $ml[0].Substring(8)
  if (-not [string]::Equals($mroot, $Root, [System.StringComparison]::OrdinalIgnoreCase)) {
    Write-Output ('ERROR: this backup was taken from ' + $mroot + ', not from ' + $Root + '. Pass -Root to restore into that folder.')
    exit 1
  }
  $rmode = 'DRY RUN - nothing is written'
  if ($Apply) { $rmode = 'APPLY' }
  Write-Output ('=== Convert-TagsToList -RestoreFrom  ' + $rmode + ' ===')
  Write-Output ('backup: ' + $rf)
  Write-Output ('root:   ' + $Root)
  $same = 0; $todo = 0; $done = 0
  $bad = New-Object System.Collections.Generic.List[string]
  for ($i = 1; $i -lt $ml.Count; $i++) {
    $rel = $ml[$i]
    if ($rel -eq '') { continue }
    $src = [System.IO.Path]::Combine($rf, $rel)
    $dst = [System.IO.Path]::Combine($Root, $rel)
    try {
      $orig = [System.IO.File]::ReadAllBytes($src)
      $cur = $null
      if ([System.IO.File]::Exists($dst)) { $cur = [System.IO.File]::ReadAllBytes($dst) }
      if ($null -ne $cur -and (Test-SameBytes $cur $orig)) { $same++; continue }
      if (-not $Apply) { $todo++; Write-Output ('  would restore  ' + $rel); continue }
      [System.IO.File]::WriteAllBytes($dst, $orig)
      if (Test-SameBytes ([System.IO.File]::ReadAllBytes($dst)) $orig) { $done++; Write-Output ('  restored       ' + $rel) }
      else { $bad.Add('  ' + $rel + '  ::  the read-back differs from the backup') }
    } catch {
      $bad.Add('  ' + $rel + '  ::  ' + $_.Exception.Message)
    }
  }
  if ($bad.Count -gt 0) { Write-Output '--- FAILED ---'; foreach ($x in $bad) { Write-Output $x } }
  Write-Output ('SUMMARY alreadyOriginal=' + $same + ' wouldRestore=' + $todo + ' restored=' + $done + ' failed=' + $bad.Count)
  if ($bad.Count -eq 0 -and $todo -eq 0 -and $done -eq 0) { Write-Output 'RESULT: clean - every file already matches its backup.'; exit 0 }
  if ($bad.Count -gt 0) { Write-Output 'RESULT: some files could not be restored - see FAILED.' }
  elseif ($Apply) { Write-Output ('RESULT: restored ' + $done + ' files from the backup.') }
  else { Write-Output ('RESULT: would restore ' + $todo + ' files. Re-run with -Apply to write.') }
  exit 1
}

# ---------------- scope: a verbatim copy of Vault-Audit.ps1's InScope ----------------
function InScope($full,$name){
  if($full -match '\\\.obsidian\\' -or $full -match '\\\.trash\\' -or $full -match '\\node_modules\\'){ return $false }
  if($full -match '\\\.kiro\\'){ return $false }                  # agent context, not study content
  # Standard section 6: NOTHING under a Filer/ folder is an authored note - Excalidraw
  # drawings, copyrighted course literature and its conversions, and third-party course
  # material downloaded from Canvas (KTH templates, grading criteria, seminar slides,
  # other students' example theses). The literature naming rules do not apply to the
  # Canvas files either, because the official document titles legitimately contain course
  # codes. Stating the rule once here is deliberate: the three narrower exclusions this
  # replaced (Litteraturlista, Filer\Canvas, *.excalidraw.md) happened to cover every file
  # only by coincidence, which is not the same as enforcing the rule.
  if($full -match '\\Filer\\'){ return $false }
  if($full -match '\\Litteraturlista\\'){ return $false }          # also outside a Filer/ folder
  if($full -match '\\Ericsson\\'){ return $false }                 # work notes, not studies
  if($full -match 'Obsidian Plugins\\Templates'){ return $false }  # templates
  if($full -match '\\Kurs Mapp Mall\\'){ return $false }           # empty skeleton
  if($name -match '\.(opt|ai)\.md$'){ return $false }              # book text dumps
  if($name -match '\.excalidraw\.md$'){ return $false }            # drawings
  if($name -eq '_index.md'){ return $false }                       # generated indexes
  return $true
}
# _index.md is outside the audit, but its tags follow the same rule. Put it through every other
# exclusion by asking InScope about a neutral file name in the same folder. -ExcludePath takes
# literal substrings (case-insensitive) matched against the path, so a folder another agent is
# editing - a course being converted, a half-finished move - can be left entirely alone. It is
# empty by default, so a normal run is unaffected.
function InConvertScope($full, $name) {
  foreach ($x in $ExcludePath) {
    if ($x -and $full.IndexOf($x, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) { return $false }
  }
  if (InScope $full $name) { return $true }
  if ($name -eq '_index.md') { return (InScope $full 'note.md') }
  return $false
}

# ---------------- parsing ----------------
# Returns $null when the text has no frontmatter. Otherwise Lines (from the opening fence up to and
# including the closing one, each with its Start offset, Text without terminator, and Eol), CloseIdx
# and CloseOk. The closing fence is the first later line that STARTS with ---, which is where
# Vault-Audit.ps1's pattern stops too; CloseOk is false when that line is not exactly ---. Line by
# line on purpose: a (?s) pattern runs past the frontmatter to any later --- in the body (T13).
function Read-Frontmatter([string]$text) {
  $lines = New-Object System.Collections.Generic.List[object]
  $pos = 0
  $n = $text.Length
  while ($pos -lt $n) {
    $nl = $text.IndexOf([char]10, $pos)
    $end = $n
    $eol = ''
    if ($nl -ge 0) { $end = $nl; $eol = "`n" }
    $content = $text.Substring($pos, $end - $pos)
    if ($eol -ne '' -and $content.EndsWith("`r", [System.StringComparison]::Ordinal)) {
      $content = $content.Substring(0, $content.Length - 1)
      $eol = "`r`n"
    }
    $lines.Add([pscustomobject]@{ Start = $pos; Text = $content; Eol = $eol })
    $idx = $lines.Count - 1
    if ($idx -eq 0 -and -not [string]::Equals($content, '---', [System.StringComparison]::Ordinal)) { return $null }
    if ($idx -gt 0 -and $content.StartsWith('---', [System.StringComparison]::Ordinal)) {
      return [pscustomobject]@{ Lines = $lines; CloseIdx = $idx; CloseOk = [string]::Equals($content, '---', [System.StringComparison]::Ordinal) }
    }
    if ($eol -eq '') { break }
    $pos = $end + 1
  }
  return $null
}

# The list reader: the lines after a bare `tags:` that are list items, up to the first line that is
# not. Kept apart from the writer below on purpose - the values must survive a round trip through
# a parser that did not produce them. Vault-Audit.ps1 reads list-form tags the same way.
function Read-ListTags([string]$text) {
  $fm = Read-Frontmatter $text
  if ($null -eq $fm -or -not $fm.CloseOk) { return $null }
  $ti = -1
  for ($i = 1; $i -lt $fm.CloseIdx; $i++) { if ($fm.Lines[$i].Text -cmatch '^tags:[ \t]*$') { $ti = $i; break } }
  if ($ti -lt 0) { return $null }
  $out = New-Object System.Collections.Generic.List[string]
  for ($i = $ti + 1; $i -lt $fm.CloseIdx; $i++) {
    $m = [regex]::Match($fm.Lines[$i].Text, '^[ \t]*-[ \t]+(.*?)[ \t]*$')
    if (-not $m.Success) { break }
    $out.Add($m.Groups[1].Value)
  }
  return [pscustomobject]@{ Values = $out; CloseIdx = $fm.CloseIdx }
}

# Decides what to do with one file, without writing anything. Kind is one of the six buckets above;
# for 'convert' it also carries Values and the complete new file as NewBytes.
function Get-Plan([byte[]]$bytes) {
  $r = [pscustomobject]@{ Kind = ''; Reason = ''; Values = $null; NewBytes = $null }
  $hadBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
  $off = 0
  if ($hadBom) { $off = 3 }
  try { $text = $utf8Strict.GetString($bytes, $off, $bytes.Length - $off) }
  catch { $r.Kind = 'skipped'; $r.Reason = 'not valid UTF-8'; return $r }

  $fm = Read-Frontmatter $text
  if ($null -eq $fm) { $r.Kind = 'noTags'; return $r }
  $lines = $fm.Lines
  $close = $fm.CloseIdx
  $sb = New-Object System.Text.StringBuilder
  for ($i = 1; $i -lt $close; $i++) { [void]$sb.Append($lines[$i].Text).Append("`n") }
  if ($sb.ToString() -match 'excalidraw') { $r.Kind = 'excalidraw'; return $r }
  if (-not $fm.CloseOk) { $r.Kind = 'skipped'; $r.Reason = 'the closing frontmatter fence is not exactly ---'; return $r }

  # -match is case-insensitive on purpose here: Tags:, TAG: and tag: are all keys Obsidian reads.
  $keys = New-Object System.Collections.Generic.List[int]
  for ($i = 1; $i -lt $close; $i++) { if ($lines[$i].Text -match '^tags?[ \t]*:') { $keys.Add($i) } }
  if ($keys.Count -eq 0) { $r.Kind = 'noTags'; return $r }
  if ($keys.Count -gt 1) { $r.Kind = 'skipped'; $r.Reason = 'more than one tags key in the frontmatter'; return $r }
  $k = $keys[0]
  $tl = $lines[$k]
  if ($tl.Text -cmatch '^tags:[ \t]*$') {
    if ($k + 1 -lt $close -and $lines[$k + 1].Text -match '^[ \t]*-[ \t]+\S') { $r.Kind = 'alreadyList'; return $r }
    $r.Kind = 'skipped'; $r.Reason = 'a tags key with no values'; return $r
  }
  $im = [regex]::Match($tl.Text, '^tags:[ \t]*\[([^\[\]]*)\][ \t]*$')
  if (-not $im.Success) { $r.Kind = 'skipped'; $r.Reason = 'the tags line is neither a plain inline list nor list form: ' + $tl.Text; return $r }

  # A value goes into the list unquoted, so it must mean the same thing there as inside [ ]: letters,
  # digits, _ / and -, starting with a letter or digit. Anything else is skipped, never quoted.
  $vals = New-Object System.Collections.Generic.List[string]
  foreach ($piece in $im.Groups[1].Value.Split([char]',')) {
    $v = $piece.Trim([char[]]@([char]32, [char]9))
    if (-not [regex]::IsMatch($v, '^[\p{L}\p{N}][\p{L}\p{M}\p{N}_/\-]*$')) {
      $r.Kind = 'skipped'; $r.Reason = 'a value would need YAML quoting, or is empty: [' + $v + ']'; return $r
    }
    $vals.Add($v)
  }

  $nCrlf = [regex]::Matches($text, '\r\n').Count
  $nLf   = [regex]::Matches($text, '(?<!\r)\n').Count
  $nCr   = [regex]::Matches($text, '\r(?!\n)').Count
  if ($nCr -gt 0) { $r.Kind = 'skipped'; $r.Reason = 'contains a lone CR'; return $r }
  if ($nCrlf -gt 0 -and $nLf -gt 0) { $r.Kind = 'skipped'; $r.Reason = ('mixed line endings: ' + $nCrlf + ' CRLF and ' + $nLf + ' LF'); return $r }
  $eol = $tl.Eol
  if ($eol -eq '') { $r.Kind = 'skipped'; $r.Reason = 'the tags line has no line ending'; return $r }

  $blk = New-Object System.Text.StringBuilder
  [void]$blk.Append('tags:').Append($eol)
  foreach ($v in $vals) { [void]$blk.Append('  - ').Append($v).Append($eol) }
  $block = $blk.ToString()
  $prefix = $text.Substring(0, $tl.Start)
  $suffix = $text.Substring($tl.Start + $tl.Text.Length + $eol.Length)
  $newText = $prefix + $block + $suffix

  # Check 1: the slices are right - the original is exactly prefix + old line + suffix.
  if (-not [string]::Equals(($prefix + $tl.Text + $eol + $suffix), $text, [System.StringComparison]::Ordinal)) {
    $r.Kind = 'skipped'; $r.Reason = 'internal check failed: the slices do not rebuild the original'; return $r
  }
  # Check 2: the decoding is lossless, so equal strings outside the block mean equal bytes.
  $origBody = $utf8Plain.GetBytes($text)
  $origLen = $bytes.Length - $off
  $sameBody = ($origBody.Length -eq $origLen)
  if ($sameBody) {
    $tail = New-Object byte[] $origLen
    [Array]::Copy($bytes, $off, $tail, 0, $origLen)
    $sameBody = Test-SameBytes $origBody $tail
  }
  if (-not $sameBody) { $r.Kind = 'skipped'; $r.Reason = 'internal check failed: the text does not re-encode to the same bytes'; return $r }
  # Check 3: an independent re-read of the new text gives the same values, in the same order, and
  # the frontmatter still closes where it should, one line further down per value.
  $back = Read-ListTags $newText
  $okBack = ($null -ne $back -and $back.Values.Count -eq $vals.Count -and $back.CloseIdx -eq ($close + $vals.Count))
  if ($okBack) {
    for ($i = 0; $i -lt $vals.Count; $i++) {
      if (-not [string]::Equals($back.Values[$i], $vals[$i], [System.StringComparison]::Ordinal)) { $okBack = $false; break }
    }
  }
  if (-not $okBack) { $r.Kind = 'skipped'; $r.Reason = 'internal check failed: the new list does not read back as the old values'; return $r }

  $newBody = $utf8Plain.GetBytes($newText)
  $nb = $newBody
  if ($hadBom) {
    $nb = New-Object byte[] ($newBody.Length + 3)
    $nb[0] = 0xEF; $nb[1] = 0xBB; $nb[2] = 0xBF
    [Array]::Copy($newBody, 0, $nb, 3, $newBody.Length)
  }
  $r.Kind = 'convert'
  $r.Values = $vals
  $r.NewBytes = $nb
  return $r
}

# True when Obsidian lists this folder as one of its vaults. Fails closed: a config that cannot be
# read counts as yes, so -Apply then refuses while the app runs.
function Test-RegisteredVault([string]$path) {
  if (-not $env:APPDATA) { return $true }
  $cfg = [System.IO.Path]::Combine($env:APPDATA, 'obsidian\obsidian.json')
  if (-not [System.IO.File]::Exists($cfg)) { return $true }
  try {
    $j = [System.IO.File]::ReadAllText($cfg, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
    foreach ($v in $j.vaults.PSObject.Properties) {
      $vp = ([string]$v.Value.path).TrimEnd('\')
      if ([string]::Equals($vp, $path, [System.StringComparison]::OrdinalIgnoreCase)) { return $true }
    }
    return $false
  } catch { return $true }
}

# True when the file, or any folder between it and the vault root, is a reparse point.
function Test-Reparse($file) {
  $rp = [System.IO.FileAttributes]::ReparsePoint
  if (($file.Attributes -band $rp) -ne 0) { return $true }
  $d = $file.Directory
  while ($null -ne $d -and $d.FullName.Length -gt $Root.Length) {
    if (($d.Attributes -band $rp) -ne 0) { return $true }
    $d = $d.Parent
  }
  return $false
}

# ---------------- run ----------------
if ($Apply) {
  $obs = @(Get-Process -Name 'Obsidian' -ErrorAction SilentlyContinue)
  if ($obs.Count -gt 0 -and (Test-RegisteredVault $Root)) {
    Write-Output 'ERROR: Obsidian is running and this folder is one of its vaults. Close Obsidian completely, then run again.'
    exit 1
  }
  if (-not $BackupDir) {
    $BackupDir = [System.IO.Path]::Combine($env:USERPROFILE, 'KTHObsidian-backups', ('tags-to-list-' + (Get-Date).ToString('yyyy-MM-dd-HHmmss')))
  }
  # -BackupDir MUST be absolute. A relative value is resolved by .NET against the PROCESS working
  # directory, which Set-Location does not change (T7), so it lands somewhere unrelated to the vault.
  # On 2026-10-24 a stray positional argument bound to -BackupDir as the relative path 'SF1686' and
  # 536 backups were written into the author's employer-synced OneDrive folder before anyone noticed.
  # Refuse instead of guessing where the caller meant.
  if (-not [System.IO.Path]::IsPathRooted($BackupDir)) {
    Write-Output ('ERROR: -BackupDir must be an absolute path. Got: ' + $BackupDir)
    Write-Output '       A relative path resolves against the process working directory, not the vault.'
    exit 1
  }
  $BackupDir = [System.IO.Path]::GetFullPath($BackupDir).TrimEnd('\')
  if ($BackupDir.StartsWith($Root + '\', [System.StringComparison]::OrdinalIgnoreCase) -or [string]::Equals($BackupDir, $Root, [System.StringComparison]::OrdinalIgnoreCase)) {
    Write-Output 'ERROR: -BackupDir is inside the vault. A backup there would be committed and converted itself.'
    exit 1
  }
  if ([System.IO.File]::Exists([System.IO.Path]::Combine($BackupDir, $manifestName))) {
    Write-Output ('ERROR: ' + $BackupDir + ' already holds a backup. Pick an empty folder.')
    exit 1
  }
}

$files = @(Get-ChildItem -LiteralPath $Root -Recurse -File | Where-Object { $_.Extension -eq '.md' -and (InConvertScope $_.FullName $_.Name) } | Sort-Object FullName)
$nIndex = @($files | Where-Object { $_.Name -eq '_index.md' }).Count

$counts = [ordered]@{ convert = 0; alreadyList = 0; noTags = 0; excalidraw = 0; skipped = 0; failed = 0 }
$convLines = New-Object System.Collections.Generic.List[string]
$skipLines = New-Object System.Collections.Generic.List[string]
$failLines = New-Object System.Collections.Generic.List[string]
$nosrConverted = 0
$manifest = $null

foreach ($f in $files) {
  $rel = $f.FullName.Substring($Root.Length + 1)
  # A symbolic link or junction would make the write land on a file outside the vault, and its backup
  # would hold the target's content rather than the link. None exists today (0 measured 2026-10-24);
  # skip one rather than follow it.
  if (Test-Reparse $f) { $counts['skipped'] = $counts['skipped'] + 1; $skipLines.Add('  ' + $rel + '  ::  a symbolic link, junction or other reparse point, in the path or the file - not followed'); continue }
  try { $bytes = [System.IO.File]::ReadAllBytes($f.FullName) }
  catch { $counts['skipped'] = $counts['skipped'] + 1; $skipLines.Add('  ' + $rel + '  ::  cannot be read: ' + $_.Exception.Message); continue }
  $p = Get-Plan $bytes
  if ($p.Kind -ne 'convert') {
    $counts[$p.Kind] = $counts[$p.Kind] + 1
    if ($p.Kind -eq 'skipped') { $skipLines.Add('  ' + $rel + '  ::  ' + $p.Reason) }
    continue
  }
  $line = '  ' + $rel + '  ::  ' + $p.Values.Count + ' tags: ' + ($p.Values -join ', ')
  if (-not $Apply) {
    $counts['convert'] = $counts['convert'] + 1
    $convLines.Add($line)
    if ($p.Values.Contains('nosr')) { $nosrConverted++ }
    continue
  }
  $wrote = $false
  try {
    # Something else may have written the file since it was read: Drive, the app, the phone.
    $now = [System.IO.File]::ReadAllBytes($f.FullName)
    if (-not (Test-SameBytes $now $bytes)) {
      $counts['skipped'] = $counts['skipped'] + 1
      $skipLines.Add('  ' + $rel + '  ::  changed on disk during the run - not touched')
      continue
    }
    if ($null -eq $manifest) {
      [void][System.IO.Directory]::CreateDirectory($BackupDir)
      $manifest = [System.IO.Path]::Combine($BackupDir, $manifestName)
      [System.IO.File]::WriteAllText($manifest, ('# root: ' + $Root + "`n"), $utf8Plain)
    }
    $bk = [System.IO.Path]::Combine($BackupDir, $rel)
    [void][System.IO.Directory]::CreateDirectory([System.IO.Path]::GetDirectoryName($bk))
    [System.IO.File]::WriteAllBytes($bk, $bytes)
    if (-not (Test-SameBytes ([System.IO.File]::ReadAllBytes($bk)) $bytes)) { throw 'the backup copy did not verify' }
    [System.IO.File]::AppendAllText($manifest, ($rel + "`n"), $utf8Plain)
    $wrote = $true
    [System.IO.File]::WriteAllBytes($f.FullName, $p.NewBytes)
    if (-not (Test-SameBytes ([System.IO.File]::ReadAllBytes($f.FullName)) $p.NewBytes)) { throw 'the read-back after the write differs from the intended bytes' }
    $counts['convert'] = $counts['convert'] + 1
    $convLines.Add($line)
    if ($p.Values.Contains('nosr')) { $nosrConverted++ }
  } catch {
    $msg = $_.Exception.Message
    $state = 'file not written'
    if ($wrote) {
      $cur = $null
      try { $cur = [System.IO.File]::ReadAllBytes($f.FullName) } catch { $cur = $null }
      if ($null -ne $cur -and (Test-SameBytes $cur $bytes)) { $state = 'file unchanged' }
      else {
        try {
          [System.IO.File]::WriteAllBytes($f.FullName, $bytes)
          if (Test-SameBytes ([System.IO.File]::ReadAllBytes($f.FullName)) $bytes) { $state = 'original restored' }
          else { $state = 'RESTORE DID NOT VERIFY - use the backup' }
        } catch { $state = 'RESTORE FAILED - use the backup: ' + $_.Exception.Message }
      }
    }
    $counts['failed'] = $counts['failed'] + 1
    $failLines.Add('  ' + $rel + '  ::  ' + $msg + ' (' + $state + ')')
  }
}

$mode = 'DRY RUN - nothing is written'
if ($Apply) { $mode = 'APPLY' }
Write-Output ('=== Convert-TagsToList  ' + (Get-Date -Format 'yyyy-MM-dd HH:mm') + '  ' + $mode + ' ===')
Write-Output ('root: ' + $Root)
Write-Output ('files in scope: ' + $files.Count + ' (the audit scope plus ' + $nIndex + ' _index.md)')
Write-Output ''
if ($convLines.Count -gt 0) {
  if ($Apply) { Write-Output '--- converted ---' } else { Write-Output '--- would convert ---' }
  foreach ($x in $convLines) { Write-Output $x }
  Write-Output ''
}
if ($skipLines.Count -gt 0) {
  Write-Output '--- skipped, NOT touched: fix by hand, then re-run ---'
  foreach ($x in $skipLines) { Write-Output $x }
  Write-Output ''
}
if ($failLines.Count -gt 0) {
  Write-Output '--- FAILED ---'
  foreach ($x in $failLines) { Write-Output $x }
  Write-Output ''
}
$parts = @()
foreach ($key in $counts.Keys) { $parts += ($key + '=' + $counts[$key]) }
Write-Output ('SUMMARY ' + ($parts -join ' '))
Write-Output ('nosr in the converted files: ' + $nosrConverted)
if ($Apply -and $null -ne $manifest) {
  Write-Output ('backup:  ' + $BackupDir)
  Write-Output ('restore: powershell -NoProfile -ExecutionPolicy Bypass -File "' + $PSCommandPath + '" -Root "' + $Root + '" -RestoreFrom "' + $BackupDir + '" -Apply')
}
$problems = $counts['skipped'] + $counts['failed']
if ($counts['convert'] -eq 0 -and $problems -eq 0) {
  Write-Output 'RESULT: clean - no inline tags left to convert.'
  exit 0
}
if ($Apply) {
  Write-Output ('RESULT: converted ' + $counts['convert'] + ', skipped ' + $counts['skipped'] + ', failed ' + $counts['failed'] + '.')
  Write-Output 'Next: Get-SRIntegrity.ps1 -Compare with your own -BaselinePath, every figure unchanged; then Vault-Audit.ps1.'
} else {
  Write-Output ('RESULT: would convert ' + $counts['convert'] + ', would skip ' + $counts['skipped'] + '. Dry run - re-run with -Apply to write.')
}
exit 1
