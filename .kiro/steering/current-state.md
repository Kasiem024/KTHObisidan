---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: in flight — ten modified files and two untracked files are written, verified and NOT
COMMITTED.** Written 2026-10-02, 14:15, immediately before a compact.

Nothing is half-written: every edit is complete and both gates are green. The only open action is the
commit.

## The commit that is pending

`HEAD` is `236bf1f` (2026-10-02 12:44), the concurrent flashcard session's F89 commit. **Everything
uncommitted below is this session's work; F85–F89 are already in `HEAD`, so a commit cannot sweep up
another session's entries.** Verified with `git show HEAD:` against the file on disk, and with a
`git diff` that adds exactly one F-heading (F90) and removes none.

Ten modified, all this session's:

```text
.kiro/README.md                          .kiro/steering/documentation-standard.md
.kiro/lessons-learned.md                 .kiro/steering/environment.md
.kiro/reentry.md                         .kiro/steering/product.md
.kiro/steering/current-state.md          .kiro/steering/traps.md
README.md                                Meta/Vault Findings & Backlog.md
```

Two untracked, **to be committed with them** — the author asked for this explicitly on 2026-10-02:

```text
.kiro/skills/write-flashcards/SYNTHESIS.md
.kiro/skills/query-notebooklm/SYNTHESIS.md
```

**Do not commit** `.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`.
It is a Drive sync artefact and its removal is the author's call.

**Stage by name, never `git add -A`** — the flashcard session may write at any time, and `git status`
must be re-read immediately before staging.

Already verified, so a commit needs no further gate run unless files changed after 14:15:
`Vault-Audit.ps1` → `RESULT: clean` (520 notes in scope); `Test-DocHygiene.ps1` → `RESULT: clean`;
`markdownlint-cli2` → `Linting: 4 files`, 0 issues. Line endings and encoding were checked per file:
the backlog stayed CRLF, the other nine stayed LF, no BOM introduced anywhere.

## What this session did, recorded as F90

Eight skills for the **Gemini web app** were built at `Jag/Gemini/Skills/` — outside this vault and
outside git — and then this session's learnings were folded back into the vault's own agent docs. F90
has the detail. Two entries were added to `lessons-learned.md`; `environment.md` gained the
`$variable`-stripping mechanism; `traps.md` gained `\b` on T3 and `-File` on T19;
`documentation-standard.md` gained four rules; `README.md` lost a stale trap count.

**Six of those eight remain.** The author deleted `cite-network-protocol-rfcs` and
`write-toon-format` on 2026-10-02, saying he did not need them; they are in Drive's cloud trash, not
in git, so recovery is via drive.google.com within 30 days. The docs that quoted "eight" were
corrected in the same change — **list the folder rather than trusting any count.**

**A wrong attribution was corrected in three places** — see the section below. That correction is the
part most worth knowing, because the vault had repeated it.

## One open follow-up, not started

**The identifier-leak rule has no check, and that breaches `documentation-standard.md`'s own law that
a rule without a check will drift.** The rule says material carried in from a work repository must be
scanned for internal identifiers — hostnames, codenames, customer and tool names, repo paths — before
it reaches this public repo. `.kiro/hooks/block-secrets.sh` matches credential patterns only.

Extending it means an author-maintained list of forbidden identifiers and a write-time scan. Not done
deliberately: it is a change to a security hook, so it needs the author's go-ahead, and the gap is
recorded in the doc rather than left silent. **Ask before implementing it.**

## The re-entry prompt

**`.kiro/reentry.md`** is the file to be pointed at after a compact. It is course-neutral.
`.kiro/hi1031-tenta-reentry.md` is the archive of the earlier HI1031 writing project, not a live state
file, and two of its figures are superseded — see the banner inside it.

## Done: the HI1031 and HI1032 exam-prep programme (F80 to F85)

- **F80, 2026-09-26** — all ten HI1031 chapter decks cut from **401 cards to 219** against the published
  exam questions. 69 markers removed with the 69 cards that carried them; hidden multi-fact prose cards
  went from 98 to 0. `Test-DeckHygiene.ps1` was written in the same change.
- **F81, 2026-09-27** — the narrowed decks stress-tested against a simulated oral examiner. 147
  follow-up questions: 110 answerable, 26 thin, 11 not. A depth calibration found **0 of 20** shortened
  cards had lost their mechanism, so the gap was not depth but **tradeoffs and downsides**. 22 cards
  added, 2 removed.
- **F82, 2026-09-27** — the T22 baseline trap removed rather than documented (`-BaselinePath`), doc-figure
  drift made mechanical (`staleFRange`), and the seed card removed from `Begrepp Template.md`.
- **F83, 2026-09-27 to 10-01** — HI1032's Labb 5 deck brought to the form rules, **15 cards added to
  chapter 17**, and three defects found in the checks F82 had just added. Labb 5's duplicated heading
  taxonomy was then folded: two parallel `##` series became the four `## Modul N` sections, 57 cards and
  56 markers unchanged.
- **F84, 2026-10-01** — HI1031's **five exam-answer notes** for chapters 4, 5, 6, 9 and 10 narrowed to
  the exam questions. Only 45 lines went, and the measurement is the finding: **the 150–250 line target
  cannot be met by a chapter with five or six exam questions.** Also corrected a wrong conclusion of my
  own about chapter 9 — see below.
- **F85, 2026-10-01** — HI1032 Labb 5's deck turned from addresses to topology: five address-recall cards
  deleted, five reworded to the consequence, ten added about the lab's shape and its acceptance
  criterion. 57 → 62 cards, 56 → 51 markers.

**Card counts now.** HI1031 per chapter: 01 26, 02 19, 04 29, 05 24, 06 25, 09 18, 10 22, 11 30, 16 28,
17 **33** — 254 cards. HI1032 Labb 5 holds **62 cards and 51 markers**. Marker totals move constantly
because the author reviews daily; re-run `Get-SRIntegrity.ps1` rather than quoting these.

**Exam-answer note lengths after F84:** 308, 232, 375, 317, 343 lines. Four are above the agreed 250 and
**that is correct, not a finding** — `product.md` now carries the measurement. Quote **lines per exam
ask** (29 to 47 across the five) rather than lines per note.

**Two authoring rules were added to `product.md` this programme, and both are easy to rediscover the
hard way:**

1. **No card whose answer is an address, a mask or an ID.** Stated 2026-10-01. Protocol constants are
   fine; lab addresses are not. Applying it to Labb 5 removed five cards and reworded five.
2. **The 40–60 cards per deck target is superseded** — "as few as possible, as concentrated on the exam
   questions as possible". 40 is not a floor. Chapter 17 is the one deliberate exception.

**`nosr` is the author's rotation and is not an agent's to change.** `Format-FrontmatterTags.ps1`
preserves what is there and **does not restore a missing `nosr`**, so check deliberately before running
it.

**One thing left for the author, and it is a correction of mine.** Chapter 9's deck has no card for the
hypermedia part of exam question 2. This was reported three times as needing his decision because
closing it "means accepting a non-book source". **That premise was wrong, corrected 2026-10-01:** KursPM
line 58 requires `restfulapi.net` — *What is REST*, *REST Constraints*, *Naming REST resources* — as
course literature alongside chapter 9, and the vault holds a saved copy at `REST - restfulapi.net.md`.
The 2012 book genuinely never uses the word *hypermedia*, which is why four reviewers found no coverage;
but the second required source does, so HATEOAS is examinable and the cards removed in F80 should come
back. Left undone because it is a deck change he has not asked for.

**Also open, not blocking:** HI1032's twelve chapter decks and its Labb 1 deck carry card-form findings
from before these conventions — run `Test-DeckHygiene.ps1` with no `-Course`. HI1031's ten and HI1032's
Labb 5 are clean. `-All` is a **survey, not a gate**.

**The exam has been moved.** The date in the earlier archive — 21–23 September 2026 — is past and wrong.
The author confirmed the move on 2026-09-26 but gave no new date, so do not quote one.

## Two untracked files, awaiting commit

`.kiro/skills/write-flashcards/SYNTHESIS.md` and `.kiro/skills/query-notebooklm/SYNTHESIS.md` were
recorded here, in `.kiro/reentry.md` and in backlog F85 as *"not mine and not attributable"*. **That
was wrong.** They were written by the session that ran on the evening of 2026-10-01 — it was asked to
synthesise those two skills into standalone files for use outside this vault — and on 2026-10-02 the
author confirmed they are his and asked for them to be **committed next time**.

So the open question is not provenance, it is a pending commit. Both are still untracked and absent
from `HEAD`; nothing has been lost.

The correction rests on the author's instruction and that session's own knowledge of what it wrote —
**a timestamp and a byte size establish when a file appeared, never who wrote it.** F90 records the
mechanism.

## Nothing else partially finished

**Run `git status` rather than trusting a commit id written here** — this file has carried a stale one
three times, and a reviewer caught it again on 2026-10-01.

One file is left untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`, a Drive sync
conflict artefact. It should be deleted, but that is the author's call.

**`core.quotepath` is `false` in this repository's local git config**, deliberately, because `traps.md`
T2 recommends it and nearly every path here contains `å ä ö`. It is **only half the fix** — PowerShell
still decodes git's stdout using the console code page, so `[Console]::OutputEncoding` has to be set to
UTF-8 as well. And **T2's "safe" form stops being safe the moment you scope it**: `git diff --numstat`
with a Swedish pathspec matches nothing and exits 0. That produced a false "review data only" reading on
2026-10-01; take the whole diff in one call and split it in PowerShell.

Settled 2026-09-06: the author's goal — pass the exam, not cover the book — and the deck
self-containment policy are recorded in `product.md` and `llms.txt`, with the authoring consequence in
`.kiro/skills/write-flashcards/`. See F71, F72 and F73.

## In flight: making the phone usable (started 2026-09-08)

Only spaced repetition is used on the phone, and it is slow. Measured: the phone syncs
**2 229 files / 1 751.9 MB** to review **421 notes / 1.4 MB**. Causes in order of cost —
Omnisearch rebuilding its index at every launch (`useCache: false` with `PDFIndexing: true`, over the
notes plus 17.6 MB of extracted PDF text in Text Extractor's 310-file cache); **all 14 plugins loading
on mobile** — 14 as measured, 11 after the removals recorded in F75 — every manifest carrying
`isDesktopOnly: false`; Dataview's 147 queries across 31 notes;
and the weight itself — `.git` 445.9 MB, PDFs 1 113 MB, `.obsidian` 93.4 MB, plus 30.1 MB of the
39.5 MB of Markdown being 17 Excalidraw drawings.

**Part A — per-device config.** Obsidian's own `optionConfigLocation`, "Override config folder" / "Use
a different config folder than the default one. Must start with a dot.", verified present in
`obsidian-1.13.7.asar`. Point the phone at `.obsidian-mobile` and install only
obsidian-spaced-repetition there. *Not verified: whether the mobile app exposes that setting in its
UI.* Fallback is `alangrainger/obsidian-lazy-plugins` (v1.0.24, 2026-05-31), whose `src/main.ts` has a
`DeviceSettings` type holding separate desktop and mobile data — its 741-byte README never mentions
devices, so the source is the evidence.

**Part B — sync exclusions:** `.git/`, `.obsidian/`, `.kiro/`, `.github/`, `.trash/`, `Meta/` and any
`Filer/`. Validated against the real tree: **541 files / 1.5 MB** remain, and **295 notes carrying
`<!--SR:-->` markers are kept**. The 17 excluded files containing the literal `<!--SR:` are all
documentation quoting the syntax — `Meta/Vault Standard.md`, the backlog, `.kiro/` docs — not decks.

**Done on the phone (2026-09-08 evening).** One FolderSync exclude filter, `Folder name starts with`
= `.`, which is the app's documented idiom for hidden folders and covers `.git`, `.obsidian`, `.kiro`,
`.github` and `.trash` in one rule. Then the 13 unwanted plugins were disabled in Obsidian on the
phone — safe only *because* `.obsidian` had stopped syncing, so it cannot propagate back. The author
reports mobile is now much quicker and syncing looks correct.

**This made Part A unnecessary.** Once `.obsidian` is excluded the phone keeps its own copy, so the
config-folder override is belt-and-braces rather than a requirement, and `.obsidian-mobile/` was never
created. The `.gitignore` entry for it stays: it costs nothing and the reasoning is recorded there.

**Still outstanding.**

1. The `Folder name equals` = `Filer` exclude filter, which is **1 209 MB across 742 files** and by far
   the largest remaining win. Add it, run FolderSync's `Analyze` (its dry run) before syncing, and only
   then delete the `Filer` folders already on the phone.
2. `.git` (445.9 MB) is excluded but still present on the phone; deleting it there reclaims the space.
3. **The round trip is unverified.** `Get-SRIntegrity.ps1 -Save` was taken 2026-09-08 21:02 —
   **1 429 marker placements across 311 files, 2 277 cards in the active deck, 130 excluded by
   `nosr`**. Those figures are now superseded by the deck narrowing; re-take a baseline before using
   `-Compare` for this. After the next review on the phone, markers arriving with no change to card or
   separator counts proves review data still flows back. Until that is done, nothing has confirmed the
   phone can write.

**The trap, before setting up the phone.** A fresh SR install uses defaults and this vault's settings
are not default. Copy `.obsidian/plugins/obsidian-spaced-repetition/data.json` to the same path under
`.obsidian-mobile/` **after** installing the plugin there, then restart it. Four settings matter:
`flashcardTags` is `#HI1031, #HI1032` against a default of `#flashcards`, so a fresh install finds
**zero cards** and looks like a sync failure; `algorithm` is `FSRS` against a default of SM-2, while
the markers are `!fsrs` format, so a mismatch writes the wrong one; `flashcardTagsToIgnore` is
`#nosr`, without which those notes re-enter review and undo F64 and F71; and `maximumInterval` is 30
against a default of 36525.

**Decisions.** Both parts, because they solve different problems — the override is the guarantee that a
mis-set exclusion cannot re-enable the desktop plugin set, the exclusions are the bandwidth. Config folders are not
synced at all, which also removes the conflict class already visible as
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`.
`.obsidian-mobile/` is gitignored even though `.obsidian/` is tracked, because it is one device's
recreatable state and the settings that matter are already committed in the desktop copy.

**Do not redo.** Turning off Dataview's auto-update is pointless and cannot be scripted (F75). SR's
`scheduleData` is empty because `dataStore` is `NOTES` — the schedule is in the notes' `<!--SR:-->`
comments.

**The risk to respect.** The exclusions are the dangerous step. If the sync app mirrors two-way, an
exclusion can register as a remote delete and propagate. `Filer/Litteraturlista/` and `Filer/Canvas/`
are **gitignored**, so 1 113 MB of PDFs exist only on disk and in Google Drive, not in git. Test one
small folder and confirm the app's exclusion semantics are "ignore", not "delete".

---

**How to use this file:** write it before a long operation and when pausing an unfinished task; reset
it to "nothing in flight" as soon as the work is done. Finished work belongs in
`Meta/Vault Findings & Backlog.md`, not here — a stale state file is worse than an empty one. The
format to follow, and the table of where every durable fact lives, are in `.kiro/README.md`.
