---
name: skills
description: Root index of the procedures available for this vault. Start here, then open a leaf skill's SKILL.md, then its references. Use when about to run a sweep over many notes, add or change a convention, or verify a change.
---

# Skills

Procedures for working on this vault. The steering docs in `.kiro/steering/` say what the
**rules** are; these say how to **carry out** the recurring jobs without repeating mistakes
that have already been made here.

| Skill | Use it when |
|---|---|
| **`vault-bulk-edit`** | Any change touching more than a handful of notes. The single most dangerous operation in this vault — it has both fixed 745 violations mechanically in one pass and nearly destroyed a live flashcard deck. |
| **`add-a-convention`** | Adding or changing a rule. A documented-but-unchecked rule always drifts; this is the pipeline that stops it. |

## Navigation

`SKILL.md` is navigation, not the answer. A leaf `SKILL.md` gives the procedure and says
which `references/` file holds the detail — if your answer comes only from the `SKILL.md`
body, go one level deeper before acting.

For the site's own procedures, see `.kiro/skills/` in the Quartz repo (`verify-the-site`).

## Format

Agent Skills open format: a directory with a `SKILL.md` (frontmatter `name` + `description`,
then a concise body) and optional `references/` loaded only when needed. Keep `SKILL.md`
short; put detail in `references/`.
