---
tags: [meta]
---
# 📐 Vault Standard & Conventions

The single source of truth for how this vault is structured and tagged. Follow it
for every new note so the vault stays uniform and machine-readable. See also
`llms.txt` (vault root) for the AI-facing summary, and
`Meta/Vault Findings & Backlog.md` for known outstanding issues.

**Check compliance any time:**
```
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```
(add `-Detail` to list offending files). `Atlas/Vault Health Report.md` does the same
checks live inside Obsidian.

## 1. Tag casing rules (authoritative)

Tags are normalized with exactly these rules:

| Kind | Rule | Examples |
| --- | --- | --- |
| Course code | **UPPERCASE**, pattern `[A-Z]{2}[0-9]{4}` | `ME1003`, `HH1802`, `HI1029` |
| Acronyms | **UPPERCASE** | `KTH`, `MOC` |
| Type / subject / status | **lowercase** | `begrepp`, `föreläsning`, `ekonomi`, `tenta` |
| Year | `year` + 4 digits, lowercase | `year2024`, `year2026` |
| Hierarchical exam tags | `CODE/CODE<section>`, uppercase throughout | `HH1802/HH1802KS1`, `ME1003/ME1003KS2` |

Rule of thumb: **if it is a course code or a well-known acronym, uppercase it; every
descriptive word is lowercase.**

## 2. Controlled tag vocabulary

Use existing tags rather than inventing synonyms. Current vocabulary:

- Note type: `begrepp` (concept), `föreläsning` (lecture), `lektion` (lesson),
  `övning` (exercise), `labb` (lab), `seminarium` (seminar), `studieguide`,
  `tenta` (exam prep), `övrigt` (misc).
- Subject: `programmering`, `nätverk`, `matematik`, `ekonomi`, `hårdvara`,
  `databaser`, `samhälle`, `säkerhet`.
- Structural: `index` (course index note), `MOC` (map of content), `meta`
  (vault-management notes), `KTH` (all coursework), `year<YYYY>`.
- Functional (plugin): `excalidraw`, `nograph`.
- Course codes: one per relevant course, e.g. `HI1027`. A note may carry more than
  one course code when a concept is shared between courses.

## 3. Frontmatter shape

Every content note starts with YAML frontmatter. Use the **inline array** style for
`tags` (the enforced vault standard), plus ISO `created` / `updated` dates:

```yaml
---
tags: [begrepp, CM1005, ekonomi, KTH, year2024]
description: "Kort mening som sammanfattar begreppet."
created: 2024-03-30
updated: 2024-04-20
---
```

- `description` is a one-sentence summary, used by the published site for search
  results and social previews. **Required on every note in scope** — notes tagged
  `excalidraw` are the only exception, being scope-excluded by section 6. For
  `begrepp` notes it is normally the first sentence of the `## Definition` section;
  for other types it is the first meaningful sentence of the note, or a synthesised
  summary where the note is a structured list (course indexes, `Instuderingsfrågor`).
  Keep it plain text: no wikilink brackets, no flashcard delimiters, and never text
  taken from inside a Dataview block.
- `created` / `updated` are the source of truth for dates and live **only in
  frontmatter** — there is no in-body date line. The Obsidian Linter plugin
  auto-updates `updated` on save, Obsidian's Properties panel shows both, and the
  published Quartz site renders them natively from these two fields.
- Begin the body with a single H1 (`# <Title>`) matching the note name.

Order convention (recommended, not enforced): type → course code(s) → subject →
`KTH` → `year<YYYY>`.

## 4. Folder & note structure

```
KTH/<Year Season>/<CODE Course Name>/
├── _index.md          ← generated course index
├── Anteckningar/      ← study guides, exam prep, labs, projects, protocols
├── Begrepp/           ← one concept per note
├── Filer/             ← attachments: PDF, PNG, Excalidraw (+ Filer/Litteraturlista/)
└── Föreläsningar/     ← all dated session notes (lectures, lessons, exercises)
```

- Exactly **four** category folders — no others. **All four exist in every course**,
  even when empty, for visual uniformity.
- `<Year Season>` uses Swedish seasons `Vår` / `Höst`, e.g. `2025 Höst`.
- `<CODE Course Name>` starts with the uppercase course code, e.g.
  `HI1029 Algoritmer och Datastrukturer`.
- `Föreläsningar/` holds **both** lectures and lessons; the `föreläsning` /
  `lektion` / `övning` tag carries that distinction, not the folder.
- `Filer/` holds every non-note file. Course literature goes in
  `Filer/Litteraturlista/` together with any generated `.opt.md` / `.ai.md`
  conversions and conversion tooling docs.
- New courses: copy the skeleton from `KTH/Kurs Mapp Mall/`.
- `Atlas/` holds subject MOCs, the `Dashboard` and the `Vault Health Report`.
  `Meta/` holds tooling, templates and this standard. `Ericsson/` is work, not studies.

### Note file naming

- Dated session notes: **`YYYY-MM-DD - CODE - Type`**, e.g.
  `2024-12-02 - HE1026 - Föreläsning 14`, `2024-04-16 - HH1802 - Lektion`.
  ISO date first so files sort chronologically; never omit the year.
- Concept notes: the concept name itself, e.g. `Balansräkning`.
- Single spaces only, and the H1 heading must match the filename.

### Concept note body format

Concept (`begrepp`) notes follow one shape. Measured across the 352 concept notes in
the vault: `## Definition` 320, `## Flashcards` 320, `## Kopplat till` 297,
`## Tenta-fokus` 42.

```markdown
# <Concept>

> **Lager:** OSI 2 & 4        ← optional label callouts, used by newer notes
> **Mål:** ...

---

## Definition

The definition, in plain prose. Wiki-link related concepts inline.

### <Sub-heading>          ← optional, for worked examples or sub-topics

## Tenta-fokus             ← optional, only where exam guidance exists

## Kopplat till

- Motsatsen till [[Other Concept]]
- Används vid [[Third Concept]]

## Flashcards

<Term> (Definition):: <answer>
```

- `## Definition` and `## Flashcards` are expected on every concept note;
  `## Kopplat till` on any concept that relates to another.
- The leading `> **Label:**` callouts and the `---` rule after them are **optional**.
  Newer notes use them to surface exam-relevant framing; most older notes do not.
- **`## Flashcards` is always the last section.** This holds in 320 of 320 notes that
  have one, and the published site depends on it — the build-time card transformer
  only rewrites content under that heading.
- `## Tenta-fokus` is **optional**. Add it only where there is real exam guidance;
  most notes do not have one.
- The definition is written as plain prose. Opening with a bold term is allowed but is
  not the house style (15 notes do, 304 do not).
- `## Kopplat till` links **related concepts only**. Do not link study-question lists
  or dated session notes just because they mention the term; that dilutes the graph
  without adding meaning. Leaving it empty is fine when nothing genuinely relates.
- An empty section keeps its heading, so every concept note stays uniform and the
  heading acts as a prompt to fill in later. Empty sections cost nothing on the
  published site — Quartz hides any heading with no content beneath it (see
  `quartz/styles/custom.scss`).
- `## Flashcards` uses obsidian-spaced-repetition syntax (`::`, `;;`, `??`, `||`, and
  `==DISABLEDFLASHCARD==` for a card switched off). **Never** strip these delimiters
  or the `<!--SR:...-->` scheduling comments: they drive a live review schedule. The
  site rewrites cards into collapsible callouts at build time and never touches the
  vault.

**Concept collections are a recognised exception.** Notes named like
`HI1025 Begrepp Föreläsning 2` or `SEM4 Begrepp HF1201` gather many short definitions
into a single note, written directly as flashcards, and have no `## Definition`
section of their own. 32 of the 352 concept notes are of this kind. They are still
tagged `begrepp` and still end with `## Flashcards`.

### Course literature naming (`Filer/Litteraturlista/`)

**`<Titel> <År> [<Region>] Edition <N> <Författare>`** — omit any part that does not
apply, but never reorder the parts that do:

- Year comes **before** the edition; the author always comes **last**.
- Edition is written `Edition <N>` (e.g. `Edition 5`), **not** `5th Edition` and not
  `2a Upplagan`. Keep regional qualifiers before the word: `European Edition 4`.
- No course code (the folder already implies the course) and no trailing spaces.
- Examples:
  `Den Nya Affärsredovisningen 2018 Edition 21.pdf` ·
  `Calculus A Complete Course 2018 Edition 9 Robert A. Adams.pdf` ·
  `Principles of Marketing 2023 Global Edition 19.pdf`
- Companion conversions keep the book's name plus a suffix:
  `<samma namn>.opt.md` / `.ai.md`. Supplements prefix the title, e.g.
  `Solutions Calculus …`, `Den Nya Affärsredovisningen Övningar …`.

## 5. Per-course index note (`_index.md`)

Every course folder contains an `_index.md` at its root that gives a uniform,
Dataview-driven overview of that course.

- Location: `KTH/<Year Season>/<CODE Course Name>/_index.md`
- Frontmatter: `title: "<CODE Course Name>"` (exactly the folder name) plus
  `tags: [index, <CODE>, KTH, year<YYYY>]`. The `title` is required: the published
  site falls back to the filename otherwise, which would render as "_index".
- Body: course metadata + Dataview lists grouped by note type, scoped to the
  course folder. See `Meta/Obsidian Plugins/Templates/Kurs Index Template.md`.

## 6. Out of scope

These are deliberately **exempt** from the rules above — they are not authored study
notes, and audits/health checks must exclude them:

- `_index.md` — generated course indexes (no `created`/`updated`; tags are fixed).
- `Atlas/` MOCs, `Dashboard`, `Vault Health Report`, root `index.md`, `README.md`,
  `Meta/` docs — navigation and vault-management notes (no dates).
- `**/Litteraturlista/**` — PDF→Markdown conversion tooling docs (`CONVERSION_*.md`,
  `FIX_PLAN.md`) and the source PDFs. **Do not delete these — active working files.**
- `*.ai.md` — raw OCR text dumps from the Text Extractor plugin.
- `Ericsson/` — work notes, not coursework.
- `KTH/Kurs Mapp Mall/` — the empty new-course skeleton.

## 7. Adding a new course or note

1. Create the course folder as `KTH/<Year Season>/<CODE Course Name>/` and copy
   the category subfolders from `KTH/Kurs Mapp Mall`.
2. Add `_index.md` from the index template.
3. Create notes from the templates in `Meta/Obsidian Plugins/Templates`; they
   already emit standard-compliant tags.
4. Tag each note with its type, course code, subject, `KTH`, and `year<YYYY>`.
