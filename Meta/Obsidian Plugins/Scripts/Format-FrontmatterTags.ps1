# Format-FrontmatterTags.ps1
#
# WHAT IT COUNTS AND WHAT IT CHANGES:
#
#   Finds notes whose frontmatter declares tags in YAML *list* form and rewrites them to this
#   vault's inline form. Nothing else in the file is touched.
#
#       tags:                  becomes      tags: [begrepp, HI1031, KTH, year2026, nosr]
#         - begrepp
#         - HI1031
#         - KTH
#         - year2026
#         - nosr
#
#   Reported figures:
#     files scanned   every .md under <Root>\KTH, which is where notes live
#     files changed   notes that had a bare "tags:" line followed by list items, inside the
#                     leading frontmatter block only
#     tags per file   how many values were folded into the inline list, so the count can be
#                     eyeballed against the file
#
#   IN SCOPE: <Root>\KTH only. Meta/, .kiro/, .obsidian/ and Filer/ are not scanned - no note
#   lives there, and .obsidian/ is read-only by convention.
#
# WHY IT EXISTS: Vault-Audit.ps1's listStyleTags check reports this deviation but nothing repaired
#   it, and conventions.md says a rule the audit reports while nothing may repair it is the worst
#   of both worlds. The deviation also recurs: twelve notes across two courses were rewritten to
#   list form on 2026-09-10 by a process other than the audit, and the repair had to be derived
#   from scratch to get the pre-push hook to pass.
#
# WHAT IT PRESERVES, and why each one matters:
#   - Tag ORDER and every tag VALUE, verbatim. In particular `nosr`, which decides whether a
#     deck's whole card set is in review (F64) - dropping it silently re-enters hundreds of cards.
#     Equally, it never ADDS nosr: HI1031's chapter 2 deck legitimately lacks it.
#   - The BOM, if the file had one. After decoding, a BOM is one character, not three bytes (T9).
#   - The file's existing line endings. This working tree mixes LF and CRLF (T12), and a
#     whole-file rewrite that normalises them would show up as a diff on every line.
#
# WHAT IT DOES NOT DO: it does not touch any other frontmatter key, does not reorder or
#   deduplicate tags, does not validate them against the tag vocabulary in Meta/Vault Standard.md,
#   and does not look outside the leading frontmatter block. It is a formatter, not a linter.
#
# SAFETY: dry run by default - it prints what it would change and writes nothing. `-Apply` writes,
#   and copies every file it is about to touch into a timestamped folder under `%TEMP%` first,
#   which is where Format-NoteWrapping.ps1 puts its backups too. Deliberately outside the vault:
#   a backup written inside the repo would be picked up by the next `git add .` and committed to a
#   public repository. Override with -BackupDir. Re-running after a successful pass is a no-op,
#   because an inline `tags: [...]` line no longer matches.
#
# AFTER RUNNING WITH -Apply, in this order:
#   1. Get-SRIntegrity.ps1 -Compare   (take -Save BEFORE the run). Every figure must be
#      unchanged: this edit must not move a card, a marker or a deck's nosr scope.
#   2. Vault-Audit.ps1                listStyleTags should be gone.
#   3. npx markdownlint-cli2 "**/*.md"
#
# EXIT: 0 when nothing needed changing. 1 when files were found (dry run) or changed (-Apply), so
#   it can be wired into a check the same way Vault-Audit.ps1 is.
#
# Pure ASCII on purpose: PowerShell 5.1 reads .ps1 as ANSI, so a Swedish literal here would match
# nothing (T1). Tag values are read from the file and written straight back, never compared
# against a literal, so Swedish tags such as `natverk` survive untouched. Paths come from
# Get-ChildItem, never hardcoded, because a path containing Swedish characters fails Test-Path
# after mis-decoding (T2).

[CmdletBinding()]
param(
  [string]$Root,
  [string]$Filter = '*.md',
  [string]$BackupDir,
  [switch]$Apply
)

if (-not $Root -or $Root -eq '') {
  # This script lives in <root>\Meta\Obsidian Plugins\Scripts, so the root is four levels up.
  $Root = Split-Path -Parent $PSCommandPath
  $Root = Split-Path -Parent $Root
  $Root = Split-Path -Parent $Root
  $Root = Split-Path -Parent $Root
}
# Canonicalise before any path arithmetic - an 8.3 short-name root shifts every derived
# path segment and silently skips files (T10).
$Root = (Get-Item -LiteralPath $Root).FullName

$scan = Join-Path $Root 'KTH'
if (-not (Test-Path -LiteralPath $scan)) {
  Write-Output ('ERROR: no KTH folder under ' + $Root)
  exit 1
}

$backupDir = $BackupDir
if ($Apply -and (-not $backupDir -or $backupDir -eq '')) {
  # Outside the vault on purpose: a backup written into the repo would be committed by the next
  # `git add .`, and this repository and the site built from it are public.
  $stamp = (Get-Date).ToString('yyyy-MM-dd-HHmmss')
  $backupDir = Join-Path $env:TEMP ('frontmatter-tags-backup-' + $stamp)
}

$report = New-Object System.Collections.Generic.List[string]
$scanned = 0
$changed = 0

foreach ($f in (Get-ChildItem -LiteralPath $scan -Recurse -File -Filter $Filter)) {
  $scanned++
  # Detect the BOM from the BYTES. The pattern that tests the first decoded character cannot work
  # here: [System.IO.File]::ReadAllText($path) detects and CONSUMES the BOM as a preamble, so the
  # string never starts with U+FEFF and a $hadBom flag derived from it is always false - which
  # would silently strip the BOM on write. Verified: a file whose first bytes are EF BB BF reads
  # back with 'h' as its first character. See traps.md T9.
  $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
  $hadBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)

  $raw = [System.IO.File]::ReadAllText($f.FullName)
  if ($raw.Length -lt 8) { continue }
  $body = $raw

  $usesCrlf = $body.Contains([string][char]13 + [string][char]10)

  $lines = New-Object System.Collections.Generic.List[string]
  foreach ($ln in $body.Split([char]10)) {
    $t = $ln
    if ($t.Length -gt 0 -and $t[$t.Length - 1] -eq [char]13) { $t = $t.Substring(0, $t.Length - 1) }
    $lines.Add($t)
  }

  if ($lines.Count -lt 3) { continue }
  if ($lines[0] -ne '---') { continue }

  # Find the closing fence by scanning lines. Do NOT use a (?s) regex for this: a lazy match runs
  # past the frontmatter to the next '---', which Markdown also uses as a horizontal rule (T13).
  $fmEnd = -1
  for ($i = 1; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -eq '---') { $fmEnd = $i; break }
  }
  if ($fmEnd -lt 2) { continue }

  $tagLine = -1
  for ($i = 1; $i -lt $fmEnd; $i++) {
    if ($lines[$i] -match '^tags:[ \t]*$') { $tagLine = $i; break }
  }
  if ($tagLine -lt 0) { continue }

  $vals = New-Object System.Collections.Generic.List[string]
  $j = $tagLine + 1
  while ($j -lt $fmEnd) {
    $m = [regex]::Match($lines[$j], '^[ \t]+-[ \t]*(.+?)[ \t]*$')
    if (-not $m.Success) { break }
    $vals.Add($m.Groups[1].Value)
    $j++
  }
  if ($vals.Count -eq 0) { continue }

  $inline = 'tags: [' + [string]::Join(', ', $vals) + ']'
  $rel = $f.FullName.Substring($Root.Length + 1)
  $changed++

  $report.Add('  ' + $rel)
  $report.Add('      ' + $vals.Count + ' tags -> ' + $inline)

  if ($Apply) {
    if (-not (Test-Path -LiteralPath $backupDir)) {
      New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
    }
    # Flatten the relative path so the backup folder stays one level deep and cannot collide.
    $safe = $rel.Replace('\', '__').Replace('/', '__')
    Copy-Item -LiteralPath $f.FullName -Destination (Join-Path $backupDir $safe) -Force

    $new = New-Object System.Collections.Generic.List[string]
    for ($i = 0; $i -lt $lines.Count; $i++) {
      if ($i -eq $tagLine) { $new.Add($inline); continue }
      if ($i -gt $tagLine -and $i -lt $j) { continue }
      $new.Add($lines[$i])
    }
    $sep = [string][char]10
    if ($usesCrlf) { $sep = [string][char]13 + [string][char]10 }
    $text = [string]::Join($sep, $new)
    # Restore the BOM through the encoding, not by prepending U+FEFF to the string - the encoding
    # emits the preamble, and prepending the character as well would write it twice.
    [System.IO.File]::WriteAllText($f.FullName, $text, (New-Object System.Text.UTF8Encoding($hadBom)))
  }
}

Write-Output ('Frontmatter tag form - ' + $Root)
Write-Output ''
if ($changed -eq 0) {
  Write-Output ('RESULT: clean - ' + $scanned + ' notes scanned, none uses list-form tags.')
  exit 0
}

if ($Apply) { Write-Output ('CHANGED ' + $changed + ' of ' + $scanned + ' notes:') }
else { Write-Output ('WOULD CHANGE ' + $changed + ' of ' + $scanned + ' notes:') }
Write-Output ''
foreach ($x in $report) { Write-Output $x }
Write-Output ''

if ($Apply) {
  Write-Output ('backups: ' + $backupDir)
  Write-Output 'Now run Get-SRIntegrity.ps1 -Compare and require every figure to be unchanged,'
  Write-Output 'then Vault-Audit.ps1 and require listStyleTags to be gone.'
}
else {
  Write-Output 'Dry run - nothing was written. Re-run with -Apply to write.'
  Write-Output 'Take Get-SRIntegrity.ps1 -Save immediately before that run.'
}
exit 1
