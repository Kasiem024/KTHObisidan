#
# Self-test for Vault-Audit.ps1.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
# Optional:
#   -KeepFixture    leave the throwaway vault on disk for inspection
#
# WHAT THIS COUNTS
#   Assertions, not vault facts. It prints "N assertions, F failed": one assertion per audit
#   check that must fire on a planted violation, plus the assertions that a rule-following
#   fixture is reported clean, that -ContentOnly skips exactly two checks, and that every
#   documented scope exclusion holds. F must be 0. The numbers say nothing about the real
#   vault - the fixture lives under %TEMP% and this script never opens the vault.
#
# WHY THIS EXISTS
#   The audit is the only thing standing between this vault and silent drift. A check
#   that has quietly stopped matching still prints nothing and still exits 0, which is
#   indistinguishable from a clean vault. Before this file existed, exactly one of the
#   audit's 39 checks had ever been proven to fail on purpose.
#
#   So: build a tiny throwaway vault, prove the audit calls it clean, then plant one
#   deliberate violation of every rule and require every matching check to fire.
#
# WHY IT IS FAST
#   The violations are planted all at once and the audit runs five times in total, not
#   once per check. A per-check version of this took 127 seconds; this takes a few. A
#   slow test gets deleted, which would leave the audit unverified again.
#
# THIS NEVER TOUCHES THE REAL VAULT. Everything happens under %TEMP%.
#
# Run it after any edit to Vault-Audit.ps1. CI runs it automatically whenever anything
# under Meta/Obsidian Plugins/Scripts/ changes.
#
# IMPORTANT: keep this file pure ASCII. PowerShell 5.1 reads .ps1 as ANSI, so literal
# Swedish characters get corrupted. The Swedish names below are built from char codes.
#
param([switch]$KeepFixture)
$ErrorActionPreference = 'Stop'

$audit = Join-Path $PSScriptRoot 'Vault-Audit.ps1'
if (-not (Test-Path -LiteralPath $audit)) { throw "Vault-Audit.ps1 not found next to this script" }

$fx  = Join-Path $env:TEMP 'vault-audit-selftest'
$enc = New-Object System.Text.UTF8Encoding($false)

# Swedish names built from char codes so this file stays ASCII.
$aring = [string][char]0xE5
$auml  = [string][char]0xE4
$ouml  = [string][char]0xF6
$term    = '2026 V' + $aring + 'r'
$course  = 'HE1033 Kommunikationsn' + $auml + 't'
$forelas = 'F' + $ouml + 'rel' + $auml + 'sningar'
$natverk = 'n' + $auml + 'tverk'

$kth       = Join-Path $fx 'KTH'
$termDir   = Join-Path $kth $term
$courseDir = Join-Path $termDir $course
$begrepp   = Join-Path $courseDir 'Begrepp'

function Write-Utf8($path, $text) {
  $dir = Split-Path -Parent $path
  if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
  [System.IO.File]::WriteAllText($path, $text, $enc)
}

# Tags in YAML list form, the vault's convention from F105 on: a bare `tags:` line, then one
# `  - value` line per tag, exactly as Obsidian's Properties panel writes them. Every fixture uses
# this form except c-inlinetags.md, which plants the old inline form on purpose.
function Format-TagList([string[]]$vals, [string]$nl = "`n") {
  return ('tags:' + (($vals | ForEach-Object { $nl + '  - ' + $_ }) -join ''))
}
$goodTags = Format-TagList @('begrepp', 'HE1033', 'KTH', $natverk, 'year2026')
$goodDesc = 'description: "En kort mening som sammanfattar begreppet."'
$dates    = "created: 2026-01-01`nupdated: 2026-01-01"

# A note satisfying every rule in Meta/Vault Standard.md.
function Clean-Note($title) {
  return "---`n$goodTags`n$goodDesc`n$dates`n---`n# $title`n`n## Definition`n`nEtt testbegrepp som finns for att verifiera auditen.`n`n## Kopplat till`n`n- [[$title]]`n`n## Flashcards`n`nFraga::Svar`n"
}

function New-Fixture {
  if (Test-Path -LiteralPath $fx) { Remove-Item -LiteralPath $fx -Recurse -Force }
  foreach ($n in @('Anteckningar', 'Begrepp', 'Filer', $forelas)) {
    New-Item -ItemType Directory -Path (Join-Path $courseDir $n) -Force | Out-Null
  }
  Write-Utf8 (Join-Path $courseDir '_index.md') ("---`n" + (Format-TagList @('index', 'HE1033', 'KTH', $natverk, 'year2026')) + "`ndescription: `"Kursindex.`"`n$dates`n---`n# $course`n")
  Write-Utf8 (Join-Path $begrepp 'Testbegrepp.md') (Clean-Note 'Testbegrepp')
  # NEGATIVE CONTROL for the list-form tag reader: a list-valued key directly after the tags. The
  # reader F105 replaced let .* run across line ends and took every later "- x" line as a tag, so
  # `hittepa` and `Annat Namn` below became unknown tags and this clean fixture stopped being clean.
  Write-Utf8 (Join-Path $begrepp 'Aliasbegrepp.md') ((Clean-Note 'Aliasbegrepp').Replace($goodDesc, ("aliases:`n  - hittepa`n  - Annat Namn`n" + $goodDesc)))
  # Standard section 6: a Markdown file under Filer/ is not an authored note, and must also
  # be kept out of Obsidian's tag index. Both halves need a fixture:
  #   - the file itself, so InScope is proven to skip it (it breaks every content rule);
  #   - .obsidian/app.json with the filter, so tagIndexNotExcluded has something to pass on.
  # Without the .md file the check is vacuous and would "pass" even if deleted.
  Write-Utf8 (Join-Path $courseDir 'Filer\Skrapad Bok.md') "# Rubrik utan frontmatter`n`n#include <stdio.h>`n`n#page-12-0`n"
  # Single-quoted so the backslashes survive: PowerShell's double quotes leave \\ alone but
  # this is JSON, where \\ means one backslash. The stored filter must end up as
  # /(^|\/)Filer\/ - the exact string the real vault uses - so the test exercises the form
  # that is easiest to get wrong, not a simplified one.
  $filterJson = '{' + "`n" + '  "userIgnoreFilters": [' + "`n" + '    "/(^|\\/)Filer\\//"' + "`n" + '  ]' + "`n" + '}' + "`n"
  Write-Utf8 (Join-Path $fx '.obsidian\app.json') $filterJson

  # staleFRange needs two files: the backlog, which is the authority for the highest F-number,
  # and a doc quoting a range that disagrees with it. The backlog's own BODY also quotes an old
  # range here on purpose - a real backlog records what earlier docs used to say, and a check that
  # flags its own history is a check that gets switched off. Only its frontmatter is a live claim.
  $backlogText = "---`n" +
    'tags:' + "`n" + '  - meta' + "`n" +
    'description: "Backlog for the fixture (F1-F7)."' + "`n" +
    $dates + "`n---`n" +
    "# Backlog`n`n" +
    "### F7. DONE - the newest entry`n`n" +
    "### F6. DONE - an older one`n`n" +
    "An earlier repair set three docs to F1-F3, which this line records on purpose.`n"
  Write-Utf8 (Join-Path $fx 'Meta\Vault Findings & Backlog.md') $backlogText
  # README agrees with the backlog here, so the CLEAN fixture stays clean. The disagreement is
  # planted later, with the other violations.
  Write-Utf8 (Join-Path $fx 'README.md') "---`ntags:`n  - meta`ndescription: `"Fixture readme.`"`n$dates`n---`n# README`n`nSee the backlog (F1-F7).`n"
}

function Invoke-Audit([switch]$ContentOnly) {
  $a = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $audit, '-Root', $fx, '-Detail')
  if ($ContentOnly) { $a += '-ContentOnly' }
  $out = & powershell @a 2>&1
  return [pscustomobject]@{ Code = $LASTEXITCODE; Text = ($out -join "`n") }
}

# Match a REPORT ROW ("<bucket><spaces><count>"), never the name anywhere in the output.
# -ContentOnly prints "skipping courseMissingFolder and brokenWikilinks" as information,
# and a naive substring test matches that sentence and fails a working audit. It did, on
# this suite's first run.
function Reports($text, $bucket) {
  return [bool]([regex]::IsMatch($text, '(?m)^' + [regex]::Escape($bucket) + '\s+\d+\s*$'))
}

$results = New-Object System.Collections.Generic.List[object]
function Add-Result($name, $expected, $ok, $note) {
  $results.Add([pscustomobject]@{ Check = $name; Expected = $expected; Ok = [bool]$ok; Note = $note })
}

$sw = [System.Diagnostics.Stopwatch]::StartNew()
Write-Output "Self-test for Vault-Audit.ps1"
Write-Output "fixture: $fx"
Write-Output ""

# =========================================================== 1. a clean vault is clean
# If this fails, every assertion below is meaningless.
New-Fixture
$base  = Invoke-Audit
$baseC = Invoke-Audit -ContentOnly
Add-Result 'clean fixture, full run'      'exit 0' (($base.Code  -eq 0) -and ($base.Text  -match 'RESULT: clean')) ("exit " + $base.Code)
Add-Result 'clean fixture, -ContentOnly'  'exit 0' (($baseC.Code -eq 0) -and ($baseC.Text -match 'RESULT: clean')) ("exit " + $baseC.Code)
if ($base.Code -ne 0) {
  Write-Output "FIXTURE IS NOT CLEAN - the audit reports deviations on a vault that breaks no rule."
  Write-Output "Either the fixture or the audit is wrong. Full output:"
  Write-Output $base.Text
  exit 1
}

# =========================================================== 2. plant every violation
# One file per rule, all at once, so a single audit run exercises every check. The three
# structural violations live on separate courses so they cannot cancel each other out:
# one course is missing a folder, another is missing its _index.md.
$b = @{}
function Bad($file, $text) { Write-Utf8 (Join-Path $begrepp $file) $text; }

# duplicateFNumber: give the fixture backlog a second F6 heading. The highest F stays 7, which is the
# point - a duplicate is invisible to staleFRange. The "-old." stub is planted too and must NOT be
# counted, because three of those exist in the real backlog on purpose.
Write-Utf8 (Join-Path $fx 'Meta\Vault Findings & Backlog.md') ("---`n" +
  'tags:' + "`n" + '  - meta' + "`n" +
  'description: "Backlog for the fixture (F1-F7)."' + "`n" +
  $dates + "`n---`n" +
  "# Backlog`n`n" +
  "### F7. DONE - the newest entry`n`n" +
  "### F6. DONE - an older one`n`n" +
  "### F6. DONE - a second entry claiming the same number`n`n" +
  "### F5-old. (superseded - see F5 above)`n`n" +
  "An earlier repair set three docs to F1-F3, which this line records on purpose.`n")
# staleFRange: rewrite README to claim a range the backlog contradicts. Not under Begrepp/, because
# the check deliberately reads the whole vault - a stale range in the root README is the real case.
Write-Utf8 (Join-Path $fx 'README.md') "---`ntags:`n  - meta`ndescription: `"Fixture readme.`"`n$dates`n---`n# README`n`nSee the backlog (F1-F4).`n"

Bad 'a-nofm.md'        "# Trasig`n`nIngen frontmatter alls.`n"
Bad 'b-notags.md'      "---`n$goodDesc`n$dates`n---`n# Trasig`n"
# inlineStyleTags: the old inline form, with valid tags. Those tags must still be READ, so this note
# must not also count as missing its KTH tag - the missingKTHtag guard below depends on it.
Bad 'c-inlinetags.md'  "---`ntags: [begrepp, HE1033, KTH, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'd-nocreated.md'   "---`n$goodTags`n$goodDesc`nupdated: 2026-01-01`n---`n# Trasig`n"
Bad 'e-noupdated.md'   "---`n$goodTags`n$goodDesc`ncreated: 2026-01-01`n---`n# Trasig`n"
Bad 'f-nodesc.md'      "---`n$goodTags`n$dates`n---`n# Trasig`n"
Bad 'g-emptydesc.md'   "---`n$goodTags`ndescription: `"`"`n$dates`n---`n# Trasig`n"
Bad 'h-desc-head.md'   "---`n$goodTags`ndescription: `"### Hur det fungerar`"`n$dates`n---`n# Trasig`n"
Bad 'i-desc-math.md'   "---`n$goodTags`ndescription: `"Kostnaden `$O(n)`$ per steg.`"`n$dates`n---`n# Trasig`n"
Bad 'j-desc-bullet.md' "---`n$goodTags`ndescription: `"- Ping skickar Echo Request`"`n$dates`n---`n# Trasig`n"
Bad 'k-desc-ord.md'    "---`n$goodTags`ndescription: `"1. Discover skickar broadcast`"`n$dates`n---`n# Trasig`n"
Bad 'l-desc-card.md'   "---`n$goodTags`ndescription: `"Fraga::Svar`"`n$dates`n---`n# Trasig`n"
Bad 'm-desc-quiz.md'   "---`n$goodTags`ndescription: `"Vad ar en natmask? En 32-bitars siffra.`"`n$dates`n---`n# Trasig`n"
Bad 'n-desc-link.md'   "---`n$goodTags`ndescription: `"Se [[Testbegrepp]] for mer.`"`n$dates`n---`n# Trasig`n"
Bad 'o-desc-dv.md'     "---`n$goodTags`ndescription: `"FROM KTH SORT file.name`"`n$dates`n---`n# Trasig`n"
Bad 'p-duptags.md'     ("---`n" + (Format-TagList @('begrepp', 'begrepp', 'HE1033', 'KTH', $natverk, 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'q-nokth.md'       ("---`n" + (Format-TagList @('begrepp', 'HE1033', $natverk, 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'r-noyear.md'      ("---`n" + (Format-TagList @('begrepp', 'HE1033', 'KTH', $natverk)) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 's-nocode.md'      ("---`n" + (Format-TagList @('begrepp', 'KTH', $natverk, 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 't-notype.md'      ("---`n" + (Format-TagList @('HE1033', 'KTH', $natverk, 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'u-nosubject.md'   ("---`n" + (Format-TagList @('begrepp', 'HE1033', 'KTH', 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'v-casing.md'      ("---`n" + (Format-TagList @('Begrepp', 'HE1033', 'KTH', $natverk, 'year2026')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'w-vocab.md'       ("---`n" + (Format-TagList @('begrepp', 'HE1033', 'KTH', $natverk, 'year2026', 'hittepa')) + "`n$goodDesc`n$dates`n---`n# Trasig`n")
Bad 'x-noh1.md'        "---`n$goodTags`n$goodDesc`n$dates`n---`n## Definition`n`nIngen H1.`n"
Bad 'y-twoh1.md'       "---`n$goodTags`n$goodDesc`n$dates`n---`n# Ett`n`n# Tva`n"
Bad 'z-fcnotlast.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n## Flashcards`n`nFraga::Svar`n`n## Efterat`n`nText.`n"
Bad 'aa-noalt.md'      "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n![[bild.png]]`n"
Bad 'ab-widthonly.md'  "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n![[bild.png|300]]`n"
Bad 'ac-inlinedv.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# ``= this.file.name```n"
Bad 'ad-olddates.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`nSkapad: ``= dateformat(this.file.ctime, 'yyyy-MM-dd')```n"
Bad 'ae-brokenlink.md' "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`nSe [[Finns Inte Alls]].`n"
# rawMathNotLatex: math written as plain text instead of LaTeX. Two signatures on one line - a caret
# power (2^32) and a subscript identifier (RTT_M) - both outside any $...$ and outside code. A clean
# note writes these as $2^{32}$ and $\text{RTT}_\text{M}$, which this file deliberately does not.
Bad 'ah-rawmath.md'    "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`nMed 64 bitar racker 2^32 varianter, och RTT_M ar den matta tiden.`n"
# A note that only MENTIONS excalidraw in its prose, and has a --- rule later on. It is a
# normal note and every content check must still see it. The excalidraw test used to be
# '(?s)\A---\n.*?excalidraw.*?\n---', which with (?s) matched from the frontmatter's opening
# --- to that later rule, so the whole note was skipped. Two Meta docs were silently exempt
# from every check for as long as that regex existed. This file has no description, so if it
# is being skipped, missingDescription simply will not count it.
Bad 'af-mentions-excalidraw.md' "---`n$goodTags`n$dates`n---`n# Trasig`n`nVi anvander excalidraw for ritningar.`n`n---`n`n## Definition`n`nText.`n"
# A CRLF file whose fenced code block contains an H1. The code-stripper must blank it, so this
# note has exactly ONE H1 and must NOT be reported. In .NET multiline mode $ matches before the
# \n without absorbing a preceding \r, so a closing-fence pattern of '[ \t]*$' silently matches
# nothing in a CRLF file - it found 0 of Vault Findings & Backlog.md's 6 blocks. This vault
# genuinely mixes the two conventions, so the LF fixtures above cannot catch it. Its tags are in list
# form with CRLF line ends, so the list reader is exercised on CRLF too (the missingKTHtag guard).
$crlf = "---`r`n" + (Format-TagList @('begrepp', 'HE1033', 'KTH', $natverk, 'year2026') "`r`n") + "`r`n$goodDesc`r`ncreated: 2026-01-01`r`nupdated: 2026-01-01`r`n---`r`n# Ett CRLF-dokument`r`n`r`n## Definition`r`n`r`n" + '```text' + "`r`n# Inte en riktig rubrik`r`n" + '```' + "`r`n"
Write-Utf8 (Join-Path $begrepp 'ag-crlf-fence.md') $crlf

# literature filenames
$lit = Join-Path $courseDir 'Filer\Litteraturlista'
Write-Utf8 (Join-Path $lit 'Nagon Bok 5th Edition 2020.pdf') 'x'
Write-Utf8 (Join-Path $lit 'Nagon  Bok 2020 Edition 5.pdf') 'x'
Write-Utf8 (Join-Path $lit 'Nagon Bok HE1033 2020 Edition 5.pdf') 'x'

# a folder that is not one of the four
New-Item -ItemType Directory -Path (Join-Path $courseDir 'Bilagor') -Force | Out-Null

# Empty the excluded-files setting. The Filer/ note planted by New-Fixture is now in the
# tag index, so tagIndexNotExcluded must fire. This is the only violation that lives in
# .obsidian/ rather than in a note, and it is invisible from inside the vault - which is
# exactly why it needs a check and a test.
# One unparseable filter does double duty: tagIndexBadFilter fires because the regex will not
# compile, and tagIndexNotExcluded still fires because Filer/ ends up unexcluded either way.
Write-Utf8 (Join-Path $fx '.obsidian\app.json') ('{' + "`n" + '  "userIgnoreFilters": [' + "`n" + '    "/(unclosed/"' + "`n" + '  ]' + "`n" + '}' + "`n")

# a second course missing a required folder (no Filer)
$c2 = Join-Path $termDir 'CM1005 Testkurs'
foreach ($n in @('Anteckningar', 'Begrepp', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c2 $n) -Force | Out-Null }
Write-Utf8 (Join-Path $c2 '_index.md') ("---`n" + (Format-TagList @('index', 'CM1005', 'KTH', 'ekonomi', 'year2026')) + "`ndescription: `"Kursindex.`"`n$dates`n---`n# CM1005 Testkurs`n")

# a third course with all four folders but no _index.md
$c3 = Join-Path $termDir 'ME1003 Testkurs'
foreach ($n in @('Anteckningar', 'Begrepp', 'Filer', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c3 $n) -Force | Out-Null }

# A degree-project course code: KTH ends these with X rather than a fourth digit
# (HT100X, HI111X). The checks must treat it as a course like any other - before the
# pattern was widened on 2026-08-26, the whole thesis course was invisible to them.
# This one is deliberately missing its _index.md too, so courseMissingIndex must catch it.
$c4 = Join-Path $termDir 'HT100X Testexamensarbete'
foreach ($n in @('Anteckningar', 'Begrepp', 'Filer', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c4 $n) -Force | Out-Null }
Write-Utf8 (Join-Path $c4 'Begrepp\Trasig X-kod.md') ("---`n" + (Format-TagList @('begrepp', 'HT100X', 'KTH', $natverk, 'year2026', 'hittepa')) + "`n$goodDesc`n$dates`n---`n# Trasig X-kod`n")

$full = Invoke-Audit
Add-Result 'violations produce exit 1' 'exit 1' ($full.Code -eq 1) ("exit " + $full.Code)

# Every bucket the audit is supposed to have. If a name here never appears, that check
# has stopped working - or was renamed, in which case fix this list in the same commit.
$expect = @(
  'noFrontmatter', 'frontmatterWithoutTags', 'inlineStyleTags',
  'missingCreated', 'missingUpdated',
  'missingDescription', 'emptyDescription', 'malformedDescription',
  'duplicateTags', 'missingKTHtag', 'missingYearTag', 'missingCourseCode',
  'missingTypeTag', 'missingSubjectTag', 'tagCasingViolations', 'tagsOutsideVocabulary',
  'noH1', 'multipleH1', 'flashcardsNotLastSection', 'rawMathNotLatex',
  'imageEmbedWithoutAlt', 'inlineDataviewExpression', 'oldDataviewDates',
  'brokenWikilinks', 'courseMissingFolder', 'courseMissingIndex', 'nonConformingFolder',
  'litWrongEditionFormat', 'litBadSpacing', 'litHasCourseCode',
  'tagIndexNotExcluded', 'tagIndexBadFilter', 'staleFRange', 'duplicateFNumber'
)
foreach ($e in $expect) {
  $fired = Reports $full.Text $e
  $note = 'reported'
  if (-not $fired) { $note = 'NOT REPORTED - this check no longer fires' }
  Add-Result $e 'reported' $fired $note
}

# Each malformedDescription shape has its own file above. Prove the rule catches all
# eight rather than only the first, by counting the offenders: heading, $ math, bullet,
# ordered list, card separator, question-plus-answer, wikilink, Dataview keyword.
$m = [regex]::Match($full.Text, '(?m)^malformedDescription\s+(\d+)\s*$')
$descCount = 0
if ($m.Success) { $descCount = [int]$m.Groups[1].Value }
Add-Result 'malformedDescription catches all 8 shapes' '8 files' ($descCount -eq 8) "reported $descCount"

# REGRESSION GUARD. Two planted files lack a description: f-nodesc.md and
# af-mentions-excalidraw.md. The second one only mentions "excalidraw" in its prose and has a
# --- rule further down. If the excalidraw test ever goes back to scanning the whole file
# instead of just the first frontmatter block, that note is skipped and this count drops to 1
# while everything else still passes. That is exactly how Meta/Vault Standard.md and
# Meta/Vault Findings & Backlog.md stayed exempt from every content check.
$m2 = [regex]::Match($full.Text, '(?m)^missingDescription\s+(\d+)\s*$')
$noDescCount = 0
if ($m2.Success) { $noDescCount = [int]$m2.Groups[1].Value }
Add-Result 'a note that merely mentions excalidraw is still audited' '2 files' ($noDescCount -eq 2) "missingDescription reported $noDescCount"

# REGRESSION GUARD for the CRLF fence. Only y-twoh1.md has two real H1s. ag-crlf-fence.md is a
# CRLF file whose single extra "# " line sits inside a code fence, so if the stripper stops
# working on CRLF this count becomes 2 and nothing else changes.
$m3 = [regex]::Match($full.Text, '(?m)^multipleH1\s+(\d+)\s*$')
$h1Count = 0
if ($m3.Success) { $h1Count = [int]$m3.Groups[1].Value }
Add-Result 'a heading inside a CRLF code fence is not an H1' '1 file' ($h1Count -eq 1) "multipleH1 reported $h1Count"

# REGRESSION GUARD: tags are READ in both forms. Only a-nofm.md, b-notags.md and q-nokth.md lack
# the KTH tag. If the list reader broke, every planted note would join them; if it broke only on
# CRLF, ag-crlf-fence.md would; and if inline values stopped being read, c-inlinetags.md would.
$m4 = [regex]::Match($full.Text, '(?m)^missingKTHtag\s+(\d+)\s*$')
$kthCount = 0
if ($m4.Success) { $kthCount = [int]$m4.Groups[1].Value }
Add-Result 'tags read in list (LF and CRLF) and inline form' '3 files' ($kthCount -eq 3) "missingKTHtag reported $kthCount"

# Only c-inlinetags.md is in the old form. A second one means a fixture was written inline by
# mistake, or that the audit has started reporting list form as inline.
$m5 = [regex]::Match($full.Text, '(?m)^inlineStyleTags\s+(\d+)\s*$')
$inlCount = 0
if ($m5.Success) { $inlCount = [int]$m5.Groups[1].Value }
Add-Result 'inlineStyleTags flags only the inline note' '1 file' ($inlCount -eq 1) "inlineStyleTags reported $inlCount"

# A degree-project code (HT100X) must be accepted as a course code, and its folder must be
# checked like any other course. Two assertions: the code itself is NOT reported as an
# unknown tag, and the X-coded course without an _index.md IS reported.
$xTagRejected = [bool]([regex]::IsMatch($full.Text, '(?m)^\s+HT100X\s*=\s*\d+\s*$'))
Add-Result 'HT100X accepted as a course code' 'not an unknown tag' (-not $xTagRejected) ''
$xCourseSeen = [bool]($full.Text -match 'HT100X Testexamensarbete')
Add-Result 'X-coded course is structure-checked' 'reported missing index' $xCourseSeen ''

# =========================================================== 3. -ContentOnly skips two
# ...and only those two. If it silently skipped more, CI would be weaker than it looks.
$co = Invoke-Audit -ContentOnly
Add-Result '-ContentOnly skips courseMissingFolder' 'not reported' (-not (Reports $co.Text 'courseMissingFolder')) ''
Add-Result '-ContentOnly skips brokenWikilinks'     'not reported' (-not (Reports $co.Text 'brokenWikilinks'))     ''
$stillMissing = @()
foreach ($e in $expect) {
  if ($e -eq 'courseMissingFolder' -or $e -eq 'brokenWikilinks') { continue }
  if (-not (Reports $co.Text $e)) { $stillMissing += $e }
}
Add-Result '-ContentOnly keeps every other check' 'all reported' ($stillMissing.Count -eq 0) (($stillMissing -join ',') + ' ')
Add-Result '-ContentOnly still exits 1' 'exit 1' ($co.Code -eq 1) ("exit " + $co.Code)

# =========================================================== 4. scope exclusions hold
# A violation inside an excluded path must stay invisible, or the audit could never be
# clean. All of them are planted at once: the vault must still be reported clean.
New-Fixture
$junk = "---`ntags: [hittepa]`n---`nIngen H1, ingen description, okand tagg.`n"
Write-Utf8 (Join-Path $fx '.kiro\junk.md') $junk
Write-Utf8 (Join-Path $fx 'Ericsson\junk.md') $junk
Write-Utf8 (Join-Path $courseDir 'Filer\Litteraturlista\junk.md') $junk
Write-Utf8 (Join-Path $courseDir 'Filer\Canvas\junk.md') $junk
Write-Utf8 (Join-Path $begrepp 'bok.opt.md') $junk
Write-Utf8 (Join-Path $begrepp 'bok.ai.md') $junk
Write-Utf8 (Join-Path $begrepp 'ritning.excalidraw.md') $junk
Write-Utf8 (Join-Path $courseDir 'Anteckningar\_index.md') $junk
Write-Utf8 (Join-Path $fx '.trash\junk.md') $junk
Write-Utf8 (Join-Path $begrepp 'Ritning.md') "---`ntags: [excalidraw]`n---`n"
$ex = Invoke-Audit
Add-Result 'excluded paths stay invisible' 'exit 0' (($ex.Code -eq 0) -and ($ex.Text -match 'RESULT: clean')) ("exit " + $ex.Code)

$sw.Stop()

# =========================================================== report
Write-Output ("{0,-46} {1,-16} {2,-6} {3}" -f 'CHECK', 'EXPECTED', 'RESULT', 'NOTE')
Write-Output ('-' * 104)
$failed = 0
foreach ($r in $results) {
  $verdict = 'FAIL'
  if ($r.Ok) { $verdict = 'pass' } else { $failed++ }
  Write-Output ("{0,-46} {1,-16} {2,-6} {3}" -f $r.Check, $r.Expected, $verdict, $r.Note)
}
Write-Output ('-' * 104)
Write-Output ("{0} assertions, {1} failed, {2:N1} s" -f $results.Count, $failed, $sw.Elapsed.TotalSeconds)

if (-not $KeepFixture) {
  if (Test-Path -LiteralPath $fx) { Remove-Item -LiteralPath $fx -Recurse -Force }
} else {
  Write-Output "fixture kept at $fx"
}

Write-Output ""
if ($failed -gt 0) {
  Write-Output "RESULT: $failed assertion(s) failed - Vault-Audit.ps1 no longer does what it claims."
  Write-Output "Fix the audit, not this test, unless a rule deliberately changed. If it did,"
  Write-Output "update Meta/Vault Standard.md, the audit and this file in the same commit, and"
  Write-Output "record it in Meta/Vault Findings & Backlog.md."
  exit 1
}
Write-Output "RESULT: all $($results.Count) assertions pass. Every check in Vault-Audit.ps1 fires on a"
Write-Output "deliberate violation, a rule-following vault is reported clean, -ContentOnly skips"
Write-Output "exactly two checks, and every documented scope exclusion holds."
exit 0
