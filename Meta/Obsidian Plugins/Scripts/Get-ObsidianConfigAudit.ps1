#
# Get-ObsidianConfigAudit.ps1 - is .obsidian/ internally consistent with itself?
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail        list every plugin and every note, not just the findings
#   ... -Root <path>   audit a different vault, or a throwaway copy
#
# WHAT THIS COUNTS
#   Two populations, and the split is the whole point.
#
#   FINDINGS are drift inside the repository, so they are reproducible on any machine and
#   safe to run in CI. Each is a state where one tracked file in .obsidian/ names something
#   another tracked file does not provide:
#     enabledNoFolder    an id in community-plugins.json with no plugins/<id>/manifest.json
#     deadHotkey         a hotkeys.json command whose plugin id is not installed. The owner is
#                        accepted if it is an installed plugin, a key in core-plugins.json, or
#                        one of Obsidian's built-in command namespaces, which are listed in the
#                        code because they are absent from core-plugins.json. Where the app
#                        bundle is present it settles anything that list missed, as a note.
#     orphanSetting      a "<prefix>@@" key in the Style Settings data whose prefix appears
#                        in no installed theme.css or plugin file
#     missingTheme       appearance.json cssTheme names a theme folder that is not there
#     missingSnippet     an enabledCssSnippets entry with no snippets/<name>.css
#
#   NOTES are never findings, because they depend on the machine rather than the repo and
#   would fire on every CI run:
#     fonts named in appearance.json that are not installed (machine and per-user registry,
#     Windows only), and fonts present for this Windows user only
#     isDesktopOnly per plugin, which is what the phone pays at every launch
#     folder sizes, and any data.json naming an http(s) endpoint
#
#   The exit code therefore answers one question only: does .obsidian/ contradict itself?
#
# WHY IT EXISTS
#   Nothing else looks here. Vault-Audit.ps1's InScope drops any path containing
#   \.obsidian\, .markdownlint-cli2.jsonc lists ".obsidian/**" under ignores, and
#   Test-DocHygiene.ps1 reads .kiro/ only. So the 217 tracked files that decide whether
#   Obsidian works at all are checked by no tool, while a green audit reads as "clean".
#
#   Removing four plugins on 2026-09-08 (Linter, Git, LanguageTool, Settings Search) left
#   two kinds of debris that had to be found by hand, twice: 5 hotkeys bound to commands of
#   plugins that no longer existed, and 21 Style Settings keys belonging to two themes that
#   were not installed. Both are silent. Obsidian ignores a hotkey for a missing command and
#   Style Settings ignores a key for a missing section, so nothing ever complains and the
#   files simply accumulate.
#
#   The notes exist for a different reason. A font named in appearance.json that is not
#   installed is skipped by the font-family fallback stack, so the setting looks authoritative
#   and does nothing - which produced a confidently wrong review finding on 2026-09-08 (F76,
#   and .kiro/lessons-learned.md). Reporting it as a note rather than a finding is deliberate:
#   it is true of this machine, not of the repository.
#
# READ-ONLY. This script never writes to the vault.
#
# Exit 0 = no contradictions, 1 = at least one finding. Notes do not affect the exit code.
#
# Keep this file pure ASCII: PowerShell 5.1 reads .ps1 as ANSI, so Swedish literals in the
# source would be mis-decoded. Values read from JSON are decoded as UTF-8 explicitly.
#
param(
  [string]$Root,
  [switch]$Detail
)
$ErrorActionPreference = 'Stop'

# ------------------------------------------------------------------ find the vault root
if (-not $Root) {
  $d = Get-Item -LiteralPath $PSScriptRoot
  while ($d -ne $null -and -not (Test-Path -LiteralPath (Join-Path $d.FullName 'KTH'))) { $d = $d.Parent }
  if ($d) { $Root = $d.FullName }
}
if (-not $Root -or -not (Test-Path -LiteralPath (Join-Path $Root '.obsidian'))) {
  throw "No .obsidian/ found - pass -Root explicitly"
}
# Canonicalise: an 8.3 short-name root breaks Substring path math (traps T10).
$Root = (Get-Item -LiteralPath $Root).FullName
$ob = Join-Path $Root '.obsidian'

function Read-Utf8([string]$path) {
  return [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
}
function Read-Json([string]$path) {
  if (-not (Test-Path -LiteralPath $path)) { return $null }
  $t = Read-Utf8 $path
  if ($t.Length -gt 0 -and [int][char]$t[0] -eq 0xFEFF) { $t = $t.Substring(1) }
  try { return $t | ConvertFrom-Json } catch { return 'BADJSON' }
}

$findings = New-Object System.Collections.Generic.List[string]
$notes    = New-Object System.Collections.Generic.List[string]
function Add-Finding([string]$check, [string]$what) {
  $findings.Add(("  {0,-18} {1}" -f $check, $what)) | Out-Null
}
function Add-Note([string]$check, [string]$what) {
  $notes.Add(("  {0,-18} {1}" -f $check, $what)) | Out-Null
}

Write-Output "=== OBSIDIAN CONFIG AUDIT  $(Get-Date -Format 'yyyy-MM-dd HH:mm') ==="
Write-Output "root=$Root"

# ------------------------------------------------------------------------- inventory
$pluginDir = Join-Path $ob 'plugins'
$themeDir  = Join-Path $ob 'themes'
$snipDir   = Join-Path $ob 'snippets'

$folders = @()
if (Test-Path -LiteralPath $pluginDir) {
  $folders = @(Get-ChildItem -LiteralPath $pluginDir -Directory | Sort-Object Name)
}
$installed = @{}
foreach ($f in $folders) {
  $mf = Join-Path $f.FullName 'manifest.json'
  $m = Read-Json $mf
  $id = $f.Name
  $ver = ''
  $desktopOnly = $false
  if ($m -ne $null -and $m -ne 'BADJSON') {
    if ($m.id) { $id = $m.id }
    if ($m.version) { $ver = $m.version }
    if ($m.isDesktopOnly -eq $true) { $desktopOnly = $true }
  }
  $bytes = 0
  foreach ($x in (Get-ChildItem -LiteralPath $f.FullName -Recurse -File -Force -ErrorAction SilentlyContinue)) { $bytes += $x.Length }
  $installed[$id] = [pscustomobject]@{
    Folder = $f.Name; Id = $id; Version = $ver; DesktopOnly = $desktopOnly
    Bytes = $bytes; HasManifest = ($m -ne $null -and $m -ne 'BADJSON'); Path = $f.FullName
  }
}

$enabled = @()
$cpFile = Join-Path $ob 'community-plugins.json'
$cp = Read-Json $cpFile
if ($cp -eq 'BADJSON') { Add-Finding 'badJson' 'community-plugins.json is not valid JSON' }
elseif ($cp -ne $null) { $enabled = @($cp) }

$themes = @()
if (Test-Path -LiteralPath $themeDir) { $themes = @(Get-ChildItem -LiteralPath $themeDir -Directory | ForEach-Object { $_.Name }) }
$snippets = @()
if (Test-Path -LiteralPath $snipDir) { $snippets = @(Get-ChildItem -LiteralPath $snipDir -File -Filter *.css | ForEach-Object { $_.BaseName }) }

Write-Output ("plugins: {0} enabled, {1} present on disk   themes: {2}   snippets: {3}" -f $enabled.Count, $installed.Count, $themes.Count, $snippets.Count)
Write-Output ""

# ------------------------------------------------- FINDING 1: enabled but not installed
foreach ($id in $enabled) {
  if (-not $installed.ContainsKey($id)) {
    Add-Finding 'enabledNoFolder' ("'{0}' is enabled but plugins/{0}/manifest.json is missing" -f $id)
  } elseif (-not $installed[$id].HasManifest) {
    Add-Finding 'enabledNoFolder' ("'{0}' is enabled but its manifest.json is unreadable" -f $id)
  }
}
# the other direction is normal Obsidian usage, so it is a note
foreach ($id in ($installed.Keys | Sort-Object)) {
  if ($enabled -notcontains $id) {
    Add-Note 'presentDisabled' ("'{0}' is on disk but not in community-plugins.json ({1:N0} B)" -f $id, $installed[$id].Bytes)
  }
}

# --------------------------------------------------------- FINDING 2: dead hotkeys
$hkFile = Join-Path $ob 'hotkeys.json'
$hk = Read-Json $hkFile
$hkCount = 0
if ($hk -eq 'BADJSON') { Add-Finding 'badJson' 'hotkeys.json is not valid JSON' }
elseif ($hk -ne $null) {
  # A command id is "<owner>:<command>". An owner is legitimate if it is an installed plugin,
  # a core plugin, or one of Obsidian's built-in command namespaces. The first two are read
  # from the vault; the third has to be listed, because these are NOT in core-plugins.json.
  # Every entry below was verified present in obsidian-1.13.7.asar - 'markdown' and
  # 'open-with-default-app' are here because assuming otherwise produced 3 false positives
  # on the first run of this script, and a check that cries wolf gets switched off.
  $builtIn = @('app', 'editor', 'workspace', 'markdown', 'open-with-default-app', 'window')
  $coreIds = @()
  $core = Read-Json (Join-Path $ob 'core-plugins.json')
  if ($core -ne $null -and $core -ne 'BADJSON') {
    if ($core -is [array]) { $coreIds = @($core) }
    else { $coreIds = @($core.PSObject.Properties.Name) }
  }
  $known = @($builtIn + $coreIds)

  # If this machine has the app bundle, it can settle anything the list above missed.
  # Absent (CI), the list alone decides - so the list is the deterministic part.
  $asarText = $null
  $asarDir = Join-Path $env:APPDATA 'obsidian'
  if (Test-Path -LiteralPath $asarDir) {
    $asar = @(Get-ChildItem -LiteralPath $asarDir -File -Filter '*.asar' -ErrorAction SilentlyContinue | Sort-Object Name -Descending)
    if ($asar.Count -gt 0) { $asarText = [System.IO.File]::ReadAllText($asar[0].FullName, [System.Text.Encoding]::UTF8) }
  }

  foreach ($p in $hk.PSObject.Properties) {
    $hkCount++
    $key = $p.Name
    $i = $key.IndexOf(':')
    if ($i -lt 1) { continue }
    $owner = $key.Substring(0, $i)
    if ($known -contains $owner) { continue }
    if ($installed.ContainsKey($owner)) { continue }
    if ($asarText -ne $null -and $asarText.Contains($key)) {
      Add-Note 'coreCommand' ("'{0}' is a core command this script's built-in list does not know - add '{1}' to it" -f $key, $owner)
      continue
    }
    Add-Finding 'deadHotkey' ("'{0}' is bound, but no plugin '{1}' is installed" -f $key, $owner)
  }
}

# ------------------------------------------------- FINDING 3: orphaned Style Settings keys
# A Style Settings key is "<sectionId>@@<option>". The section id is declared by the theme
# or plugin in its own @settings block, and is NOT the folder name - Prism's folder is
# "Prism" but its id is "obsidian-prism-theme". So the prefix is resolved by searching the
# installed theme/plugin files for the literal, which is also how a renamed section is caught.
$ssFile = Join-Path $ob 'plugins\obsidian-style-settings\data.json'
$ss = Read-Json $ssFile
$ssKeys = 0
if ($ss -eq 'BADJSON') { Add-Finding 'badJson' 'Style Settings data.json is not valid JSON' }
elseif ($ss -ne $null) {
  $haystacks = New-Object System.Collections.Generic.List[string]
  foreach ($t in $themes) {
    $tc = Join-Path $themeDir (Join-Path $t 'theme.css')
    if (Test-Path -LiteralPath $tc) { $haystacks.Add((Read-Utf8 $tc)) | Out-Null }
  }
  foreach ($id in $installed.Keys) {
    foreach ($n in @('main.js', 'styles.css')) {
      $pf = Join-Path $installed[$id].Path $n
      if (Test-Path -LiteralPath $pf) { $haystacks.Add((Read-Utf8 $pf)) | Out-Null }
    }
  }
  $prefixSeen = @{}
  foreach ($p in $ss.PSObject.Properties) {
    $ssKeys++
    $k = $p.Name
    $j = $k.IndexOf('@@')
    if ($j -lt 1) { continue }
    $prefix = $k.Substring(0, $j)
    if (-not $prefixSeen.ContainsKey($prefix)) {
      $found = $false
      foreach ($h in $haystacks) {
        # .Contains, not -match: an unescaped metachar in a prefix would match everywhere (T16)
        if ($h.Contains($prefix)) { $found = $true; break }
      }
      $prefixSeen[$prefix] = $found
    }
  }
  foreach ($prefix in ($prefixSeen.Keys | Sort-Object)) {
    if (-not $prefixSeen[$prefix]) {
      $n = @($ss.PSObject.Properties.Name | Where-Object { $_.StartsWith($prefix + '@@') }).Count
      Add-Finding 'orphanSetting' ("{0} key(s) for '{1}', which no installed theme or plugin declares" -f $n, $prefix)
    }
  }
}

# ------------------------------------------- FINDING 4 and 5: appearance.json coherence
$apFile = Join-Path $ob 'appearance.json'
$ap = Read-Json $apFile
if ($ap -eq 'BADJSON') { Add-Finding 'badJson' 'appearance.json is not valid JSON' }
elseif ($ap -ne $null) {
  if ($ap.cssTheme -and $ap.cssTheme -ne '') {
    if ($themes -notcontains $ap.cssTheme) {
      Add-Finding 'missingTheme' ("cssTheme is '{0}' but themes/{0}/ is not present" -f $ap.cssTheme)
    }
  }
  foreach ($s in @($ap.enabledCssSnippets)) {
    if ($s -and $snippets -notcontains $s) {
      Add-Finding 'missingSnippet' ("enabledCssSnippets names '{0}' but snippets/{0}.css is not present" -f $s)
    }
  }

  # --- NOTE: fonts named here that this machine does not have ---
  # Both scopes matter. A font installed for all users lands in HKLM; one installed with
  # "Install for me only" - or copied to %LOCALAPPDATA%\Microsoft\Windows\Fonts and
  # registered by a script - lands in HKCU and is invisible in HKLM. Reading only HKLM
  # reported Inter as missing on 2026-09-09 while it was installed and rendering.
  $fontKeys = @('HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts',
                'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts')
  $fontNames = @()
  $perUser = @()
  $anyKey = $false
  foreach ($fk in $fontKeys) {
    if (-not (Test-Path -LiteralPath $fk)) { continue }
    $anyKey = $true
    $props = Get-ItemProperty -Path $fk
    foreach ($p in $props.PSObject.Properties) {
      if ($p.Name -like 'PS*') { continue }
      $fontNames += $p.Name
      if ($fk -like 'HKCU:*') { $perUser += $p.Name }
    }
  }
  if ($anyKey) {
    foreach ($slot in @('interfaceFontFamily', 'textFontFamily', 'monospaceFontFamily')) {
      $val = $ap.$slot
      if (-not $val -or $val -eq '') { continue }
      foreach ($fam in ($val -split ',')) {
        $fam2 = $fam.Trim().Trim('"').Trim("'")
        if ($fam2 -eq '') { continue }
        $hit = @($fontNames | Where-Object { $_ -like ($fam2 + '*') })
        if ($hit.Count -eq 0) {
          Add-Note 'fontNotInstalled' ("{0} names '{1}', which is not installed in either the machine or the per-user font registry - the font-family stack silently falls through" -f $slot, $fam2)
        } else {
          $userOnly = @($perUser | Where-Object { $_ -like ($fam2 + '*') })
          if ($userOnly.Count -eq $hit.Count) {
            Add-Note 'fontPerUserOnly' ("{0} names '{1}', installed for this Windows user only ({2} faces) - another user or a fresh profile would fall through the stack" -f $slot, $fam2, $hit.Count)
          }
        }
      }
    }
  } else {
    Add-Note 'fontCheckSkipped' 'no Windows font registry on this machine, so font names were not verified'
  }
}

# ----------------------------------------------------- NOTE: mobile cost and endpoints
$mobileCount = 0
$mobileBytes = 0
foreach ($id in ($installed.Keys | Sort-Object)) {
  if (-not $installed[$id].DesktopOnly) { $mobileCount++; $mobileBytes += $installed[$id].Bytes }
}
Add-Note 'mobileLoad' ("{0} of {1} installed plugins load on mobile ({2:N1} MB on disk)" -f $mobileCount, $installed.Count, ($mobileBytes / 1MB))

$seenUrl = @{}
foreach ($id in ($installed.Keys | Sort-Object)) {
  $dj = Join-Path $installed[$id].Path 'data.json'
  if (-not (Test-Path -LiteralPath $dj)) { continue }
  $t = Read-Utf8 $dj
  foreach ($m in [regex]::Matches($t, 'https?://[^"''\s]+')) {
    $u = $m.Value.TrimEnd('.', ',', ')')
    if ($u -like '*localhost*' -or $u -like '*127.0.0.1*') { continue }
    $k = $id + ' ' + $u
    if ($seenUrl.ContainsKey($k)) { continue }
    $seenUrl[$k] = $true
    Add-Note 'remoteEndpoint' ("{0} data.json names {1}" -f $id, $u)
  }
}
if ($seenUrl.Count -gt 0) {
  Add-Note 'remoteEndpoint' 'a URL in data.json is a configured endpoint, not proof of traffic - check the plugin''s auto-send setting before concluding anything (this is how the LanguageTool auto-check was found, F75)'
}

# ------------------------------------------------------------------------------ output
if ($Detail) {
  Write-Output "--- installed plugins ---"
  Write-Output ("  {0,-34} {1,-10} {2,10}  {3}" -f 'ID', 'VERSION', 'BYTES', 'MOBILE')
  foreach ($id in ($installed.Keys | Sort-Object)) {
    $p = $installed[$id]
    $mob = 'yes'
    if ($p.DesktopOnly) { $mob = 'no (desktop only)' }
    Write-Output ("  {0,-34} {1,-10} {2,10:N0}  {3}" -f $p.Id, $p.Version, $p.Bytes, $mob)
  }
  Write-Output ""
  Write-Output ("hotkey bindings: {0}   style-settings keys: {1}" -f $hkCount, $ssKeys)
  Write-Output ""
}

Write-Output "--- notes (machine-specific, never a finding) ---"
if ($notes.Count -eq 0) { Write-Output "  none" }
foreach ($n in $notes) { Write-Output $n }
Write-Output ""

if ($findings.Count -gt 0) {
  Write-Output "--- findings (.obsidian/ contradicting itself) ---"
  foreach ($f in $findings) { Write-Output $f }
  Write-Output ""
  Write-Output ("RESULT: {0} finding(s)." -f $findings.Count)
  exit 1
}
Write-Output ("RESULT: clean - {0} enabled plugins, {1} hotkey bindings and {2} style-settings keys all resolve." -f $enabled.Count, $hkCount, $ssKeys)
exit 0
