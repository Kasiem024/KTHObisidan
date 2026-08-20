---
tags: [meta]
---
# 📐 Vault Standard & Conventions

The single source of truth for how this vault is structured and tagged. Follow it
for every new note so the vault stays uniform and machine-readable. See also
`llms.txt` (vault root) for the AI-facing summary, and
`Meta/Vault Findings & Backlog.md` for known outstanding issues.

**Check compliance any time:**

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

(add `-Detail` to list offending files). `Atlas/Vault Health Report.md` does the same
checks live inside Obsidian.

**Check Markdown syntax any time:**

```powershell
npx markdownlint-cli2 "**/*.md"          # report
npx markdownlint-cli2 --fix "**/*.md"    # apply the fixable rules
```

The two tools do different jobs and neither replaces the other: the audit enforces *vault
conventions* (tags, `description`, folder placement, section order), the linter enforces
*Markdown syntax* (blank lines around headings and fences, single trailing newline, no bare
URLs). Expected result: only the deviations listed in `Vault Findings & Backlog.md` F52.

Configuration lives in two files at the vault root, one job each:

- `.markdownlint.json` — which rules apply.
- `.markdownlint-cli2.jsonc` — which files are linted. Note that markdownlint-cli2 does
  **not** read `.markdownlintignore`; that is cli v1 only, and a stray one is silently
  ignored.

Rules deliberately switched off, with reasons, so they are not turned back on by accident:

| Rule | Off because |
| --- | --- |
| MD003 heading style | Mixed ATX styles are harmless here |
| MD007 ul indent | Obsidian writes tab-indented lists |
| MD010 hard tabs | Obsidian writes tabs for nested list items |
| MD013 line length | Notes are prose, not code |
| MD029 ol prefix | Obsidian renumbers lists on edit |
| MD032 lists surrounded by blanks | Too noisy against Obsidian's output |
| MD033 inline HTML | `<!--SR:-->` scheduling comments and `<br>` are required |
| MD036 emphasis as heading | Swedish notes legitimately use `*emphasis*` for notation such as `*Employee N -> worksFor -> 1 Department*` |
| MD024 duplicate headings | Scoped to `siblings_only` only: a course may be listed under two different `##` sections of a MOC, but never twice inside the same section |
| MD025 front-matter title | Set to `""` only: index notes correctly have both a `title:` key and an H1, so the frontmatter title must not count as a second top-level heading |

`Meta/Obsidian Plugins/Templates/` is excluded from linting rather than having rules
disabled for it, because a Templater `<% %>` expression is not valid Markdown until it is
rendered — it can sit inside a URL or a link. That exclusion is what allows MD011 to stay
**on** for real notes.

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
  Keep it plain text prose: no wikilink brackets, no flashcard delimiters, no markdown
  syntax (a `##` heading, a leading `-` or `1.` bullet, a `$...$` formula), never text
  taken from inside a Dataview block, and never a flashcard's question with its answer.
  All of those are **harvest residue** — a generator took the first content line without
  checking it was prose. 21 notes published a heading, a bullet, a formula or a quiz item
  as their `<meta name="description">` before this was enforced; see F56. A card's *answer*
  alone is fine, and often is the right summary for a `begrepp` note.
- `created` / `updated` are the source of truth for dates and live **only in
  frontmatter** — there is no in-body date line. The Obsidian Linter plugin
  auto-updates `updated` on save, Obsidian's Properties panel shows both, and the
  published Quartz site renders them natively from these two fields.
- Begin the body with a single H1 (`# <Title>`) matching the note name.

Order convention (recommended, not enforced): type → course code(s) → subject →
`KTH` → `year<YYYY>`.

## 4. Folder & note structure

```text
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

### MOC heading structure

All ten MOCs use the same three levels, and heading levels are never skipped:

```text
# <Subject> MOC          <- H1, the note name
## Kurser                <- H2 section
### #CODE Course Name    <- H3 per course, then the note links
## KTH-relaterat         <- further H2 sections as needed
### #CODE Course Name
```

A course may appear under two different `##` sections; it must not appear twice inside the
same one. Enforced by markdownlint MD001 and MD024, so it cannot drift back.

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
  not the house style (15 notes do, 305 do not).
- `## Kopplat till` links **related concepts only**. Do not link study-question lists
  or dated session notes just because they mention the term; that dilutes the graph
  without adding meaning. Leaving it empty is fine when nothing genuinely relates.
- An empty section keeps its heading, so every concept note stays uniform and the
  heading acts as a prompt to fill in later. Empty sections cost nothing on the
  published site — Quartz hides any heading with no content beneath it (see
  `quartz/styles/custom.scss`).
- `## Flashcards` uses obsidian-spaced-repetition syntax. **The four separators are not
  interchangeable** — per the plugin's settings, `::` is single-line one-directional, `;;`
  single-line **reversed**, `||` multi-line one-directional and `??` multi-line **reversed**.
  A reversed card also generates a back-to-front card, so rewriting one form into another
  would silently delete half the deck. `==DISABLEDFLASHCARD==` marks a card switched off.
  **Never** change a separator or strip an `<!--SR:...-->` comment: they drive a live review
  schedule. The site rewrites cards into collapsible callouts at build time and never touches
  the vault. It converts cards **anywhere in a note**, not only under this heading, so the
  29 notes that keep their cards elsewhere still publish correctly — but new concept notes
  should still use `## Flashcards` for consistency.

**Concept collections are a recognised exception.** Notes named like
`HI1025 Begrepp Föreläsning 2` or `SEM4 Begrepp HF1201` gather many short definitions
into a single note, written directly as flashcards, and have no `## Definition`
section of their own. 31 of the 352 concept notes are of this kind. They are still
tagged `begrepp` and still end with `## Flashcards`.

### Images and embeds

Every image embed carries **alt text** after a pipe:

```markdown
![[Bostonmatrisen ME1003.png|Bostonmatrisen]]
```

- This is required, not optional. Without it the published site emits `alt=""`, which
  makes the diagram invisible to anyone using a screen reader. The audit reports
  `imageEmbedWithoutAlt`.
- It is native to both tools. Obsidian shows the text as the embed's display name, and
  Quartz's `obsidian-flavored-markdown` parses a **non-numeric** value after the pipe as
  the `alt` attribute — while `|300` still means width, so sizing keeps working.
- Write what the image *shows*, normally the figure's own name. **Drop the course code**:
  the page already establishes the course, so "ME1003" only adds noise when read aloud.
- Image filenames are themselves descriptive (`Kraljics Inköpsmatris ME1003.png`), which
  is what makes the alt text easy to write — keep naming new ones that way.

### Dataview blocks

Quartz cannot run Dataview, so query blocks are hidden on the published site. Always put
**at least one line of prose above a Dataview block**, inside the same section.

Otherwise the section's heading is left with nothing visible beneath it on the web — and it
will not even be hidden by the empty-heading rule in `custom.scss`, because the hidden
query block is still a sibling element. One explanatory sentence fixes it and reads better
in Obsidian too.

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
