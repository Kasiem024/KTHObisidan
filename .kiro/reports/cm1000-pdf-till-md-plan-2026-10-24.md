# CM1000: all 95 PDFs to AI-optimised Markdown — plan

**Status:** approved by the author on 2026-10-24 at 14:09, with one change: every converted file is
also copied to the raw tree outside the vault (§3, §8). Reviewed by three adversarial lenses first
(§10). Conversion in progress; see `current-state.md`.

**Goal (the author's words):** "convert all pdf files for the course cm1000 to .md files that are
optimized for ai and that are easily readable by an ai". All 95, not only the book chapters.

> **Kort på svenska.** Du får en Markdown-fil per PDF (95 st) som en AI kan läsa: uppgifter med egna
> rubriker, all matematik som LaTeX, figurer som både bild och text, plus en index-fil som visar vilka
> gamla uppgifter som finns per område. Allt ligger i `Filer/` och är gitignorerat, så inget blir
> publikt. Materialet till KS1 (kap 1–3) görs först. Varje fil kontrolleras tecken för tecken mot
> PDF:en och läses en gång till av en annan agent, eftersom ett fel tecken i en lösning blir ett fel
> svar du lär dig. **Det du behöver bestämma står i §8**; mätningarna och metoden är §1–§7.

**In one paragraph.** Every PDF has a text layer, but in the 94 TeX files that layer is silently wrong in
nine ways (Swedish letters split, ℝ read as `R`, ∑ read as `X`, x² read as `x2`, …). A repair script
(the *oracle*) fixes the characters per font. A subagent then writes the Markdown from the page image
plus the oracle, a deterministic verifier proves per page that no token was lost, added or changed,
and a second subagent checks what the verifier cannot see. The pilot ran this end to end on one file
and the verifier caught an error the transcriber had explained away. Output goes where the vault
already keeps conversions, all of it gitignored.

## 1. What was measured

Evidence: `C:\dev\pdf2md\out\CM1000\_pilot\` (census, probes, pilot files, verifier reports) and the
scripts in `C:\dev\pdf2md\prep\cm1000\`.

**Corpus.** 95 PDFs, 497 pages: the book `Filer/Litteraturlista/kap1–kap9` (234 p), past exams
`Filer/Canvas/Gamla Tentor/HT2019–HT2025` (83 files, 256 p), `Filer/Canvas/Kursinformation` (KursPM,
Detaljplanering, formelsamling; 7 p). No md5 duplicates. Every page has a text layer and no page
carries a raster image (largest image area on any page: 0 %), so there is nothing to OCR; figures and
the KTH logo are vector paths. 94 files are TeX — 93 dvips + Ghostscript and the KursPM pdfTeX, set
in Computer Modern plus the AMS fonts MSBM/MSAM and, in kap7–kap9's figures, NimbusRomNo9L — and the
Detaljplanering is an Excel export.

**Silent text-layer defects, and what the oracle does about each** (counts over all 95 files):

| Defect in the raw text layer | Count | Oracle repair |
|---|---|---|
| OT1 accents: `L¨osningar`, `p˚a`; not one precomposed å/ä/ö in any TeX file | 45 374 | compose by position, text fonts only |
| ligatures ﬁ ﬂ | 2 380 | expand |
| MSBM10 ℝ ℤ ℕ ℚ ℂ come out as `R Z N Q C` | 911 | remap inside that font |
| CMSY script capitals (ℛ relation, 𝒫 power set) come out as `R P` | 926 | remap inside that font |
| CMEX big operators/delimiters: ∑ as `X`/`P`, parentheses as U+0000…, PUA U+F8EB… | 1 589 + 164 | per-code map |
| `\not` drawn as a separate U+0338 | 226 | bind to the relation: ≠ ∉ ∤ |
| ↦ drawn as CMSY `7` plus → | 18 | compose |
| super/subscripts flattened (`x2` for x²) | 4 122 sup, 5 061 sub, 716 direction unknown | marked from size and baseline; lines holding only script-size maths (operator limits, exponents after a big delimiter) are marked direction-free |
| Type3 zero-width glyphs inside graph drawings (HT2021 ks3/ks3_sol, HT2024 tenta/tentan_sol) | 8 | dropped; read from the image |
| **unexplained after repair** | **3** | lone `˚`: HT2019 ks3_sol p1 ×2, HT2020 Fx-skrivning-1 p4 — decide from the image |

Two things that look like defects and are not: CMMI ι (105) is a real iota (the identity function
ι_B), and the 183 macrons, all in CMR10, are math accents — a residue-class bar ¯0 or a complement Ā
— so the oracle binds each to the next character, digits included. NimbusRomNo9L (kap7–kap9, 1 052
characters) is the italic used for vertex labels inside the figures; it needs no repair.

**Structure seen on rendered pages.** Exam problems are printed `N. <Delområde>.`; the nine areas are
KursPM's nine sub-areas, which are book chapters 1–9. Solutions follow each problem (`Lösning:`).
Logic derivations are numbered premises with a `∴` line under a rule. Answer forms are tables with
☐/⊠. Graphs are vector drawings with vertex labels; kap7 has many, and kap9 p33's 8 015 vector paths
are an urn drawing (U1, U2, black and white balls). Several files are misleadingly named: in HT2021
`tentamen_sol.pdf` is the April 2022 re-exam (to confirm), `Tentamen_sol(1).pdf` the January 2022
exam, `sept_tenta_sol.pdf` September 2022; `formelsamling_ht26_v01.pdf` is titled *Formelsamling för
KS2 i CM1000 HT25*; `-1` and `(1)` are download suffixes.

**Course facts (KursPM, Detaljplanering).** 8,0 hp, TEN1 5,0 + RED1 3,0. KS1 on 10 Nov covers ch. 1–3,
KS2 on 30 Nov ch. 4, 7, 8; exam 5 Jan, re-exam 31 Mar. The HT2025 exams allow no aid except the
formula sheet.

**Pilot: HT2021 `ks3_sol.pdf`, 3 pages** (problems 3, 7, 8, 9; six graph drawings).

- One `kiro_default` transcriber wrote the file; the verifier reported 8 differences on page 1: the
  inner fractions are printed `1/4 + 3/4`, the transcriber had set them as stacked `\frac`, and had
  listed this under its own deviations as "the text layer writes them with a slash, same value". The
  image showed the slash. **Lesson: the transcriber never classifies its own differences.**
- After the fix: `UNCLASSIFIED=0` on all three pages.
- The instrument needed four fixes during the pilot, each a false difference: escaped `\{ \}` were
  deleted; commas in vertex lists were counted; a binomial's `3` was taken for a page number (now: a
  page number is the page's *own* number in the margin); exponents beside big delimiters have no
  direction in the text layer (now matched direction-free); a line of digits is never a subscript.
- Self-test: the untouched file exits 0; four planted defects (x² → x2, 40 → 41, a dropped word,
  ≠ → =) each exit 1.
- Graph edges were checked against the page's own internal controls: deg(a)=4, deg(b′)=5, and the
  printed isomorphism φ maps all 13 remaining edges one to one.
- **Not measured: time per page.** Batch 1 measures it (§5).

## 2. Why pdf2md's method but not its marker pipeline

pdf2md supplies the environment (`C:\dev\pdf2md\.venv`, PyMuPDF 1.28), the workspace
(`C:\dev\pdf2md\out\CM1000\`, deploy as a separate step) and the method this plan follows: trust the
glyphs, per-font remaps only, a completeness diff against the text layer, two independent readings,
sampling the agreements, a resume ledger.

marker is not used. pdftext, the engine marker reads born-digital text with, returned **169 split
accents and 0 å/ä/ö** on the pilot's three pages (measured, `cm1000-pdftext.txt`), so marker's output
would carry the defects above, reflowed and without the per-font information the repairs need. Its
launcher is also broken after the repo moved: `marker_single.exe --help` exits 1 with no output.
Whether marker could turn this layer into LaTeX at all was not tested.

## 3. Where the files go

The layout HI1032 already uses, so the vault keeps one way of doing this (Vault Standard §4):

```text
CM1000 Diskret Matematik/Filer/
├── Litteraturlista/
│   ├── kap1.pdf … kap9.pdf                  (unchanged)
│   ├── kap1.md … kap9.md                    NEW, beside each PDF, like HI1031/HI1032's book
│   └── assets/                              NEW, the book's figure crops, prefixed kapN__
└── Canvas/
    ├── Gamla Tentor/HT2019 … HT2025/*.pdf   (unchanged)
    ├── Kursinformation/*.pdf                (unchanged)
    └── AI-optimerad Markdown/               NEW
        ├── _INDEX.md
        ├── assets/                          shared; figure crops as PNG, prefixed <stem>__
        ├── Gamla Tentor/HT2019 … HT2025/<stem>.md
        └── Kursinformation/<stem>.md
```

- **Filenames = the PDF's stem**, unchanged: `ks1_sol.pdf` → `ks1_sol.md`. A file keeps its download
  suffix (`ks1-1`, `Tentamen_sol(1)`), because the stem is what links the two files; the real identity
  goes in the frontmatter.
- The Gamla Tentor tree keeps its year folders, one level deeper than HI1032's flat layout. Image
  links from there are `../../assets/…`; the verify step resolves every link from the file's own
  folder (pdf2md's batch-runbook lesson 20).
- **Everything new is gitignored** — `**/Filer/Canvas/` and `litteraturlista/` are in `.gitignore`,
  checked on 2026-10-24 with `git status --ignored` (all 95 PDFs ignored). Nothing reaches the public
  repo or the site, and the audit and the linter skip `Filer/`.
- Sources are never modified. Conversion runs in `C:\dev\pdf2md\out\CM1000\` and is copied to the
  vault in one dry-run-first deploy step.
- `conventions.md` §4 says nothing under `Filer/` is edited. This plan edits nothing there: it only
  adds new files in the two places Vault Standard §4 names for conversions (`Filer/Litteraturlista/`
  and `Filer/Canvas/AI-optimerad Markdown/`), as HI1031 and HI1032 already do. The one change made
  under `Filer/` on 2026-10-24 was moving the 86 Canvas PDFs from `Filer/` into `Filer/Canvas/`,
  because at `Filer/` they were not gitignored and the next `git add .` would have published them.

**A copy outside the vault**, decided by the author on 2026-10-24: every converted file also goes to
the raw tree, in one folder of its own so the PDFs there stay as they are:

```text
G:\My Drive\KTH\2026 Höst\CM1000 Diskret Matematik\
└── AI-optimerad Markdown\              NEW
    ├── _INDEX.md                       generated for this location, so its links resolve here
    ├── assets\
    ├── Gamla Tentor\HT2019 … HT2025\<stem>.md
    ├── Kursinformation\<stem>.md
    └── Litteraturlista\kap1.md … kap9.md + assets\
```

Every file except `_INDEX.md` is byte-identical to its vault copy, which keeps every relative image
link valid in both places; each pair is md5-checked at deploy.

## 4. The Markdown format

One file per PDF, designed so an AI can answer "solve problem N", "what is on KS1", "show every graph
theory problem" without the PDF:

**Frontmatter**, HI1032's keys plus two (`exam_type`, `topics`). HI1032's `images_kept` and
`images_removed` are left out because they described marker's output; the values follow HI1032's
(`exam`, `exam_answers`, `course_info`) so the two courses read alike:

```yaml
title: "Kontrollskrivning 3 – CM1000, Diskret Matematik, HT2021"   # as printed
source_pdf: "ks3_sol.pdf"
source_subfolder: "Gamla Tentor/HT2021"
doc_type: exam_answers   # exam | exam_answers | textbook_chapter | course_info | formula_sheet | schedule
exam_type: kontrollskrivning   # kontrollskrivning | tentamen | omtentamen | fx | hemtentamen | komplettering
exam_period: "HT2021"     # plus the printed date where there is one
course: CM1000
language: sv
pages: 3
ocr: false
answer_key: true
related: "ks3.md"         # the problem sheet <-> its solutions, where both exist
topics: [Funktioner, Grafteori, Kombinatorik, Sannolikhetslära]   # area names as printed
processed_by: "CM1000 pipeline: repaired text layer + visual transcription, verified per page"
```

**Body.**

- `# <printed title>`, then the cover text (rules, time, allowed aids) as prose.
- One `## Uppgift N. <Delområde>` per problem, with number and area **exactly as printed**, the
  statement directly under it, then `### Lösning`. Where an exam prints parts (`Del I`, `Del II`),
  each part is a `##` and everything under it moves down one level. Book chapters keep their own
  section numbering as headings (`## 1. Mängder och deras element`, exercises `### Övning 7.1.1`).
- Maths in LaTeX — `$…$` inline and `$$…$$` displayed, the vault's house style
  (`hi103x-latex-math-plan-2026-10-20.md`; Obsidian renders it with MathJax, the site with KaTeX, and
  these files never reach the site). Everything is transcribed **as printed**: a fraction printed
  `1/4` stays `1/4`, a stacked one becomes `\frac`.
- Logic derivations as a numbered list with the conclusion on its own line:
  `1. $p \to q \lor r$` … then `$\therefore\ p \to s \oplus t$`.
- Truth tables and answer forms as Markdown tables, ☐ and ☒ kept as printed; `|` inside a cell is
  written `\vert`.
- Each figure is kept two ways: a PNG crop in `assets/` linked with an alt text, and a text form an AI
  can reason over — a graph as a fenced `graf` block listing vertices and edges; other figures (urns,
  Venn diagrams, schedules) as a short factual description of what is drawn, never an
  interpretation.
- `<!-- sida N -->` at each page boundary, so a reader can cite a page.
- Page furniture removed: KTH logo, page numbers, running heads. Words hyphenated across a line are
  joined.
- Source errors (typos, a stray parenthesis, a wrong word) are **kept and listed**, never fixed.
- Last section `## Avvikelser`: every source error and every reading the converter was unsure of,
  with its page, or `Inga.`

**`_INDEX.md`**, generated from the frontmatter and headings, never by hand:

- one line per document, grouped by year and type, with the true identity spelled out where the
  filename misleads ("`tentamen_sol.md` — omtentamen april 2022, lösningar");
- a matrix of the nine areas against every exam — which problem number covers which area in which
  sitting. That matrix is the most useful thing in the batch for an AI asked to find all past
  problems on, say, relations.

## 5. The pipeline

Per PDF, run in `C:\dev\pdf2md\out\CM1000\<stem>\`. **Two routes, chosen by what a mistake costs.**
A wrong sign in a book chapter or a solution is a wrong answer the author memorises, so those get
every step. The course documents (KursPM, Detaljplanering, formula sheet) and the problem sheets
without solutions take the light route: steps 0–5 and 8, plus a one-page spot read; the full route is
used anyway on any page of theirs that holds a figure or a table.

| Step | Who | Does | Gate |
|---|---|---|---|
| 0 Stage | script | copy the PDF, md5-verify the copy | md5 equal |
| 1 Oracle | script `cm1000-oracle.py` | repaired text layer per page, lines with positions | `leftover_bad_chars` 0, or each one listed for step 5 |
| 2 Render | script | one PNG per page, ≤1 400 px wide and ≤1 900 px tall; figure crops at higher zoom | file exists, size within limits |
| 3 Transcribe | subagent A | writes `<stem>.md` from the images + oracle, following §4 | file written; nothing else touched |
| 4 Verify | script `cm1000-verify.py` | per page: token multiset and super/subscript multiset, oracle vs Markdown | `UNCLASSIFIED=0`, or every difference adjudicated |
| 5 Adjudicate | me, from the image | gives each verifier difference a verdict: transcription error (fix) or oracle/instrument error (record) | written verdict per difference, scripted so an unclassified one fails |
| 6 Second reading | subagent B, never A | the order-and-position check, item by item (below) | every item ticked or a finding raised; findings fixed, then step 4 again |
| 7 Figures | subagent C, never A or B | re-reads every figure and answer form from the image without seeing A's version | equal to A's, or each difference decided from a magnified crop |
| 8 Lint | script | frontmatter keys, heading pattern, links resolve, no `||`/`::` card syntax, one `<!-- sida N -->` per page | all pass |

**Why step 6 exists: the verifier compares multisets, so it cannot see order.** The technical review
gave the decisive example from the pilot itself: `1 - 2\sqrt{d} + d` written as `1 + 2\sqrt{d} - d`
has exactly the same tokens, so it passes step 4 and is a wrong answer. Step 6 is therefore not a
general read-through. A script generates a numbered checklist from the Markdown with one line per
item the verifier is blind to, and B ticks each line against the image:

- **every** `$…$` and `$$…$$` formula, read symbol by symbol in order — signs, operands, which part
  is the numerator, which limit of ∑ is below;
- every answer-form row: which box is ticked;
- every table: cell order, row by row;
- every derivation: the order of its lines and the rule cited on each;
- every place the oracle marked a script direction-free (`<<?…>>`): is it above or below?

A formula with no checklist line is a defect of the checklist generator, so the generator's own
output is counted against the formulas in the file, and the two numbers must be equal.

**Step 7 covers every figure, not only graphs**: graph edges (the `graf` block), the urns and Venn
diagrams, and the ☐/☒ state of every answer form, because the verifier sees none of them. Where A
and C agree on a graph, 1 in 5 is drawn again at higher zoom and read a third time, since two
readers can misread the same crossing; and where a page prints an internal control (degrees, an
isomorphism, a count of edges) the lists are checked against it. Steps 7 and the third reading are
skipped for a file that has no figure and no answer form.

**Before batch 1: four fixes to the instruments**, each from the technical review, each proven by a
new planted defect in the self-test before it is trusted:

1. The verifier's `\mathcal` table gets all 26 letters, the same as the oracle's (it has 12, so any
   other script capital would show as a false difference that has to be waved through by hand).
2. A heading may absorb a `.` or `:` only directly after the problem number, not anywhere on the page.
3. A word may be reconciled as "split across a line" only if its two parts are adjacent in the
   Markdown.
4. ∑, ∏ and ∫ limits get their direction from their height relative to the operator glyph, so fewer
   scripts are left direction-free for step 6.

**Batches, in the order the course needs them.** KS1 is on 10 November (chapters 1–3) and KS2 on
30 November (chapters 4, 7, 8), so the material for each comes first. A batch is marked done only
when every file in it has passed.

1. **Calibration (5 files, about 20 pages)**, chosen to exercise every structure: `kap1` pages
   1–8 (book prose and derivations), `HT2021/ks1_sol.pdf` (answer form), `HT2019/tenta_solutions.pdf`
   (84 residue-class bars), `Kursinformation/Detaljplanering_HT26.pdf` (table) and `kap9` pages 30–34
   (urn figure). **Time per page is measured here**, and the author gets the figure and an estimate
   for the rest before batch 2 starts.
2. **For KS1:** the rest of kap1–kap3, the formula sheet, and every KS1 and Fx paper with its
   solutions.
3. **For KS2:** kap4, kap7, kap8 and the KS2-era papers.
4. **For the exam:** kap5, kap6, kap9 and every tentamen, omtentamen and hemtentamen, newest year
   first, with the KursPM.
5. `_INDEX.md`, the `related` links, and the deploy. Each earlier batch is also deployed as soon as
   it passes, so KS1 material is in the vault before KS1 material for later batches is even started.

**Units of work.** One unit is a file of up to 8 pages, or a chapter section of up to 8 pages.
kap1–kap9 run 15 to 34 pages, so they are split at their own section headings and joined
afterwards; the join is checked by the verifier, run on the whole chapter. **Every subagent reads
exactly one page image per read call**: during this planning a call with three images timed out,
while one image per call never did.

**Parallelism.** Up to four transcribers at once, one unit each; the reviewer for a unit never
transcribed it. The author asked for speed and for an adversarial check of every piece of work, and
this is the pattern that met both in F99.

**Pause-safety.** Each unit writes a status file of its own, `<unit>\status.json` (source md5, each
step's result, the deliverable's md5), and a step writes to `<file>.tmp` and renames only when it has
finished, so an interrupted step leaves no half-written deliverable behind. `LEDGER.md` is generated
from those status files by one script, run by me alone; no subagent ever writes it, because several
writers to one file is how a parallel run silently loses work (T22).

**Verification of the whole batch, before deploy.**

- 95 deliverables plus `_INDEX.md`; each the right page count of `<!-- sida N -->` markers.
- Every verifier report at `UNCLASSIFIED=0` or fully adjudicated; every review finding closed.
- The self-test passes against the final verifier (planted defects caught, untouched file clean).
- Every image link resolves from the file's own folder; no orphan in `assets/`.
- Problems counted per exam against the printed numbering, so a dropped problem cannot pass.
- A spot read: 5 random pages that passed everything, read once more against the image.

## 6. Deploy to the vault

A separate step, run after each batch passes, so the files for KS1 reach the vault without waiting for
the rest. It only adds new files, none of which Obsidian has open, so Obsidian does not need to be
closed:

1. Dry run: list every file that would be written, assert 0 name collisions with what exists.
2. Copy into the layout in §3, in the vault and in the raw tree. Nothing existing is overwritten; the
   PDFs are not touched.
3. Read back: md5 of every copied file equals the local deliverable, in both trees (`_INDEX.md`
   excepted, being generated per tree); every link resolves in place.
4. `git status --ignored` shows every new file as ignored (`!!`) and none as untracked (`??`).
5. `Vault-Audit.ps1` — must still print `RESULT: clean`, as it did at 14:00 on 2026-10-24 after the
   F105 tag conversion; this work adds nothing the audit reads (`Filer/` is out of its scope).
   CM1000's `_index.md` still has inline tags on purpose — F105's run excluded CM1000 so the two
   pieces of work could not collide, and the audit does not read `_index.md` files — and it is
   converted with `Convert-TagsToList.ps1` when the course folder is committed.
6. Record the work as one F-entry in `Meta/Vault Findings & Backlog.md`, with the measured figures.

Two expected side effects, both the same as HI1032 today, so neither is changed here:

- The course index's *Alla anteckningar i kursen* list has no `Filer` guard, so it will list the 96
  new files. HI1032's index lists its converted files the same way.
- The phone's FolderSync does not yet exclude `Filer/` (`current-state.md`, item 1 of *making the
  phone usable*), so the new files will sync there until that filter is added.

## 7. Risks, and what each one costs if it happens

| Risk | Where it would bite | Guard |
|---|---|---|
| The oracle mis-repairs a character in a way the verifier then trusts | wrong maths that looks right | oracle rules are per font and each was checked on a rendered page; the reviewer reads every formula against the image; 5-page spot read at the end |
| A transcriber "improves" the source | an AI learns a correct-looking answer that is not the examiner's | rule 2 in the brief; the verifier sees every changed word or number; the reviewer is told to look for this |
| A graph edge misread | a wrong answer to a graph-theory problem | two independent readings, internal controls, third reading of a sample |
| A whole problem dropped | gap that no AI would notice | per-exam problem count against the printed numbering |
| The verifier has a blind spot nobody has found | false confidence | self-test with planted defects before every batch; any surprising zero is a suspect measurement |
| Time | 95 files × several subagent calls | batch 1 measures it; the plan is resized before batch 2, and the author is told the figure |

## 8. Decisions — the author's answer, 2026-10-24 14:09: all as proposed, except 7

1. **Order: the material for KS1 first (proposed), or everything in one go?** KS1 is on 10 November
   and covers chapters 1–3.
2. **Thoroughness against time.** Proposed: every step for the book and the solutions, the light
   route for the course documents and the problem sheets (§5). The alternative is every step for
   everything: slower, and safer for the problem sheets. The time per page from batch 1 is what turns
   this into a real figure, so he gets it before batch 2 and can change his mind then.
3. **Approve the plan as a whole**, or name what to change.
4. **Figure crops in `assets/`: keep them (proposed) or text only?** Keeping them costs some
   megabytes in Drive and lets a multimodal AI see the drawing; the text form is there either way.
5. **Book chapters: one file per chapter (proposed) or one file for the whole book?** Per chapter
   matches the PDFs and the nine exam areas; one file is easier to hand to an AI in a single go.
6. **Is a `_INDEX.md` area matrix wanted?** Proposed yes.
7. **Also copy the Markdown into the raw tree `G:\My Drive\KTH\2026 Höst\CM1000 Diskret Matematik\`?**
   **Decided: yes**, every converted file, in the layout shown in §3. This was the one change he made
   to the proposals.

## 9. Not in this plan

- No flashcards, theory notes or exam analysis. Those come after, and only if the author asks.
- No change to the source PDFs, their names or their folders.
- No new rule in `Meta/Vault Standard.md`: the layout follows §4 as it stands. §4's description of
  the conversions as `.opt.md` / `.ai.md` was stale (no such file exists; HI1031's and HI1032's books
  are plain `.md`), and was corrected on 2026-10-24 in the same change as this plan, as was its list
  of courses with a `Filer/Canvas/` folder, which now includes CM1000.
- pdf2md's stale `C:\pdf2md` paths and its broken marker launcher are reported to the author, not
  repaired as part of this work.

## 10. Review record (2026-10-24)

Three reviewers ran in parallel on the first draft: a premise lens (`premise-reviewer`, given the
author's goal and not the rules), a conformance lens and a technical lens (both `kiro_default`, read
and grep only; `conformance-reviewer` was not used because of its open timeout problem, F97).

| Lens | Verdict | What changed because of it |
|---|---|---|
| Premise | worth building, with changes | batches reordered by the exam calendar (book and KS1 material first, deploy per batch); light route for course documents and problem sheets; order and thoroughness-versus-time now the first two decisions in §8 |
| Conformance | four minor findings | macron count corrected 105 → 183 (re-measured: all CMR10, eight files); the NimbusRomNo9L font in kap7–kap9's figures named; Vault Standard §4's stale `.opt.md` wording fixed in the same change; the move of the 86 Canvas PDFs stated as done, with its reason, in §3 |
| Technical | needs changes: 1 blocker, 5 major | the blocker — the verifier compares multisets and cannot see order, so `1 - 2\sqrt{d} + d` → `1 + 2\sqrt{d} - d` passes — answered by step 6 reading every formula symbol by symbol from a generated checklist whose length is counted against the file; step 7 covers every figure and answer form, not only graphs; one image per read call; per-unit status files instead of a shared ledger; `.tmp` then rename; four instrument fixes before batch 1 |

Claims the conformance lens re-checked against the evidence and found correct: the corpus counts,
every figure in the defect table, the pilot's numbers, the course facts, the misleading filenames,
and the HI1032 format the plan follows.

Not yet done, and required before batch 1: the four instrument fixes in §5, each with a planted
defect in the self-test, and the checklist generator for step 6.
