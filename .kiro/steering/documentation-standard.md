---
inclusion: auto
description: Which docs must be updated when the vault changes, and where each fact belongs. Read when changing a convention, adding a rule, or finishing a batch of work.
---

# Documentation Standard — KTH Obsidian Study Vault

Docs are updated **in the same change** as the work, not afterwards. A stale doc is a bug:
it makes both the author and any future agent act on something that is no longer true.

## Where each fact belongs

| Fact | Home |
|---|---|
| A convention (tags, frontmatter, structure, naming) | `Meta/Vault Standard.md` |
| What changed, why, and the evidence | `Meta/Vault Findings & Backlog.md` (F-numbered) |
| How to read the vault as an AI tool | `llms.txt` |
| Entry points for a human | `README.md` |
| Live conformance queries | `Atlas/Vault Health Report.md` |
| How the *website* is built | `PROJECT-NOTES.md` in the Quartz repo |

Link to these rather than restating them. Duplicated rules drift apart.

## The backlog is a record, not a wish list

Each entry says what was wrong, what was done, and **how it was verified**, with real
numbers. Record mistakes too, including wrong estimates and false positives — the entries
that document a failed assumption have saved the most time later. When a later change makes
an earlier entry wrong, correct that entry.

## A rule without a check will drift

If a convention is worth documenting, add a check to
`Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1` in the same change, and a Dataview query to
`Atlas/Vault Health Report.md` where it can be expressed. Both `description` and the
Flashcards-last invariant sat documented-but-unchecked, and both had already been violated
by the time a check was added.

## Templates are documentation too

`Meta/Obsidian Plugins/Templates/` is where a convention actually takes effect. A rule that
the templates do not produce will be broken by the next note created. The concept template
once emitted `**Flashcards:**` as a bold label instead of a `## Flashcards` heading, which
would have made every new note's cards publish as raw `::` syntax.

## A stale number is a finding against the doc

Several docs quote exact figures — 520 notes in scope, 400 concept notes, 1262 scheduling
markers, 542 linted files, and on the site side 652 pages, 2241 callouts and 74 broken links.
Every one was correct when written, and nothing verifies them afterwards. A confident wrong
number is worse than no number, because it gets quoted instead of checked.

The vault figures moved twice on 2026-08-26. First, HI1031 and HI1032 gained 92 notes: 470
became 561, 352 concept notes became 441, and 493 linted files became 583. Then those two
courses' flashcard decks and concept notes were pruned to course-relevant scope, removing 41
notes: 561 became 520, 441 became 400, and 583 became 542 — scheduling markers stayed at 1262,
since the removed notes carried none.

**The site figures moved twice on 2026-08-26, and the reason took three attempts to find.**
`site-baseline.json` was set to `1270` pages from a CI log, then "corrected" to `693` from a
local build, and both numbers were **correct measurements of different things**.

Quartz emits a 448-byte redirect stub at each note's *original-cased* path
(`KTH/2026-Höst/.../Replikering.html` — meta-refresh, `rel=canonical`, `robots: noindex`)
pointing at the lowercase slug it actually serves. Linux keeps both files; **NTFS is
case-insensitive, so every pair collapses into one.** CI's own artifact listing: 1269 HTML
files = 576 mixed-case stubs + 693 real pages. A Windows build physically cannot produce
1269 files, and CI cannot produce 693.

`check-site.mjs` now counts **distinct case-insensitive routes**, so both platforms report
`pages 693`. Verified by running the implemented expression over CI's real 1269 paths.
Every other metric was already byte-identical between the two builds — including
`brokenInternalLinks`, which is **85** on both, so the earlier worry that it diverges by
platform was unfounded.

The lesson generalises: before changing a number, establish **what it counts**. Both sides of
this argument were measuring honestly and disagreeing about the unit.

### A number needs a declared unit and an observable source

Two rules came out of that day, both mechanically enforced rather than left to memory:

1. **Every compared metric declares what it counts.** The site's are in
   `tools/lib/page-count.mjs` (`METRIC_UNITS`), and `tools/test-check-site.mjs` fails if a
   baselined metric has no declaration. "Pages" meant two different things to two machines and
   nothing in the system recorded which.
2. **The other environment's numbers must be readable without privileges.** Every site build
   now writes `build-report.json` into its output, so CI's own measurements are published at
   `/build-report.json`. Diagnosing this the first time needed a run log gated behind
   `actions:read`, with artifacts returning 403 and the anonymous API rate-limited at 60/hour —
   so four hypotheses were tested against local data alone and none of them converged.
   `node tools/check-site.mjs <dir> --compare-ci` diffs a local build against that report and
   names any metric that is not machine-independent.

**When a doc figure disagrees with a fresh measurement, read the backlog entry that documents
the figure before changing anything.** F58 recorded exactly where `1270` came from; overriding
it on the strength of my own reconstruction is what turned a five-minute question into a day.
The record was right and I was confident.

When a figure in a doc disagrees with a fresh measurement, **fix the doc**; never adjust the
measurement to match. The machine-checked copies are `site-baseline.json` and the audit's own
output — prose copies are convenience, not truth. The same applies to a trap that no longer
reproduces, or a path a skill names that has moved: report it against the document, not against
the vault.

## Never commit secrets

There are none in this vault today, and it should stay that way. Do not add API keys, tokens
or credentials — the repository is public, and so is the site built from it.
