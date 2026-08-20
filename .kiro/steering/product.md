# Product — KTH Obsidian Study Vault

## What it is

A personal Obsidian vault of university coursework for one student on KTH's
**Högskoleingenjör – Teknik och Ekonomi** programme (IT/computer engineering with an
economics track). Around 470 interlinked Markdown notes across 24 courses and six terms.

It is two things at once, and both matter:

1. **A study tool in Obsidian** — concept notes, lecture notes, exam-question sets, and an
   active spaced-repetition deck reviewed with the obsidian-spaced-repetition plugin.
2. **A published website**, built with Quartz from these same files and served at
   <https://kasiem024.github.io/KTHObsidianQuartz/>. The site repo is separate; this vault
   is its `content/` submodule.

**The note content is written in Swedish.** Technical terms are often English. Answer in
Swedish when discussing the study material.

## Who uses it

One student, as the sole author. There is no collaboration workflow, no review process and
no multi-user concept. The published site is public but is a by-product of studying, not a
blog with an audience to serve.

## What is in it

| Path | Contents |
|---|---|
| `KTH/<Year Season>/<CODE Course>/` | All coursework, four fixed category folders per course |
| `Atlas/` | Subject MOCs, `Dashboard`, `Vault Health Report`, `Tenta-prioritering` |
| `Meta/` | The standard, the change log, templates, the audit script. Not study content |
| `llms.txt` | Entry point for AI tools: structure, tags, and how to read Obsidian syntax |
| `index.md` | Landing page for the published site |

## What matters most

**Uniformity.** This vault is deliberately, aggressively consistent: one tag vocabulary,
one frontmatter shape, one folder layout per course, one concept-note structure, one
literature naming scheme. That consistency is the point — it is what makes ~470 notes
navigable and machine-readable. A change that introduces a second way of doing something
is a regression even if it looks locally reasonable.

The rules live in `Meta/Vault Standard.md` and are enforced by
`Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`, which must report
`RESULT: clean` after any change.

## Status

Conventions are settled and the vault is clean against them. The change log in
`Meta/Vault Findings & Backlog.md` tracks findings F1–F56: all closed except **F10**, which is
parked because the author removes those files personally. Both the audit and the linter run
automatically on every push via `.github/workflows/vault-checks.yml`.

Remaining work is content the author must write — chiefly `## Tenta-fokus` sections, present on
42 of the 352 concept notes, prioritised in `Atlas/Tenta-prioritering.md`.

## What it is not

- Not a shared or collaborative knowledge base.
- Not a blog or a publication with an editorial calendar.
- Not a place for work notes. `Ericsson/` exists but is empty and out of scope.
- Not a general note-taking system — it is coursework for one degree programme.
