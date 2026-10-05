---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: nothing in flight.** The exam-prep programme is finished through **F96** and every gate is
green. The phone-sync item at the bottom has been parked since 2026-09-08 and waits on the author.

**The re-entry prompt is `.kiro/reentry.md`.** It is course-neutral and is the file to be pointed at
after a compact. `.kiro/hi1031-tenta-reentry.md` is an archive of the earlier HI1031 writing project,
not a live state file.

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
(`Tentafragor och Svar - Kap NN`), and `Tentafragor - Snabbsvar.md`. The last two hold **the same 81
answer-bearing cards**: once distributed across the ten notes, once collected in Snabbsvar, which
carries `nosr` so the drill is paid for only once. **If you edit one copy you must edit the other**, or
they diverge; F92's patch step refuses to write unless each change matches both.

**His rotation, as of 2026-10-05:** he drills chapters **01, 02, 11, 16, 17**. Chapters 04, 05, 06, 09
and 10 carry `nosr` on both the concept deck and the exam-answer note. `nosr` is his and not an agent's
to change.

**HI1032** — the twelve `Begrepp - Kap NN` decks were **deleted** in F89 (101 cards, zero markers, never
drilled). What exists is `Tentaplugg - Del A Transportnivan.md` and `... Del B Applikationsnivan.md`,
**96 cards**, built from the author's own `Tentaanalys` notes. Both lab decks are untouched and carry
`nosr`: Labb 1 at 66 markers, Labb 5 at 62. **HI1032's entire active deck is those 96 cards** — every
other card-bearing note in the course is `nosr`.

HI1032 is the course with real exam evidence: **four past papers with the examiner's own solutions**,
under `Filer/Canvas/AI-optimerad Markdown/Gamla Tentor/`, distilled by the author into
`HI1032 Tentaanalys - Ranking och poangstrategi.md` and a self-contained `AI-kontext.md`. Those two are
the specification for that course — `product.md`'s table understates this by naming only HI1031.

## Done: F86 to F96

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

## Use both reviewers, and never give the premise one a shell

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

## Nothing else partially finished

**Run `git status` rather than trusting a commit id written here** — this file has carried a stale one
four times, and a reviewer caught it again on 2026-10-01.

Expect the working tree to be dirty: **the author reviews daily, and a review rewrites marker lines
only.** He also edits cards by hand — on 2026-10-05 he reworded a chapter 17 prompt himself — so
classify a diff before assuming it is all review data, and take the whole diff in one call rather than
passing a Swedish path to git as a pathspec (**T2**).

**Editing a note's tags in Obsidian's own UI rewrites the frontmatter into YAML list form**, which the
audit reports as `listStyleTags`. `Format-FrontmatterTags.ps1` is the repair, and it has now recurred
five times. **Check that `nosr` is still present before running it**: it preserves what is there and
does not restore a tag already gone.

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

**The trap, before setting up a fresh SR install anywhere.** Four settings are not default:
`flashcardTags` is `#HI1031, #HI1032` against a default of `#flashcards`, so a fresh install finds
**zero cards** and looks like a sync failure; `algorithm` is `FSRS` while the markers are `!fsrs` format;
`flashcardTagsToIgnore` is `#nosr`, without which every `nosr` note re-enters review; and
`maximumInterval` is 30 against a default of 36525. Copy
`.obsidian/plugins/obsidian-spaced-repetition/data.json` after installing, then restart the plugin.

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
