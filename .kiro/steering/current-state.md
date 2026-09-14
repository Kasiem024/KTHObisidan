---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: one task in flight — making the vault usable on the phone. The HI1031 exam-prep rewrite is
finished, and both repositories are committed and pushed with every check green.**

**The re-entry prompt is `.kiro/reentry.md`.** It is course-neutral and is the file to be pointed at
after a compact. `.kiro/hi1031-tenta-reentry.md` is now the archive of the finished HI1031 project,
not a live state file.

## Done: HI1031 exam-prep rewrite (2026-09-08 to 2026-09-10, committed 2026-09-14)

All ten chapters — 1, 2, 4, 5, 6, 9, 10, 11, 16 and 17 — have an exam-answer note plus a rebuilt
flashcard deck, in everyday Swedish at 40–60 cards per deck. Each was reviewed by five adversarial
reviewers and verified. Chapters 16 and 17 were written from scratch. The review pass over all ten is
recorded in `.kiro/reports/hi1031-genomgang-2026-09-10.md`; the calibration knowledge, book line
offsets and confirmed errata are in `.kiro/hi1031-tenta-reentry.md`. The oral exam is **21–23
September 2026**. **Do not write more chapters.**

The two `listStyleTags` and `nosr` questions this file previously flagged for the author's decision
are **resolved**. All twelve affected notes were written back to inline tag form, keeping every tag
including `nosr`, and `Vault-Audit.ps1` now reports clean. `Format-FrontmatterTags.ps1` exists so the
repair does not have to be re-derived when it recurs.

**One question still open, and it is a small one.** An inspection of `HI1031 .../Begrepp/` found 14
concept notes covering the course's early material, with nothing at all for chapters 9 or 11, all
tagged `nosr` so they are never drilled. The recommendation was to leave the folder as reference and
add one line recording what it is, rather than expanding it to match the exam — expanding it would
duplicate verified material for no review benefit. The author has not replied.

## Nothing else partially finished

No other partially-finished task, and **the working tree is clean** as of 2026-09-14 11:45. `main`
and `origin/main` are both `80c9cc8`; the site repo's `v5` and `origin/v5` are both `7de1cbd`. Run
`git status` rather than trusting that — a second agent has edited this tree before, and the figure
here has aged wrong twice.

One file is left untracked deliberately:
`.obsidian/plugins/obsidian-spaced-repetition/data (conflict 2026-09-07-10-27-11).json`, a Drive sync
conflict artefact. It should be deleted, but that is the author's call.

**The exposure this section used to name is closed.** It said `.kiro/skills/query-notebooklm/` and
`.kiro/research/` had no version history and were "the single largest exposure in the repo right
now". Both are committed: 5 tracked files and 7 tracked files respectively. What they contain is
still worth knowing — six tested prompt levers and an eleven-check list for distrusting an answer in
the skill, and five verbatim Deep Research reports plus a distillation in `research/`, where the
reports carry three known fabrications and the distillation is the only place that says which.

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
   `nosr`**. After the next review on the phone, run `-Compare`: markers arriving with no change to
   card or separator counts proves review data still flows back. Until that is done, nothing has
   confirmed the phone can write.

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
