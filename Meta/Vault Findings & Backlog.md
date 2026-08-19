---
tags: [meta]
---
# 🧾 Vault Findings & Backlog

Complete record of every issue found in the full read-only audit of **2026-08-17**.
Nothing here is fixed automatically — this is the to-do list. Companion documents:
`Meta/Vault Standard.md` (the rules) and `llms.txt` (the AI entry point).

Scope of the audit: 725 files / 526 Markdown / **501 content notes** (excluding
`.obsidian`, `.trash`, templates, Excalidraw drawings).

Priority key: **P1** = mechanical + safe, do first · **P2** = needs a decision or
touches filenames/links · **P3** = config, workflow, or judgement calls.

---

## 📌 Progress log

### 🧹 2026-08-19 (16) — MARKDOWN LINTING (F52)

Linted all 500 lintable notes: **767 violations → 0**, 220 files fixed. The linter's
defaults needed correcting first — MD011's 8 "reversed links" were Templater expressions,
and MD034's auto-fix genuinely **broke the course template** by splitting a `<% %>`
expression out of a URL (caught and repaired). Excalidraw and templates are now excluded
properly; `.markdownlintignore` turned out to be inert, which had silently linted 36 extra
files. The seven subject MOCs were restructured onto the `# → ## → ###` shape the three year
MOCs already used, so all ten now match. Removed 3 orphaned `<!--SR:-->` comments on request:
1265 → 1262 markers, 0 orphans left, every separator count unchanged, build identical.

### 🃏 2026-08-19 (15) — FLASHCARDS + .KIRO (F50, F51 done)

The flashcard separators must **not** be normalised — `;;` and `??` are the reversed forms and
rewriting them would delete half the deck. The real defect was that **34 notes keep their cards
outside a `## Flashcards` heading** and so published raw `::` syntax; my earlier "0 raw syntax"
check had been scoped too narrowly to see them. The transformer now converts cards anywhere in
a note: leaks 34 → 0, callouts 686 → **1,965**. Also fixed 5 notes with `=this.file.name` as
their H1. Both repos gained a `.kiro/` folder with steering, guard hooks and one agent each.
Nothing open.

### 🧹 2026-08-19 (14) — HOUSEKEEPING (F49 done)

Renamed the `Värdekejda` image at source with both references updated, deleted the merged
`wip/flashcards` branch from both remotes, and added `tools/slim-svg.mjs` to the CI build so
the Excalidraw pages shrink ~23% (site ~105 MB → ~90 MB). The slimming under-delivered
against my 40–50% estimate — coordinates averaged only 3.36 decimals, so integers were
needed to reach 18%. Nothing open.

### 🎯 2026-08-19 (13) — EXAM PRIORITY MAP (F48 done)

`Atlas/Tenta-prioritering.md` ranks concepts by how many distinct question sets reference
them, as a worklist for writing `## Tenta-fokus` (42 of 352 have one; 225 exam-referenced
concepts do not). Built as **one** note, not 225 edits, because the `backlinks` panel
already shows each concept's references — what was missing is the ranking. Also corrects a
metric I got wrong earlier: counting occurrences instead of distinct notes turned 4 into
"39". The real range is 1–7. Nothing open.

### ♿ 2026-08-19 (12) — ACCESSIBILITY (F47 done)

Every image on the site published with `alt=""` — 183 images across 61 pages, invisible to
screen readers. All now carry alt text derived from the already-descriptive filenames, with
the course code dropped. Verified 183 `<img>` tags and **0 without alt**. Documented in the
Standard and enforced by a new `imageEmbedWithoutAlt` audit check. `robots.txt` was
considered and dropped: crawlers only honour it at the domain root, and this is a project
site on a subpath. Nothing open.

### 🔌 2026-08-19 (11) — PLUGIN REVIEW (F46 done)

Enumerated the entire Quartz plugin ecosystem from the npm registry: 53 packages carry the
`quartz-plugin` keyword, 50 of them official, and only **2** third-party packages exist at
all. 49 of the scope's 52 are already installed, so there is nothing meaningful left to add.
Nothing installed or enabled, by the owner's decision — including `stacked-pages`, which was
the one genuine candidate. Also corrected the provenance of the "860 themes" figure and
retired a wrong assumption that the course index pages were dead ends. Nothing open.

### 📚 2026-08-19 (10) — DOCS + ENFORCEMENT (F43, F44, F45 done)

The templates were contradicting the Standard: `Begrepp Template.md` used `**Flashcards:**`
as a bold label, so every **new** concept note would have published its cards as raw `::`
syntax. All seven templates rewritten. The Standard's own concept-note section was written
from memory and has been corrected against a measurement of all 352 concept notes
(`Tenta-fokus` is optional at 12%, not standard; bold-first definitions are not house
style). The audit now enforces `description` and the Flashcards-last invariant, which
found 2 real gaps, and a re-check of all 490 descriptions found 5 genuinely bad ones
(citation text, a heading, a dangling clause, a wrap-truncation) now fixed. `llms.txt`,
`README.md` and the Health Report updated; the Quartz repo gained `PROJECT-NOTES.md`.
Nothing open.

### 📈 2026-08-19 (9) — CONTENT DEPTH + SITE POLISH (F40, F41, F42 done)

Every note in scope now carries a `description` (315 → **488 of 506**; the 18 without
are the scope-excluded `excalidraw` notes). Empty `## Kopplat till` sections went
**129 → 29**, with 319 evidence-based links added across 100 notes and the remaining 29
honestly left alone. Site: `recent-notes` and `tag-list` enabled, footer repointed at
own repos, two unused plugins switched off, empty section headings hidden, term order
now fully reverse-chronological. Nothing open.

### 🎴 2026-08-19 (8) — FLASHCARDS + TERM SORT (F38, F39 done)

Flashcards now render as **collapsible callouts** instead of being hidden: 316 of 326
pages, 686 cards, **0 pages left showing raw syntax**. Five different card formats had
to be handled — see **F38**. The explorer term sort turned out to be **broken** rather
than unverified (it is serialized to the browser and referenced enclosing scope plus an
esbuild helper); fixed in **F39**. Nothing open.

### 🌐 2026-08-18 (7) — PUBLISHING: vault made Quartz-safe (F35, F36 done)

Quartz v5 publishing set up at `C:\dev\KTHObsidianQuartz`. A real build (489 files →
1398 output files) revealed three site-only defects, all fixed: the in-body Dataview date
line on **450 notes**, the `_index` page titles on **all 24 courses**, and 4 protocol
`Tid:` fields. Details in **F35**. Then **F36**: 189 math spans across 31 files rewritten
with `\text{}`, taking the KaTeX warning count from **456 to 0**. Nothing open.

### 🎉 2026-08-18 (6) — AUDIT IS CLEAN

`Vault-Audit.ps1` reports **no deviations from the standard** (469 notes in scope).
F9, F24 closed; F10 left in place at the user's request (they will remove those files
themselves). All items were done or parked as of that point; F36 opened later the same
day during the publishing work.

**2026-08-18 (5) — F15, F29 closed. `brokenWikilinks` is now 0.**
Audit baseline is a single deviation: `missingTypeTag 4` (F9-rest, awaiting your decision).

**2026-08-18 (4) — F6, F18, F20, F30 closed; F8 closed as out-of-scope.**
Audit baseline is now **only 2 deviations**, both awaiting your decision:
`brokenWikilinks 13` (F15 — 9 unwritten concept notes) and `missingTypeTag 4`
(F9-rest — the 2026 Höst landing notes). Everything else reports clean.

**2026-08-18 (3) — VISUAL UNIFORMITY + LITERATURE NAMING:** F31, F32 closed (below).

**2026-08-18 (2) — FOLDER SCHEME MIGRATION + FILENAME STANDARD:** F12, F13, F14 closed.
See those items for detail. 278 files moved, 54 renamed, 0 collisions, 0 data loss.

**2026-08-18 — closed:** F1, F2, F3, F4, F5, F7, F16, F17, F21, F27, F28 · F10 (scope
documented), F11, F19, F25 · F9 (14 of 18), F22 (verified clean — 0 mismatches).
Remaining open: F6, F8, F9-rest (4 landing notes), F11-verify (P1) · F15 (P2) ·
F18, F20, F23, F24, F26, F29, F30 (P3).

**Audit movement 2026-08-17 → 2026-08-18:** broken wikilinks 52 → 26 and unique broken
targets 36 → **10** (all known: the CM1005 PDF + 9 unwritten concept notes — **zero
path-based breakage**) · notes missing dates 224 → 44 (all intentional) · missing type
tag 32 → 11 · missing subject 123 → 7 · noH1 238 → **1** · non-conforming folders → **0** ·
casing violations 0 · out-of-vocabulary tags 0 · list-style frontmatter 0.
Every remaining violation is either an out-of-scope file (`Filer/Litteraturlista/`,
Excalidraw drawings) or a listed open item.

**Scope decision (dates, F1):** `created` / `updated` apply to **study notes under
`KTH/` only**. Generated and navigation files — the 24 `_index.md`, the Atlas MOCs,
`Dashboard`, `Vault Health Report`, `index.md`, `README.md` and `Meta/` docs — are
deliberately left without dates (they are not authored study content). This is why the
audit still reports ~43 notes "missing created"; that is expected, not drift.

---

## ✅ Already verified uniform (do not re-litigate)

Confirmed clean on 2026-08-17 — keep it that way:

| Check | Result |
| --- | --- |
| Tag casing violations | 0 |
| Tags outside the controlled vocabulary | 0 |
| Frontmatter tag style | 100 % inline array (0 list-style) |
| Duplicate tags inside a note | 0 |
| Leftover `=dateformat(this.file.…)` expressions | 0 |
| Courses with `_index.md` | 24 / 24 |
| Study notes missing `KTH` / year / course-code / subject tag | 0 (except 4 junk files, see F10) |
| Notes missing an H1 heading | 4 (all non-study, see F20/F21/F24) |

---

## P1 — Mechanical and safe

### F1. ✅ DONE (2026-08-18) — 235 notes had no `created` / `updated` dates

**Resolved:** 184 study notes backfilled (`created`/`updated` seeded from filesystem
dates + body mirror line). Coverage went 267 → 451 notes. Per the scope decision above,
`_index.md` / MOCs / Dashboard / `index.md` / `README.md` / `Meta` docs were
intentionally excluded. Backups: `%TEMP%\kth_f1_backup`.
Two files were skipped for having no frontmatter: `HH1802/Begrepp/Untitled.md` (see F27)
and `HI1031/…/Litteraturlista/FIX_PLAN.md` (see F10).

<details><summary>Original finding</summary>

The date convention was only ~53 % applied: **267 notes had it, 235 did not**
(224 of those study notes). Only notes that previously had the old Dataview
date block were converted.

Breakdown of notes missing dates:

| Location | Count |
| --- | --- |
| 2024 Vår / CM1005 Extern Redovisning | 130 |
| 2026 Vår / HI1029 Algoritmer och Datastrukturer | 25 |
| 2026 Vår / HE1033 Kommunikationsnät | 21 |
| Atlas | 11 |
| 2024 Vår / ME1003 | 6 |
| 2026 Höst / HI1031 | 6 |
| Ericsson | 6 |
| 2026 Höst / HI2002 | 3 |
| (vault root) | 3 |
| Meta | 2 |
| 2024 Höst / HI1024 · 2026 Höst / EN2720 · 2026 Höst / HI1032 | 2 each |
| 13 other courses | 1 each (the `_index.md` files) |

</details>

### F2. ✅ DONE (2026-08-18) — Folder typo `Billagor`

`KTH/2024 Vår/HU1801 Industriell Marknadsföring/Billagor` renamed to `Bilagor`
(folder was empty; no note linked to it, so no links needed updating).

### F3. ✅ DONE (2026-08-18) — 8 MOC links pointed to old, pre-rename filenames

All 8 link targets were updated to the current filenames. The table below is kept as the
historical record of what was repaired (and as a warning for F13):

| In file | Broken link target | Actual current file |
| --- | --- | --- |
| `Atlas/Hårdvara MOC` | `…/HE1026 Digitalteknik/Lektioner/12-02 Föreläsning 14 HE1026` | `2024-12-02 - HE1026 - Föreläsning 14.md` |
| `Atlas/Hårdvara MOC` | `…/HI1025 Operativsystem/Föreläsningar/03-17 HI1025 Föreläsning 1` | `2025-03-17 - HI1025 - Föreläsning 1.md` |
| `Atlas/Ekonomi MOC` | `…/HH1802 …/Lektioner/05-21 Lektion HH1802` | `2024-05-21 - HH1802 - Lektion.md` |
| `Atlas/Ekonomi MOC` | `…/HU1801 …/Lektioner/04-09 Lektion HU1801` | `2024-04-09 - HU1801 - Lektion.md` |
| `Atlas/Ekonomi MOC` | `…/HU1801 …/Lektioner/03-18 Lektion HU1801` | `2024-03-18 - HU1801 - Lektion.md` |
| `Atlas/Databaser MOC` | `…/HI1030 Databasteknik/Föreläsningar/10-27 HI1030 Föreläsning 1` | `2025-10-27 - HI1030 - Föreläsning 1.md` |
| `Atlas/Programmering MOC` | `…/HI1027 …/Föreläsningar/08-26 Föreläsning 1 HI1027` | `2025-08-26 - HI1027 - Föreläsning 1.md` |
| `Atlas/Programmering MOC` | `…/CM1008 …/Föreläsningar/03-26 CM1008 Föreläsning 4` | `2025-03-26 - CM1008 - Föreläsning 4.md` |

**Fixed by:** updating the link targets in the 4 MOC files (Hårdvara, Ekonomi,
Databaser, Programmering).

### F4. ✅ DONE (2026-08-18) — `Atlas/Dashboard.md` had no frontmatter

Added `tags: [MOC, meta]`, matching the 10 MOCs.

### F5. ✅ DONE (2026-08-18) — Dashboard linked to a non-existent Vault Health Report

Created `Atlas/Vault Health Report.md` — a live Dataview health page that flags notes
missing a subject tag, type tag, `KTH` tag or dates, plus orphans, broken links and a
per-course note count. The Dashboard link now resolves, and future drift surfaces
automatically instead of needing a manual audit.

### F6. ✅ DONE (2026-08-18) — links to a PDF that appeared to be missing

The PDF was never missing — it had simply been **renamed twice**, leaving links pointing
at dead names:

1. `Den nya affärsredovisningen Per Arvidson, Thomas Carrington, Gustav Johed 2018.pdf`
2. `Den nya affärsredovisningen CM1005.pdf`
3. `Den Nya Affärsredovisningen 2018 Edition 21.pdf` ← current (per F32)

**22 references across 16 files** were repointed to the current name: 13 `Begrepp` notes,
1 lecture note, and 3 Excalidraw drawings (which referenced both older names in their
text elements *and* their embedded JSON). Page anchors and selection ranges
(`#page=105&selection=27,0,27,10`) and the citation-style aliases were preserved.
Backups: `%TEMP%\kth_f6_backup`. This removed the last cluster of broken links —
`brokenWikilinks` dropped 26 → 13 (the remainder is all F15).
<details><summary>Original finding</summary>

Target: `Den nya affärsredovisningen CM1005.pdf`, referenced from 13 CM1005 notes:
`BAS-kontoplan`, `Dubbel Bokföring`, `Intäkt`, `Utbetalning`, `Utgift`, `Kostnad`,
`T-Konton`, `Inbetalning`, `Inkomst`, `Preliminär Skatt`, `Varutransaktion`,
`Semesterlön`, `Lektioner/02-19 Lektion CM1005`.
**Fix:** add the PDF to the course `PDFs` folder, or convert the links to plain text
citations.

</details>

### F7. ✅ DONE (2026-08-18) — Study note with two H1 headings

`KTH/2026 Vår/HF1012 Matematisk Statistik/Anteckningar/LABA Begrepp 1.md` — the second
heading (`LABA Begrepp - Kategori 1 (Grundläggande)`) was demoted to `##`.
Verified against the pre-edit backup that **both H1s pre-existed** the 2026-08-17 work;
the H1 script correctly skipped this file.
(Remaining multi-H1 files are the OCR/working/Ericsson files in F10/F24 — lower priority.)

### F8. ✅ CLOSED (2026-08-18) — not applicable

`Ericsson/Overview.md`, `Ericsson/Onboarding.md` have frontmatter but no tags. Since
`Ericsson/` is out of scope per `Meta/Vault Standard.md` §6 (work notes, not coursework),
this is not a standard violation. The audit script now excludes `Ericsson/`, so these no
longer appear. Reopen only if you decide work notes should get their own tag vocabulary
(F24).

### F9. ✅ DONE (2026-08-18) — notes with no note-type tag

**Resolved (14 on 2026-08-18):** `tenta` added to the 6 `Instuderingsfrågor…` notes
(HI1024, CM1005, ME1003 ×4); `övrigt` added to the 3 `Generella Anteckningar` notes,
`Instruktioner HE1028`, and `Protokoll 1–4 från Gruppmöte`.
Backups: `%TEMP%\kth_f9_backup`.

**Resolved (last 4) — landing notes merged into `_index.md`:** the four 2026 Höst courses
had both a curated landing note and a generated index, i.e. two hubs per course that
would drift apart. Decision: **merge**. Each `_index.md` now carries the curated
Kursinfo (hp, period, startdatum, examination) inside its `> [!info]` callout, plus
`## 📚 Litteratur` (with ISBNs) and `## 🔗 Länkar` (MOC links), while keeping the five
standard Dataview sections unchanged. The landing notes' subject tags were folded into the
index frontmatter (e.g. `[index, EN2720, KTH, nätverk, säkerhet, year2026]`), which also
makes the course indexes discoverable from the subject MOCs.

6 inbound links were repointed first (4 in `Atlas/2026 MOC`, 2 in `Atlas/Nätverk MOC`),
then the 4 landing notes were deleted — only after verifying every index contained the
merged content and that 0 inbound links remained. Backups:
`%TEMP%\kth_f9_landing_backup`. There is now exactly **one hub per course**.

<details><summary>Original list of 21</summary>

- `2024 Höst/HI1024/Anteckningar/Instuderingsfrågor och Svar TENA HI1024`
- `2024 Vår/CM1005/Anteckningar/Instuderingsfrågor Ten Del C CM1005`
- `2024 Vår/CM1005/Anteckningar/Generella Anteckningar CM1005`
- `2024 Vår/ME1003/Anteckningar/` → `Instuderingsfrågor och Svar Kap 1-7`, `Kap 8-9`,
  `Kap 10-12`, `Kap 14-16`, `Generella Anteckningar ME1003`
- `2025 Vår/HE1028/Anteckningar/Instruktioner HE1028`
- `2025 Vår/CM1008/Anteckningar/Protokoll 1–4 från Gruppmöte` (4 notes)
- `2026 Höst/` landing notes: `HI2002 Routing i IP-nät`, `EN2720 Etisk hackning`,
  `HI1032 Kommunikationssystem`, `HI1031 Distribuerade informationssystem`
  → these should probably be `index`
- the 4 junk files in F10

</details>

### F11. ✅ DONE (2026-08-18) — 12 folder wikilinks that could not resolve

Each of the 4 landing notes had a "📂 Undermappar" list of 4 folder wikilinks (Obsidian
cannot link a folder). Replaced with a cross-link to the course `_index` plus a Dataview
listing of the course's notes — self-maintaining and no longer broken. This accounted for
most of the broken-link drop (43 → 27).
**Verify in Obsidian:** confirm the new Dataview lists render (they are empty until the
2026 Höst courses have notes, which is expected).

### F10. ⏸️ PARKED (2026-08-18) — user will remove these files personally

**Decision:** leave everything in `Filer/Litteraturlista/` untouched. The user will
delete what they no longer need themselves. **Do not touch these files.**
They are out of scope per `Meta/Vault Standard.md` §6, so they do not affect the audit.
**Update 2026-08-18 (late):** the other agents **moved their pdf2md work out of Google
Drive**. The pipeline is no longer run from inside the vault, but **6 files remain**:

`KTH/2026 Höst/HI1031 …/Filer/Litteraturlista/`
- `CONVERSION_INSTRUCTIONS.md`, `CONVERSION_INSTRUCTIONS_THIS_LAPTOP.md`,
  `CONVERSION_LOG.md`, `FIX_PLAN.md` — process docs for a pipeline that now lives elsewhere
- `Distributed Systems Concepts and Design 2012 Edition 5.opt.md` (3.1 MB)
- `VAULT_CHANGES_CONTEXT.md` — the handoff note written for those agents

`KTH/2026 Höst/HI2002 …/Filer/Litteraturlista/`
- `CCNP and CCIE Enterprise Core ENCOR 350-401.opt.md` (1.9 MB)

**Decision needed now that the work has moved out:**
- The 4 tooling docs + `VAULT_CHANGES_CONTEXT.md` are stale process documentation →
  move them to the external project, or delete them from the vault.
- The 2 `*.opt.md` book conversions are arguably **useful study material** (searchable
  book text). Keep them in `Filer/Litteraturlista/` (already out of scope for the
  standard), or move them out with the rest of the pipeline.
- They are the sole remaining cause of the ~6 raw-audit "violations" (see F30).

⚠️ **History:** three `CONVERSION_*.md` files were deleted in error on 2026-08-17 and
restored by the user from Google Drive trash. Ask before deleting anything here.

<details><summary>Original finding (reclassified from "junk")</summary>

`KTH/2026 Höst/HI1031 …/04 Kursinfo & Tenta/Litteraturlista/`
- `FIX_PLAN.md` (9 KB) — "Fix & Optimization Plan — pdf2md books", status *PREP ONLY*,
  written 2026-08-17. An active working document.
- `CONVERSION_LOG.md` (19 KB) — conversion history and measurements
- `CONVERSION_INSTRUCTIONS_THIS_LAPTOP.md` (12 KB) — annotated plan
- `CONVERSION_INSTRUCTIONS.md` (3 KB)
- (alongside `Distributed Systems … 5th Edition.pdf`, 5.8 MB)

`KTH/2026 Höst/HI2002 …/Litteraturlista/CCNP and CCIE Enterprise Core ENCOR 350-401.ai.md`
— a ~1.95 MB OCR text dump produced by the Text Extractor plugin (5 H1s, no frontmatter).

⚠️ **History:** the three `CONVERSION_*.md` files were deleted in error on 2026-08-17 and
restored by the user from Google Drive trash. Do not delete anything in this folder.

These 6 files are the sole remaining cause of the "missing KTH/year/code/subject" and
several multi-H1 counts. **Partly resolved (2026-08-18):** the preferred option was
implemented — `Meta/Vault Standard.md` §6 now declares `**/Litteraturlista/**` and
`*.ai.md` out of scope, and `Atlas/Vault Health Report.md` excludes them from every
query. **Still open:** decide whether to *move* the tooling docs to `Meta/` (they are
process docs, not course content). Until then they will keep appearing in raw
whole-vault audits that do not apply the exclusions.

</details>

### F11-old. (superseded — see F11 above)

The four 2026 Höst landing notes each linked to their 4 category folders. Fixed.

---

## P2 — Structural: needs a decision, touches filenames/links

### F12. ✅ DONE (2026-08-18) — three competing folder schemes unified

**New standard — exactly 4 category folders, created on demand:**
`Anteckningar/` · `Begrepp/` · `Filer/` (+ `Filer/Litteraturlista/`) · `Föreläsningar/`

What changed:
- `Lektioner/` merged into `Föreläsningar/` (the year-based split is gone; the
  `lektion` / `föreläsning` / `övning` **tag** now carries the distinction).
- `Bilagor/` + `PDFs/` + `Journal/` + `Excalidraw/` merged into `Filer/` — one place
  for all 191 attachments, and notes are cleanly separated from binaries.
- The numbered `01–04` scheme (2026 Höst) was dropped; it was empty scaffolding
  (`01`, `02`, `03` were empty in all 4 courses).
- `Litteraturlista` normalised to `Filer/Litteraturlista/` in all 13 courses that
  have literature.
- **161 empty folders removed**, so a course now only shows folders it actually uses.
- Rationale for no numbering: numbers bake ordering into paths, so re-ordering breaks
  links; with 4 folders alphabetical order is enough.

Result: **0 non-conforming folders** across all 24 courses.
Documented in `Meta/Vault Standard.md` §4 and `llms.txt`.
⚠️ **Note:** the empty-folder sweep also deleted `KTH/Kurs Mapp Mall` (it consisted
only of empty folders — no files lost). It was **recreated** with the new 4-folder
skeleton plus `Filer/Litteraturlista`.

<details><summary>Original finding (three schemes)</summary>
| Scheme | Courses | Folder names |
| --- | --- | --- |
| 2024 (8 courses) | HE1026, HF1005, HF1006, HI1024, CM1005, HH1802, HU1801, ME1003 | `Lektioner`, `Begrepp`, `Anteckningar`, `Bilagor`, `Journal`, `Excalidraw`, `PDFs` |
| 2025 + 2026 Vår (12) | CM1000, HI1027, HI1030, SF1686, CM1008, HE1028, HF1201, HI1025, HE1033, HF1012, HI1029, HI1039 | `Föreläsningar` (instead of `Lektioner`), otherwise as above |
| 2026 Höst (4) | EN2720, HI1031, HI1032, HI2002 | `01 Föreläsningar`, `02 Begrepp & Frågor`, `03 Labb & Projekt`, `04 Kursinfo & Tenta` |

Distinct counts: `Begrepp` 20 · `Anteckningar` 20 · `PDFs` 20 · `Bilagor` 19 ·
`Excalidraw` 13 · `Föreläsningar` 12 · `Journal` 12 · `Lektioner` 8 · numbered set 4 each.

`Lektioner` vs `Föreläsningar` is partly legitimate (lessons vs lectures), but it is
applied by year rather than by content type. **Decision needed:** pick one scheme
(the numbered one from `KTH/Kurs Mapp Mall` is the newest and sorts predictably) and
migrate, or formally document the per-era split as intentional.
⚠️ Renaming folders breaks every path-based wikilink and every `FROM "path"` Dataview
query inside the affected `_index.md` files — must be done together.

</details>

### F13. ✅ DONE (2026-08-18) — one lecture-filename convention

All dated session notes now use **`YYYY-MM-DD - CODE - Type`**
(e.g. `2024-10-28 - HE1026 - Föreläsning`, `2024-04-16 - HH1802 - Lektion`).
- **54 files renamed** from the year-less `MM-DD Type CODE` form.
- **54 H1 headings synced** to the new filenames (they had kept the old titles —
  including the 12 files renamed earlier, whose H1s were already stale).
- **14 inbound links rewritten** across 5 files (MOCs + self-references); done in the
  same pass as the folder move so nothing was left half-updated.
- Verified afterwards: **zero path-based broken links** remain.
Documented in `Meta/Vault Standard.md` §4 ("Note file naming").
**Exempt:** the 12 `*.excalidraw.md` drawings in `Filer/` keep their original
`MM-DD …` names — they are attachments, not session notes.

### F14. ✅ DONE (2026-08-18) — double spaces in filenames

Fixed automatically by the F13 rename (whitespace is collapsed), including
`10-28  Föreläsning HE1026` and `10-29  Föreläsning HE1026`, plus two H1 headings that
also contained double spaces.

### F31. ✅ DONE (2026-08-18) — all 4 folders now exist in every course

The migration created folders on demand, which left some courses showing only 1–2 of the
four. Per user preference for **visual uniformity**, **47 missing folders** were created
so all 24 courses now show `Anteckningar` · `Begrepp` · `Filer` · `Föreläsningar`.
Verified: **0 courses missing any folder**. `Meta/Vault Standard.md` §4 updated to state
that all four always exist, even when empty.

### F32. ✅ DONE (2026-08-18) — one naming convention for all course literature

Determined the dominant format from the existing 28 files, then applied it everywhere.

**Convention: `<Titel> <År> [<Region>] Edition <N> <Författare>`**
Evidence for the choice: year-before-edition **10 files** vs edition-before-year 4;
`Edition N` **8 files** vs `Nth Edition` 6; author last in every file that names one.

**13 files renamed**, e.g.
- `Calculus A Complete Course 9th Edition 2018 Robert A. Adams` → `… 2018 Edition 9 Robert A. Adams`
- `Databases Illuminated 4th Edition 2022 Catherine M. Ricardo` → `… 2022 Edition 4 …`
- `Data Communications and Networking 2013 5th Edition` → `… 2013 Edition 5`
- `Miljöteknik För en Hållbar Utveckling 2a Upplagan` → `… Edition 2`
- `C Programming 2008 Editiion 2 K N King` → typo `Editiion` fixed
- `Operating Systems Three Easy Pieces HI1025` / `Arbete och Teknik … HF1201` → course
  code dropped (the folder already implies the course)
- two `Principles of Marketing …` files had **trailing spaces** removed
- the paired `Distributed Systems … .opt.md` conversion was renamed alongside its PDF

Verified afterwards: **0** files with `Nth Edition`, `Upplagan`, the `Editiion` typo,
trailing spaces, or embedded course codes.

⚠️ **Check your pdf2md pipeline:** 4 filename references were updated inside
`CONVERSION_INSTRUCTIONS.md` and `CONVERSION_INSTRUCTIONS_THIS_LAPTOP.md`, but if any
script **outside** the vault hardcodes the old PDF names it will need updating.
Book conversions (`*.opt.md`, `*.ai.md`) were deliberately **not** text-edited, so the
books' own title pages still read e.g. "5th Edition" — that is book content, not metadata.

**Scope note:** this covered `Filer/Litteraturlista/` (course textbooks). The seminar
reading PDFs in `HF1201/Filer/SEM1–SEM5` are academic articles in author-year citation
style (e.g. `Malmodin et al 2014 - Life Cycle Assesment of ICT.pdf`) and were left alone
— tell me if you want those standardised too.

### F30. ✅ DONE (2026-08-18) — audit is now a permanent script with scope exclusions

Saved as **`Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`** (no longer a throwaway in
`%TEMP%`). Run it any time:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

Add `-Detail` to list offending files; `-Root <path>` if auto-detection fails (it walks
up from the script until it finds `KTH/`).

It checks frontmatter, tag casing + vocabulary, duplicate tags, `created`/`updated`,
H1 count, leftover Dataview date syntax, path-derived tags (KTH / year / course code /
type / subject), broken wikilinks, folder conformance, per-course `_index.md`, and
literature filename rules — and it applies the §6 scope exclusions
(`Litteraturlista`, `*.opt.md` / `*.ai.md`, `Ericsson/`, templates, `Kurs Mapp Mall`,
`_index.md`, notes tagged `excalidraw`, and navigation notes for the date checks).

**Baseline after this cleanup: only 2 deviations**, both tracked and awaiting decisions —
`brokenWikilinks 13` (F15) and `missingTypeTag 4` (F9-rest). Everything else is clean, so
any new number is real drift.

### F15. ✅ DONE (2026-08-18) — all broken concept links resolved

**Key finding:** most of these were **not missing notes** — they were links to notes that
already existed under fuller names. Writing new notes would have created duplicates.

**Repointed to existing notes (5 targets):**

| Broken link | Actual existing note |
| --- | --- |
| `Instickssortering` | `Instickssortering (Insertion sort)` |
| `Urvalssortering` | `Urvalssortering (Selection sort)` |
| `IPv4` | `IPv4 och IPv6` |
| `CIDR Notation` | `Subnätning och CIDR` |
| `Big O Notation` + `Tidskomplexitet (Big O) - Snabbguide` | `Tidskomplexitet (Big O)` (the two duplicates collapsed into one link) |

Links use the alias form (`[[Instickssortering (Insertion sort)|Instickssortering]]`) so
the display text stays short.

**Written from scratch (3 notes, HE1033 / nätverk):**
- `Begrepp/RIP.md` — distance vector, hop count, 15-hop limit, RIPv1/v2/ng,
  count-to-infinity + split horizon / route poisoning / hold-down, UDP 520, vs OSPF
- `Begrepp/HTTP.md` — client-server, stateless, TCP 80 / HTTPS 443, methods, status-code
  classes, HTTP/1.0 → 1.1 keep-alive → 2 multiplexing → 3 over QUIC
- `Begrepp/Sliding Window.md` — window mechanics, Stop-and-Wait as $W=1$, Go-Back-N
  $2^k-1$ vs Selective Repeat $2^{k-1}$ (matching the formulas already in
  `ARQ-protokoll`), throughput $\frac{W \cdot L}{RTT}$, TCP receive window

All three follow the house format exactly: frontmatter + `created`/`updated`, H1, date
mirror line, callout with two `> **Label:**` rows, `---`, `## Definition` with the term in
bold, `## Tenta-fokus`, `## Kopplat till`, and `## Flashcards` using the `::` / `(3)::`
delimiters. **Result: `brokenWikilinks` 13 → 0.**

<details><summary>Original finding</summary>
Normal Obsidian "planned notes", listed so they are not forgotten:

| Missing note | Referenced from |
| --- | --- |
| `Urvalssortering` (3×) | HI1029 `Stabilitet (Sortering)`, `Tidskomplexitet (Big O)` |
| `Instickssortering` (2×) | HI1029 `Stabilitet (Sortering)` |
| `RIP` (2×) | HE1033 `OSPF`, `Routing-principer` |
| `Big O Notation` | HI1029 `Tidskomplexitet Begrepp` |
| `Tidskomplexitet (Big O) - Snabbguide` | HI1029 `Tidskomplexitet Begrepp` |
| `IPv4` | HE1033 `Subnätning Begrepp` |
| `CIDR Notation` | HE1033 `Subnätning Begrepp` |
| `HTTP` | HE1033 `OSI-modellen` |
| `Sliding Window` | HE1033 `ARQ-protokoll` |

Note `Stabilitet (Sortering)` links `Instickssortering` and `Urvalssortering` twice each
— deduplicate while writing them.
**Fix:** write the notes, or unlink. (`tool.uv.index` in `Ericsson/EricAI.md` is a false
positive — it is code, not a wikilink.)

</details>

### F29. ✅ DONE (2026-08-18) — health report reviewed and Excalidraw excluded

User confirmed the report renders correctly in Obsidian. Per request, **all Excalidraw
drawings are now excluded** — they are special files, not authored notes. Verified that
all 17 `*.excalidraw.md` files carry `tags: [excalidraw]`, so every query now uses
`FROM "KTH" AND !#excalidraw` plus a `!contains(file.name, ".excalidraw")` guard (which
also catches `CM1008 Lean Canvas Grupp 10.md`, an Excalidraw drawing not named
`*.excalidraw.md`). `*.opt.md` was added to the exclusions at the same time, and the
report now points to `Vault-Audit.ps1` for the same checks outside Obsidian.

---

## P3 — Config, workflow, judgement

### F16. ✅ DONE (2026-08-18) — Linter timestamp rule enabled by user

`created` / `updated` now auto-update on save (Linter → *YAML timestamp*, keys `created`
/ `updated`, format `YYYY-MM-DD`, lint on save). The dynamic + AI-readable date design is
complete: values live in frontmatter, the body mirrors them via Dataview.

### F17. ✅ DONE (2026-08-18) — template folder paths verified after reload

`.obsidian/templates.json` → `Meta/Obsidian Plugins/Templates` and Templater's
`templates_folder` / `user_scripts_folder` → `Meta/Obsidian Plugins/…` survived the
reload (verified by reading the JSON back). Templates are reachable again.

### F18. ✅ DONE (2026-08-18) — `CM1008 Meeting Template` year now dynamic

`year2025` replaced with `year<% tp.date.now("YYYY") %>`. The `CM1008` course tag is kept
deliberately — it is a course-specific template.

### F19. ✅ DONE (2026-08-18) — `Föreläsning Template` course link now resolves

The template now emits a `**Kurs:**` wikilink to the course `_index.md`
(`KTH/<termin>/<kurs>/_index`) instead of a bare course code that matched no note.

### F25. ✅ DONE (2026-08-18) — `README.md` now points to the key entry files

Added frontmatter plus a "Var man börjar" table linking `llms.txt`,
`Meta/Vault Standard.md`, `Meta/Vault Findings & Backlog.md`, `Atlas/Dashboard.md` and
`Atlas/Vault Health Report.md`.

### F20. ✅ DONE (2026-08-18) — `NotebookLM Ideas.md` moved out of the vault root

Now `Meta/NotebookLM Ideas.md` with `tags: [meta, övrigt]`, an H1, and the scratch
content restructured into headed sections (topics + the draft Kiro prompt as a
blockquote). Verified 0 inbound links before removing the root copy. The vault root now
holds only `README.md`, `index.md` and `llms.txt`.

### F21. ✅ DONE (2026-08-18) — `index.md` oddities

Tag normalised from the quoted `"#nograph"` form to plain `nograph` (+ `meta`), and an
`# Index` heading added. **Still open:** decide whether `index.md` or
`Atlas/Dashboard.md` is the canonical entry point — both exist and overlap. `index.md`
is a static tag list; the Dashboard is the live Dataview version. Recommend keeping the
Dashboard and reducing `index.md` to a pointer (or deleting it).

### F27. ✅ DONE (2026-08-18) — empty stray note deleted

`KTH/2024 Vår/HH1802 …/Begrepp/Untitled.md` (0 bytes, created 2026-08-18) deleted with
the user's approval.

### F28. ✅ DONE (2026-08-18) — vault docs polluted their own audits

`Meta/Vault Standard.md` and `Meta/Vault Findings & Backlog.md` quote the syntax they
describe (`=dateformat(this.file.…)`, the `= this.created` mirror, double-bracket link
examples), which made naive audits count them as real violations and broken links.
Literal double-bracket examples have been reworded. **Remaining known false positives**
in any future audit — treat as expected, not drift:
- `leftoverOldDataviewDates` = 1 (`Vault Findings & Backlog.md` quotes the old syntax)
- `mirrorWithoutFrontmatterDates` = 2 (both docs quote the mirror line)

### F29-old. (merged into F29 above — done)

The report's Dataview queries were unverified when written; user confirmed 2026-08-18.

### F22. ✅ DONE (2026-08-18) — subject tags cross-checked, vault is clean

Every note's subject tags were compared against its course's expected subject(s):
**0 mismatches**. The `ekonomi`-in-a-programming-course error on
`Instuderingsfrågor TENA HI1024.md` (fixed 2026-08-17) was the only one.
Re-run this check after bulk tag edits. Reference map (a course may have several):
`programmering`: HI1024, HF1005, CM1008, HI1025, HI1027, HI1029, HI1039, HI1031 ·
`matematik`: HF1006, SF1686, CM1000, HF1012 ·
`ekonomi`: ME1003, CM1005, HU1801, HH1802 ·
`hårdvara`: HE1026, HE1028 ·
`nätverk`: HE1033, HI2002, HI1032, EN2720 ·
`databaser`: HI1030, HI1031 · `säkerhet`: EN2720 · `samhälle`: HF1201.

### F23. ✅ DONE (2026-08-18) — support folders no longer inconsistent

Obsolete after F12/F31: `Journal`, `Bilagor`, `PDFs` and `Excalidraw` no longer exist —
they were merged into `Filer/`, and all 24 courses now have the same four folders.

### F24. ✅ DONE (2026-08-18) — `Ericsson/` confirmed out of scope

User confirmed: `Ericsson/` is work, not coursework, and stays exempt from the vault
standard. It is listed in `Meta/Vault Standard.md` §6 and excluded by both
`Vault-Audit.ps1` and `Atlas/Vault Health Report.md`. The 6 work notes there keep their
own free-form structure; no action needed (closes F8 too).
6 work notes: 4 with no frontmatter (`New Backlog`, `Kiro Loop`, `prompts`, `EricAI`),
2 with frontmatter but no tags (`Overview`, `Onboarding`), 2 missing an H1, several with
multiple H1s. **Decision taken:** `Ericsson/` is now listed as out of scope in
`Meta/Vault Standard.md` §6 (it is work, not study), and the health report excludes it.
**Confirm** this is what you want — the alternative is giving work notes their own tag
vocabulary. Note these files still inflate counts in raw whole-vault audits.

### F25-old. (merged into F25 above — done)

`README.md` was minimal and undated. Resolved 2026-08-18.

### F26. ✅ DONE (2026-08-18) — `KTH/Kurs Mapp Mall` rebuilt to the new scheme

It previously used the numbered `01–04` folders, so every new course inherited a scheme
none of the existing courses used. It now contains exactly
`Anteckningar` · `Begrepp` · `Filer` (+ `Filer/Litteraturlista`) · `Föreläsningar`.

---

### F35. ✅ DONE (2026-08-18) — vault made publish-safe for Quartz v5

Setting up publishing at `C:\dev\KTHObsidianQuartz` (Quartz **v5.0.0**, branch `v5`)
exposed three defects that only showed up in the rendered site. Evidence came from an
actual build of this vault: 489 Markdown files → 1398 output files.

**1. The in-body date line was broken on every page (450 notes).**
The line paired `**Skapad:**` with the Dataview inline expression `= this.created`, and
`**Uppdaterad:**` with `= this.updated`. Quartz does not run Dataview, so it published as
the literal text `= this.created`, and it also leaked into the `og:description`
social-preview tag.
**Removed from all 450 notes** plus `Annotator Template.md`. Quartz reads `created` and
`updated` straight from frontmatter (its `Frontmatter` plugin accepts `updated` as an
alias for the modified date), so dates still display — natively, and correctly.
Obsidian's own Properties panel shows them in-app. `Vault Standard.md` §3 updated.

**2. All 24 course pages were titled `_index`.**
`_index.md` *does* become the folder page in Quartz v5 (it slugifies to `index.html`),
but with no `title:` frontmatter Quartz falls back to the filename. Added
`title: "<CODE Course Name>"` to all 24, derived from the folder name, and to
`Kurs Index Template.md` so new courses comply automatically. `Vault Standard.md` §5
updated to make `title` required on index notes.

**3. Four meeting protocols used a `Tid:` label followed by `= this.created`.**
Replaced with each file's literal `created` date (2025-03-19, -21, -26, -29).

Excluded from the site via `ignorePatterns`: `Litteraturlista` (copyrighted textbooks,
OCR dumps, conversion tooling), `Meta`, `.excalidraw.md` sources, `.trash`,
`Kurs Mapp Mall`. Third-party analytics disabled.

**Fixed in F36:** the 456 KaTeX warnings from Swedish characters inside math mode.

### F36. ✅ DONE (2026-08-18) — Swedish text in math mode wrapped in `\text{}`

The Quartz build emitted **456** `unicodeTextInMathMode` warnings: Swedish economics
formulas were written as bare words inside math mode, e.g.

```text
Balanslikviditet = \frac{Omsattningstillgangar}{Kortfristiga \, Skulder}
```

KaTeX set every letter as an italic single-letter *variable*, which is both ugly and
semantically wrong. Words are now wrapped in `\text{...}`:

```text
\text{Balanslikviditet} = \frac{\text{Omsattningstillgangar}}{\text{Kortfristiga} \, \text{Skulder}}
```

**189 math spans across 31 files** (CM1005, HH1802, ME1003, HI1025). Scope was limited
to math spans containing at least one non-ASCII letter — deliberately, because a blanket
sweep would have wrapped genuine two-letter maths variables like `dx` in the
mathematics courses. LaTeX commands were protected before substitution, so `\frac`,
`\,` and friends are untouched, and single-letter variables (`g`, `P/E`, `R_{E}`,
`q_{v}`) correctly stay in math mode.

Verified: **456 warnings -> 0**, build exit 0, no `katex-error` on any converted page.

Also fixed while here: one genuine KaTeX parse error in
`LABA Uppgift 1 HI1029`, where two display-math blocks were concatenated
(`...\frac{1}{12}n$$$$O(n^4)$$`) and rendered as a red error box.

**Residual, accepted:** formulas whose words are pure ASCII (e.g. WACC's
`Totalt \, Kapital`) still render italic. They produce no warnings, so they were left
alone; extending the sweep to them is a cosmetic follow-up.

### F37. ✅ DONE (2026-08-18) — site polish: PDFs, drawings, descriptions, auto-publish

Quartz-side and vault-side improvements, all verified by a real build:

- **Stopped publishing 83 course PDFs (262 MB).** `Filer/` and `Filer/SEM2/` held
  scanned textbook chapters (`Miljöteknik … Kap 2-5`, `Gulliksson & Holmgren … kap 6.6`,
  `Räkneövningar Frågor Kap 10-12`) and lecturer slide decks. The `Litteraturlista`
  exclusion never covered these. Site went **327.7 MB → 104.9 MB**. The files stay in
  the vault, so Obsidian links still work. Note: 30 of the 83 were referenced by notes,
  so those 30 links are now dead **on the website only**.
- **Excalidraw drawings render instead of 404ing.** Installed and enabled
  `@quartz-community/obsidian-plugin-excalidraw` and stopped excluding
  `*.excalidraw.md`; **18 drawing pages** now build. 7 were already referenced by
  notes and had been broken. The 9 unreferenced PNG auto-exports are excluded as
  redundant (one was 8.1 MB).
- **`description:` frontmatter on 315 `begrepp` notes**, derived from the first
  sentence of each note's `## Definition`. Feeds Quartz search and the
  `og:description` / `meta description` tags, which previously scraped body text.
  37 notes were skipped because they are multi-concept collections with no single
  definition (e.g. `HI1025 Begrepp Föreläsning 4`); 123 non-`begrepp` notes untouched.
- **Publishing is now one push.** `deploy.yml` runs
  `git submodule update --remote --recursive content` and has an hourly `schedule:`
  plus `workflow_dispatch`, so a plain `git push` in the vault publishes on its own —
  no submodule pointer bump, no secrets.
- **Theme:** `hackthebox` (dark-only), so the light/dark toggle is disabled.
- **Three real typos fixed** in ME1003 exam formulas: `Särinäkt`→`Särintäkt` (6),
  `Täckninsgrad`→`Täckningsgrad` (2), `Netoonuvärde`→`Nettonuvärde` (2).
- **Math pass 2:** 89 more spans across 21 files wrapped in `\text{}`, covering the
  ASCII-only formulas F36 left behind (e.g. WACC's `Totalt \, Kapital`). Scoped to
  CM1005 / HH1802 / ME1003 / HU1801 only — a blanket sweep would wrap real
  two-letter variables like `dx` in the maths courses.

**Unverified:** the explorer term sort (`quartz.ts`). The explorer renders
client-side from `contentIndex.json`, so a server-side `sortFn` may have no effect.
Needs eyeballing in a browser; if `2024 Höst` still precedes `2024 Vår`, it did nothing.

### F38. ✅ DONE (2026-08-19) — flashcards render as collapsible callouts

Flashcards are no longer hidden. Each card is rewritten at build time into a
collapsed Obsidian callout, so they became a study feature on the site instead of
noise.

**Implementation:** a local Quartz transformer at
`C:\dev\KTHObsidianQuartz\plugins\flashcards\` (plain ESM, no build step — but the
`package.json` still needs a no-op `build` script or `quartz plugin install`
fails). It uses the `textTransform` hook to rewrite cards into
`> [!question]- Q` / `> A` **before** markdown parsing, at `order: 25` so it runs
ahead of `obsidian-flavored-markdown` (30).

Callouts rather than raw `<details>`: callout bodies are still parsed as markdown,
so LaTeX, wikilinks, bold and **list answers** keep working. Raw HTML bodies would
not be, because `enableInHtmlEmbed` is `false`. Only content under `## Flashcards`
is touched, since Dataview inline fields elsewhere also use `::`.

**Five card forms had to be handled** — the first attempt only did the first one
and left 114 pages showing raw syntax:

1. `Question:: Answer` and `Question;; Answer` — single line.
2. `Question ??` — separator trailing the question line.
3. A **bare** `??` / `||` alone on its own line, with the question on the preceding
   line(s) and the answer (often a markdown list) below. This was the big miss.
4. `DISABLED` / `==DISABLEDFLASHCARD==` standing in for a separator, marking cards
   switched off for review. Structurally identical cards, so they now render like
   any other and the marker is dropped — a reader does not care about review state.
5. The same disabled marker used **inline** in place of `::` on one line.

Also: scheduler-only `<!--SR:...-->` lines are dropped, and `###` subsections
inside the Flashcards section no longer stop the transform.

**Verified:** 326 pages have a Flashcards section → **316 render collapsible
question callouts, 10 sections are genuinely empty (heading only), 0 pages show raw
card syntax**, 686 callouts total. The CSS that used to hide flashcards has been
removed from `quartz/styles/custom.scss`; only the Dataview hiding remains.

The vault is untouched, so the spaced-repetition schedule and its `<!--SR:-->` data
are intact.

### F39. ✅ DONE (2026-08-19) — explorer term sort now survives serialization

The `quartz.ts` sort override from F37 was **broken**, not merely unverified. The
explorer ships the comparator to the browser via `sortFn.toString()`, so it must be
entirely self-contained. The first version referenced a regex, a season lookup table
and a helper function from the enclosing scope — all `undefined` client-side — and
esbuild additionally wrapped the named inner helper in its `__name()` helper, which
also does not exist once the string is rebuilt. It would have thrown.

Everything is now inline inside the function body. Verified from the emitted HTML
that the serialized source contains no `__name` and no free identifiers.

Sorting: newest year first, `Vår` before `Höst` within a year, term folders grouped
above unrelated siblings, everything else folders-first then Swedish collation
(`localeCompare(…, "sv")` so å/ä/ö sort after z).

**Verified (2026-08-19) without a browser.** The client rebuilds the comparator with
`new Function("a","b","return (" + E.sortFn + ")(a, b)")`, reading the serialized
options from the `data-data-fns` attribute — confirmed in the emitted
`public/static/scripts/script-3-*.js`. That runs in **global scope**, which is exactly
why the original version would have thrown rather than just sorting oddly.

Replicating that same path in Node against the real built `index.html` gives:

```text
sortFn present = true · contains __name = false · comparator does not throw
term order:  2026 Vår · 2026 Höst · 2025 Vår · 2025 Höst · 2024 Vår · 2024 Höst
2024 Vår before 2024 Höst = true          (the reported symptom, fixed)
mixed siblings: term folders → plain folders → files
Swedish collation: Anteckningar, Zebra, Åter, Änglar, Övningar
```

**Open design question (not a defect):** the ordering is currently a hybrid — years
descending but seasons ascending within a year — so the current term (2026 Höst) sits
second rather than first. Fully reverse-chronological would put the current term at the
top; fully chronological would read as a study progression. Flagged to the user for a
decision; the change is two lines in `quartz.ts`.

### F40. ✅ DONE (2026-08-19) — every note in scope now has a `description`

Coverage went from 315 to **488 of 506** notes. The 18 without one are exactly the
notes tagged `excalidraw`, which section 6 of the Standard puts out of scope. Before
this, only `begrepp` notes had descriptions, so every lecture, lesson, lab, exam and
index page published with an empty meta description and empty social preview.

The 191 notes had no `## Definition` to harvest, so seven rules were used:

| rule | n | source |
|---|---|---|
| `prose` | 117 | first genuinely prose sentence of the note |
| `index` | 24 | synthesised: `Kursindex för <Course> med …` |
| `exam` | 19 | synthesised from the exam token + course code |
| `lesson` | 9 | synthesised: `Anteckningar från lektion <date> i kursen <code>` |
| `links` | 2 | synthesised for link-collection notes |
| `generic` / `conceptlist` | 2 | fallback / leading concept list |

**Four bugs were caught in the dry run, which is the reason for always dry-running:**

1. The prose rule harvested **Dataview query internals** (`FROM 'KTH/2025 Vår/…'`),
   because only lines *starting* with a fence were skipped, not lines *inside* one.
   This would have published query text as the meta description on all 24 course
   index pages.
2. Length was validated on the raw line, so a line that was mostly wikilink markup
   collapsed to two words after stripping (`Räkningar Excalidraw`). Now validated
   after stripping.
3. Flashcard syntax leaked in (`Throughput (Definition):: Mäter …`). The hint label
   is now dropped and `Term:: Answer` becomes `Term: Answer`, which reads well.
4. `Instuderingsfrågor` notes grabbed a question label as their description. They
   now always use the synthesised exam wording, which is also more uniform.

Verified: 0 duplicate `description` keys, 0 unbalanced quotes, audit clean, and a
live-vault build confirms the text reaches both `<meta name="description">` and
`og:description`.

### F41. ✅ DONE (2026-08-19) — empty `## Kopplat till` sections filled from evidence

Empty sections went **129 → 29**, adding 319 links across 100 notes.

Proposals were never guessed. Each link had to be backed by one of:

- **BOTH** (78) — the note links to it *and* it links back.
- **OUT** (179) — the note already references it in its own body.
- **IN** (62) — that note links here, so the relationship exists but was one-way.

Targets were then filtered to `begrepp` notes only. The first run proposed
`Instuderingsfrågor` question lists and dated lecture notes, which mention a term
without being conceptually related — `AIDA` came out with three question-list links
and no concepts at all.

The remaining **29 notes were deliberately left alone**: they have no concept-level
evidence, being mostly standalone models (`AIDA`, `PESTLE-Analys`,
`Maslows Behovspyramid`, `Bostonmatrisen`). An honestly empty section is better than
a padded one.

### F42. ✅ DONE (2026-08-19) — site polish

- **`recent-notes` enabled** ("Senast uppdaterat", 6 items) — useful on an actively
  updated study vault.
- **`tag-list` enabled**, so the standardised taxonomy is reachable from a page you
  are reading. Tag pages were already being generated but nothing linked to them;
  582 pages now show their tags.
- **Footer** pointed at this vault and the site source instead of Quartz's own GitHub
  and Discord, which were the defaults and looked unintentional.
- **`encrypted-pages` and `cname` disabled** — nothing is encrypted and the site is
  served from a `github.io` subpath, so a `CNAME` file would be wrong. Verified
  neither artifact is emitted any more.
- **Empty section headings hidden** via `custom.scss`. The Standard requires concept
  notes to carry `## Kopplat till` and `## Flashcards`, so an empty section is
  standard-compliant in the vault; it is only noise on the page. Verified against the
  built DOM that a *filled* section can never match the selectors: filled
  `Kopplat till` is followed by `<ul>`, filled `Flashcards` by
  `<blockquote class="callout question">`.
- **Term sort changed to fully reverse-chronological** (see F39), so the term
  currently being studied is always first.

### F43. ✅ DONE (2026-08-19) — templates rewritten; they had been contradicting the standard

The templates were quietly the biggest source of future drift in the vault, and one of
them had a consequence beyond tidiness.

**`Begrepp Template.md` used bold labels, not headings** — `**Definition:**`,
`**Flashcards:**`, `**Relaterade Koncept:**`, plus a stray `---` and no frontmatter
beyond `tags`. Because the published site's card transformer only rewrites content under
a `## Flashcards` **heading**, every *new* concept note would have published its cards as
raw `::` syntax — reintroducing exactly the defect F38 fixed. `Föreläsning Template.md`
likewise used `## Relaterade Begrepp` instead of `## Kopplat till`.

All seven templates now emit `tags` (type-first), `description`, `created` and `updated`,
and the section names the Standard documents. `description` uses a Templater prompt so it
cannot silently be left blank; the course index and meeting templates synthesise theirs.

**The Standard itself was wrong and has been corrected.** The concept-note format section
was written from memory rather than measurement. Measuring all 352 concept notes:

| Claimed | Measured |
| --- | --- |
| `## Tenta-fokus` part of the fixed order | 42 of 352 (12%) — **optional** |
| `## Definition` opens with a bold term | 15 bold vs 304 plain prose — **not** house style |
| no label callouts / `---` rule | newer notes **do** use them — optional |

Genuine invariants, now documented as such: `## Definition` 320, `## Flashcards` 320 and
**last in 320 of 320**, `## Kopplat till` 297, tags type-first in 349 of 352. Concept
*collections* (`HI1025 Begrepp Föreläsning 2`, `SEM4 Begrepp HF1201`) are recorded as a
recognised exception — 32 notes that hold many definitions as flashcards with no
`## Definition` of their own.

### F44. ✅ DONE (2026-08-19) — the audit now enforces what the Standard claims

Two documented rules were going unchecked, so the audit could report "clean" while the
vault drifted. `Vault-Audit.ps1` now also reports:

- `missingDescription` — required on every note in scope, `excalidraw` excepted.
- `emptyDescription` / `malformedDescription` — rejects a description containing card
  delimiters, wikilink brackets, or text lifted out of a Dataview query.
- `flashcardsNotLastSection` — the hard invariant the site depends on.

Turning these on found 2 real gaps (`Meta/NotebookLM Ideas.md`,
`Meta/Obsidian Plugins/Theme Test.md`), fixed by writing descriptions rather than
special-casing the files. Audit is clean at 469 notes in scope.

**A bug in the F40 generator surfaced here.** Its prose rule took a single *line*, but
this vault hard-wraps paragraphs, so a wrapped paragraph was cut at the wrap point.
Auditing all 490 descriptions for ones not ending in terminal punctuation gave 42 hits,
of which **5 were genuinely wrong** and were rewritten by hand:

- `Dubbel Bokföring`, `Semesterlön` — the description was **citation link text**
  ("Den nya affärsredovisningen …, page 38").
- `Sliding Window` — a heading plus list markers.
- `2024-10-29 - HE1026 - Föreläsning` — dangling ("… Boolesk algebra. Alltså").
- `Atlas/Vault Health Report` — cut at a wrap ("… is drift that needs").

The other 37 are fine: complete statements that simply lack a final period, or that end
in a colon introducing a list, or that were correctly ellipsised with `…` (which the
first version of the checker missed, since it only looked for three dots).

### F45. ✅ DONE (2026-08-19) — documentation set brought into line

- **`llms.txt`** — documents `description` as the most reliable one-line summary of a
  note; adds the `meta` type; adds a "How concept notes are structured" section; notes
  that cards appear **only** under `## Flashcards`, so a `::` anywhere else is a Dataview
  inline field; and records the **fifth flashcard form** (a bare `??`/`||` on its own
  line with the question above and the answer below, plus
  `DISABLED` / `==DISABLEDFLASHCARD==`), which an AI would otherwise misread. Corrected
  the `Atlas/` and `Meta/` folder descriptions and added the published-site note.
- **`README.md`** — the entry table now lists the audit script and the templates, and
  there is a "Kontrollera vaultet" section with the command and expected output.
- **`Atlas/Vault Health Report.md`** — two new Dataview checks mirroring the audit: notes
  without a `description`, and `Flashcards` not last.
- **`PROJECT-NOTES.md` in the Quartz repo** (new) — records the site setup where the code
  lives: the submodule-vs-`-d` build trap, the mandatory no-op plugin `build` script, the
  serialised-`sortFn` constraint, the registry override path, all five card forms, the
  deliberate exclusions, which plugins are off and why, and the two `custom.scss` rules.
  Previously this knowledge existed only in this backlog and in commit messages.

### F46. ✅ DONE (2026-08-19) — Quartz plugin ecosystem reviewed; nothing added, by decision

The whole ecosystem was enumerated from the npm registry rather than guessed, so this does
not need re-researching. **It is small and the site already covers essentially all of it:**
53 packages carry the `quartz-plugin` keyword (stable at higher search limits, so a real
total) — 50 in `@quartz-community`, of which **49 of the scope's 52 are installed**, plus
exactly **2** third-party packages in the entire ecosystem.

Nothing was installed or enabled. The reasoning is recorded in
`PROJECT-NOTES.md` in the Quartz repo, in short:

- **Three official packages are missing and should stay missing** — `obsidian-plugin-leaflet`
  (no maps in the vault), `obsidian-plugin-ttrpg-tools-maps` (tabletop RPG), and `runtime`
  (a library for plugin authors, not a feature).
- **Both third-party packages were rejected.** `quartz-plugin-pseudo` renders pseudocode with
  KaTeX and looked plausible for `HI1029 Algoritmer och Datastrukturer`, but the vault has
  **zero** pseudocode blocks. `quartz-navbar` is v0.1.0 from a single maintainer outside the
  official scope, and the sidebar already handles navigation.
- **`stacked-pages` was the one real candidate** — binder-style side-by-side pages, a good fit
  now that 297 notes have a `Kopplat till` section. **The owner decided against enabling it.**
- **Several enabled plugins are inert** because the content does not use them: `canvas-page`,
  `bases-page`, `alias-redirects` and the `mermaid` / `enableYouTubeEmbed` /
  `parseBlockReferences` options (measured: mermaid 0, `.canvas` 0, `.base` 0, footnotes 0,
  block refs 0, YouTube 0, aliases 0). **The owner chose to leave them on**, so this is noted
  to prevent the inertness being mistaken for a misconfiguration later.

Two corrections came out of the review:

1. **The "860 themes" figure needed provenance.** It comes from the `saberzero1/quartz-themes`
   repo table, not from npm — `npm search keywords:quartz-theme` returns exactly 250 results at
   *any* `--searchlimit`, because the registry search endpoint caps there. Recorded so the two
   numbers are not treated as contradictory.
2. **An earlier assumption about course index pages was wrong.** Their bodies are entirely
   Dataview, which the site hides, so they looked like dead ends. In fact `folder-page` emits
   its own listing alongside: the CM1005 `Begrepp` page carries 718 internal links covering all
   112 concepts. The Dataview blocks are redundant on the web, not lost content — **nothing to
   fix.**

### F47. ✅ DONE (2026-08-19) — alt text on every image; the site had none at all

**183 images across 61 pages published with `alt=""`.** Every embed in the vault was a
bare `![[image.png]]`, so every diagram was invisible to anyone using a screen reader —
an accessibility failure on a public site, not a cosmetic issue.

All 183 now carry alt text: `![[Bostonmatrisen ME1003.png|Bostonmatrisen]]`.

The mechanism was verified in the shipped transformer before any bulk edit, rather than
assumed. `obsidian-flavored-markdown` parses the text after the pipe with:

```text
/^(?<alt>(?!^\d*x?\d*$).*?)?(\|?\s*?(?<width>\d+)(x(?<height>\d+))?)?$/
```

so a **non-numeric** value becomes the `alt` attribute while `|300` still means width.
Obsidian renders the same form as the embed's display name, so the change is native to
both tools and nothing had to be converted to standard-markdown image syntax.

Alt text is derived from the filenames, which were already descriptive — all 75 distinct
images, zero named `Pasted image …` or similar. Two judgement calls, both approved:

- **The trailing course code is dropped**: `Bostonmatrisen ME1003.png` → "Bostonmatrisen".
  The page already establishes the course, so reading "ME1003" aloud only adds noise.
- **One typo was corrected.** The file was named `Värdekejda ME1003.png`, misspelling
  *Värdekedja* (the note embedding it is correctly named `Värdekedja.md`). The alt text was
  fixed first, and the **file itself has since been renamed** with its 2 references
  updated — see F49, so filename and alt text now agree.

**Verified:** rebuilt from the live vault — 183 `<img>` tags, **0 without alt**, 0 pages
affected, and 0 pages with unparsed embed syntax. Sample output:
`<img src="…boolesk-algebra-he1026.png" alt="Boolesk Algebra" …>`.

Now enforced: `Vault Standard.md` §4 gained an *Images and embeds* section, and the audit
reports `imageEmbedWithoutAlt`, so new embeds cannot silently regress.

**`robots.txt` was considered and correctly dropped.** It was on the shortlist, and a
vault-root file *would* publish at the site root — verified, since `llms.txt` does exactly
that. But the site is a GitHub Pages **project** site served from
`kasiem024.github.io/KTHObsidianQuartz/`, and crawlers only honour `robots.txt` at the
**domain** root. A file at the project subpath is ignored, so it would have been dead
weight. Controlling crawling here would require a `robots.txt` in the separate
`kasiem024.github.io` user-site repo. `sitemap.xml` is unaffected and still emitted.

### F48. ✅ DONE (2026-08-19) — exam-priority map, and a correction to a bad metric

`Atlas/Tenta-prioritering.md` ranks concepts by how many **distinct** question sets
reference them, as a worklist for which `## Tenta-fokus` to write first. 42 of 352 concept
notes have one; **225 exam-referenced concepts do not.**

**A metric I reported earlier was wrong, and the corrected numbers are much smaller.** The
first pass counted link *occurrences*, not distinct notes, so `Balansräkning` was described
as appearing in "39 exam question sets". It is referenced by **4**. The true range across
the whole vault is **1 to 7**, not 1 to 39. Corrected counts, by distinct source note:

| Distinct question sets | Concepts |
| --- | --- |
| 7 | 3 |
| 6 | 2 |
| 5 | 3 |
| 4 | 13 |
| 3 | 35 |
| 2 | 114 |
| 1 | 94 |

The top of the list is `Intäkt`, `Kostnad` and `Resultaträkning` at 7, then `Aktiebolag`
and `Kassaflödesanalys` at 6. Only ME1003 (122), CM1005 (70) and HH1802 (29) have
meaningful counts; HI1029 and HE1033 have study guides rather than question sets.

**Deliberately built as one note rather than 225 edits.** The obvious approach — writing a
"Förekommer i: …" list into each concept — would have duplicated something the site
already does. The `backlinks` plugin is enabled, so every concept page already lists its
inbound links. Checked on `Balansräkning`: 38 backlinks, of which 4 are question sets. The
references are therefore already visible, just **buried and unranked**. Aggregation and
ranking is the part that genuinely did not exist, and it belongs in one place where it can
be regenerated, not copied into 225 files where it would go stale.

The note is explicit about the metric's weakness: a 1–7 spread is a blunt instrument, 94
concepts sit at exactly 1 and 114 at exactly 2, and it counts *links* rather than content,
so a concept discussed without being linked is invisible to it. It also carries a live
Dataview list for day-to-day use in Obsidian, which sorts by total inbound links — a
different and cruder measure, and labelled as such.

Linked from `index.md` and `Atlas/Dashboard.md` so it is reachable rather than orphaned.

### F49. ✅ DONE (2026-08-19) — housekeeping: filename typo, merged branch, page weight

**The `Värdekejda` image is renamed at source.** F47 had corrected only the alt text. The
file is now `Värdekedja ME1003.png`, moved with `git mv` so history follows it, and both
references updated. One stale mention remains and is **not** worth chasing: an Excalidraw
scene JSON still points at `.../Bilagor/Värdekejda ME1003.png`, but that path broke during
the F31 folder migration long before this rename — `Bilagor` became `Filer`.

**`wip/flashcards` is deleted** from both the remote and locally. It was fully merged into
`v5` at F38. `git branch -d` initially refused because it compares against the
remote-tracking ref, which the remote deletion had just orphaned; `git fetch --prune`
cleared that and the safe delete then worked, so `-D` was never needed.

**Excalidraw pages are ~23% smaller.** `tools/slim-svg.mjs` rounds coordinates in large
inline SVGs to integers, wired into `deploy.yml` between build and upload. HTML goes
82.3 MB → 67.4 MB (18.1%) and the whole site ~105 MB → ~90 MB; the heaviest page drops from
6,796 KB to 5,203 KB.

**This under-delivered against my own estimate and that is worth recording.** I predicted
40–50%. Coordinates average only 3.36 decimal places, so rounding to one decimal saved just
**7.2%** — integers were needed to reach 18%. A visitor still downloads ~5 MB for one of
those pages, so the problem is reduced, not solved. The step is trivially removable.

Safety, each verified with a synthetic fixture rather than assumed: only SVGs over 50 KB are
considered, so UI icons are untouched; only canvases ≥1,000 units across are rounded, and a
small-canvas or `viewBox`-less SVG is skipped and reported; only values |v| ≥ 1 are rounded,
protecting opacities and stroke widths; and structure is compared before/after so the build
fails rather than publishing a mangled drawing. It is idempotent.

**Two of my own verification checks were wrong this round**, both the same mistake:
PowerShell's `-match` is case-insensitive, so a search for `NaN` matched "nan" inside
Swedish words like fi**nan**siering, reporting 243 affected pages. The case-sensitive count
is **0**. The tool's own check uses JavaScript `.test()`, which is case-sensitive and was
never affected. (The earlier F40 "Dataview leak" false positive was the identical error.)

**Note for future local builds:** `content/` is a pinned submodule, so a local
`npx quartz build` can lag the vault badly — during this work it sat at `a44efa6` while the
vault was at `28422ac`, which made alt text appear missing. CI updates the submodule, so
only local builds are affected.

### F50. ✅ DONE (2026-08-19) — flashcards: the answer is "do not normalise", plus a real defect

**Asked whether the flashcards could be made more uniform. Mostly they should not be.** The
four separators look like sloppy variation and are not. From the plugin's own settings in
`.obsidian/plugins/obsidian-spaced-repetition/data.json`:

| Separator | Meaning |
|---|---|
| `::` | single-line, one-directional |
| `;;` | single-line, **reversed** |
| `\|\|` | multi-line, one-directional |
| `??` | multi-line, **reversed** |

A reversed card also generates a back-to-front card, so "normalising" `;;` → `::` would have
silently deleted half the deck. Spacing was already uniform — all 499 single-line cards use
exactly one space after the separator. There was nothing to tidy.

**The real defect was elsewhere: 34 notes hold cards with no `## Flashcards` heading**, up to
189 markers each. They use `## Begrepp`, `## 📝 Ursprungliga Flashcards`, or interleave cards
with prose under chapter headings. Because the build-time transformer only looked under
`## Flashcards`, every one of those pages published **raw `::` syntax**.

**My earlier "0 pages show raw card syntax" was wrong** — that check only inspected pages
containing `id="flashcards"`, so it could not see these 34 by construction. A verification is
only as good as its scope, and this one was never stated.

Fixed on the **transformer** side rather than by restructuring 34 differently-shaped notes:
it now processes the whole note body, skipping frontmatter, fenced blocks, table rows and
blockquotes. Safe because it was checked rather than assumed — the vault contains **zero**
bracketed Dataview inline fields (`[key:: value]`) and no `std::`-style code outside fences.

Three further bugs surfaced while verifying:

- **No blank line between cards** (common in the HI1025 notes) made the answer collector
  swallow the *next* card's question, orphaning its `??` so it printed raw.
- A question line containing `::` was consumed as a single-line card when the following line
  was a bare separator, breaking the multi-line card.
- **Five cards have no answer at all** (`Term (Definition)::` then nothing) in
  `Instuderingsfrågor TENA HI1024`. They now render as plain question text. **This is a
  content gap worth filling.**

**Result: 34 leaking pages → 0. Callout pages 316 → 353. Total callouts 686 → 1,965** — those
notes held roughly 1,280 cards that had never rendered. KaTeX errors 0, images without alt 0.

Also fixed **5 notes that still had `` `=this.file.name` `` as their H1** — HE1028 Generella
Anteckningar, CM1008 Rapport Anteckingar, and SEM2/SEM4/SEM5 Begrepp HF1201 — so those pages
published a literal `=this.file.name` heading. Same defect class as F35, missed then because
that sweep targeted the date mirror specifically. Now enforced by a new
`inlineDataviewExpression` audit check.

### F51. ✅ DONE (2026-08-19) — `.kiro` agent context in both repos

Both repos now carry a `.kiro/` folder, modelled on the layout in `Kana-App` and trimmed to
what each project needs. The point is that hard-won knowledge stops living in chat history.

**Vault** — `steering/` (product, conventions, environment, documentation-standard),
three `preToolUse` hooks, and a read-only `vault-auditor` agent.
**Site** — `steering/` (product, conventions), a destructive-operation hook, and a
`site-builder` agent that knows the submodule trap.

The steering files deliberately **do not restate** the conventions: `Meta/Vault Standard.md`
and `PROJECT-NOTES.md` stay the sources of truth, and steering says how to work rather than
what the rules are.

The hooks encode the mistakes that actually happened: `require-ascii-ps1.sh` blocks a `.ps1`
containing non-ASCII, which PowerShell 5.1 would silently corrupt; `protect-sr-data.sh` blocks
bulk rewrites of `<!--SR:-->` data or separators; `block-destructive.sh` blocks
`reset --hard`, `clean -f`, force push, `branch -D` and recursive deletes. They are a backstop
— a `preToolUse` hook sees the command, not the diff.

**Two exclusions were needed and are easy to miss.** Quartz does **not** skip dot-folders
automatically, only the ones in `ignorePatterns`, so without adding `.kiro` the steering docs
would have been published on the public site. The vault audit also had to exclude it, or the
files would be audited as notes and fail for having no tags. Verified after: 0 published files
matching `.kiro`, page count unchanged at 601, audit clean with `notesInScope` still 470.

### F52. ✅ DONE (2026-08-19) — Markdown linting: 767 → 0

Ran `markdownlint-cli2` over the whole vault and fixed everything mechanical. **767
violations → 12**, and the 12 that remain are a deliberate open question, not a backlog of
mess (see the end of this entry).

Fixed automatically across **213 files**: MD022 blank lines around headings (501), MD031
around code fences (148), MD012 collapsed runs of blank lines (33), MD034 bare URLs wrapped
as autolinks (25), MD047 missing final newline (21), MD009 stray single trailing spaces
(16), MD058 blank lines around a table (1). Fixed by hand: MD040 unlabelled code fences (8)
and MD038 two malformed nested code spans in this file.

**The linter's defaults fight this vault in several places, and taking them at face value
would have done damage.** Each of the following was verified, not assumed:

- **MD011 "reversed link" — 8 hits, all false.** They were Templater expressions:
  `tp.file.folder(true).split('/')[1]` reads as `(text)[url]`. Auto-fixing would have
  rewritten it to `[1]('/')` and broken both templates.
- **MD034's auto-fix did break the course template** — the one thing that got through. The
  URL was `.../kurs/<% CODE %>`, and the fix wrapped only the literal part, producing
  `<https://...kurs/><% CODE %>`. Every new course index would have linked to `.../kurs/`
  with the code stranded outside. Caught by checking the template after the run, and
  repaired so it emits one complete autolink. The 25 existing `_index.md` files were fine,
  since their codes were already substituted.
- **MD025 "multiple top-level headings" — 26 files.** markdownlint counts a frontmatter
  `title:` as the document H1, so the body H1 looked like a second one. That combination is
  required by F35. Set `front_matter_title: ""` rather than disabling the rule.
- **MD036 "emphasis as heading" — 3 hits, all legitimate**, e.g.
  `*Employee N -> worksFor -> 1 Department*`. Rule off.

**Excluding `Meta/.../Templates/` turned out to be better than disabling rules for it**, and
let MD011 stay enabled for real notes — the first config attempt had switched MD011 off
vault-wide to accommodate two template files, weakening a real check everywhere.

Two scoping errors of my own, both caught before they mattered:

1. **`.markdownlintignore` is inert** — markdownlint-cli2 does not read it (cli v1 only). It
   silently linted 536 files instead of 500, pulling in the Excalidraw drawings and
   inflating the count from 767 to 1673. Ignores must live in `.markdownlint-cli2.jsonc`.
2. **One Excalidraw note is identified only by its tag**, not by a `.excalidraw.md` filename
   — `CM1008 Lean Canvas Grupp 10.md`. Ignoring `**/Filer/**` covers it; verified that
   `Filer/` holds only drawings (18) and Litteraturlista files (7), no authored notes.

**Safety, since 213 files were rewritten mechanically.** Before applying, verified that
**zero** of the 501 MD022 headings sat inside a flashcard region, where an inserted blank
line would have split a card; and that MD012 only ever collapses 2+ blank lines to 1, so no
card boundary can disappear. After applying, the spaced-repetition fingerprint was identical
on every measure: 1270 `<!--SR:-->` markers, 1070 `::`, 270 `;;`, 100 `||`, 219 `??`, 13
disabled. A full build then matched the previous one exactly — 601 pages, 353 pages with
callouts, 1965 callouts, 0 leaks, 0 KaTeX errors, 0 images without alt.

**Found and then removed on the author's instruction — 3 orphaned `<!--SR:-->` comments** whose
card text was gone, in `Kassaflödesanalys`, `HE1033 Begrepp Föreläsning 1-3` and `... 6-7` (the
last dated `2000-01-01`, i.e. never actually reviewed). Deleted with the surrounding blank-line
run collapsed back to one. Study-note SR markers went 1265 → **1262**, exactly three, with
**0** orphans left and all four separator counts untouched.

**The last 12 violations, resolved (2026-08-19).**

**MD001 skipped heading levels (10).** The seven *subject* MOCs jumped `# h1` straight to
`#### h4`. Rather than invent a shape, they now follow the pattern the three **year** MOCs
already used — `# h1` → `## h2` → `### h3`:

```text
# Nätverk MOC
prose
## Kurser                      <- inserted; was missing entirely
### #HI1032 Kommunikationssystem
## KTH-relaterat
### #HE1033 Kommunikationsnät
```

That makes all ten MOCs structurally identical instead of two families. The tenth violation
was a plain typo: `2024-02-16 - CM1005 - Lektion` had `### [[Sociala Avgifter]]` while its
sibling section is `## [[Semesterlön]]` — promoted to `##`.

**MD024 duplicate headings (2).** `Nätverk MOC` and `Programmering MOC` each list one course
in both sections. Now that the sections are real `##` parents, the duplicates sit under
*different* parents, so `siblings_only: true` states the rule that actually matters — no
repeated heading **within** one section. No content was merged, because the split between
`## Kurser` and `## KTH-relaterat` is the author's own organisation.

Verified: **lint 0 errors across 493 files**, audit clean, and the build unchanged at 601
pages / 353 with callouts / 1965 callouts / 0 leaks. Quartz de-duplicates the repeated course
anchor as `he1033-kommunikationsnät-1`, so deep links remain unique, and no `<h4>` remains on
any MOC page.

Line endings: 31 files previously had **mixed** CRLF/LF and are now consistently CRLF, which
matches `core.autocrlf=true`. The repository stores LF either way, so the commit shows no
line-ending churn. A `.gitattributes` with `*.md text eol=lf` would make this deterministic
if the mixture ever returns.

### F53. ✅ DONE (2026-08-19) — the checks now run themselves

**The problem was never missing checks — it was that nothing ever ran them.** The audit and
the linter only executed when someone typed the command, so drift accumulated silently
between sweeps. The vault repo had **no CI at all** and the site deployed whatever the build
produced, verified by nobody.

**Two things were quietly broken, and only testing found them.**

1. **`Vault-Audit.ps1` always exited 0** — even when printing `RESULT: deviations found`. A CI
   step calling it would have passed unconditionally: pure theatre. It now exits 1 when not
   clean. Verified: clean → 0, deviations → 1.
2. **The audit cannot pass on a fresh clone.** Two of its checks depend on state git does not
   store: `courseMissingFolder` looks for empty category folders (git stores no empty
   directories) and `brokenWikilinks` resolves links into `Litteraturlista/`, which
   `.gitignore` excludes. On a clone they reported **68 and 49** false failures. Added
   `-ContentOnly`, which skips exactly those two and still covers all **470** notes. Proven
   against a real clone: clean with the switch, 117 failures without it.

**Vault CI** (`.github/workflows/vault-checks.yml`) runs the audit and the linter on every
push. Made cheap deliberately: the repo is **462.9 MB** (262.7 MB of PDFs, 131.9 MB of
`.obsidian/` plugin files, 30.1 MB of Excalidraw drawings) but the checks need only the
**1.45 MB** of Markdown. A blobless sparse checkout takes **8.7 s** instead of 34.7 s, the
audit **2.1 s**, the lint **3.8 s** — about 15 s of work. Runs on `windows-latest` because
`InScope` matches Windows path separators; on Linux those exclusions would silently fail and
the templates would be audited as notes.

**Site CI** (`tools/check-site.mjs`, wired into `deploy.yml` before the upload) verifies the
artifact in ~2 s. Zero-tolerance invariants for raw card syntax, missing alt and KaTeX errors,
plus a comparison against `site-baseline.json` that is **deliberately asymmetric**: counts may
grow freely, but a drop over 5% fails. That is the part that catches defects nobody enumerated
— F50's transformer silently missed 34 notes and ~1,280 cards, which no named check would have
found, but callouts collapsing from 1965 is unmistakable.

**Verified by breaking it on purpose**, because a check that has never failed is not a check:

| Injected fault | Result |
|---|---|
| unmodified build | exit 0 |
| raw card syntax on one page | exit 1, `cardLeakPages 0 → 1` |
| stripped an `alt` attribute | exit 1, `imagesWithoutAlt 0 → 4` |
| deleted 60 pages (10%) | exit 1, "pages fell from 601 to 541" |
| one new broken link | exit 1, "brokenInternalLinks rose 43 → 44" |
| **added 25 pages (growth)** | **exit 0** — growth must not fail |

**Found on the way: 43 broken internal links on the published site.** All are links into PDFs,
and Quartz emits **no** PDFs — the course literature is copyrighted and deliberately
unpublished. They work in Obsidian and 404 for readers. Baselined at 43 rather than fixed, so
the check catches new breakage without demanding these be resolved. Worth revisiting if the
dead links bother readers.

---

## 🤖 AI-friendliness: accepted trade-offs

Deliberate, not bugs — documented so nobody "fixes" them by mistake:

1. **1,265 `<!--SR:…-->` scheduler comments** and **1,338 flashcard delimiters**
   (`::`, `;;`, `??`, `||`) are noise to an AI but drive the active spaced-repetition
   review schedule. **Never strip them in place.** `llms.txt` explains how to read them.
2. **Dataview blocks** in `_index.md` and the MOCs appear as literal code to an AI, and
   also render as raw query text on the published Quartz site. Accepted in exchange for
   live indexes inside Obsidian. The `` `= this.created` `` mirror line that used to sit
   in every note body was **removed in F35** — dates now live only in frontmatter.
3. **Better long-term option (not built):** a non-destructive `ai-export/` pipeline that
   copies notes with SR comments stripped, flashcards rewritten as plain
   `Term: definition` prose, Dataview blocks removed and wikilinks flattened — ideal for
   NotebookLM / RAG while leaving the originals and the review schedule untouched.
   Optionally merge each course's many small `Begrepp` notes into one dense document.

---

## 🔁 How to re-run this audit

The audit scripts lived in `%TEMP%` and are **not persisted** — recreate them, or better,
save them under `Meta/Obsidian Plugins/Scripts/`. Checks to reproduce:

1. Tag casing + vocabulary (case-**sensitive**; PowerShell hashtables are
   case-insensitive by default — use `StringComparer]::Ordinal`).
2. Frontmatter presence / tag style / duplicate tags / `created`+`updated` presence.
3. H1 count per note (0 = missing, >1 = too many).
4. Path-derived expectations: `KTH` + `year<YYYY>` + course code + type + subject.
5. Leftover `this.file.ctime|mtime`.
6. `_index.md` coverage per course folder.
7. Broken wikilinks: resolve each double-bracket target against all file basenames
   **and** relative paths (ignore embeds, i.e. targets preceded by `!`).
8. Folder-name and filename pattern inventories.

Environment gotchas learned the hard way:
- Long **inline** PowerShell sent to the shell gets mangled and can silently match
  nothing. Write a `.ps1` file and run
  `powershell -NoProfile -ExecutionPolicy Bypass -File <script>`.
- PowerShell 5.1 reads `.ps1` as ANSI, so **keep scripts pure ASCII** and read Swedish
  strings (`föreläsning`, `nätverk`, …) from a separate UTF-8 data file.
- Shell stdout capture is unreliable here — write results to a file and read the file.
- Always preserve each file's original BOM and line endings when rewriting.
- The vault is on Google Drive: deletions go to **Google Drive trash**, not the Windows
  Recycle Bin, and untracked files cannot be recovered with git.
