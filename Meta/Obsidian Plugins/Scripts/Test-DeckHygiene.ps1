# Test-DeckHygiene.ps1 - checks the FORM of flashcards, which no other tool looks at.
#
# Usage (PowerShell 5.1+):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this file>"
#   ... -Course HI1031    only that course's chapter decks
#   ... -All              every note under KTH/ that holds cards, legacy notes included
#   ... -Detail           list every finding, not just the first five per file
#   ... -SelfTest         build a throwaway deck with one planted instance of every defect and
#                         require every check to fire. Proves a zero is meaningful. ~1 second
#   ... -Root <path>      run against a different vault
#
# WHY THIS EXISTS
#   Three tools look at these files and none of them looks at a card's shape. Vault-Audit.ps1
#   checks vault conventions - tags, frontmatter, section order - and counts a note with a broken
#   card as clean. markdownlint-cli2 checks Markdown syntax, and an orphaned "||" on its own line
#   is valid Markdown. Get-DeckPairCensus.ps1 counts cards per separator, and that is exactly the
#   measurement that cannot see this damage: a card counter looks for lines that ARE "||", so an
#   orphaned separator left behind by a half-finished edit still counts as one multi-line card.
#   Delete one card and add one, and the total is unchanged while the deck holds a question with
#   no answer. That is traps.md T20, and it happened in HI1031's chapter 10 deck on 2026-09-15:
#   TOTAL=58 was exactly the expected number and a front line sat above an unrelated card.
#
#   It also mechanises the countable half of .kiro/skills/write-flashcards/SKILL.md, whose rules
#   were enforced only by review until now. On 2026-09-26 a rework of ten HI1031 decks was checked
#   by ten adversarial reviewers reading by hand; this script replaces that reading for the parts
#   that are countable, and it found the numbers the reviewers had to establish one deck at a time.
#
# WHAT THIS COUNTS, and which files are in and out
#   Default scope is the chapter decks - notes whose name matches "* Begrepp - Kap *" under any
#   Anteckningar folder. Those are the notes current conventions were written for.
#   -All widens the scope to every note under KTH/ holding at least one card. EXPECT FINDINGS
#   THERE: several hundred cards predate these rules, so -All is a survey and not a pass/fail gate.
#   Nothing outside KTH/ is ever read, so the docs under Meta/ and .kiro/ that quote card syntax in
#   prose cannot produce a finding.
#
#   Eight checks. Each names the file, the line and the offending text.
#
#     orphanSeparator   a bare "||" or "??" with no front line above it - the line before is blank,
#                       a heading, or a marker. The T20 signature.
#     thinList          a "||" or "??" card whose body has fewer than 2 bullet rows. Half a card.
#     fatList           more than 4 bullet rows. SKILL.md rule 8 caps a list card at 2-4 items;
#                       measured in this vault's own review data, 5+ item cards are the hardest
#                       form there is - HI1031 chapter 1 scored FSRS difficulty 9.88 on them
#                       against 9.02 for single-fact cards in the same deck. A front line carrying
#                       "(8)" is exempt: HI1031 chapter 1 question 3 asks for the book's eight
#                       challenges verbatim, so that one list is the exam's own unit of knowledge.
#     listHighlight     a "==...==" inside a list body. SKILL.md rule 5: every row of a list card
#                       is a recall target, so the bold label per row already does that job and
#                       marking one row suppresses the others.
#     missingCue        a list card whose front line has no "(N)" completeness cue.
#     strayMarker       an "<!--SR:" line that does not sit under a complete card. A marker left
#                       behind by a deletion attaches itself to whatever follows, which is the one
#                       edit SKILL.md rule 11 forbids and the schedule it carries was earned by a
#                       question that no longer exists.
#     highlightCount    a single-line card whose answer does not carry exactly one "==...==" pair.
#                       Zero means nothing is declared as the recall target and grading is guesswork;
#                       two or more means the distinctiveness effect the marker exists for is gone
#                       (SKILL.md rule 5, and references/evidence.md section 16 on what is and is
#                       not measured about that).
#     unclosedMarker    an odd number of "==" on a card line, so one marker was never closed.
#
#   Reported as NOTES rather than findings, because neither is damage on its own:
#     - emptyHeading, a "##" section with no cards under it. Usually the residue of narrowing a
#       deck, and worth a look because deleting the last card under a heading silently drops a
#       topic: on 2026-09-15 "## Samtidighet" was removed with its only card and HI1031 chapter 1
#       lost one of the eight challenges its exam question asks about, while the card count stayed
#       plausible. Sometimes deliberate, so it never changes the exit code.
#     - reversedCards, the count of ";;" cards per file. A reversed card is two cards of work and
#       SKILL.md asks for it to be justified; the script cannot judge whether it was.
#
# EXIT CODE
#   0  no findings in scope
#   1  findings, or -SelfTest found a check that does not fire
#
# TRAPS THIS SCRIPT RESPECTS
#   T1  pure ASCII source. Swedish appears only in data read from files, never as a literal here.
#   T3  -match is case-insensitive, so heading detection uses -cmatch.
#   T10 the root is canonicalised before any path arithmetic.
#   T16 every "literal" search is either .Contains() or an escaped regex.
#   T18 patterns containing a backtick or a dollar sign are single-quoted.

[CmdletBinding()]
param(
  [string]$Root,
  [string]$Course,
  [switch]$All,
  [switch]$Detail,
  [switch]$SelfTest
)

$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------- helpers

function Resolve-VaultRoot {
  param([string]$Candidate)
  if ($Candidate) {
    if (-not (Test-Path -LiteralPath $Candidate)) { throw ('Root not found: ' + $Candidate) }
    # T10: canonicalise before any Substring arithmetic on the path
    return (Get-Item -LiteralPath $Candidate).FullName
  }
  $d = Split-Path -Parent $PSCommandPath
  while ($d) {
    if (Test-Path -LiteralPath (Join-Path $d 'llms.txt')) { return (Get-Item -LiteralPath $d).FullName }
    $parent = Split-Path -Parent $d
    if ($parent -eq $d) { break }
    $d = $parent
  }
  return (Get-Item -LiteralPath (Split-Path -Parent $PSCommandPath)).FullName
}

function Get-DeckFindings {
  param([string[]]$Lines)

  $res = [pscustomobject]@{
    findings      = (New-Object System.Collections.Generic.List[object])
    notes         = (New-Object System.Collections.Generic.List[object])
    cards         = 0
    markers       = 0
    reversedCards = 0
  }

  $headingCards = @{}
  $headingLine = @{}
  $headingOrder = New-Object System.Collections.Generic.List[string]
  $current = ''

  # Two regions are NOT card territory and must be skipped, or their contents are read as cards:
  #   - YAML frontmatter, whose "description:" line contains a colon pair often enough to matter
  #   - fenced code blocks, where C++ "std::cout", a Markdown example showing "||", or a prose line
  #     like "3::1" all parse as cards. Found by an adversarial review on 2026-09-26: a fixture with
  #     one real card and one code fence reported 4 cards and three false highlightCount findings.
  # The fence marker is written with [char]0x60 rather than a literal, because a backtick inside a
  # double-quoted PowerShell string is an escape character (traps T18).
  $tick = [string][char]0x60
  $fence3 = $tick + $tick + $tick
  $inFence = $false
  $inFrontmatter = $false
  if ($Lines.Length -gt 0 -and $Lines[0].Trim() -eq '---') { $inFrontmatter = $true }

  for ($i = 0; $i -lt $Lines.Length; $i++) {
    $line = $Lines[$i]
    $trim = $line.Trim()
    $num = $i + 1

    # ---- frontmatter: everything up to and including the closing --- is out of scope
    if ($inFrontmatter) {
      if ($i -gt 0 -and $trim -eq '---') { $inFrontmatter = $false }
      continue
    }

    # ---- fenced blocks, both ``` and ~~~
    if ($trim.StartsWith($fence3) -or $trim.StartsWith('~~~')) {
      $inFence = -not $inFence
      continue
    }
    if ($inFence) { continue }

    # T3: heading detection must be case-sensitive about the marker, not the text
    if ($line -cmatch '^##\s+\S') {
      $current = $trim
      if (-not $headingCards.ContainsKey($current)) {
        $headingCards[$current] = 0
        $headingLine[$current] = $num
        $headingOrder.Add($current)
      }
      continue
    }

    # ---- a bare separator line is the front of a multi-line card
    if ($trim -eq '||' -or $trim -eq '??') {
      $res.cards++
      if ($current -ne '') { $headingCards[$current] = $headingCards[$current] + 1 }

      $above = ''
      if ($i -gt 0) { $above = $Lines[$i - 1].Trim() }
      $aboveIsCard = $true
      if ($above -eq '') { $aboveIsCard = $false }
      elseif ($above.StartsWith('#')) { $aboveIsCard = $false }
      elseif ($above.StartsWith('<!--SR:')) { $aboveIsCard = $false }
      if (-not $aboveIsCard) {
        $res.findings.Add([pscustomobject]@{ check = 'orphanSeparator'; line = $num; text = $trim })
      }

      $bullets = 0
      $bodyHighlights = New-Object System.Collections.Generic.List[object]
      for ($j = $i + 1; $j -lt $Lines.Length; $j++) {
        $b = $Lines[$j]
        if ($b.Trim() -eq '') { break }
        if ($b.TrimStart().StartsWith('<!--SR:')) { break }
        if ($b -match '^\s*([-*]|\d+\.)\s+\S') { $bullets++ }
        if ($b.Contains('==')) {
          $bodyHighlights.Add([pscustomobject]@{ line = ($j + 1); text = $b.Trim() })
        }
      }

      if ($bullets -lt 2) {
        $res.findings.Add([pscustomobject]@{ check = 'thinList'; line = $num; text = ($bullets.ToString() + ' bullet row(s)') })
      }
      $frontLine = ''
      if ($i -gt 0) { $frontLine = $Lines[$i - 1].Trim() }
      # The (8) exemption is anchored to the END of the front line, because a bare .Contains('(8)')
      # exempts a list of any length whose prompt happens to mention "(8)" anywhere - an adversarial
      # review on 2026-09-26 slipped a six-row list past the gate with the front line
      # "... section (8)." That is a silent false negative in the one check that is a gate.
      $eightExempt = ($frontLine -match '\(8\)[\s.:]*$')
      if ($bullets -gt 4 -and -not $eightExempt) {
        $res.findings.Add([pscustomobject]@{ check = 'fatList'; line = $num; text = ($bullets.ToString() + ' bullet rows: ' + $frontLine) })
      }
      foreach ($h in $bodyHighlights) {
        $res.findings.Add([pscustomobject]@{ check = 'listHighlight'; line = $h.line; text = $h.text })
      }
      if ($frontLine -ne '' -and -not ($frontLine -match '\(\d+\)')) {
        $res.findings.Add([pscustomobject]@{ check = 'missingCue'; line = $num; text = $frontLine })
      }
      continue
    }

    # ---- a scheduling marker must sit under a complete card
    if ($trim.StartsWith('<!--SR:')) {
      $res.markers++
      $above = ''
      if ($i -gt 0) { $above = $Lines[$i - 1].Trim() }
      # "Complete card" means the line above is either a single-line card, or the last body row of a
      # multi-line card. Testing only that it is non-blank lets a marker sitting under ordinary prose
      # pass, which under-reports the very defect this check exists for.
      $ok = $false
      if ($above -ne '' -and -not $above.StartsWith('#') -and $above -ne '||' -and $above -ne '??') {
        if ($above -match '^\s*([-*]|\d+\.)\s+\S') { $ok = $true }          # body row of a list card
        elseif ($above -match '^(.*\S.*?)(::|;;)') { $ok = $true }          # a single-line card
      }
      if (-not $ok) {
        $res.findings.Add([pscustomobject]@{ check = 'strayMarker'; line = $num; text = ('line above is not a card: "' + $above + '"') })
      }
      continue
    }

    if ($trim -eq '') { continue }
    if ($line.StartsWith('#')) { continue }

    # ---- a single-line card: front, separator, answer on one line
    $m = [regex]::Match($line, '^(.*?)(::|;;)(.*)$')
    if (-not $m.Success) { continue }
    $front = $m.Groups[1].Value
    if ($front.Trim() -eq '') { continue }
    # a URL like http://x contains "::" only in exotic cases, but a table row never is a card
    if ($front.TrimStart().StartsWith('|')) { continue }

    $res.cards++
    if ($m.Groups[2].Value -eq ';;') { $res.reversedCards++ }
    if ($current -ne '') { $headingCards[$current] = $headingCards[$current] + 1 }

    $answer = $m.Groups[3].Value
    $marks = ([regex]::Matches($answer, '==')).Count
    if ($marks % 2 -ne 0) {
      $res.findings.Add([pscustomobject]@{ check = 'unclosedMarker'; line = $num; text = $front.Trim() })
    }
    $pairs = [math]::Floor($marks / 2)
    if ($pairs -ne 1) {
      $res.findings.Add([pscustomobject]@{ check = 'highlightCount'; line = $num; text = ($pairs.ToString() + ' highlight(s): ' + $front.Trim()) })
    }
  }

  foreach ($h in $headingOrder) {
    if ($headingCards[$h] -eq 0) {
      $res.notes.Add([pscustomobject]@{ check = 'emptyHeading'; line = $headingLine[$h]; text = $h })
    }
  }
  if ($res.reversedCards -gt 0) {
    $res.notes.Add([pscustomobject]@{ check = 'reversedCards'; line = 0; text = ($res.reversedCards.ToString() + ' reversed (;;) card(s) - each is two cards of work') })
  }

  return $res
}

function Get-DecksInScope {
  param([string]$VaultRoot, [string]$CourseCode, [bool]$Wide)

  $kth = Join-Path $VaultRoot 'KTH'
  if (-not (Test-Path -LiteralPath $kth)) { return @() }
  $all = @(Get-ChildItem -LiteralPath $kth -Recurse -File -Filter '*.md')
  $out = New-Object System.Collections.Generic.List[object]

  foreach ($f in $all) {
    if ($f.FullName.Contains('\Filer\')) { continue }
    $name = $f.Name
    # the course filter is case-insensitive on purpose: -Course hi1031 used to resolve to zero decks
    # and exit 0, which reads as "clean" for what is actually a typo
    if ($CourseCode -and -not $name.StartsWith($CourseCode, [System.StringComparison]::OrdinalIgnoreCase)) { continue }

    $isChapterDeck = $false
    # T19: the course code is part of the match, never a bare chapter filter
    if ($name -match '^\S+ Begrepp - Kap \d') { $isChapterDeck = $true }

    if (-not $Wide -and -not $isChapterDeck) { continue }

    if ($Wide -and -not $isChapterDeck) {
      # a note is in the wide scope only if it actually holds a card
      $raw = [System.IO.File]::ReadAllText($f.FullName)
      $hasCard = $false
      if ($raw -match '(?m)^\s*(\|\||\?\?)\s*$') { $hasCard = $true }
      if (-not $hasCard -and ($raw.Contains('::') -or $raw.Contains(';;'))) { $hasCard = $true }
      if (-not $hasCard) { continue }
      # an excalidraw drawing is not an authored note
      if ($raw -match '(?s)\A---\r?\n(.*?)\r?\n---') {
        if ($Matches[1] -match 'excalidraw') { continue }
      }
    }
    $out.Add($f)
  }
  return @($out | Sort-Object Name)
}

# ---------------------------------------------------------------- self-test

function Invoke-SelfTest {
  $fixRoot = Join-Path $env:TEMP ('deckhygiene-selftest-' + [guid]::NewGuid().ToString('N').Substring(0, 8))
  $deckDir = Join-Path $fixRoot 'KTH\2099 Test\XX0000 Test\Anteckningar'
  New-Item -ItemType Directory -Path $deckDir -Force | Out-Null
  Set-Content -LiteralPath (Join-Path $fixRoot 'llms.txt') -Value 'fixture' -Encoding UTF8

  $nl = "`n"
  $t = New-Object System.Text.StringBuilder
  [void]$t.Append('---' + $nl + 'tags: [begrepp, XX0000, KTH, year2099]' + $nl + 'description: "fixture"' + $nl + '---' + $nl)
  [void]$t.Append('# Fixture' + $nl + $nl)
  [void]$t.Append('## One' + $nl + $nl)
  # orphanSeparator + missingCue
  [void]$t.Append('||' + $nl + '- **A** one' + $nl + '- **B** two' + $nl + $nl)
  # thinList
  [void]$t.Append('Front thin? (2)' + $nl + '||' + $nl + '- **A** one' + $nl + $nl)
  # fatList
  [void]$t.Append('Front fat? (5)' + $nl + '||' + $nl + '- **A** one' + $nl + '- **B** two' + $nl + '- **C** three' + $nl + '- **D** four' + $nl + '- **E** five' + $nl + $nl)
  # the (8) exemption must NOT be reported as fatList
  [void]$t.Append('Front eight? (8)' + $nl + '||' + $nl + '- **A** one' + $nl + '- **B** two' + $nl + '- **C** three' + $nl + '- **D** four' + $nl + '- **E** five' + $nl + '- **F** six' + $nl + '- **G** seven' + $nl + '- **H** eight' + $nl + $nl)
  # listHighlight
  [void]$t.Append('Front marked? (2)' + $nl + '||' + $nl + '- **A** ==marked==' + $nl + '- **B** two' + $nl + $nl)
  # missingCue - a real front line, two bullets, but no (N). Kept separate from the orphaned card
  # above, whose front line is empty: reporting missingCue there too would be duplicate noise.
  [void]$t.Append('Front without any cue' + $nl + '||' + $nl + '- **A** one' + $nl + '- **B** two' + $nl + $nl)
  # strayMarker
  [void]$t.Append('<!--SR:!fsrs,2099-01-01T00:00:00.000Z,3,3.1,6.7,2,3,0,0,2099-01-01T00:00:00.000Z-->' + $nl + $nl)
  # highlightCount zero
  [void]$t.Append('Question zero?::Answer with no marker.' + $nl + $nl)
  # highlightCount three
  [void]$t.Append('Question three?::==one== and ==two== and ==three==.' + $nl + $nl)
  # unclosedMarker (also counts as highlightCount 0)
  [void]$t.Append('Question open?::==only an opening here.' + $nl + $nl)
  # a clean single-line card, to prove the checker does not fire on good input
  [void]$t.Append('Question clean?::A single ==recall target== and context.' + $nl + $nl)
  # NEGATIVE CONTROL: a fenced code block. Nothing inside it is a card, however much it looks like
  # one. Without fence tracking this block alone produced three false highlightCount findings, one
  # false thinList, one false missingCue and inflated the card count by three.
  $tick = [string][char]0x60
  $fence = $tick + $tick + $tick
  [void]$t.Append($fence + 'cpp' + $nl + 'std::cout << x;' + $nl + 'namespace foo::bar {}' + $nl + $fence + $nl + $nl)
  [void]$t.Append($fence + 'markdown' + $nl + 'Front in an example? (2)' + $nl + '||' + $nl + '- **A** one' + $nl + $fence + $nl + $nl)
  # NEGATIVE CONTROL: the (8) exemption must apply only when (8) ends the front line. A long list
  # whose prompt merely mentions (8) mid-sentence must still be reported.
  [void]$t.Append('See section (8). What are the six? (6)' + $nl + '||' + $nl + '- **A** one' + $nl + '- **B** two' + $nl + '- **C** three' + $nl + '- **D** four' + $nl + '- **E** five' + $nl + '- **F** six' + $nl + $nl)
  # emptyHeading (note, not finding)
  [void]$t.Append('## Empty' + $nl + $nl)
  [System.IO.File]::WriteAllText((Join-Path $deckDir 'XX0000 Begrepp - Kap 01 Fixture.md'), $t.ToString(), (New-Object System.Text.UTF8Encoding($false)))

  $lines = [System.IO.File]::ReadAllLines((Join-Path $deckDir 'XX0000 Begrepp - Kap 01 Fixture.md'), [System.Text.Encoding]::UTF8)
  $r = Get-DeckFindings -Lines $lines

  # The same fixture with CRLF endings must produce an identical finding list. The vault mixes LF and
  # CRLF on purpose and a fresh clone on a Windows machine gets CRLF throughout, so a line-anchored
  # pattern that only works on LF would make this script blind on a clone (traps T12).
  $crlfPath = Join-Path $deckDir 'XX0000 Begrepp - Kap 02 Fixture CRLF.md'
  $crlfText = ($t.ToString() -replace "`r", '') -replace "`n", "`r`n"
  [System.IO.File]::WriteAllText($crlfPath, $crlfText, (New-Object System.Text.UTF8Encoding($false)))
  $rCrlf = Get-DeckFindings -Lines ([System.IO.File]::ReadAllLines($crlfPath, [System.Text.Encoding]::UTF8))

  # And once more with a UTF-8 BOM, which ReadAllText consumes as a preamble (traps T9).
  $bomPath = Join-Path $deckDir 'XX0000 Begrepp - Kap 03 Fixture BOM.md'
  [System.IO.File]::WriteAllText($bomPath, $t.ToString(), (New-Object System.Text.UTF8Encoding($true)))
  $rBom = Get-DeckFindings -Lines ([System.IO.File]::ReadAllLines($bomPath, [System.Text.Encoding]::UTF8))

  $expected = @('orphanSeparator', 'thinList', 'fatList', 'listHighlight', 'missingCue',
    'strayMarker', 'highlightCount', 'unclosedMarker')
  Write-Host ''
  Write-Host '=== Test-DeckHygiene self-test ==='
  Write-Host ('fixture: ' + $deckDir)
  Write-Host ('findings reported: ' + $r.findings.Count + ', notes: ' + $r.notes.Count + ', cards counted: ' + $r.cards)
  Write-Host ''
  $missing = 0
  foreach ($e in $expected) {
    $hits = @($r.findings | Where-Object { $_.check -eq $e }).Count
    $verdict = 'FIRES'
    if ($hits -eq 0) { $verdict = 'BLIND - check never fired'; $missing++ }
    Write-Host ('  {0,-16} {1,3} hit(s)  {2}' -f $e, $hits, $verdict)
  }

  Write-Host ''
  Write-Host '  negative controls - each must report nothing:'
  # the (8) exemption applies only at the end of the front line
  $fat = @($r.findings | Where-Object { $_.check -eq 'fatList' })
  $eightWrong = @($fat | Where-Object { $_.text -match '\(8\)[\s.:]*$' }).Count
  $v1 = 'HOLDS'
  if ($eightWrong -gt 0) { $v1 = 'BROKEN - a card ending in (8) was reported'; $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f '(8) exemption at line end', $eightWrong, $v1)
  # ... but a mid-sentence (8) must NOT exempt a long list
  $midEight = @($fat | Where-Object { $_.text.Contains('section (8)') }).Count
  $v2 = 'HOLDS'
  if ($midEight -eq 0) { $v2 = 'BROKEN - a 6-row list slipped past the gate'; $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f 'mid-sentence (8) not exempt', $midEight, $v2)
  # the clean card
  $cleanWrong = @($r.findings | Where-Object { $_.text -like '*Question clean*' }).Count
  $v3 = 'HOLDS'
  if ($cleanWrong -gt 0) { $v3 = 'BROKEN - a correct card was reported'; $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f 'clean card', $cleanWrong, $v3)
  # nothing inside a fenced code block is a card
  $fenceWrong = @($r.findings | Where-Object { $_.text -match 'std::cout|namespace foo|in an example' }).Count
  $v4 = 'HOLDS'
  if ($fenceWrong -gt 0) { $v4 = 'BROKEN - code fence content read as cards'; $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f 'fenced code block ignored', $fenceWrong, $v4)
  # line endings and BOM must not change the answer
  $crlfDiff = [math]::Abs($r.findings.Count - $rCrlf.findings.Count)
  $v5 = 'HOLDS'
  if ($crlfDiff -ne 0) { $v5 = ('BROKEN - CRLF gave ' + $rCrlf.findings.Count + ' findings'); $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f 'CRLF same as LF', $crlfDiff, $v5)
  $bomDiff = [math]::Abs($r.findings.Count - $rBom.findings.Count)
  $v6 = 'HOLDS'
  if ($bomDiff -ne 0) { $v6 = ('BROKEN - BOM gave ' + $rBom.findings.Count + ' findings'); $missing++ }
  Write-Host ('    {0,-28} {1,3}  {2}' -f 'BOM same as no BOM', $bomDiff, $v6)

  $emptyNote = @($r.notes | Where-Object { $_.check -eq 'emptyHeading' }).Count
  $verdictE = 'FIRES'
  if ($emptyNote -eq 0) { $verdictE = 'BLIND'; $missing++ }
  Write-Host ''
  Write-Host ('  {0,-16} {1,3}          {2}  (note, never changes the exit code)' -f 'emptyHeading', $emptyNote, $verdictE)

  Remove-Item -LiteralPath $fixRoot -Recurse -Force
  Write-Host ''
  if ($missing -eq 0) {
    Write-Host 'RESULT: all 8 checks fire and all 6 negative controls hold. A zero on real decks means clean.'
    return 0
  }
  Write-Host ('RESULT: ' + $missing + ' problem(s) with the checks themselves. A zero proves nothing until fixed.')
  return 1
}

# ---------------------------------------------------------------- main

if ($SelfTest) { exit (Invoke-SelfTest) }

$vaultRoot = Resolve-VaultRoot -Candidate $Root
$decks = Get-DecksInScope -VaultRoot $vaultRoot -CourseCode $Course -Wide ([bool]$All)

Write-Host ('=== DECK HYGIENE  ' + (Get-Date -Format 'yyyy-MM-dd HH:mm') + ' ===')
Write-Host ('root=' + $vaultRoot)
$scopeName = 'chapter decks (* Begrepp - Kap *)'
if ($All) { $scopeName = 'every note under KTH/ holding a card - survey mode, legacy findings expected' }
if ($Course) { $scopeName = $scopeName + ', course ' + $Course }
Write-Host ('scope=' + $scopeName)
Write-Host ('decksInScope=' + $decks.Count)

if ($decks.Count -eq 0) {
  # exit 2, not 0: an empty scope is an operator error, and returning "clean" for it is how a
  # mistyped -Course gets read as a pass
  Write-Host 'RESULT: nothing in scope. Check -Course, or pass -All to widen.'
  exit 2
}

$totalFindings = 0
$totalCards = 0
$totalMarkers = 0
$byCheck = @{}
$noteLines = New-Object System.Collections.Generic.List[string]

foreach ($f in $decks) {
  $lines = [System.IO.File]::ReadAllLines($f.FullName, [System.Text.Encoding]::UTF8)
  $r = Get-DeckFindings -Lines $lines
  $totalCards += $r.cards
  $totalMarkers += $r.markers
  $totalFindings += $r.findings.Count

  foreach ($x in $r.findings) {
    if (-not $byCheck.ContainsKey($x.check)) { $byCheck[$x.check] = 0 }
    $byCheck[$x.check] = $byCheck[$x.check] + 1
  }

  if ($r.findings.Count -gt 0) {
    Write-Host ''
    Write-Host ('--- ' + $f.Name + '   cards=' + $r.cards + ' markers=' + $r.markers + ' findings=' + $r.findings.Count)
    $show = $r.findings
    if (-not $Detail) { $show = @($r.findings | Select-Object -First 5) }
    foreach ($x in $show) {
      $txt = $x.text
      if ($txt.Length -gt 90) { $txt = $txt.Substring(0, 90) }
      Write-Host ('    L{0,-5} {1,-16} {2}' -f $x.line, $x.check, $txt)
    }
    if (-not $Detail -and $r.findings.Count -gt 5) {
      Write-Host ('    ... ' + ($r.findings.Count - 5) + ' more, re-run with -Detail')
    }
  }
  foreach ($x in $r.notes) {
    $noteLines.Add(('  ' + $f.Name + '  L' + $x.line + '  ' + $x.check + ': ' + $x.text))
  }
}

Write-Host ''
Write-Host ('cardsInScope=' + $totalCards + '  markersInScope=' + $totalMarkers)

if ($byCheck.Keys.Count -gt 0) {
  Write-Host ''
  Write-Host 'findings by check:'
  foreach ($k in ($byCheck.Keys | Sort-Object)) {
    Write-Host ('  {0,-16} {1}' -f $k, $byCheck[$k])
  }
}

if ($noteLines.Count -gt 0) {
  Write-Host ''
  Write-Host 'NOTES - these never change the exit code:'
  foreach ($n in $noteLines) { Write-Host $n }
}

Write-Host ''
if ($totalFindings -eq 0) {
  Write-Host 'RESULT: clean - every card in scope has a front line, a body, and exactly one recall target.'
  Write-Host 'Run with -SelfTest once to confirm the checks still fire; a zero from a blind check is not a pass.'
  exit 0
}
Write-Host ('RESULT: ' + $totalFindings + ' finding(s). A card count cannot see these - read the lines above.')
Write-Host 'See .kiro/skills/write-flashcards/SKILL.md for the rule behind each check.'
exit 1
