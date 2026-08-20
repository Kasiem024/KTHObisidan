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

Several docs quote exact figures — 470 notes, 601 pages, 1965 callouts, 43 broken links, 1262
scheduling markers. Every one was correct when written, and nothing verifies them afterwards. A
confident wrong number is worse than no number, because it gets quoted instead of checked.

When a figure in a doc disagrees with a fresh measurement, **fix the doc**; never adjust the
measurement to match. The machine-checked copies are `site-baseline.json` and the audit's own
output — prose copies are convenience, not truth. The same applies to a trap that no longer
reproduces, or a path a skill names that has moved: report it against the document, not against
the vault.

## Never commit secrets

There are none in this vault today, and it should stay that way. Do not add API keys, tokens
or credentials — the repository is public, and so is the site built from it.
