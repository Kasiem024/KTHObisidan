#
# Get-TagInventory.ps1 - every tag Obsidian would index, and which file put it there.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail        list the files behind each tag
#   ... -Root <path>   inspect a different vault
#
# WHAT THIS COUNTS
#   Two separate populations, never mixed:
#     frontmatter tags - values of the `tags:` key, inline-array or list style.
#     inline tags      - "#tag" in the note body, with fenced code blocks and inline code
#                        spans removed first, because Obsidian does not index those.
#   A "#" only starts a tag when preceded by start-of-line, whitespace, "(", "[" or ">".
#   Purely numeric values are not tags. Files under .obsidian/, .trash/, .git/ and
#   node_modules/ are excluded, matching what Obsidian itself indexes.
#
#   The headline number is INLINE TAGS THAT EXIST ONLY IN OUT-OF-SCOPE FILES. Those are
#   the junk ones: they reach the tag pane without any note ever having asked for them.
#
# WHY IT EXISTS
#   Measured 2026-09-06: 52 of the vault's 69 distinct inline tags existed only in Filer/
#   files - 42 "#page-N-M" OCR anchors, "#include" 15 times from a C listing inside a
#   converted textbook, and postal-address debris such as "#633/EC/US". Not one overlapped
#   with a tag a real note uses, which is what made a blanket Filer/ exclusion safe.
#   That "zero overlap" is the fact worth re-measuring before touching the exclusion again;
#   this script is how it was established (F67).
#
#   It is deliberately NOT part of Vault-Audit.ps1. The audit answers "does the vault
#   follow the standard"; this answers "what does Obsidian think is in the vault", which is
#   a different question and has no pass/fail.
#
# READ-ONLY. This script never writes to the vault.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI. Tag names read from notes
# are Swedish and print correctly because the files are decoded as UTF-8 - but redirect
# output to a file if your console mangles them.
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

function Read-VaultText($path) {
  $b = [System.IO.File]::ReadAllBytes($path)
  if ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF) { return $enc.GetString($b, 3, $b.Length - 3) }
  return $enc.GetString($b)
}

# Out of scope per Meta/Vault Standard.md section 6. Kept as one expression so the reason a
# tag is called "junk" is visible rather than implied.
function Test-OutOfScope([string]$relFwd) {
  if ($relFwd -match '(^|/)Filer/')           { return $true }
  if ($relFwd -match '(^|/)Litteraturlista/') { return $true }
  if ($relFwd -match '^Ericsson/')            { return $true }
  if ($relFwd -match '^Meta/Obsidian Plugins/Templates/') { return $true }
  if ($relFwd -match '(^|/)Kurs Mapp Mall/')  { return $true }
  if ($relFwd -match '\.(opt|ai)\.md$')       { return $true }
  return $false
}

$tagRx = [regex]'(?<![^\s\(\[>])#([\p{L}\p{N}_\-/]+)'

function Get-InlineTags([string]$text) {
  # \r? before $ is required: in .NET multiline mode $ matches before the \n without absorbing
  # a preceding \r, so the closing fence never matches in a CRLF file and nothing is stripped.
  # This vault contains both conventions.
  $t = [regex]::Replace($text, '(?ms)^[ \t]*(```|~~~).*?^[ \t]*\1[ \t]*\r?$', "`n")
  $t = [regex]::Replace($t, '`[^`\r\n]*`', ' ')
  $found = @{}
  foreach ($m in $tagRx.Matches($t)) {
    $v = $m.Groups[1].Value
    if ($v -match '^[\p{N}/_\-]+$') { continue }
    if ($found.ContainsKey($v)) { $found[$v]++ } else { $found[$v] = 1 }
  }
  return $found
}

function Get-FrontmatterTags([string]$text) {
  $res = @()
  if ($text.Length -gt 0 -and [int][char]$text[0] -eq 0xFEFF) { $text = $text.Substring(1) }
  $m = [regex]::Match($text, '(?s)\A---\r?\n(.*?)\r?\n---')
  if (-not $m.Success) { return $res }
  $inTags = $false
  foreach ($ln in ($m.Groups[1].Value -split "`r?`n")) {
    if ($ln -match '^\s*tags\s*:\s*(.*)$') {
      $rest = $Matches[1].Trim()
      if ($rest -match '^\[(.*)\]$') {
        foreach ($p in ($Matches[1] -split ',')) { $v = $p.Trim().Trim('"').Trim("'"); if ($v) { $res += $v } }
      } elseif ($rest -ne '') {
        foreach ($p in ($rest -split '[,\s]+')) { if ($p) { $res += $p.Trim('"').Trim("'") } }
      } else { $inTags = $true }
      continue
    }
    if ($inTags) {
      if ($ln -match '^\s*-\s*(.+)$') { $res += $Matches[1].Trim().Trim('"').Trim("'"); continue }
      if ($ln -match '^\S') { $inTags = $false }
    }
  }
  return $res
}

$md = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md | Where-Object {
  $p = $_.FullName
  ($p -notmatch '\\\.obsidian\\') -and ($p -notmatch '\\\.trash\\') -and ($p -notmatch '\\\.git\\') -and ($p -notmatch '\\node_modules\\')
})

$inline = @{}   # tag -> @{ rel -> count }
$front  = @{}   # tag -> list of rel
$nOut = 0
foreach ($f in $md) {
  $rel = ($f.FullName.Substring($Root.Length + 1) -replace '\\', '/')
  if (Test-OutOfScope $rel) { $nOut++ }
  $text = Read-VaultText $f.FullName
  foreach ($t in (Get-FrontmatterTags $text)) {
    if (-not $front.ContainsKey($t)) { $front[$t] = New-Object System.Collections.Generic.List[string] }
    $front[$t].Add($rel) | Out-Null
  }
  $bt = Get-InlineTags $text
  foreach ($k in $bt.Keys) {
    if (-not $inline.ContainsKey($k)) { $inline[$k] = @{} }
    $inline[$k][$rel] = $bt[$k]
  }
}

Write-Output "Tag inventory - $Root"
Write-Output ("md files scanned: {0}   of which out of scope per standard section 6: {1}" -f $md.Count, $nOut)
Write-Output ""

$junk = @()
$shared = @()
$real = @()
foreach ($k in ($inline.Keys | Sort-Object)) {
  $files = @($inline[$k].Keys)
  $inScopeFiles = @($files | Where-Object { -not (Test-OutOfScope $_) })
  if ($inScopeFiles.Count -eq 0) { $junk += $k }
  elseif ($inScopeFiles.Count -lt $files.Count) { $shared += $k }
  else { $real += $k }
}

Write-Output ("distinct inline tags       : {0}" -f $inline.Keys.Count)
Write-Output ("  only in out-of-scope files: {0}   <- junk; excluded from the tag index" -f $junk.Count)
Write-Output ("  in both                   : {0}   <- excluding the folder would hide a real tag" -f $shared.Count)
Write-Output ("  only in real notes         : {0}" -f $real.Count)
Write-Output ("distinct frontmatter tags  : {0}" -f $front.Keys.Count)
Write-Output ""

Write-Output "--- inline tags that exist ONLY in out-of-scope files ---"
foreach ($k in $junk) {
  $tot = 0; foreach ($fx in $inline[$k].Keys) { $tot += $inline[$k][$fx] }
  Write-Output ("  #{0,-24} occurrences={1}  files={2}" -f $k, $tot, $inline[$k].Keys.Count)
  if ($Detail) { foreach ($fx in ($inline[$k].Keys | Sort-Object)) { Write-Output ("        " + $fx + " (x" + $inline[$k][$fx] + ")") } }
}
Write-Output ""

if ($shared.Count -gt 0) {
  Write-Output "--- inline tags in BOTH populations (read this before widening an exclusion) ---"
  foreach ($k in $shared) {
    Write-Output ("  #" + $k)
    foreach ($fx in ($inline[$k].Keys | Sort-Object)) {
      $mark = '  note '
      if (Test-OutOfScope $fx) { $mark = '  SKIP ' }
      Write-Output ("      " + $mark + $fx)
    }
  }
  Write-Output ""
}

Write-Output "--- inline tags used by real notes ---"
foreach ($k in $real) {
  $n = @($inline[$k].Keys | Where-Object { -not (Test-OutOfScope $_) }).Count
  Write-Output ("  #{0,-24} files={1}" -f $k, $n)
}
Write-Output ""

Write-Output "--- frontmatter tags ---"
foreach ($k in ($front.Keys | Sort-Object)) {
  $files = @($front[$k])
  $out = @($files | Where-Object { Test-OutOfScope $_ }).Count
  Write-Output ("  {0,-32} files={1,-5} ofWhichOutOfScope={2}" -f $k, $files.Count, $out)
  if ($Detail) { foreach ($fx in ($files | Sort-Object)) { Write-Output ("        " + $fx) } }
}

# Pure reporting: there is no such thing as a failing tag inventory, so this always exits 0
# (scripts.md rule 4). The explicit exit is here so the convention is visible in the file.
exit 0
