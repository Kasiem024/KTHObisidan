---
inclusion: auto
description: What this vault is, who it serves, and what the author is optimising for. Read before generating any study material - the goal is passing the exam, not covering the book, and that changes what "good" means.
---

# Product — KTH Obsidian Study Vault

## What it is

A personal Obsidian vault of university coursework for one student on KTH's
**Högskoleingenjör – Teknik och Ekonomi** programme (IT/computer engineering with an
economics track). Around 516 interlinked Markdown notes across 23 courses and six terms.

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

## What the author is optimising for

**Passing the exam, not covering the book.** Stated by the author on 2026-09-06 and recorded
here because it changes what "good" means for study material generated in this vault:

> my goal isn't to learn the chapters and coursebook as a whole, it's to pass the exam.

So where a course publishes its exam questions, **those questions are the specification** and
the course literature is a source of grounded answers to them, not the scope. Content that is
correct, in the chapter, and not needed for any exam question is waste — it costs review time
that the examinable material should be getting.

The concrete test for anything you generate: *if the author practised only this, could they
answer the exam questions cold?* Aim for exactly that, and no wider.

**A finished course's deck is dropped, not reviewed.** Also stated on 2026-09-06:

> i dont actually mind duplicate cards that much. i dont practice old decks at all, once i'm
> done with a course then i drop that whole deck. therefore each deck for a course needs to be
> self contained.

So each course's `Anteckningar/` flashcard decks — the `<CODE> Begrepp - Kap NN ...` notes he
drills during exam prep — must between them answer that course's exam questions **without
depending on any other course's notes**. Duplication across courses is therefore acceptable and
often required, and duplication with a `Begrepp/` concept note is acceptable too: `Begrepp/` is
reference material that happens to carry a card, is shared across courses, and counts toward
self-containment in neither direction. Duplication **within one course's decks** is still waste.
Where two courses run in the same term — HI1031 and HI1032 both do in 2026 Höst — a cross-course
duplicate genuinely is reviewed twice; that cost is accepted, so do not optimise it away. The
authoring consequence is in `.kiro/skills/write-flashcards/SKILL.md` (step 2, rule 9 and the
anti-pattern table).

Where the exam questions live, per course, when they exist at all:

| Course | Exam questions |
|---|---|
| HI1031 | `KTH/2026 Höst/HI1031 .../Filer/Canvas/Tentor/Tentafrågor HI1031 Distribuerade informationssystem.md` (per chapter), plus an old exam, `HI1031-20192.pdf` in the same folder and converted to Markdown under `Filer/Canvas/AI-optimerad Markdown/Tentor/HI1031-20192.md` |

That folder is `Filer/Canvas/` — third-party Canvas downloads, gitignored and out of the
audit's scope (`Meta/Vault Standard.md` §4). **Read it; never edit it.** It also holds the
KursPM, which states the examination form: HI1031's is a **muntlig enskild examination**, so
cards for it must train speaking an answer, not recognising one.

Two consequences worth stating, because both have already been got wrong:

- **Narrow does not mean shallow.** A question worth real marks needs the mechanism, the
  tradeoff and the failure mode, because an oral examiner asks the follow-up. Cutting scope is
  cutting *topics*, not cutting depth within a topic.
- **A gap is reported, never filled from memory.** When an exam question has no source in the
  course material, say so and name what is missing. Inventing a plausible answer to close the
  gap puts a possible falsehood into a deck that is then memorised on purpose. See
  `.kiro/skills/write-flashcards/SKILL.md`.

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
literature naming scheme. That consistency is the point — it is what makes ~516 notes
navigable and machine-readable. A change that introduces a second way of doing something
is a regression even if it looks locally reasonable.

The rules live in `Meta/Vault Standard.md` and are enforced by
`Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`, which must report
`RESULT: clean` after any change.

## Status

Conventions are settled and the vault is clean against them. The change log in
`Meta/Vault Findings & Backlog.md` runs F1–F75: all closed except F10 (parked). Both the audit and
the linter run automatically on every push via `.github/workflows/vault-checks.yml`.

Remaining work is content the author must write — chiefly `## Tenta-fokus` sections, present on
42 of the 396 concept notes, prioritised in `Atlas/Tenta-prioritering.md`.

## What it is not

- Not a shared or collaborative knowledge base.
- Not a blog or a publication with an editorial calendar.
- Not a place for work notes. `Ericsson/` exists but is empty and out of scope.
- Not a general note-taking system — it is coursework for one degree programme.
