---
inclusion: auto
description: In-flight state for work that is currently unfinished. Read at the start of any session; update it when pausing mid-task. Empty means nothing is in progress.
---

# Current state

**Status: one task in flight — making the vault usable on the phone. The working tree is also a long
way from committed.**

No partially-finished task. `main` and `origin/main` are still the same commit (`cecab1d`), while as
of **2026-09-08 12:00** the working tree holds roughly **40 modified and 28 untracked** paths. Run
`git status` rather than trusting that count — it has already aged wrong twice, and a second agent is
editing this tree (the backlog gained F75 and `Meta/Vault Standard.md` gained 67 lines that were not
mine).

Two untracked things are worth naming, because nothing else records them and a lost working tree would
take them with it:

- **`.kiro/skills/query-notebooklm/`** — five files, ~103 KB. Six tested prompt levers, an
  eleven-check list for distrusting an answer, and eleven measured ways a report has misled us.
- **`.kiro/research/`** — five verbatim Deep Research reports plus a 38 KB distillation that sorts
  every figure by how hard it was checked. The reports carry three known fabrications; the
  distillation is the only place that says which.

Neither has any version history. That is the single largest exposure in the repo right now.

Settled 2026-09-06: the author's goal — pass the exam, not cover the book — and the deck
self-containment policy are recorded in `product.md` and `llms.txt`, with the authoring consequence in
`.kiro/skills/write-flashcards/`. See F71, F72 and F73.

## In flight: making the phone usable (started 2026-09-08)

Only spaced repetition is used on the phone, and it is slow. Measured: the phone syncs
**2 229 files / 1 751.9 MB** to review **421 notes / 1.4 MB**. Causes in order of cost —
Omnisearch rebuilding its index at every launch (`useCache: false` with `PDFIndexing: true`, over the
notes plus 17.6 MB of extracted PDF text in Text Extractor's 310-file cache); **all 14 plugins loading
on mobile**, every manifest carrying `isDesktopOnly: false`; Dataview's 147 queries across 31 notes;
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

**Done:** vault side only. `.obsidian-mobile/` added to `.gitignore`, with the reason the audit and
linter would not cover it recorded in the same comment. **Nothing done on the phone yet.**

**Next:** on the phone, set the config folder override, then install *only* spaced repetition.

**The trap, before setting up the phone.** A fresh SR install uses defaults and this vault's settings
are not default. Copy `.obsidian/plugins/obsidian-spaced-repetition/data.json` to the same path under
`.obsidian-mobile/` **after** installing the plugin there, then restart it. Four settings matter:
`flashcardTags` is `#HI1031, #HI1032` against a default of `#flashcards`, so a fresh install finds
**zero cards** and looks like a sync failure; `algorithm` is `FSRS` against a default of SM-2, while
the markers are `!fsrs` format, so a mismatch writes the wrong one; `flashcardTagsToIgnore` is
`#nosr`, without which those notes re-enter review and undo F64 and F71; and `maximumInterval` is 30
against a default of 36525.

**Decisions.** Both parts, because they solve different problems — the override is the guarantee that a
mis-set exclusion cannot re-enable 14 plugins, the exclusions are the bandwidth. Config folders are not
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
