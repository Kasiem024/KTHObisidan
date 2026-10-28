---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: nothing in flight (2026-10-26 09:30).** The CM1000 study material is done (**F110**):
`Anteckningar/CM1000 Tentaanalys - AI-kontext.md` (all 83 old exam files, 388 problem rows, one
section per area) and six decks `CM1000 Begrepp - Kap 01 Logik`, `02 Mängdlära`, `03 Funktioner`,
`04 Talteori`, `07 Grafteori`, `08 Kombinatorik` (164 cards, all `nosr`). Not committed.

**His CM1000 card decisions (2026-10-25, binding for any further CM1000 cards):** card building blocks
and method skeletons, never whole proofs; one deck per chapter; `nosr` on by default — he flips it;
prefer reversed `;;`/`??`; nothing the formelsamling already prints; focus on the most-asked types.
**Open for him:** whether the formelsamling ("för KS2") is handed out at KS1 — the HT2026 KursPM is
silent. CM1000 is a written exam (TEN1) plus muntor (RED1).

---

## Background (done): the finishing and restructure passes

The session-lessons pass is done (F108, 2026-10-25 18:20; plan
`.kiro/reports/session-lessons-plan-2026-10-25.md`). Before it, CM1000's 95 PDFs were converted (F106, done 2026-10-25 15:04) — all 95
deployed to both trees, md5-identical bar each tree's own `_INDEX.md`, 0 broken links, self-test 21/21,
and `related:` links on 29 problem↔solution pairs. The tag convention is YAML list form and the vault
is converted (F105, run 2026-10-24 13:49). 536 notes converted, 0 skipped, 0 failed. **Verified after
the run:** `Get-SRIntegrity -Compare`
against an own baseline `RESULT: clean` (`nosr` 59 and 445 excluded cards unchanged), `Vault-Audit`
`RESULT: clean`, lint 550/0, deck hygiene clean, and a SHA-256 diff showing exactly the 536 manifest
files changed and nothing else. The backup is in
`%USERPROFILE%\KTHObsidian-backups\tags-to-list-2026-10-24-135010\`.
**CM1000 and SF1686 were excluded** because a second agent was converting the CM1000 PDFs. CM1000's
`_index.md`, the one file that left inline, was converted by hand before its first commit (F106). Since F102: F103 is the HI1032
`Tentasvar - Svaga ämnen` reading file, F104 the HI1031 `Tentafrågor - Nyckelord` keyword deck for the
oral exam. Unapplied findings from two audits (HI1032 lecture coverage, HI1031 manuscript depth) are in
`.kiro/reports/parked-findings-2026-10-22.md`. HI1031's Snabbsvar is a spoken-answer manuscript for the
oral exam (F98). **F102's three HI1032 Extra decks (147 cards) must not be pruned under the few-cards
rule; he set it aside for them without changing it.** The phone-sync item at the bottom has been parked
since 2026-09-08.

## Done: CM1000's 95 PDFs are converted (F106, 2026-10-25 15:04)

All 95 converted to AI-optimised Markdown, faithful to the printed page, and deployed to the gitignored
`Filer/Litteraturlista/` + `Filer/Canvas/AI-optimerad Markdown/` and to the raw tree
`G:\My Drive\KTH\2026 Höst\CM1000 Diskret Matematik\AI-optimerad Markdown\`. The 95 deliverables are
md5-identical across the two trees (only each tree's own `_INDEX.md` differs, by design); 524 image
links, 0 broken; `related:` on 29 problem↔solution pairs; self-test 21/21. Everything is in **F106** and
the method in `C:\dev\pdf2md\docs\RUNBOOK_TEX_MATH_BATCH.md`. The four tool bugs fixed while finishing
(verdicts BOM, crop-name `(1)` regex ×2, gate token) are in `out\CM1000\RUNLOG.md` and F106.

**Not committed by this work.** The conversion wrote only gitignored and out-of-vault paths, so the
vault tree carries only this session's doc edits (F106, `current-state`, `reentry`, `lessons-learned`,
`traps` T25). The author has not asked for a commit; the committing agent is separate.

**The vault's exam tree was restructured by exam type (F109, 2026-10-25).** The 83 exam `.md` + 83
`.pdf` now live in `KS1`…`KS4`, `Fx1`, `Fx2`, `Tentor`, `Komplettering` under `Filer/Canvas/…` instead
of `HT20xx/` folders, renamed `<term> <exam>[ - Lösningar]`, names fixed from each file's `answer_key`
and title. **The raw tree outside the vault keeps the `HT20xx/` layout**, so the two diverge on
purpose; `cm1000-deploy.py` refuses the vault (exit 2) to keep it that way. All still gitignored.

**An empty folder `KTH/2025 Höst/SF1686 Flervariabelanalys/`** (created 2026-10-24 19:37, not by this
work) makes the local audit report `courseMissingFolder 4` and `courseMissingIndex 1`. Git stores no
empty folder, so CI is unaffected. It was gone at 15:50 on 2026-10-25 and Drive re-created it at 17:32
(still there 18:09), so only removing it on drive.google.com holds; that is his call.

## Done: the tag conversion was run (F105, 2026-10-24 13:49)

**Why.** Obsidian's Properties panel writes `tags:` in YAML list form whenever a note's tags are edited in
the app. With the old inline standard every such edit was an audit deviation, six times over. The author
chose to make the app's form the standard (alternative 3) and to convert the vault with a script. He then
asked the agent to run it and commit.

**What was run:** `Convert-TagsToList.ps1 -ExcludePath CM1000,SF1686 -Apply`, with Obsidian closed and
nothing staged. 536 converted, 13 already in list form, 0 skipped, 0 failed, 46 of them carrying `nosr`.

**Verified afterwards**

- `Get-SRIntegrity -Compare` against an own baseline (T22): `RESULT: clean`; `nosr` 59, 445 cards excluded
  by `nosr`, `raw_srComments` 1974/2061 — all unchanged.
- `Vault-Audit`: `RESULT: clean`, `notesInScope=528`.
- Lint 550 files / 0 issues. `Test-DeckHygiene` clean, 256 cards and 256 markers.
- SHA-256 of every `.md` before and after: exactly 536 changed, 0 added, and the changed set equals the
  backup manifest file for file. 0 changed under CM1000 or SF1686.
- Backup: `%USERPROFILE%\KTHObsidian-backups\tags-to-list-2026-10-24-135010\`, 536 files plus a manifest
  whose root line is this vault, so its `-RestoreFrom` line still works.

**The audit was fully clean even while CM1000's `_index.md` was still inline.** The plan predicted
`inlineStyleTags 1`; that was wrong, because the audit's `InScope` excludes every `_index.md`.

**What is left of this item**

- Nothing. CM1000's `_index.md` was converted to list form by hand before its first commit (F106).
- **Never "repair" `inlineStyleTags` with `Format-FrontmatterTags.ps1`.** It is superseded and converts
  the wrong way. `Convert-TagsToList.ps1` is the repair. The old script stays untouched, on his
  instruction.

**The incident worth remembering.** The first `-Apply` wrote its 536 backups into
`C:\Users\ekasalm\OneDrive - Ericsson\Documents\SF1686` — the author's **employer-synced** OneDrive. The
cause was a shell invocation that splatted `-ExcludePath @('CM1000','SF1686')` into two arguments, so
`SF1686` bound positionally to `-BackupDir` as a *relative* path, which .NET resolved against the process
working directory (T7). The vault itself was converted correctly; only the backup location was wrong. The
folder was moved out of OneDrive immediately, and `Convert-TagsToList.ps1` now **refuses a relative
`-BackupDir`**. See `.kiro/lessons-learned.md`, 2026-10-24.

**Committing it:** stage by name and exclude every CM1000/SF1686 path and the other agent's
`.kiro/reports/cm1000-*` plan (never `git add -A`). The flipped audit and the converted notes must go in
the **same** commit, or CI goes red.

Everything else, including what was verified and how, is in F105.

**The re-entry prompt is `.kiro/reentry.md`.** It is course-neutral and is the file to be pointed at
after a compact. `.kiro/hi1031-tenta-reentry.md` is an archive of the earlier HI1031 writing project,
not a live state file.

## HI1031's Snabbsvar is a manuscript now (F98)

`HI1031 Tentafrågor - Snabbsvar.md` holds **91 `||` cards**, one or more per exam question. Every front is
the official question verbatim plus ` — Del X av Y: <ämne> (N)`; the rows are what he says, in order. Its
`nosr` state is his and has changed more than once — measure it (see *His rotation* below). **It is no longer a copy of the cards in the ten
`Tentafrågor och Svar - Kap NN` notes** — the sync contract ended on 2026-10-17 — so never sync edits
between them, but the manuscript must not contradict them. The form and the size rule are in
`.kiro/reports/hi1031-snabbsvar-manus-plan-2026-10-17.md`. He said to **ignore** the book errors found in
the answer notes: do not fix or re-report them.

## The one thing that will mislead you if you read the backlog forwards

**F87 built a flashcard design that F92 reversed.** F87 created "agenda cards" for HI1031's exam
questions — the prompt was the exam question and each row named *a part of the answer* without stating
it. F92 rewrote all of them to **carry the actual answer**, on the author's instruction:

> jag vill inte att flashcardesen ska innehalla svaret ungefar, jag vill att den ska rakt ut ha svaret

So **do not rebuild the agenda form.** The reason it failed is worth keeping: a pointer card only works
if the fact it points at is in a deck the author actually reviews, and half of HI1031's concept decks
carry `nosr`. Three adversarial rounds approved the design anyway; `.kiro/lessons-learned.md` records
why none of them could see it.

## What exists now, per course

**HI1031** — ten concept decks (`Begrepp - Kap NN`, 257 cards), ten exam-answer notes
(`Tentafragor och Svar - Kap NN`), and `Tentafragor - Snabbsvar.md`. The last two held **the same 81
answer-bearing cards**: once distributed across the ten notes, once collected in Snabbsvar, which
carries `nosr` so the drill is paid for only once. **On 2026-10-17 the author ended that contract:**
Snabbsvar was rewritten as a manuscript (F98), and the chapter-note cards stay as they are, with their
review history. Do not sync edits between the two any more — but the manuscript must never contradict
the chapter-note cards.

**His rotation.** As of 2026-10-05 he drilled chapters **01, 02, 11, 16, 17**. **Measured 2026-10-22,
parsing each whole frontmatter, and it has moved again:** all ten HI1031 concept decks are in review
(no `nosr`, 19-33 markers each), while all ten `Tentafrågor och Svar - Kap NN` answer notes, Snabbsvar
(20 markers) and the new Nyckelord file carry `nosr`. HI1032: the two lab decks and Extra Möjlig carry
`nosr`; Del A, Del B, Extra Säker and Extra Trolig are in review. Every change was his, made in Obsidian's
UI. `nosr` is his and not an agent's to change — measure it, never quote this paragraph as current.

**HI1032** — the twelve `Begrepp - Kap NN` decks were **deleted** in F89 (101 cards, zero markers, never
drilled). What exists now is two pairs, built like HI1031's: a **theory note he reads and copies by
hand** and a **deck he drills**, one pair per exam part.

| Part | Theory note | Deck |
| --- | --- | --- |
| Del A Transportnivån | `HI1032 Tentasvar - Del A ...` | `HI1032 Tentaplugg - Del A ...`, 67 cards |
| Del B Applikationsnivån | `HI1032 Tentasvar - Del B ...` | `HI1032 Tentaplugg - Del B ...`, 100 cards |

**Rebuilt from the lectures on 2026-10-19 (F99).** All four files were rewritten from the examiner's seven
lectures, concept-first and organised by topic, with no exam-point strategy in the text (he called the old
Del A theory "helt kass" for copying by hand). Each `## ` topic header carries a tentasannolikhet —
**Säker**, **Trolig** or **Möjlig** — and `HI1032 Föreläsningskarta - Ämnen och tentasannolikhet` maps
every topic to its level with the evidence. The old 49/71 cards and their markers were deleted on his
explicit permission; the 67 + 100 new cards start without history. The two lab decks still carry `nosr`
and are untouched.

**The fact that decided the rebuild (F97):** with each past exam treated as the unknown one, Del A had 0-2
new points of 22 and Del B 6-12, and most of Del B's new sub-questions were on the examiner's slides. The
exam is drawn from the lectures, not from earlier exams. **Never quote an in-sample coverage figure for
this course** — any material built from the four past exams scores ~100 % on them by construction
(`lessons-learned.md`, 2026-10-15); the Föreläsningskarta's calibration deliberately reports topic
coverage, not point counts, for that reason.

HI1032 is the course with real exam evidence: **four past papers with the examiner's own solutions**,
under `Filer/Canvas/AI-optimerad Markdown/Gamla Tentor/`, distilled by the author into
`HI1032 Tentaanalys - Ranking och poangstrategi.md` and a self-contained `AI-kontext.md`. Those two are
the specification for that course — `product.md`'s table understates this by naming only HI1031.

## Done: F86 to F99

- **F86** — HI1031's ten decks audited against all 49 exam questions, per *ask* rather than per
  question. 114 of 117 covered; three gaps closed, including the chapter 9 hypermedia card.
- **F87** — the agenda-card design. **Superseded by F92; see above.**
- **F88** — those cards copied into the ten exam-answer notes, `nosr` set on Snabbsvar at the author's
  request, so review load did not double.
- **F89** — HI1032's twelve chapter decks deleted and replaced by 79 cards from the exam analysis.
- **F90** — four of the six gaps F89 reported closed from the course book, which is the only place they
  could be closed: the examiner's solutions answer a question, they do not explain the subject.
- **F91** — seven cheap one-point items the card scope had left on the table, found by a coverage pass
  against the source's inventory rather than against the brief. Also records a staging mistake: a commit
  swept a concurrent session's work in, because `git add -u` on a directory has the same blast radius as
  `-A` inside it.
- **F92** — HI1031's exam-question cards rewritten to carry the answer. 73 to 81 cards.
- **F93** — `cueMismatch` added to `Test-DeckHygiene.ps1`, closing a rule that was only half-checked, and
  a new adversarial-reviewer agent, since split in two by F96.

- **F94** — the renumbered half of a duplicate F90. Not new work; see F95.
- **F95** — an outside agent reviewed F93 and found a duplicate F-number, a self-test heading that
  contradicted three of its own controls, and a false claim in the handoff that commissioned it. Two
  audit checks added, `duplicateFNumber` and an assertion for `tagIndexBadFilter`: **46 assertions**.
- **F97** — HI1032's in-sample "Korten räcker" claims corrected with a held-out measure; Del B widened
  from the examiner's lectures F4-F7 (theory 651 -> 800 lines, deck 61 -> 71). Del A deck 48 -> 49.
- **F98** — HI1031's Snabbsvar rewritten as a spoken-answer manuscript: 81 -> 91 cards, fronts verbatim
  from the official list, only that file changed, every chapter fact-reviewed against the book.
- **F99** — HI1032's two theory notes and two decks rebuilt from the examiner's lectures, concept-first,
  by topic with a tentasannolikhet per topic. 49/71 -> 67/100 cards (old markers deleted on his
  permission); new Föreläsningskarta note. Seven lecture agents in parallel, each fact-reviewed.

## Use both reviewers, and never give the premise one a shell

**Known problem, F97: `conformance-reviewer` has been cancelled by the idle deadline three times out of
three**, each after an hour with no visible progress. The same brief to `kiro_default` without shell
completed every time. Until it is diagnosed, run the gates yourself and give the review to a
`kiro_default` stage told to use read and grep only.

There are two, they share `reviewer-prompt.md`, and **the tool grant is what makes them different**:

- **`conformance-reviewer`** — handed the authoritative rules, reports rule-breaking and factual
  error. It has `shell`, whitelisted to the repo’s own `Test-*` and `Get-*` scripts, read-only `git`
  and the linter. It has no `write`, so it cannot author a probe — it can only re-run a measurement
  this repo already owns. Reproducing a figure is what distinguishes a real number from a plausible one.
- **`premise-reviewer`** — handed the author’s situation and goal and **not** the rules, asks only
  whether the thing is worth building. **No shell, and that is the point:** an agent that can run a gate
  drifts into checking conformance, which is the one job this lens exists not to do.

`documentation-standard.md` requires one of each. The premise lens exists because three conformance
rounds approved the design the author discarded the next day. The split came out of F96, after an
outside agent showed that four findings in four days had all needed execution and none had been counting.

## Two closed items that older text still calls open

**HI1031 chapter 9's hypermedia gap is closed.** It was closed in F86, and the card
`Vilken roll har hypermedia (HATEOAS) i REST?` is in the chapter 9 concept deck now. An earlier version
of *this file* still said the cards "should come back", and on 2026-10-04 a premise-lens reviewer built
its headline objection on that sentence. A stale state file does not merely misinform a reader — it
corrupts a review that was commissioned to catch exactly that kind of error.

**HI1032's twelve chapter decks no longer carry card-form findings**, because the decks no longer exist.
What remains of that old survey item is **`HI1032 Labb 1 - Flashcards.md`**: run
`Test-DeckHygiene.ps1 -All` and read its lines. `-All` is a survey, not a gate.

## Working tree

**Run `git status` rather than trusting a commit id written here** — this file has carried a stale one
four times, and a reviewer caught it again on 2026-10-01.

Expect the working tree to be dirty: **the author reviews daily, and a review rewrites marker lines
only.** He also edits cards by hand — on 2026-10-05 he reworded a chapter 17 prompt himself — so
classify a diff before assuming it is all review data, and take the whole diff in one call rather than
passing a Swedish path to git as a pathspec (**T2**).

**Editing a note's tags in Obsidian's own UI writes YAML list form**, which has been the vault's standard
since F105, so it is no longer a deviation. A note still in the old inline form is reported as
`inlineStyleTags`, and `Convert-TagsToList.ps1` is the repair. Like every tag edit, it preserves `nosr`
and never adds or restores one.

One file is left untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`, a Drive sync
artefact. Its removal is the author's call.

## The exam date is unknown

The old archive says 21-23 September 2026. That is past and wrong. The author confirmed on 2026-09-26
that the exam was moved and gave no new date. Do not quote one, and do not plan against one.

## In flight: making the phone usable (started 2026-09-08)

Only spaced repetition is used on the phone, and it was slow. Measured: the phone synced
**2 229 files / 1 751.9 MB** to review **421 notes / 1.4 MB**. Fixed on the phone that evening with one
FolderSync exclude filter, `Folder name starts with` = `.`, which covers `.git`, `.obsidian`, `.kiro`,
`.github` and `.trash` in one rule, plus disabling 13 unwanted plugins there — safe **only because**
`.obsidian` had stopped syncing, so it cannot propagate back. The author reports mobile is much quicker.

**Still outstanding.**

1. The `Folder name equals` = `Filer` exclude filter, **1 209 MB across 742 files** and by far the
   largest remaining win. Add it, run FolderSync's `Analyze` first, and only then delete the `Filer`
   folders already on the phone.
2. `.git` (445.9 MB) is excluded but still present on the phone; deleting it there reclaims the space.
3. **The round trip is unverified.** Nothing has yet confirmed the phone can write back. After the next
   review there, markers arriving with no change to card or separator counts is the proof.

**The trap, before setting up a fresh SR install anywhere.** Four settings are not default, and the
live values are a **dated reading** — read them from
`.obsidian/plugins/obsidian-spaced-repetition/data.json`, never from this paragraph.
`flashcardTags` against a default of `#flashcards` decides which decks exist at all, so a fresh install
finds **zero cards** and looks like a sync failure; `algorithm` is `FSRS` while the markers are `!fsrs`
format; `flashcardTagsToIgnore` is `#nosr`, without which every `nosr` note re-enters review; and
`maximumInterval` is 30 against a default of 36525. Copy that file after installing, then restart the
plugin.

**`flashcardTags` was `#HI1031, #HI1032` and is now `#HI1031` alone, measured 2026-10-24.** So HI1032's
four decks — Del A, Del B, Extra Säker and Extra Trolig — are outside the review scope entirely, and no
card in them comes up however many markers it has. It was found by diffing the plugin's Drive sync
conflict artefact, whose September settings held both tags, against the live file. **The review scope is
his, and an agent does not change it** — it was reported to him on 2026-10-25 and is his to decide.
This is also why the paragraph above now points at the file: the old copy of this value sat here
asserting something that had quietly stopped being true.

**The risk to respect.** The exclusions are the dangerous step. `Filer/Litteraturlista/` and
`Filer/Canvas/` are **gitignored**, so 1 113 MB of PDFs exist only on disk and in Drive, not in git. Test
one small folder and confirm the app's exclusion semantics are "ignore" and not "delete".

**Do not redo.** Turning off Dataview's auto-update is pointless and cannot be scripted (F75). SR's
`scheduleData` is empty because `dataStore` is `NOTES` — the schedule lives in the notes' markers.

---

**How to use this file:** write it before a long operation and when pausing an unfinished task; reset it
to "nothing in flight" as soon as the work is done. Finished work belongs in
`Meta/Vault Findings & Backlog.md`, not here — a stale state file is worse than an empty one, and this
file has now demonstrated that by corrupting a review. The format, and the table of where every durable
fact lives, are in `.kiro/README.md`.
