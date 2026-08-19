---
name: vault-bulk-edit
description: Safe procedure for changing many notes at once in the KTH vault - inventory, dry run, backup, apply, then prove nothing broke. Use before any sweep over more than a handful of notes, any markdownlint --fix, or any script that rewrites frontmatter, headings, links or flashcards.
---

# Bulk editing the vault

Most work here is a sweep over hundreds of notes. Done properly it fixed 745 lint
violations across 213 files with zero damage. Done carelessly it silently deletes a live
spaced-repetition deck, and you will not notice for weeks.

Every step below exists because skipping it caused a real failure.

## 1. Inventory before you touch anything

Count what is in scope and what you are excluding, and print it. Never start from an
assumption about which files match.

Exclude: `.obsidian/`, `.trash/`, `.kiro/`, `node_modules/`, `**/Filer/`,
`**/Litteraturlista/`, `*.excalidraw.md`.

**Not every Excalidraw note is named `*.excalidraw.md`** — some are identified only by tag
(`CM1008 Lean Canvas Grupp 10.md`). Excluding by extension alone leaves a 30 MB generated
drawing in scope.

## 2. Write a `.ps1`, and keep it pure ASCII

A long multi-line command passed inline to the shell arrives mangled and matches nothing,
failing silently. Write a script and run it:

```
powershell -NoProfile -ExecutionPolicy Bypass -File "<script>"
```

PowerShell 5.1 reads `.ps1` as **ANSI**, so `å ä ö` in the file are mis-decoded and Swedish
literals never match. Match with wildcards (`f.rel.sning`, `\p{L}`) or read Swedish strings
from a separate UTF-8 data file.

## 3. Never hardcode a path containing Swedish characters

**This has failed four separate times in this vault.** A mis-decoded path makes `Test-Path`
return false, and the loop skips the file with no error — once reporting 34 markdown files
when there were 529. Instead:

- locate files with `Get-ChildItem -Filter` on the ASCII part of the name, or
- filter by course code (always ASCII), or
- get sizes and paths from git (`git ls-tree -r -l HEAD`) rather than the filesystem, and
  set `core.quotepath false` first.

## 4. Dry run by default, and actually read the output

Print what would change, with counts and a few samples, and require a flag to write. Every
bulk edit here that went wrong was caught at this step — a generator once harvested Dataview
query text as note descriptions and would have published `FROM "KTH/2025 Vår/..."` on 24
pages.

## 5. Back up, and preserve the file exactly

Copy every file you touch to a backup directory before writing. A clean `git status` is the
real rollback, so start from one.

Preserve the original **BOM** and line endings. After decoding, a BOM is the single char
`U+FEFF`, not the three bytes `\xEF\xBB\xBF` — getting that wrong made a frontmatter matcher
fail on every file at once.

## 6. Process line numbers in descending order

Line numbers from an earlier scan go stale the moment you insert or delete a line. Editing
one file top-down after a 3-line replacement made four later targets point at blank lines.
Either sort targets descending per file, or re-derive them after each edit.

## 7. Guard the flashcards before applying

Before any change that inserts blank lines (`markdownlint --fix` MD022/MD031, or your own
script), verify **no heading or fence sits inside a card region** — a card runs from its
separator to the next blank line, so an inserted blank line splits it and orphans the answer.

Collapsing blank lines is safe: MD012 only reduces runs of 2+ to 1, so a boundary always
remains.

Never rewrite a separator into another form. `::` `;;` `||` `??` are four different card
types and `;;`/`??` are the reversed ones — normalising them deletes half the deck.

## 8. Prove nothing broke

See `references/verification.md` for the exact checks and the current expected numbers. In
short: SR fingerprint identical, audit clean, lint 0, build metrics unchanged.

## 9. Be re-runnable

Running the script twice must not double its effect.

## 10. Document in the same change

`Meta/Vault Standard.md` if a convention changed, `Meta/Vault Findings & Backlog.md` with
what was wrong, what you did, and the real numbers — including your own wrong estimates and
false positives. See the `add-a-convention` skill when adding a rule.
