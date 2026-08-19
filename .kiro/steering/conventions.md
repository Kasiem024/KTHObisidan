---
inclusion: auto
description: Hard rules for editing this vault - what must never be touched, where the conventions live, and how to verify a change. Read before any edit.
---

# Conventions — KTH Obsidian Study Vault

`Meta/Vault Standard.md` is the **source of truth** for tags, frontmatter, folders,
filenames and note structure. Do not restate it here or anywhere else — read it, and update
it in the same change if a convention changes.

This file covers only the things that are easy to get wrong or expensive to undo.

## 1. Never destroy spaced-repetition data

The vault holds a **live review schedule**. These are not formatting artifacts:

- `<!--SR:!2026-03-17,5,186!2026-03-16,4,186-->` — scheduling state per card.
- The card separators `::`, `;;`, `||`, `??`, and `==DISABLEDFLASHCARD==`.

**The four separators are not interchangeable.** From the plugin's own settings
(`.obsidian/plugins/obsidian-spaced-repetition/data.json`):

| Separator | Meaning |
|---|---|
| `::` | single-line, one-directional |
| `;;` | single-line, **reversed** — also generates a back-to-front card |
| `\|\|` | multi-line, one-directional |
| `??` | multi-line, **reversed** |

"Normalising" `;;` to `::` would silently delete half the deck. Never rewrite a separator
into another form, and never strip an `<!--SR:-->` comment.

The published site renders cards as collapsible callouts **at build time**, in the Quartz
repo's `plugins/flashcards/`. The vault is never modified for the site's benefit.

## 2. Verify with the audit, not by eye

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

Expected: `RESULT: clean - no deviations from the standard.` Add `-Detail` to list offending
files. A change is not finished until this is clean.

For Markdown syntax there is a second, separate tool:

```powershell
npx markdownlint-cli2 "**/*.md"          # report
npx markdownlint-cli2 --fix "**/*.md"    # apply the fixable rules
```

They are complementary, not alternatives: the audit checks vault conventions, the linter
checks Markdown syntax. Three traps, all of which have already bitten:

- Ignores must live in `.markdownlint-cli2.jsonc`. **`.markdownlintignore` is silently
  inert** — that is cli v1 only — and a stray one linted 36 extra files without complaining.
- **Never run `--fix` on the Templater templates.** MD034's fix split a `<% %>` expression
  out of a URL and broke the course template. They are excluded for this reason.
- Before any bulk `--fix`, confirm no heading or fence needing blank lines sits **inside a
  flashcard region**, because an inserted blank line would split the card. Afterwards,
  re-count the `<!--SR:-->` markers and each separator and require them to be identical.

If a rule is worth having, add a check to the audit in the same change. Documented-but-
unenforced rules drift: `description` and the Flashcards-last invariant were both in the
standard for a while without being checked, and both had already been violated.

## 3. Bulk edits: dry-run, back up, then apply

Most work here is a sweep over hundreds of notes. Every such script must:

1. default to a **dry run** that prints what it would change,
2. copy each file it touches to a backup directory before writing,
3. preserve the original **BOM** and line endings,
4. and be re-runnable without doubling its own effect.

Review the dry-run output properly. Every bulk edit in this vault's history that went wrong
was caught at this step — a generator once harvested Dataview query text as note
descriptions, which would have published `FROM "KTH/2025 Vår/..."` on 24 pages.

## 4. Out of scope — do not edit

- `KTH/2026 Höst/HI1031 .../Filer/Litteraturlista/` — conversion tooling docs
  (`CONVERSION_*.md`, `FIX_PLAN.md`, `VAULT_CHANGES_CONTEXT.md`, `*.opt.md`). The author
  deletes these personally. Tracked as F10.
- Anything under `Filer/Litteraturlista/` — copyrighted course literature.
- `.obsidian/` — plugin state. Read it for facts; do not edit it.
- Notes tagged `excalidraw` — drawing files, not authored notes.

## 5. Writing style for note content

Swedish, matching the surrounding notes. Keep the author's voice; do not rewrite their prose
into something more formal. When generating text mechanically — descriptions, alt text,
link lists — derive it from what the note already says rather than inventing content, and
never invent study material such as exam guidance.
