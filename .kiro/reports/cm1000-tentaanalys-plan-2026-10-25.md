# CM1000 Tentaanalys - AI-kontext: plan (2026-10-25)

**Status:** draft for adversarial review. **Author's instruction (2026-10-25):** one self-contained
file for CM1000, like HI1032's `Anteckningar/HI1032 Tentaanalys - AI-kontext.md` in purpose but not
necessarily in format, that analyses **literally all** old exams and finds the patterns, organised
**per chapter** with the questions for that chapter, framed by **this term's** rules (KursPM HT2026,
Detaljplanering HT26, formelsamling HT26). "What's important is that the file is correct and useful."
Flashcard decisions already taken are in `.kiro/steering/current-state.md`; this file is their
foundation.

## 1. What is already measured

- **83 files, 53 sittings** (HT2019–HT2025), extracted by
  `%TEMP%\cm1000-tentaanalys\extract.py`: 595 uppgift units, 361 (sitting, area) groups, **388
  expected table rows**. Asserted: every line of every file lands in exactly one section; every unit
  is emitted in exactly one chapter dossier; 0 conflicts between uppgift number and area name (so
  *Uppgift N = område N* holds in every file); 0 differences between a sitting's problem file and
  solutions file in which uppgifter they hold; 12 file-level notes (numbering gaps) routed to the rules
  dossier, none lost.
- Rows per area: K1 42, K2 54, K3 56, K4 39, K5 36, K6 31, K7 39, K8 39, K9 30, higher-grade 22.
- **Two sittings have no solutions file:** HT2019 Hemtentamen april, HT2019 Komplettering. Some
  solutions files repeat a problem without solving it (e.g. HT2024 Fx2 U1 and U7).
- **Problem and solutions files differ** in 96 of 205 paired groups (the solutions file abbreviates or
  drops figures and hints), so the dossiers carry **both** texts.
- **This term's design is closest to HT2025:** KS1 (1, 2a/2b, 3a/3b), KS2 (1–3 again plus 4, 7, 8),
  Fx (1, 2, 3, 4, 7, 8), tenta 1–9 + uppgift 10, and HT2025's Fx2 and April omtenta state
  *"Inga tillåtna hjälpmedel förutom ingående formelsamling."* Every older sitting allowed one
  handwritten A4 sheet. **The HT2026 KursPM says nothing about aids** — reported as unverified.
- The formelsamling has sections for areas 1, 2, 3, 4, 7, 8 only.

## 2. The file

`KTH/2026 Höst/CM1000 Diskret Matematik/Anteckningar/CM1000 Tentaanalys - AI-kontext.md`, frontmatter
per `Meta/Vault Standard.md` §3 (tags `tenta`, `CM1000`, `matematik`, `KTH`, `year2026`; plain-prose
`description`; `created`/`updated`), H1 = filename. Sections (H2):

1. **Så används filen** — rules for an AI reader: Swedish, everyday; goal is passing; nothing invented;
   old papers come from older designs; how to read IDs and types.
2. **Kursen och examinationen HT2026** — from KursPM and Detaljplanering, quoted: 6 + 3 areas, "helt
   och hållet", grade table, KS1 10/11 (1, 2, 3), KS2 30/11 (4, 7, 8), tenta 5/1, omtenta 31/3, Fx,
   results valid HT2026–VT2027, RED1 muntor (kapitel 5 in v. 50), AI not allowed at TEN1; aids:
   unverified for HT2026, with HT2025's rule quoted; what the formelsamling contains.
3. **Snabböversikt** — one table: area, basic/advanced, where examined this term, the most common
   problem type(s) with counts (generated), and the HT2025 form.
4. **Underlaget och hur skrivningarna sett ut** — counts by kind and year (generated), the sitting ×
   area matrix (generated), and the framing analyst's text (design history, rules the papers state,
   what is missing).
5. **Område 1 – Logik** … **Område 9 – Sannolikhetslära**, **Högrebetygsuppgifter** — each: a generated
   header line (basic/advanced, KS this term, sittings with the area); `### Typer` as a generated table
   (the analyst's labels + counts per label: sittings, first and last year); then the analyst's
   `### Vad uppgifterna ber om`, `### Så löser lösningsförslagen uppgifterna`,
   `### Formelsamlingen och kapitlet`, `### Uppgifter som återkommer`, `### Alla uppgifter` (rows sorted
   into the dossier's order).
6. **Verifierat och osäkert** and **Källfiler** (paths in code format, no wikilinks: the targets are
   gitignored).

Expected size ~150–200 KB, ~390 table rows. That is the price of "literally all"; the per-area prose
and the overview carry the human reading.

## 3. How it is built

1. **Ten chapter analysts in parallel** (kapitel 1–9 and the higher-grade problems), each with its own
   **fidelity reviewer** that loops back on `NEEDS_CHANGES` (max 2 rounds), plus one **framing analyst**
   with a reviewer. All `kiro_default`. Briefs: `%TEMP%\cm1000-tentaanalys\brief-analytiker.md`,
   `brief-granskare.md`, `brief-ram.md`. Each analyst reads only its dossier `underlag-kapNN.md`
   (80–157 k characters, verbatim problems + solutions + the transcription's notes) and the
   formelsamling; writes `kapNN.md`; runs the checker before finishing.
2. **Checker** `check_chapter.py NN` (self-tested on planted defects, all caught): six headings in
   order; table header; 4 cells per row; **every expected ID exactly once**, no unknown IDs; every
   *Typ* defined; **every `$…$` in a row verbatim in that sitting's own source** (whitespace-insensitive;
   `\vert`, `\mid`, `\|`, `|` equal); sittings without solutions must say `Lösning saknas i underlaget.`;
   IDs in prose must exist; no `::`, `;;`, lone `||`/`??`, wikilinks or H1/H2. Prose math not found in
   any source of the chapter or the formelsamling is a warning to adjudicate.
3. **Counts are generated, never typed:** analysts write no counts in prose; every figure in the file
   comes from a script over the tables and the inventory.
4. **Assembly** by script + the framing sections by me; then **global checks**: all 388 IDs once,
   table math verbatim, no forbidden syntax, frontmatter shape, `Vault-Audit.ps1` clean,
   `markdownlint-cli2` clean on the file.
5. **Final independent review**, two lenses in parallel: fidelity (rows sampled across all areas,
   checked against the **original source files**, not the dossiers, so an extraction error would show)
   and premise (read as the student: is it useful for passing; what is missing).
6. Docs: backlog F110, `current-state.md`, `reentry.md`. No commit.

## 4. Risks

- **A wrong answer copied from a misread solution.** Mitigation: every row is checked by a reviewer
  against the dossier; math is mechanical; the final review re-checks a sample against the sources.
- **An analyst solving an unsolved problem.** The brief forbids it; the checker enforces it for the two
  sittings without solutions; reviewers check solutions files that only repeat the problem.
- **Patterns over-claimed from old designs.** Counts carry first/last year; each area has an HT2024–
  HT2025 paragraph; the design history says which sittings look like this term.
- **Size.** Mitigated by the overview and by keeping rows to ~300 characters per cell.
- **Subagent cancelled mid-run.** Each writes its file as it goes; a failed chapter is re-run alone.

## 5. Out of scope

Textbook content (definitions are named, not taught — that is the flashcards' job); solving problems
without a solution; the flashcards themselves; the raw tree outside the vault; any file under `Filer/`
(read-only).

## 6. Review outcome (2026-10-25) and the changes that apply

Premise lens: **GO WITH CHANGES**. Technical lens: **STOP**, three items; extraction verified correct on
every hard file (HT2025 KS1/KS2, HT2024 KS3, Del I–III, the doubled-`---` files, unnamed headings).

- **STOP 2 (invented answers where the solutions file only repeats the problem):** `extract.py` now
  detects them (no solution heading and text contained in the problem file) → `no_solution` in the
  inventory, 17 IDs: all of HT2019 Hemtentamen april and Komplettering, plus **HT2024 Fx2 U1 and U7**.
  The dossiers flag them; the checker requires `Lösning saknas i underlaget.` for every one.
- **STOP 1 (Typer form):** analysts write the label bullets (checked); the assembler adds the
  generated count table under them.
- **STOP 3 (assembly unchecked):** after assembly every area section is cut back out of the final file
  and `check_chapter.py` re-run on it; plus global checks (all 388 IDs once, no duplicates).
- **Premise 1 (formelsamling):** the sheet is titled *"Formelsamling för KS2 i CM1000 HT25"* and the
  HT2026 KursPM states no aids, so whether it is available at **KS1** is unconfirmed. The file states
  what the sheet prints and never "need not be learned"; the author's flashcard rule (decision 5) is
  reported back to him with this caveat — his call.
- **Premise 2, 4, 5, 8:** basic areas first (1, 2, 3, 4, 7, 8), then 5, 6, 9 and the higher-grade
  problems, marked as grade-setting; each area header says where it is examined this term; a mandatory
  `De senaste åren (HT2024–HT2025)` paragraph; a KS1/KS2 cross-view in the overview from the recent
  types; the higher-grade problems are called *Högrebetygsuppgifter*, not a tenth area.
- **Premise 3 (a pass needs a complete solution):** new mandatory section `### Mönsterlösningar` — per
  type one row whose examiner solution is the fullest worked example (checker: right type, has a
  solution); `Källfiler` maps every sitting to its files, so the tutor can open the full text. The file
  does not claim to contain complete solutions.
- **Technical FIX 4 / premise 7:** task cells carry the whole claim verbatim (checker warns if none of
  the problem's displayed formulas is there); method steps are one action each.
- **Wording in §1 corrected:** "0 conflicts" is tested only where a heading carries both number and
  area name; unnamed and area-only headings were checked by hand (reviewer and me). The 96-of-205
  figure is from `p_in_l.py` (paragraph containment of P in L). File-level avvikelser notes naming no
  uppgift are copied into every dossier of that sitting; the 12 that reached none are the
  numbering-gap notes, which go to the rules dossier.
