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

### 🌐 2026-08-18 (7) — PUBLISHING: vault made Quartz-safe (F35 done, F36 open)
Quartz v5 publishing set up at `C:\dev\KTHObsidianQuartz`. A real build (489 files →
1398 output files) revealed three site-only defects, all fixed: the in-body Dataview date
line on **450 notes**, the `_index` page titles on **all 24 courses**, and 4 protocol
`Tid:` fields. Details in **F35**. One new open item: **F36** (456 KaTeX warnings from
Swedish text inside math mode — cosmetic).

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

```
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
`**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`` is a Dataview inline
expression. Quartz does not run Dataview, so it published as the literal text
`= this.created`, and it also leaked into the `og:description` social-preview tag.
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

**3. Four meeting protocols used `Tid: `= this.created``.**
Replaced with each file's literal `created` date (2025-03-19, -21, -26, -29).

Excluded from the site via `ignorePatterns`: `Litteraturlista` (copyrighted textbooks,
OCR dumps, conversion tooling), `Meta`, `.excalidraw.md` sources, `.trash`,
`Kurs Mapp Mall`. Third-party analytics disabled.

**Known and accepted:** 456 KaTeX warnings from Swedish characters inside `$…$` math
(e.g. `$Räntabilitet$`). These render, but the text should not be in math mode. Not yet
fixed — see F36.

### F36. 🔵 OPEN — Swedish text inside math mode (456 KaTeX warnings)

The Quartz build emits 456 `unicodeTextInMathMode` warnings for `ä`, `ö`, `å`, `Å`
inside `$…$` / `$$…$$`. Formulas still render, but words wrapped in math mode are set in
italic serif and are wrong semantically. Worth sweeping: either move the words outside
the math delimiters or wrap them in `\text{…}`. Not urgent, purely cosmetic.

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
