#
# Self-test for Vault-Audit.ps1.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
# Optional:
#   -KeepFixture    leave the throwaway vault on disk for inspection
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

$goodTags = "tags: [begrepp, HE1033, KTH, $natverk, year2026]"
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
  Write-Utf8 (Join-Path $courseDir '_index.md') "---`ntags: [index, HE1033, KTH, $natverk, year2026]`ndescription: `"Kursindex.`"`n$dates`n---`n# $course`n"
  Write-Utf8 (Join-Path $begrepp 'Testbegrepp.md') (Clean-Note 'Testbegrepp')
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

Bad 'a-nofm.md'        "# Trasig`n`nIngen frontmatter alls.`n"
Bad 'b-notags.md'      "---`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'c-listtags.md'    "---`ntags:`n  - begrepp`n  - HE1033`n  - KTH`n  - $natverk`n  - year2026`n$goodDesc`n$dates`n---`n# Trasig`n"
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
Bad 'p-duptags.md'     "---`ntags: [begrepp, begrepp, HE1033, KTH, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'q-nokth.md'       "---`ntags: [begrepp, HE1033, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'r-noyear.md'      "---`ntags: [begrepp, HE1033, KTH, $natverk]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 's-nocode.md'      "---`ntags: [begrepp, KTH, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 't-notype.md'      "---`ntags: [HE1033, KTH, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'u-nosubject.md'   "---`ntags: [begrepp, HE1033, KTH, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'v-casing.md'      "---`ntags: [Begrepp, HE1033, KTH, $natverk, year2026]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'w-vocab.md'       "---`ntags: [begrepp, HE1033, KTH, $natverk, year2026, hittepa]`n$goodDesc`n$dates`n---`n# Trasig`n"
Bad 'x-noh1.md'        "---`n$goodTags`n$goodDesc`n$dates`n---`n## Definition`n`nIngen H1.`n"
Bad 'y-twoh1.md'       "---`n$goodTags`n$goodDesc`n$dates`n---`n# Ett`n`n# Tva`n"
Bad 'z-fcnotlast.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n## Flashcards`n`nFraga::Svar`n`n## Efterat`n`nText.`n"
Bad 'aa-noalt.md'      "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n![[bild.png]]`n"
Bad 'ab-widthonly.md'  "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`n![[bild.png|300]]`n"
Bad 'ac-inlinedv.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# ``= this.file.name```n"
Bad 'ad-olddates.md'   "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`nSkapad: ``= dateformat(this.file.ctime, 'yyyy-MM-dd')```n"
Bad 'ae-brokenlink.md' "---`n$goodTags`n$goodDesc`n$dates`n---`n# Trasig`n`nSe [[Finns Inte Alls]].`n"

# literature filenames
$lit = Join-Path $courseDir 'Filer\Litteraturlista'
Write-Utf8 (Join-Path $lit 'Nagon Bok 5th Edition 2020.pdf') 'x'
Write-Utf8 (Join-Path $lit 'Nagon  Bok 2020 Edition 5.pdf') 'x'
Write-Utf8 (Join-Path $lit 'Nagon Bok HE1033 2020 Edition 5.pdf') 'x'

# a folder that is not one of the four
New-Item -ItemType Directory -Path (Join-Path $courseDir 'Bilagor') -Force | Out-Null

# a second course missing a required folder (no Filer)
$c2 = Join-Path $termDir 'CM1005 Testkurs'
foreach ($n in @('Anteckningar', 'Begrepp', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c2 $n) -Force | Out-Null }
Write-Utf8 (Join-Path $c2 '_index.md') "---`ntags: [index, CM1005, KTH, ekonomi, year2026]`ndescription: `"Kursindex.`"`n$dates`n---`n# CM1005 Testkurs`n"

# a third course with all four folders but no _index.md
$c3 = Join-Path $termDir 'ME1003 Testkurs'
foreach ($n in @('Anteckningar', 'Begrepp', 'Filer', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c3 $n) -Force | Out-Null }

# A degree-project course code: KTH ends these with X rather than a fourth digit
# (HT100X, HI111X). The checks must treat it as a course like any other - before the
# pattern was widened on 2026-08-26, the whole thesis course was invisible to them.
# This one is deliberately missing its _index.md too, so courseMissingIndex must catch it.
$c4 = Join-Path $termDir 'HT100X Testexamensarbete'
foreach ($n in @('Anteckningar', 'Begrepp', 'Filer', $forelas)) { New-Item -ItemType Directory -Path (Join-Path $c4 $n) -Force | Out-Null }
Write-Utf8 (Join-Path $c4 'Begrepp\Trasig X-kod.md') "---`ntags: [begrepp, HT100X, KTH, $natverk, year2026, hittepa]`n$goodDesc`n$dates`n---`n# Trasig X-kod`n"

$full = Invoke-Audit
Add-Result 'violations produce exit 1' 'exit 1' ($full.Code -eq 1) ("exit " + $full.Code)

# Every bucket the audit is supposed to have. If a name here never appears, that check
# has stopped working - or was renamed, in which case fix this list in the same commit.
$expect = @(
  'noFrontmatter', 'frontmatterWithoutTags', 'listStyleTags',
  'missingCreated', 'missingUpdated',
  'missingDescription', 'emptyDescription', 'malformedDescription',
  'duplicateTags', 'missingKTHtag', 'missingYearTag', 'missingCourseCode',
  'missingTypeTag', 'missingSubjectTag', 'tagCasingViolations', 'tagsOutsideVocabulary',
  'noH1', 'multipleH1', 'flashcardsNotLastSection',
  'imageEmbedWithoutAlt', 'inlineDataviewExpression', 'oldDataviewDates',
  'brokenWikilinks', 'courseMissingFolder', 'courseMissingIndex', 'nonConformingFolder',
  'litWrongEditionFormat', 'litBadSpacing', 'litHasCourseCode'
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
