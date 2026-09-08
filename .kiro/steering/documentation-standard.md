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
| A reusable measurement, and what it counts | a script in `Meta/Obsidian Plugins/Scripts/`, listed in `.kiro/steering/scripts.md` |
| How the *website* is built | `PROJECT-NOTES.md` in the Quartz repo |
| Which chat transcript still holds something undistilled | `.kiro/sessions.md`, and how to reopen one |

Link to these rather than restating them. Duplicated rules drift apart.

`.kiro/sessions.md` is the one entry above that is *provenance* rather than content: it names the
transcripts whose output has not yet landed in any of the others, and a row there is deleted as
soon as it has. Reach for it when you are about to end a session having decided not to write
something down — and read it before concluding that a piece of reasoning was never recorded.
Nothing in it is a substitute for the rows above.

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

**And when a check passed while the thing it protected was broken anyway, that goes in
`.kiro/lessons-learned.md`** — the one file that records where a *check* was insufficient rather than
where a rule was broken. It is not auto-loaded, because it explains why the rules exist rather than
what to do. Read it before adding a check. **Add an entry when any of these four happen**, because
they are the cases the checks cannot catch and none of them announces itself:

1. A check passed and the thing it was meant to protect was broken anyway.
2. A measurement produced a confident number that turned out to be false.
3. A rule turned out to be wrong, or to have a case it did not cover.
4. A doc said something that was true when written and silently stopped being true.

## Before a task counts as done

Ask one question: **did anything go wrong in a way no doc predicted?** If so it belongs in one of the
five durable homes — the standard, the backlog, `traps.md`, `lessons-learned.md`, or a script — and the
table above says which. Write it in the same session, not "later".

Every other instruction here is conditional on already having decided to document something. This one
is not, and it exists because the decision is what gets skipped when a session ends. `.kiro/sessions.md`
is the ledger of times it was skipped; a row there is a debt, and an empty ledger is the healthy state.

**If nothing fits any of the five homes, that is a finding against this file, not a reason to drop the
fact.** Say so, and say what kind of home is missing.

## Templates are documentation too

`Meta/Obsidian Plugins/Templates/` is where a convention actually takes effect. A rule that
the templates do not produce will be broken by the next note created. The concept template
once emitted `**Flashcards:**` as a bold label instead of a `## Flashcards` heading, which
would have made every new note's cards publish as raw `::` syntax.

## A stale number is a finding against the doc

Several docs quote exact figures — 516 notes in scope, 396 concept notes, 1262 scheduling
markers, 538 linted files, and on the site side 648 pages, 2233 callouts and 44 broken links.
Every one was correct when written, and nothing verifies them afterwards. A confident wrong
number is worse than no number, because it gets quoted instead of checked. Three of those are
already superseded: the linted-file count is **539** as of 2026-09-06, the marker count is a dated
reading that no prose copy should carry, and the site's page and broken-link figures were corrected to
**693** pages and **85** broken links once `check-site.mjs` was taught what it was counting (F58) — the
648 / 44 pair above is the pre-fix measurement, kept because the paragraph is about how figures rot.

Where a script now owns a figure, quote the script rather than the prose. `Vault-Audit.ps1`
prints `notesInScope`, and `Get-SRIntegrity.ps1` prints the scheduling-marker counts in two
named scopes — `studyNotes` and `wholeVault` — because the same marker has two legitimate
totals and quoting one without its scope name is how a wrong figure spreads. See
`.kiro/steering/scripts.md`.

Every vault figure quoted above has moved at least once, and each move is recorded with its cause
in `Meta/Vault Findings & Backlog.md` — F61 and F67 for the note and marker counts, F58 for the
site's pages. **Read the backlog entry before changing a figure**, because the entry says what the
number counted, and that is usually where the disagreement is rather than in the measurement.

### A number needs a declared unit and an observable source

Both rules came out of F58, where `1270` and `693` were **correct measurements of different
things** — a Linux build keeps Quartz's mixed-case redirect stubs, and case-insensitive NTFS
collapses each pair into one file. Neither platform was wrong; nothing recorded what "pages"
meant. Both rules are mechanically enforced rather than left to memory:

1. **Every compared metric declares what it counts.** The site's are in
   `tools/lib/page-count.mjs` (`METRIC_UNITS`), and `tools/test-check-site.mjs` fails if a
   baselined metric has no declaration.
2. **The other environment's numbers must be readable without privileges.** Every site build
   writes `build-report.json` into its output, so CI's own measurements are published at
   `/build-report.json`, and `node tools/check-site.mjs <dir> --compare-ci` names any metric that
   is not machine-independent. Diagnosing F58 without this needed a run log behind `actions:read`,
   and four hypotheses were tested against local data alone before any of them could converge.

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
