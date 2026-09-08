#
# Test-DocHygiene.ps1 - checks the Markdown that nothing else checks.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Detail        list every offending line, not just the first three per file
#   ... -Root <path>   run against a different vault
#
# WHY THIS EXISTS
#   .kiro/** is in the linter's ignore list (.markdownlint-cli2.jsonc, "agent context, tooling")
#   and is outside Vault-Audit.ps1's scope. So no tool validates syntax, encoding, line endings or
#   blank-line runs there. Running `npx markdownlint-cli2 ".kiro/**/*.md"` prints "Linting: 0 files"
#   and then "Summary: 0 issues in 0 files", which reads as a pass. On 2026-09-07 a bulk replacement
#   corrupted nine passages across four files in .kiro/skills/query-notebooklm/ and both the audit
#   and the linter reported clean, because neither looked.
#
# WHAT THIS COUNTS, and which files are in and out
#   Two scopes, reported separately, because they have different rules.
#
#     authored    every .md under .kiro/ EXCEPT .kiro/research/. Hand-written agent context:
#                 steering, skills, traps, lessons, the session ledger, reports. These must be
#                 BOM-free, free of trailing whitespace and of runs of three or more newlines.
#     verbatim    .kiro/research/*.md except README.md. Pasted Deep Research output, kept
#                 byte-exact as SOURCES (see that folder's README). Odd spacing and CRLF are
#                 expected and are NOT findings. Checked only for BOM and for corruption.
#
#   Five checks. Each names the file and, where meaningful, the line.
#
#     encoding    a UTF-8 BOM is present. Both scopes; a BOM has never been wanted under .kiro/
#     whitespace  trailing spaces, or 3+ consecutive newlines. authored only
#     corruption  the damage signature of a botched bulk replacement - two adjacent en/em dashes,
#                 or a mojibake byte sequence. Both scopes. This is the defect that went
#                 undetected on 2026-09-07. Content inside `inline code spans` is exempt, because
#                 these docs quote the damage on purpose when explaining it
#     deadRef     a doc naming a Scripts/*.ps1 file that does not exist, where the name appears
#                 next to the word Scripts or a Scripts\ path. authored only, and .kiro/reports/
#                 is exempt: a dated report legitimately names the throwaway scripts of its own
#                 session. Written because environment.md was edited to name this very script one
#                 minute before the file existed
#
#   Reported as NOTES rather than findings, because neither is damage:
#     - CR characters in an authored doc. The vault mixes LF and CRLF on purpose
#       (Meta/Vault Standard.md is LF, Meta/Vault Findings & Backlog.md is CRLF), so this is a
#       portability warning for anyone writing a line-anchored regex - traps T12 - not a defect.
#     - The skill navigation invariant: each .kiro/skills/<name>/SKILL.md should be smaller than
#       the sum of its references/*.md.
#
#   Read-only. It never writes to the vault.
#
# EXIT CODE
#   0 = clean, 1 = one or more findings. Matches the convention in .kiro/steering/scripts.md.
#

[CmdletBinding()]
param(
    [string]$Root,
    [switch]$Detail
)

$ErrorActionPreference = 'Stop'

# --- locate the vault root -------------------------------------------------
if (-not $Root) {
    $here = Split-Path -Parent $PSCommandPath
    $Root = (Resolve-Path (Join-Path $here '..\..\..')).Path
}
if (-not (Test-Path -LiteralPath $Root)) { throw "Root not found: $Root" }
$kiro = Join-Path $Root '.kiro'
if (-not (Test-Path -LiteralPath $kiro)) { throw "No .kiro directory under $Root" }

$utf8 = New-Object System.Text.UTF8Encoding($false)
$LF   = [char]10
$CR   = [char]13
$EN   = [char]0x2013
$EM   = [char]0x2014
$BOM  = [char]0xFEFF

$findings = @()
$notes    = @()
function Add-Finding([string]$check, [string]$file, [string]$detail) {
    $script:findings += [pscustomobject]@{ Check = $check; File = $file; Detail = $detail }
}
function Add-Note([string]$file, [string]$detail) {
    $script:notes += [pscustomobject]@{ File = $file; Detail = $detail }
}

# Strips `inline code spans` so a doc may quote the damage signature while explaining it.
function Remove-CodeSpans([string]$s) {
    return [regex]::Replace($s, '`[^`]*`', '')
}

# --- gather files ---------------------------------------------------------
$all = Get-ChildItem -LiteralPath $kiro -Recurse -Filter *.md -File
$researchDir = Join-Path $kiro 'research'
$authored = @()
$verbatim = @()
foreach ($f in $all) {
    if ($f.DirectoryName -eq $researchDir -and $f.Name -ne 'README.md') { $verbatim += $f }
    else { $authored += $f }
}

Write-Host ''
Write-Host "Test-DocHygiene - the Markdown no other tool checks"
Write-Host "Root: $Root"
Write-Host ("Scope: {0} authored, {1} verbatim (research artifacts)" -f $authored.Count, $verbatim.Count)
Write-Host ''

# --- the corruption signature --------------------------------------------
$mojibake = @(
    ([string][char]0x00E2 + [string][char]0x20AC),   # U+00E2 U+20AC - an em dash read as Latin-1
    ([string][char]0x00C3 + [string][char]0x00A4),   # U+00C3 U+00A4 - a-diaeresis read as Latin-1
    ([string][char]0x00C3 + [string][char]0x00B6),   # U+00C3 U+00B6 - o-diaeresis read as Latin-1
    ([string][char]0x00EF + [string][char]0x00BB)    # U+00EF U+00BB - a BOM read as bytes
)

function Test-OneFile($file, [bool]$isAuthored) {
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $text  = $utf8.GetString($bytes)
    $rel   = $file.FullName.Substring($Root.Length).TrimStart('\')

    # 1. encoding
    if ($text.Length -gt 0 -and $text[0] -eq $BOM) { Add-Finding 'encoding' $rel 'UTF-8 BOM present' }

    # 4. corruption - both scopes. Code spans are exempt: these docs quote the damage deliberately.
    $lines = $text -split $LF
    $hits = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $ln = Remove-CodeSpans $lines[$i]
        $bad = $false
        if ($ln.Contains([string]$EN + [string]$EN)) { $bad = $true }
        if ($ln.Contains([string]$EM + [string]$EM)) { $bad = $true }
        if ($ln.Contains([string]$EM + [string]$EN)) { $bad = $true }
        if ($ln.Contains([string]$EN + [string]$EM)) { $bad = $true }
        foreach ($m in $mojibake) { if ($ln.Contains($m)) { $bad = $true } }
        if ($bad) { $hits += ('L' + ($i + 1)) }
    }
    if ($hits.Count -gt 0) {
        $show = $hits
        if (-not $Detail -and $hits.Count -gt 3) { $show = $hits[0..2] + @('...' + $hits.Count + ' total') }
        Add-Finding 'corruption' $rel ('adjacent dashes or mojibake at ' + ($show -join ', '))
    }

    if (-not $isAuthored) { return }

    # 2. line endings - information, not a finding: the vault mixes conventions on purpose (traps T12)
    $crCount = 0
    foreach ($ch in $text.ToCharArray()) { if ($ch -eq $CR) { $crCount++ } }
    if ($crCount -gt 0) { Add-Note $rel "$crCount CR characters - CRLF, while most authored .kiro docs are LF" }

    # 3. whitespace
    $trail = ([regex]::Matches($text, '(?m)[ \t]+\r?$')).Count
    if ($trail -gt 0) { Add-Finding 'whitespace' $rel "$trail line(s) with trailing whitespace" }
    $runs = ([regex]::Matches($text, ([string]$LF + '{3,}'))).Count
    if ($runs -gt 0) { Add-Finding 'whitespace' $rel "$runs run(s) of 3+ consecutive newlines" }

    # 5. dead references. Dated reports name their own throwaway scripts, so they are exempt.
    if ($rel -like '.kiro\reports\*') { return }
    $scriptsDir = Join-Path $Root 'Meta\Obsidian Plugins\Scripts'
    $dead = @()
    foreach ($m in [regex]::Matches($text, '[A-Za-z0-9_\-]+\.ps1')) {
        $name = $m.Value
        if (Test-Path -LiteralPath (Join-Path $scriptsDir $name)) { continue }
        # only a claim about THIS folder counts: the name must appear near "Scripts" or a backslash path
        $near = [regex]::Escape($name)
        if ($text -match ('Scripts[^\n]{0,40}' + $near) -or $text -match ($near + '[^\n]{0,40}Scripts') -or
            $text -match ('Scripts\\' + $near)) {
            $dead += $name
        }
    }
    foreach ($d in ($dead | Sort-Object -Unique)) { Add-Finding 'deadRef' $rel "names $d as a Scripts file, which does not exist" }
}

foreach ($f in $authored) { Test-OneFile $f $true }
foreach ($f in $verbatim) { Test-OneFile $f $false }

# --- navigation invariant, informational ---------------------------------
Write-Host 'Skill navigation (SKILL.md should be smaller than the sum of its references):'
$skillsDir = Join-Path $kiro 'skills'
if (Test-Path -LiteralPath $skillsDir) {
    foreach ($d in (Get-ChildItem -LiteralPath $skillsDir -Directory | Sort-Object Name)) {
        $sk = Join-Path $d.FullName 'SKILL.md'
        $refDir = Join-Path $d.FullName 'references'
        if (-not (Test-Path -LiteralPath $sk)) { continue }
        $skLen = (Get-Item -LiteralPath $sk).Length
        $refLen = 0
        if (Test-Path -LiteralPath $refDir) {
            $sum = Get-ChildItem -LiteralPath $refDir -Filter *.md -File | Measure-Object Length -Sum
            if ($sum.Sum) { $refLen = $sum.Sum }
        }
        $verdict = 'ok'
        if ($refLen -gt 0 -and $skLen -ge $refLen) { $verdict = 'SKILL.md is not smaller' }
        if ($refLen -eq 0) { $verdict = 'no references/' }
        Write-Host ("  {0,-20} SKILL {1,6} B   references {2,6} B   {3}" -f $d.Name, $skLen, $refLen, $verdict)
    }
}
Write-Host ''

# --- report --------------------------------------------------------------
if ($notes.Count -gt 0) {
    Write-Host 'Notes (not findings):'
    foreach ($n in $notes) { Write-Host ("  {0,-52} {1}" -f $n.File, $n.Detail) }
    Write-Host ''
}

if ($findings.Count -eq 0) {
    Write-Host 'RESULT: clean - no encoding, whitespace, corruption or dead-reference findings.'
    exit 0
}

Write-Host ("RESULT: {0} finding(s)." -f $findings.Count)
Write-Host ''
foreach ($g in ($findings | Group-Object Check | Sort-Object Name)) {
    Write-Host ("{0} ({1}):" -f $g.Name, $g.Count)
    foreach ($x in $g.Group) { Write-Host ("  {0,-52} {1}" -f $x.File, $x.Detail) }
    Write-Host ''
}
exit 1
