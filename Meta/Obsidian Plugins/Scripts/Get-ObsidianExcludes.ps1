#
# Get-ObsidianExcludes.ps1 - what Obsidian's "Excluded files" setting actually matches.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail        list the matched files, not just the counts
#   ... -Root <path>   audit a different vault
#
# WHAT THIS COUNTS
#   For each entry in userIgnoreFilters (.obsidian/app.json), the number of .md files
#   whose VAULT-RELATIVE, FORWARD-SLASH path the filter matches. Files under .obsidian/,
#   .trash/ and .git/ are not counted - Obsidian does not index them either. It then
#   reports how many .md files under a Filer/ folder are left uncovered, which is the
#   same condition the audit's tagIndexNotExcluded check enforces.
#
# WHY IT EXISTS
#   The filter syntax is not what it looks like, and a wrong filter fails silently.
#   From obsidian-1.13.7.asar, MetadataCache.updateUserIgnoreFilters:
#
#     o.length > 2 && o.startsWith("/") && o.endsWith("/")
#       ? new RegExp(o.substring(1, o.length - 1), "i")   // regex, matches anywhere
#       : new RegExp("^" + escape(o), "i")                // literal, anchored PREFIX
#
#   A bare "Obsidian Plugins/" was in this vault's settings for months and matched zero
#   files, because the real path is "Meta/Obsidian Plugins/" and an unwrapped filter is
#   anchored at the start. Nothing reported it. This script does: a filter that matches
#   0 files is flagged INERT.
#
#   The setting matters more than its own description admits. MetadataCache.getTags()
#   skips ignored paths and the tag pane is built from getTags(), so this is the only
#   mechanism that keeps a junk tag - #include, #page-12-0 - out of the tag pane.
#
# READ-ONLY. This script never writes to the vault.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI, so Swedish literals in
# the source would be mis-decoded. Filter strings are read from app.json as UTF-8, which
# is why the Swedish ones below print correctly.
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

# ---------------------------------------------------------------- read the setting
$appJson = Join-Path $Root '.obsidian\app.json'
if (-not (Test-Path -LiteralPath $appJson)) { throw ".obsidian\app.json not found under $Root" }
$cfg = [System.IO.File]::ReadAllText($appJson, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
$filters = @()
if ($cfg.PSObject.Properties.Name -contains 'userIgnoreFilters' -and $cfg.userIgnoreFilters) {
  $filters = @($cfg.userIgnoreFilters)
}

# ------------------------------------------------- compile them the way Obsidian does
function New-ObsidianFilter([string]$raw) {
  $s = $raw.Trim()
  if ($s.Length -eq 0) { return $null }
  if ($s.Length -gt 2 -and $s.StartsWith('/') -and $s.EndsWith('/')) {
    $kind = 'regex'
    $pattern = $s.Substring(1, $s.Length - 2)
  } else {
    $kind = 'prefix'
    $pattern = '^' + [regex]::Escape($s)
  }
  try {
    $rx = [regex]::new($pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
  } catch {
    # Obsidian logs "Bad regex for user ignore filter" and drops the entry.
    return [pscustomobject]@{ Raw = $raw; Kind = $kind; Regex = $null; Broken = $true }
  }
  return [pscustomobject]@{ Raw = $raw; Kind = $kind; Regex = $rx; Broken = $false }
}
$compiled = @()
foreach ($f in $filters) { $c = New-ObsidianFilter $f; if ($c) { $compiled += $c } }

# ---------------------------------------------------------------------- collect files
$md = @(Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.md | Where-Object {
  $p = $_.FullName
  ($p -notmatch '\\\.obsidian\\') -and ($p -notmatch '\\\.trash\\') -and ($p -notmatch '\\\.git\\') -and ($p -notmatch '\\node_modules\\')
})
$rels = @($md | ForEach-Object { $_.FullName.Substring($Root.Length + 1) -replace '\\', '/' })
$filerRels = @($rels | Where-Object { $_ -match '(^|/)Filer/' })

Write-Output "Obsidian userIgnoreFilters - $Root"
Write-Output ("md files considered: {0}   of which under a Filer/ folder: {1}" -f $rels.Count, $filerRels.Count)
Write-Output ""
Write-Output ("{0,-8} {1,-8} {2}" -f 'KIND', 'MATCHES', 'FILTER')
Write-Output ("-" * 100)

$coveredAll = New-Object 'System.Collections.Generic.HashSet[string]'
$inert = 0
foreach ($c in $compiled) {
  if ($c.Broken) {
    Write-Output ("{0,-8} {1,-8} {2}" -f $c.Kind, 'BROKEN', $c.Raw)
    continue
  }
  $hits = @($rels | Where-Object { $c.Regex.IsMatch($_) })
  foreach ($h in $hits) { [void]$coveredAll.Add($h) }
  $flag = ''
  if ($hits.Count -eq 0) { $flag = '   <- INERT: matches nothing'; $inert++ }
  Write-Output ("{0,-8} {1,-8} {2}{3}" -f $c.Kind, $hits.Count, $c.Raw, $flag)
  if ($Detail) { foreach ($h in ($hits | Sort-Object)) { Write-Output ("             " + $h) } }
}

Write-Output ""
Write-Output ("total .md files excluded from the tag index: {0} of {1}" -f $coveredAll.Count, $rels.Count)

$uncovered = @($filerRels | Where-Object { -not $coveredAll.Contains($_) })
Write-Output ("Filer/ files NOT excluded: {0}" -f $uncovered.Count)
foreach ($u in ($uncovered | Sort-Object)) { Write-Output ("   " + $u) }

$collateral = @($coveredAll | Where-Object { $_ -notmatch '(^|/)Filer/' })
Write-Output ""
Write-Output ("excluded files OUTSIDE Filer/: {0} (expected: the Meta templates and the four Instuderingsfragor notes)" -f $collateral.Count)
foreach ($c2 in ($collateral | Sort-Object)) { Write-Output ("   " + $c2) }

Write-Output ""
if ($inert -gt 0) {
  Write-Output "RESULT: $inert filter(s) match nothing. An unwrapped filter is an anchored PREFIX,"
  Write-Output "        not a path fragment - wrap path fragments in / / to make them regexes."
  exit 1
}
if ($uncovered.Count -gt 0) {
  Write-Output "RESULT: $($uncovered.Count) file(s) under Filer/ are still in the tag index."
  exit 1
}
Write-Output "RESULT: clean - every Filer/ file is excluded and no filter is inert."
exit 0
