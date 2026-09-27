---
inclusion: manual
description: The feedback loop. When something passed every check and was still wrong, it gets recorded here and the miss becomes a new rule. Read when a check turns out to have been insufficient, or before adding one. NOT auto-loaded - this file explains why the rules exist; the rules themselves live in .kiro/steering/.
---

# Lessons learned

Without this file, the rules stay exactly as smart as the day they were written. With it, every
miss makes them better.

This is **not** for violations the checks already catch — those are just findings, and they go
in `Meta/Vault Findings & Backlog.md`. This is for the cases where everything was green and the
result was still wrong.

## When to add an entry

- A check passed and the thing it was supposed to protect was broken anyway.
- A measurement produced a confident number that turned out to be false.
- A rule turned out to be wrong, or to have a case it did not cover.
- A doc said something that was true when written and silently stopped being true.

## Format

```markdown
## YYYY-MM-DD — short title

**What happened:** what was done, and what went wrong with it.
**Why the checks missed it:** which check should have caught this, and why it did not.
**Rule added:** the new or amended rule, and where it now lives.
**Lesson:** one sentence a future reader can act on.
```

---

## 2026-09-14 — the documented way to preserve a BOM could never have worked

**What happened:** `steering/environment.md` carried a three-line pattern that every writing script
here was meant to copy: read the file with `[System.IO.File]::ReadAllText`, set `$hadBom` from
whether the first character is `U+FEFF`, write back with `UTF8Encoding($hadBom)`. `traps.md` T9
recommended the same test. It cannot work. `ReadAllText` detects the BOM and consumes it as a
preamble, so the decoded string never begins with `U+FEFF`, `$hadBom` is always `$false`, and the
write strips a BOM that was present. Found while writing `Format-FrontmatterTags.ps1` by testing a
file with a real BOM rather than trusting the pattern: bytes `EF BB BF` then `hello` reads back
with length 5 and `h` first.

**Why the checks missed it:** nothing exercises it. `Test-ScriptHygiene.ps1` deliberately reports
write calls rather than verifying rule 3, because static analysis cannot prove a write is safe.
`Test-DocHygiene.ps1` checks for a BOM under `.kiro/` but never round-trips one through a script.
And the population hid it: **0 of 629 notes under `KTH/` carry a BOM**, so a stripping bug had
nothing to strip. The pattern was wrong for as long as it existed and could not have been noticed
from the vault's own state — only from a planted fixture.

**Rule added:** `environment.md` now detects the BOM from `ReadAllBytes` and says why the character
test cannot fire, and `traps.md` T9 records that the fix it used to recommend was itself wrong.
`Format-FrontmatterTags.ps1` uses the byte check and was verified across all four combinations of
BOM and line ending, each round-tripping unchanged.

**Lesson:** a documented code pattern is an untested assertion until something round-trips a
fixture through it; "0 of 629 affected" is why a wrong rule can survive indefinitely, not evidence
that it is right.

---

## 2026-09-14 — a check failed correctly and I drew the wrong conclusion from it

**What happened:** after pushing the vault, a local Quartz build was run to confirm the site still
built. It failed, fatally, on HI1031's chapter 16 note. That was reported to the author as *the
vault push has broken the site and the hourly deploy will fail*. **It had not.** The crash needs
CRLF line endings, and it only appeared because the site repo's `content` submodule is a separate
clone on a machine where `core.autocrlf=true`, so the checkout converted the file. CI checks out
on Linux, gets LF, and builds. A build pointed straight at the vault's own working tree processed
560 files and exited 0. The underlying parser bug is real and now documented — a `==highlight==`
spanning two or more CRLF line breaks kills Quartz's markdown parser — but the site was never at
risk, and the alarm was raised before checking which of the two copies had been measured.

**Why the checks missed it:** they did not. The build failed exactly as it should have, on the
bytes it was given. Nothing was wrong with the check; the error was in the inference from it. The
missing step was cheap and was skipped: comparing the file that failed against the same file in
the working tree, which would have shown 580 CR against 0 CR immediately. `traps.md` T5 and the
site repo's own T9 both already say that Windows and CI legitimately disagree about the same
commit — the pattern was documented and I did not apply it.

**Rule added:** `steering/environment.md` gains a section with the measured line-ending state of
this repository — index all-LF, working tree 668 LF against 37 CRLF and 3 mixed, no
`.gitattributes`, `core.autocrlf` set at system level — and the instruction never to conclude
anything about CI or the published site from a local build alone. It also records that a CR count
answers *"has this file been through a checkout here?"* rather than *"is this file damaged?"*,
which corrects how `Get-DeckPairCensus.ps1`'s CR figure should be read.

**Note against this file:** none of the four cases listed at the top covers this. All four are
about a check being too permissive, a figure being wrong, a rule being incomplete, or a doc going
stale. This was the inverse — a check that fired correctly and a conclusion that overreached it.
That is worth adding as a fifth trigger: **a check failed and the failure was attributed to the
wrong cause.**

**Lesson:** a failure tells you about the bytes you handed the tool, not about production; before
reporting a break, confirm which copy of the file you actually measured.

---

## 2026-09-10 — a number written once and never re-derived propagated into ten rows

**What happened:** the HI1031 exam-prep project kept a calibration table in
`.kiro/hi1031-tenta-reentry.md` mapping each chapter to its number of exam questions, card count and note
length. The chapter 1 row said **4 questions**. The exam file has **5** — the fifth asks what role IP and
RFCs played in the development of distributed systems. The wrong figure survived every context window for
the whole project and was used to derive that chapter's budget, its "lines per question" ratio, and by
extension the formula calibrated against all ten rows. It was found only when a reviewer was asked, in
passing, to confirm that question 5 was answered. It was: the note had covered all five all along. **The
material was right and the measurement of it was wrong** — the least visible way for a figure to be false.

**Why the checks missed it:** nothing checks a figure in a `.kiro/` doc against the source it summarises.
`Vault-Audit.ps1` does not read `.kiro/`; `Test-DocHygiene.ps1` checks encoding, whitespace and dead
script references there, not arithmetic. And the number was self-consistent: 4 questions × ~70 lines
matched the note's actual length closely enough that no downstream figure looked absurd. A wrong number
that produces plausible derived numbers has no symptom.

**Rule added:** two, both in `.kiro/hi1031-tenta-reentry.md`. The calibration table's chapter 1 row is
corrected to 5 questions. And more generally: **a count of things in an external file is re-derived from
that file, not copied forward.** The exam questions are read verbatim at the start of each chapter anyway —
the count must come from that reading, not from the table the reading is compared against.

**Lesson:** a figure that summarises another file needs a stated source and a re-derivation, because
self-consistency is not evidence — the surrounding numbers will happily agree with a wrong one.

---

## 2026-09-10 — the flashcard rule protected the data and blocked the owner

**What happened:** `conventions.md` §1 said "never strip an `<!--SR:-->` comment" without qualification.
During a review of all ten HI1031 chapters, seven cards in chapter 1's deck were found to serve no exam
question — but that deck was the only one carrying review history, so the rule appeared to forbid removing
them. The question was put to the author, who answered that history is not a reason to keep a card:
*"bry dig inte om ett kort har historik, om den inte är nödvändig kastar du den."* The rule had been read
as protecting the schedule from the author's own editorial decisions, which was never its purpose.

**Why the checks missed it:** this is not a check failure — `Get-SRIntegrity.ps1` would have caught any
*accidental* marker loss correctly. The failure was in the rule's wording. It described **what** must not
happen (markers disappearing) without saying **why** (incidental loss from sweeps, `--fix` runs and
regexes), so it read as an absolute prohibition and cost a round trip to the author.

**Rule added:** `conventions.md` §1 now has a named carve-out separating **incidental** loss, still
forbidden, from **authorised editorial removal**, allowed — with the three things that still apply:
delete the whole card block including its marker, prove the arithmetic from the per-file `-Compare`
lines, and require `raw_srComments` to fall by exactly the number of markers removed. It also says not to
ask again.

**Lesson:** a prohibition that does not say what it is protecting against will be over-applied; write the
failure mode into the rule, not just the forbidden outcome.

---

## 2026-09-07 — a document can be well-researched, confidently written and still unusable

**What happened:** two long Markdown documents arrived in `Downloads` and were considered as a skill or a
reference for this vault. *Training AI To Write Human-Like Text* (internally *"Detection, Artifacts, and
Evasion Strategies"*) and *Crafting AI Persona for Book Summaries*. Both read as authoritative: headed
sections, citation markers, tables of figures. Both were rejected.

Measured before deciding, which is what made the decision cheap: the first cites **46 unique domains, 19.6 %
academic, 63 % blog, vendor or Reddit, with 20 Reddit links**; the second **35 domains, 0 % academic, 57 %
blog, vendor or Reddit**. Then the disqualifying details. The first is an evasion manual — **35 uses of
evasion, evade, undetectable or bypass** — sourced simultaneously to detector vendors *and* to the humanizer
vendors selling against them, carrying an invented "Effectiveness" column, mangled citation markers, an
instruction to insert deliberate typos, and no engagement anywhere with detector false positives. The second
is about the wrong course entirely, mandates the Cornell method (a second note structure, against
`Meta/Vault Standard.md` §4), forbids verbatim quoting where this vault requires it, and instructs the AI to
invent study guidance.

The vindication came two days later. The corpus built to check the same topic properly contained one
experiment that actually tests the typo advice — 105 participants — and found the error-rate change
**non-significant after Holm correction** while lexical diversity fell sharply. The document's central
tactic had no measured effect, and its confident tone was the only thing carrying it.

**Why the checks missed it:** nothing checks an incoming document. `Vault-Audit.ps1` validates notes already
in scope; markdownlint validates syntax. A file in `Downloads` passes both by not being examined. And the
document's *form* — sections, citations, tables — is exactly what a reader uses as a proxy for rigour, so
the proxy pointed the wrong way.

**Rule added:** before adopting any outside document as a skill or reference, count its sources by domain
class and search it for the vocabulary of its own agenda. Two numbers and one word-search settled both cases
in minutes. Recorded with the figures in `.kiro/research/2026-09-07-llm-style-what-survived-checking.md`,
whose tier table now also marks which lines of the derived prompt rest on **nothing measured** — the same
distinction these documents blurred.

**Lesson:** measure a document's bibliography before reading its conclusions, because confident structure is
free and citations are not.

**What happened:** across one session of hardening a skill and distilling a research corpus, my own
verification scripts produced **nine** wrong results. Six of them were false negatives: the script
reported a phrase or figure *absent* from a file that contained it. Two were false positives from a
broken pattern. One wiped a variable and read null from four files.

The consequences differed in kind. When a script reported a stale claim removed, I told the user it
was fixed and it was not — the text was still in the file, wrapped across two lines while I searched
for it on one. When three figures came back missing from a file I had just written, I nearly rewrote
correct content to "restore" them; they were formatted `8 290` while I searched `8,290`. A search for
one table row returned **31 372 matches** in a 31 KB file, because an unescaped `|` turned the pattern
into an alternation of empty branches.

**Why the checks missed it:** nothing was checking the checks. A green `Vault-Audit.ps1` and a clean
`markdownlint` prove the *file* is well-formed; neither can tell whether the ad-hoc script I wrote to
answer today's question is asking the right question. And the failure is asymmetric: a false
**positive** looks wrong immediately — 31 372 matches is absurd on its face — while a false
**negative** looks exactly like the truth. `absent = False` is the answer I usually expect, so it
passes without a second look.

**Rule added:** T16, T17 and T18 in `.kiro/steering/traps.md`, covering unescaped regex metacharacters, the
four rendering variants that defeat a phrase search (line wrapping, blockquote markers, digit
grouping, unicode punctuation), and the backtick escape. All three now carry the shared instruction:
**never report a negative from a single test.** Confirm it with a differently-shaped one — a shorter
fragment, a whitespace-normalised comparison, or a literal `.Contains()` instead of a regex.

**Lesson:** when a check says the thing you were looking for is not there, the likeliest explanation
is that the check is wrong, because that is the one answer no one questions.

---

## 2026-09-07 — quoting a table without its baseline row loses the only thing that made it mean something

**What happened:** a research report reproduced a benchmark's results table with the value column
intact and correct, but with every label shifted one row, because it silently dropped the source's
first row. That row was the human-versus-human baseline — the distance between two halves of the same
human corpus. The result attributed the human baseline to a model, and named the *worst*
instruction-tuned configuration as the best available, reversing the paper's conclusion. I quoted it
to the user as fact.

**Why the checks missed it:** every individual number in the table was real and appeared in the
source. A spot-check of figures — the check I had, and the one that caught a sign-reversed
fabrication earlier the same day — cannot detect a transposition, because transposition preserves
every value and corrupts only the pairing. And without the baseline row there was nothing in the
table to look wrong against: 7.1 and 33.8 are both plausible model scores.

**Rule added:** checklist item 7 in `.kiro/skills/query-notebooklm/references/reading-a-report.md` —
when a table carries the argument, ask for its rows in the source's own order and demand any baseline
or reference row. What surfaced it: quoting **both** conflicting claims back verbatim in one question,
with their numbers, and forbidding reconciliation.

**Lesson:** verify the mapping, not just the values — and a table's baseline row is data, not
decoration.

---

## 2026-08-19 — a verification is only as good as its stated scope

**What happened:** "0 pages show raw flashcard syntax" was reported and believed for weeks. In
fact 34 notes were publishing raw `::` syntax, covering roughly 1,280 cards that had never
rendered.

**Why the checks missed it:** the check only inspected pages containing `id="flashcards"`. Every
one of the 34 notes keeps its cards under a different heading, so they could not appear in the
sample by construction. The scope was never stated, so the number read as a statement about the
whole site.

**Rule added:** every verification states what it examined. `tools/check-site.mjs` now prints a
mandatory `NOT CHECKED` block on every run, and the site steering says a pass means "the checks
that ran found nothing", never "the site is good".

**Lesson:** a claim scoped to a subset is indistinguishable from a claim about everything unless
you say which it is.

## 2026-08-19 — an auto-fix can be more dangerous than the defect

**What happened:** `markdownlint --fix` wrapped a bare URL in angle brackets and split a
Templater `<% %>` expression out of it, producing `<https://...kurs/><% CODE %>`. Every future
course index would have contained a broken link.

**Why the checks missed it:** the linter's rule was correct in general and wrong for a file that
is not valid Markdown until rendered. Nothing verified the *template* after the sweep, only the
notes.

**Rule added:** `Meta/Obsidian Plugins/Templates/**` is excluded from linting, and the
`add-a-convention` skill requires checking templates by generating a note from them rather than
by linting them.

**Lesson:** a generic tool applied to a file with non-Markdown syntax will confidently corrupt
it; exclude the file rather than trusting the rule.

## 2026-08-19 — a check that cannot fail is not a check

**What happened:** `Vault-Audit.ps1` printed `RESULT: deviations found` and exited **0**. Any CI
step calling it would have passed unconditionally.

**Why the checks missed it:** nobody had ever run it expecting failure. It was only ever read by
a human who looked at the text.

**Rule added:** the audit exits 1 when not clean, and the `add-a-convention` skill requires
verifying a new check in **both** directions — clean gives 0, a deliberately broken file gives 1.

**Lesson:** test that a check fails, not only that it passes.

## 2026-08-19 — silent tool no-ops beat loud errors, every time

**What happened:** a `.markdownlintignore` file was created and looked authoritative.
`markdownlint-cli2` does not read it. 536 files were linted instead of 500 and the violation
count read 1673 instead of 767.

**Why the checks missed it:** the tool reported success. Nothing compares the number of files
linted against the number expected.

**Rule added:** recorded as trap T4 in `.kiro/steering/traps.md`; after changing ignores, check the
`Linting: N file(s)` line, because that number is the only proof the config took effect.

**Lesson:** when a config file is added, verify the tool actually read it — silence is not
agreement.

## 2026-08-19 — my own measurement is the most likely thing to be wrong

**What happened:** across one session, four separate "findings" were artifacts of the
measurement rather than the vault: 243 corrupted pages that did not exist (case-insensitive
`-match`), 34 tracked markdown files that were really 529 (mis-decoded Swedish paths), an audit
reporting exit `-1` while clean (`Select-Object` closing the pipe), and an agent with no tools
(.NET ignoring `Set-Location`).

**Why the checks missed it:** none of these produced an error. Every one returned a plausible
number.

**Rule added:** `.kiro/steering/traps.md` collects them as T2, T3, T6 and T7, with the rule that a
surprisingly large or small count is treated as a suspect measurement until re-derived a second
way.

**Lesson:** before reporting a surprising number, reproduce it by a different method.

## 2026-08-20 — a check is only as good as its predicate, and mine was a list of known defects

**What happened:** 21 notes published raw markdown or a flashcard question as their
`<meta name="description">` on the live site. The audit had a `malformedDescription` check the
whole time, and it reported clean.

**Why the checks missed it:** the check tested for `::`, `;;`, `[[` and Dataview keywords — a list
assembled from the defects known when it was written. Raw markdown was never in the list, so it
passed. A green check over an incomplete predicate is indistinguishable from a green check over a
complete one.

It then took three more passes to enumerate, each limited the same way: a delegated review found 5
of 10, a script found 16 of 17 (it tested bullets but not ordered lists), and a build sample
surfaced the last 4, which no delimiter test could see because the separator had already been
stripped.

**Rule added:** the check now tests headings, `$` math, leading bullets, ordered lists and a
question followed by its answer, and was verified in both directions. The Standard states the
positive rule — a description is prose — rather than only enumerating what it must not contain.

**Lesson:** when a check is a blocklist of known defects, it will keep passing for every defect
nobody has met yet; state the rule as what the value must *be*.

## 2026-08-20 — a detector that flags legitimate work is worse than a blind spot

**What happened:** hunting the above, I wrote a detector for "description appears verbatim in a
flashcard line". It returned 17 notes. Thirteen were fine — for a `begrepp` note the definition,
the description and the card's answer are legitimately the same sentence. Acting on that list
would have rewritten 13 correct descriptions into something worse.

Independently, a delegated review flagged 12 notes for keeping cards under `## Begrepp` instead of
`## Flashcards` — a deliberate arrangement the site's transformer was widened to support.

**Why the checks missed it:** nothing was missed. The opposite: two detectors were confident about
things that were correct, in one case because it did not know a documented decision existed.

**Rule added:** a new detector's first output is reviewed as a *sample*, not as a worklist, and its
false-positive rate is stated before anything is fixed in bulk. The `vault-bulk-edit` skill already
required reading the dry run; this makes the false-positive count an explicit part of it.

**Lesson:** measure a detector's precision before you trust its recall — a list of 17 that is 13
wrong will do more damage than the defect it was chasing.

## 2026-08-20 — delegation is good at noticing, bad at counting

**What happened:** four read-only subagents reviewed four course folders for the thing no script
can judge — whether the notes are any good. One surfaced a real defect class no check covered
(F56). Collectively they produced roughly 21 findings, of which about 7 were real.

**Why the checks missed it:** the automated checks cover conventions and structure. Nothing read
the prose, because nothing can.

**Rule added:** fan out read-only agents to *discover* an unnamed problem; then write a script to
*enumerate* it, and never let an agent's own count stand as the number. Their own standard already
says a worker's self-verification is not authoritative — here it was off by half.

**Lesson:** use delegation to find out what to look for, and a script to find out how many.

## 2026-08-26 — two correct measurements, one wrong unit

`site-baseline.json` said 1270 pages. A clean local build produced 693. I could not reproduce
1270, so I concluded it was measured from a polluted output directory and re-baselined to 693.

Both numbers were right. Quartz emits a 448-byte redirect stub at each note's *original-cased*
path beside the lowercase slug it serves. Linux keeps both files; **NTFS is case-insensitive, so
each pair collapses into one.** CI: 1269 files = 576 stubs + 693 pages. Windows: 693. Neither
platform can produce the other's figure.

Three things to carry forward:

- **Before changing a number, establish what it counts.** A disagreement between two honest
  measurements is usually a disagreement about the unit, not an error in one of them.
- **The fix belonged in the metric, not the baseline.** Counting distinct case-insensitive
  routes makes both platforms report 693, which restores the local build as a usable gate.
  Re-baselining from CI would have "worked" while leaving the local run permanently red.
- **I trusted my own reconstruction over the written record.** F58 stated where 1270 came from.
  Had I read it before re-baselining, I would not have spent the effort — the backlog entry was
  right and I overrode it. Read the entry that documents a number before overwriting it.

A corollary about evidence: I disproved four hypotheses from local data alone (plugin
differences, duplicate URL forms, a tracked `public/`, `slim-svg`) and none of it converged. One
CI log settled it in minutes. When the question is "why does that environment differ", local
reasoning cannot answer it — get the log.

## 2026-08-20 — a doc full of exact numbers is a doc that will go stale

**What happened:** the steering and skill files now quote hard figures — 470 notes, 601 pages,
1965 callouts, 43 broken links, 1262 scheduling markers. They were all correct when written.

**Why the checks missed it:** nothing verifies documentation against reality. A confident wrong
number is worse than no number, because it is quoted rather than checked.

**Rule added:** every file quoting live numbers carries a "keeping this file honest" note — a
figure that no longer matches is a finding **against the doc**, and the doc is fixed in the same
change. `site-baseline.json` is the machine-checked copy of the site figures; prose copies are
convenience, not truth.

**Lesson:** when a number in a doc disagrees with a fresh measurement, fix the doc — do not
adjust the measurement to match.

## 2026-09-08 - a config value is not a rendered result, and I asserted the consequence without checking the precondition

**What happened:** reviewing this vault's theme, I found `"monospaceFontFamily": "Inter"` in
`appearance.json` and reported, as the review's headline defect, that every code block was rendering
in a proportional font. I traced Obsidian's cascade correctly
(`--font-monospace: var(--font-monospace-override), var(--font-monospace-theme), ...`), confirmed the
setting populates the override, and confirmed Prism only sets the theme layer. The reasoning was
sound and the conclusion was wrong: **Inter is not installed.** The Windows font registry holds 378
entries and contains no Inter and no JetBrains Mono. `font-family` is a *fallback stack*, so an
absent font is skipped, and code was already rendering in a real monospace font.

**Why the checks missed it:** nothing was checking. The claim rested on a config file agreeing with a
CSS cascade, and both agreed. The missing step was the one fact outside both files - whether the
named font exists on the machine. My first attempt to check it enumerated `C:\Windows\Fonts` with
`Get-ChildItem` and returned **zero matches for every candidate including Consolas**, which was an
obviously broken measurement I nearly accepted as "no mono fonts installed"; the registry key
`HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts` is the reliable source.

**What caught it:** an adversarial subagent, briefed to refute rather than confirm, and told which
claim to attack hardest. It confirmed the mechanism and then wrote the sentence that mattered:
"conclusion holds only given Inter present". The same review refuted a second claim outright - that
the theme styled the caret and active line, when it styles neither - and overstated a third by 3x
(1 134 custom-property *declarations* of only 365 distinct names).

**Lesson:** when a finding is "setting X causes visible effect Y", the setting is only half the
evidence. Name the precondition that turns a value into a result - is the font installed, is the
plugin enabled, is the selector reachable in this view - and check that too. And when a measurement
returns an implausible zero, the measurement is the suspect, not the world.

## 2026-09-09 - the "test that a check fails" rule, obeyed for the script and skipped for its guards

**This is a recurrence.** `## 2026-08-19 - a check that cannot fail is not a check` already records the
rule: test that a check *fails*, not only that it passes. Three weeks later I broke it in a new place,
and on the same day I had honoured it properly elsewhere.

**What happened:** `Format-NoteWrapping.ps1` joins hard-wrapped lines in study notes. Its header
described the property that made it safe as a token-identity check - build the whitespace-insensitive
token sequence before and after, refuse to write if they differ. An adversarial subagent needed one
line to dismantle it: every join is `previous + ' ' + line`, so the token sequence is identical **by
construction**. The guard could not fail on a join. It only ever protected against a coding error that
dropped text outright.

**Why the existing rule did not save me:** I applied it at the wrong granularity. Earlier the same day
I wrote `Get-ObsidianConfigAudit.ps1` and tested it in both directions properly - a clean fixture must
exit 0, one planted defect per check must exit 1, seven assertions, all passing. So the habit was
active. But I tested the *script's* behaviour, not each *guard inside it*. The token guard was never
handed an input that should have made it fail, and if it had been, there was none to hand it.

**What it cost, or would have:** three real bugs passed that guard untouched - a GFM table written
without leading pipes collapsed into one line, a `~~~` inside a ``` block ended the fence so code was
reflowed as prose, and files with mixed line endings were silently normalised into a whole-file diff.
All three change the rendered document while preserving every token, so the script would have printed
`RESULT: clean` while corrupting tables in any note using that style.

**Fixed by a guard that can fail:** counts of headings, list items, table rows, delimiter rows, fence
lines, blockquote lines, horizontal rules and blank lines, compared before and after, refusing the file
if any moves. Plus nine regression fixtures, one per bug and one per join kind. The token check stayed,
demoted in the header to what it actually is.

**Rule, sharpened:** for every guard, name an input that must make it fire, and add that input as a
fixture. If you cannot construct one, the guard is documentation and the header must say so.

**A second, unrelated lesson from the same day, recorded because it also happened twice.** A claim about
what the user sees is a claim about *configuration*, not about the specification. In F76 I traced
Obsidian's font cascade correctly and concluded code was rendering in a proportional font, without
checking whether that font was installed - it was not, so the cascade fell through and the conclusion
was wrong. In F78 I said a single newline renders as a space because that is the Markdown spec, without
checking `strictLineBreaks`, which Obsidian defaults to `false` precisely so that a newline renders as a
visible break. Both times the mechanism was right and the outcome was wrong, because a mechanism only
produces an outcome when its precondition holds. Find the setting and read it.

---

## 2026-09-26 — four green measurements about the same edit, three of them false

**What happened:** a rework of HI1031's ten flashcard decks (F80) was measured four times, and three of
the four readings were wrong in a way that read as precise.

1. **A diff classifier reported `REVIEW DATA ONLY - safe` for all 23 changed notes.** It ran
   `git diff --name-only`, then `git diff -- <each path>` and counted marker lines against other lines.
   Every file came back with 0 added and 0 removed lines of both kinds, so every file was declared safe
   to edit. The real diff was **1035 insertions and 1605 deletions**. `core.quotepath false` was set, so
   git was not escaping anything — but PowerShell decoded git's stdout using the console code page, so
   `Höst` came back as `H|-+st` and every per-file `git diff` matched nothing and exited 0.
2. **The same session then read `srMarkers at HEAD = 0`** for three decks that HEAD holds 61, 15 and 0
   markers for, by the same mechanism, and nearly concluded the committed history contained no review
   data at all.
3. **A form comparison reported that prose cards were easier than list cards**, 5.2 against 9.6 FSRS
   difficulty, which would have argued against the author's own instruction to convert hidden
   multi-fact prose into list cards. The figure pooled all decks, and 29 of the 59 prose-multi-fact
   cards lived in the deck first drilled the previous evening, where FSRS had not raised difficulty yet.
   Deck age was masquerading as card form; within each deck the ordering is the opposite in all five.
4. **`Get-SRIntegrity.ps1 -Compare` printed a clean, precise per-file report of the wrong window.** A
   parallel agent had called `-Save` mid-run, replacing the 22:56 baseline with a 23:53 one, so the
   comparison showed chapter 1 as `cards 27 -> 25` and no change at all for chapters 2, 11 and 16. The
   real movement was 401 → 219 cards and 142 → 73 markers.

A fifth near-miss the same night: the new `Test-DeckHygiene.ps1` returned **zero findings** on the ten
reworked decks, and its `-SelfTest` then showed that one of its eight checks, `missingCue`, could not
fire at all — the only card without a cue in the fixture was the orphaned one, whose front line is empty
and therefore skipped.

**Why the checks missed it:** every one of these *is* a check, and each failed by returning a plausible
number instead of an error. The shared structure is that **absence was read as evidence**: zero diff
lines as "nothing changed", zero markers as "no history", zero findings as "clean". None of the four had
a positive control — nothing established that the measurement was capable of producing a non-zero answer
on input that deserved one. `Test-ScriptHygiene.ps1` cannot help, because these were session scripts in
`%TEMP%`, and the trap entries that existed (T2 on mis-decoded paths, the deck-age confound implied by
earlier `nosr` findings) described the mechanism without saying that the resulting figure looks normal.

**Rule added:**

- `traps.md` **T2** now carries the console-decoding half explicitly, with the 1035/1605 figure, the
  `[Console]::OutputEncoding` fix, and `git cat-file -e` as the round-trip test. It also says to prefer
  `git diff --numstat`, which never sends a path back to git.
- `traps.md` **T22** records the shared `sr-baseline.json`: read the `baseline taken at` line and check
  it is yours, and with several agents running, keep your own per-file fingerprint instead.
- `traps.md` **T23** records that `Write-Host` output is invisible to `| Out-String`, which produced a
  captured report containing only its own exit codes.
- `references/formulation.md` records the pooled-versus-within-deck confound as a worked example, and
  now states the field order of an FSRS marker as **read from the plugin source** rather than inferred.
- `Test-DeckHygiene.ps1` ships a `-SelfTest` that plants one instance of every defect plus two negative
  controls, and `scripts.md` says to run it before trusting a zero.

**Lesson:** a measurement that can only return zero is indistinguishable from a clean result, so every
check needs a positive control before its zero is worth anything — and when comparing groups in this
vault, hold the deck constant, because deck age moves every FSRS figure more than card quality does.

---

## 2026-09-26 — a steering doc named the course's past exam, and the file was the syllabus

**What happened:** `steering/product.md` stated that HI1031 publishes its exam questions *"plus an old
exam, `HI1031-20192.pdf` in the same folder and converted to Markdown under `Filer/Canvas/AI-optimerad
Markdown/Tentor/HI1031-20192.md`"*. A reviewer was pointed at that file to check deck coverage against a
real past paper. It is the **kursplan** from HT19 — the syllabus. Its own frontmatter says
`Born-digital official kursplan (HT19, utgava 2)`, and its contents are `Lärandemål`, `Kursinnehåll`,
`Kurslitteratur` and the examination form. The course has **no** past paper. The claim had been in the
doc for weeks and had been read as a fact about what practice material existed.

The same folder holds a second trap of the same kind: `Tentafrågor_ HI1031 HT26 ... (10321).md` stops
mid-way through chapter 4 question 2 while its own frontmatter asserts *"Body text checked complete
against the PDF text layer"*. Both files are named and filed as exam material, and only one of the three
in that folder is.

**Why the checks missed it:** nothing reads `Filer/`. It is outside `Vault-Audit.ps1`'s scope, in the
linter's ignore list, and `Test-DocHygiene.ps1` reads `.kiro/` only — deliberately, because the contents
are third-party downloads the author must not edit. So a claim in a steering doc *about* a file in
`Filer/` has no mechanical backstop at all, and the filename agreed with the claim, which is what made it
survive: `Tentor/HI1031-20192.md` looks exactly like an old exam.

**Rule added:** `product.md` now says the course has no past paper, names both misleading files and what
they actually are, and keeps the useful part of the syllabus — the learning objective *"Kunna kritiskt
analysera, diskutera och jämföra olika distribuerade metoder och modeller"*, which is why the decks carry
comparison cards and not only definitions.

**Lesson:** a filename is not a claim about contents, and for the folders no script reads, a doc's
assertion is only as good as the last time somebody opened the file — so open it before citing it.
