---
name: add-a-convention
description: The full pipeline for adding or changing a vault convention so it cannot drift - standard, enforcement, template, health report, backlog, in one change. Use when introducing a rule, tightening an existing one, or when an audit check needs adding.
---

# Adding or changing a convention

**A rule without a check will drift.** Both `description` and the Flashcards-last invariant
sat documented-but-unenforced in this vault, and both had already been violated by the time a
check was added. Uniformity is the point of this vault, so a rule that is only written down
is a rule that is quietly optional.

Do all five steps in the **same** change. A convention half-landed is worse than none,
because the docs then lie.

## 1. Write the rule where rules live

`Meta/Vault Standard.md` is the single source of truth. State the rule and, where it is not
obvious, why. Do not restate it in `.kiro/steering/` or `llms.txt` — link instead. Duplicated
rules drift apart.

## 2. Make it enforceable

Add a check to `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`, or a markdownlint rule in
`.markdownlint.json`, whichever fits:

- **Vault convention** (tags, frontmatter, structure, naming, section order) → the audit.
- **Markdown syntax** (blank lines, fences, link form) → the linter.

For the audit, add a bucket and increment it; the script exits 1 when any bucket is
non-empty, which is what makes CI able to gate on it. Verify both directions: clean → exit 0,
a deliberately broken file → exit 1.

If a rule genuinely cannot be checked mechanically, say so in the Standard next to the rule,
so nobody assumes it is enforced.

**Beware CI reproducibility.** A check that reads state git does not store — empty folders,
gitignored files — cannot pass on a fresh clone. Two existing checks have this problem and
are skipped under `-ContentOnly`. If your new check needs untracked state, add it to that
exclusion and note why.

## 3. Make the templates produce it

`Meta/Obsidian Plugins/Templates/` is where a convention actually takes effect. A rule the
templates do not produce will be broken by the very next note created. The concept template
once emitted `**Flashcards:**` as a bold label instead of a `## Flashcards` heading, which
would have made every new note's cards publish as raw `::` syntax.

Templates are excluded from linting, because a Templater `<% %>` expression is not valid
Markdown until rendered — so check them by generating a note, not by linting them.

## 4. Surface it in Obsidian

Add a Dataview query to `Atlas/Vault Health Report.md` where the rule can be expressed. That
is the feedback loop that works while writing, rather than after pushing.

A Dataview block needs **a line of prose above it**, or the section looks empty on the
published site — the empty-heading CSS will not catch it, because the hidden block is still a
sibling.

## 5. Record it

`Meta/Vault Findings & Backlog.md`, F-numbered: what was wrong, what changed, and **how it
was verified**, with real numbers. Record mistakes and wrong estimates too — those entries
have saved the most time later. If a later change makes an earlier entry wrong, correct that
entry.

Then bump the F-range in `README.md`.

## 6. Fix the existing violations

Adding the check will usually reveal that the vault already breaks the new rule. Use the
`vault-bulk-edit` skill for the sweep, and do not consider the convention landed until the
audit is clean and CI is green.
