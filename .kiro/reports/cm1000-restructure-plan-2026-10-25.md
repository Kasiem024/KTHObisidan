# Plan: restructure CM1000's exam files by exam type, in the vault only (2026-10-25)

**Status:** implemented 2026-10-25, record in the backlog's **F109**. Three reviews before execution
(outcome below); an independent audit after the move caught two defects — 33 cross-year `related:`
links and a partial first backup — both fixed (see F109). **Author's instruction:** group the exam
files by which exam they are (all KS1 together, all KS2, …; all tentor/omtentor in one folder), not by
year; put the term in each filename; verify every file's true identity and fix any wrong name; vault
only (leave the raw tree outside the vault alone); permanent. Applies to both the `.md` and the `.pdf`
files.

## Scope — exactly what moves

Two sibling trees inside the vault, both gitignored under `Filer/Canvas/`:

- **MD:** `Filer/Canvas/AI-optimerad Markdown/Gamla Tentor/HT20xx/*.md` — 83 files.
- **PDF:** `Filer/Canvas/Gamla Tentor/HT20xx/*.pdf` — 83 files (the Kursinformation PDFs stay).

**Out of scope, do not touch:** the raw tree `G:\My Drive\KTH\...` (the author changed his mind);
the 9 book chapters (`Litteraturlista/`); `Kursinformation/` (KursPM, schedule, formula sheet); the
`assets/` crops; the content of any `.md` (only its filename and folder change, plus the two
link-bearing fields below); anything outside `Filer/Canvas/`.

## The target layout

`Filer/Canvas/AI-optimerad Markdown/Gamla Tentor/` and `Filer/Canvas/Gamla Tentor/` each get these
folders instead of `HT2019 … HT2025`:

`KS1/  KS2/  KS3/  KS4/  Fx1/  Fx2/  Tentor/  Komplettering/`

- **Tentor/** holds every tentamen, omtentamen and the one hemtentamen — the author said "all tentor
  related is one folder".
- **Komplettering/** holds the single HT2019 komplettering (`fx2.md`), which is neither an Fx nor a
  KS nor a tenta. Alternative considered: fold it into Fx2. Rejected — its own title is
  "Kompletteringsuppgifter", a distinct thing; one file in its own folder is honest.

Counts per folder (from the identity read): KS1 11, KS2 11, KS3 10, KS4 8, Fx1 and Fx2 8 each,
Tentor 21, Komplettering 1. Total 83 — must equal the file count before and after.

## The filename

`<term> <exam>[ <month>][ - Lösningar].md`, e.g.

- `HT2021 KS1.md` (problems), `HT2021 KS1 - Lösningar.md` (solutions)
- `HT2024 Tentamen januari.md`, `HT2024 Tentamen - Lösningar.md`
- `HT2021 Omtentamen april.md`

Rules: term is always the `HT20xx` the file already sits under. `- Lösningar` iff the document is a
solution (decided per *Identity*, not by the `_sol` in the old name). A **month** is added only in
`Tentor/`, where two sittings can share a year (HT2021 has a January tentamen and an April omtentamen);
KS and Fx need no month. The `.pdf` gets the **same stem** as its `.md`, so `HT2021 KS1.pdf` ↔
`HT2021 KS1.md` — the pairing the pipeline relies on is preserved.

## Identity is read from the document, never the filename

The old names are unreliable; the restructure's whole point is to fix that. Each file's folder, exam
label, term, month and solution-flag come from its **frontmatter and printed title/heading** (gathered
2026-10-25, `%TEMP%\identity.txt`). The traps already found:

- **HT2021 `tentamen_sol.md`** is the **April 2022 omtentamen** (problems). Its `exam_type` says
  `tentamen` but its title and period say april 2022, which is the omtentamen sitting. → `Tentor/HT2021
  Omtentamen april.md`. **This means `exam_type` alone is not authoritative**; reconcile it against
  `exam_period`/title, and where they disagree the printed title wins.
- **HT2021 `fx1_sol.md`** is a **problem set** ("UPPGIFTER TILL HT2021 … Fx-skrivning 1",
  `doc_type: exam`), not a solution. → `Fx1/HT2021 Fx1.md`, no "- Lösningar".
- **HT2025 `omtentamen_sol.md`** is the **April 2026 omtentamen problems** (`doc_type: exam`). →
  `Tentor/HT2025 Omtentamen april.md`, no "- Lösningar".
- **HT2021 `sept_tenta_sol.md`** = September 2022 omtentamen solutions. → `Tentor/HT2021 Omtentamen
  september - Lösningar.md`.
- **HT2020 `Omtenta_2021_04_08_lösningar.md`** = April 2021 omtentamen solutions. **HT2020
  `Tentamen_13_jan…`** = January 2021 tentamen solutions.
- **HT2019 `tenta_solutions.md`** = January 2020 tentamen solutions; **`hemtenta.md`** = the April
  2020 hemtentamen (→ `Tentor/HT2019 Hemtentamen april.md`); **`fx2.md`** = the komplettering.

### Five files whose number the title does not give — resolve before executing

The classifier could not assign Fx1 vs Fx2 for five files because the printed title omits the number,
and two of them collided on one name. Each is resolved by reading the body (which Fx-skrivning it is)
and, where needed, the `source_pdf`:

| File | Evidence to read | Expected |
|---|---|---|
| HT2024 `fx1.md` | source_pdf `fx1.pdf`, title "Februari 2025" | `Fx1/HT2024 Fx1.md` |
| HT2024 `fx2.md` | source_pdf `fx2.pdf`, title "Maj 2025" | `Fx2/HT2024 Fx2.md` |
| HT2019 `Fx1-solutions.md` | title "FX-skrivning … januari 2020 – Lösningar", pdf `Fx1-solutions` | `Fx1/HT2019 Fx1 - Lösningar.md` |
| HT2021 `fx1_sol.md` | problem set (above) | `Fx1/HT2021 Fx1.md` |
| HT2025 `fx2_sol-1.md` | title "FX-skrivning, maj 2026", pdf `fx2_sol-1` | `Fx2/HT2025 Fx2 - Lösningar.md` |

The agent step confirms each of the five from its own content before the move; a residual `Fx?` or
any within-folder name collision is a **hard stop**.

## What else must change in the same move (or it goes stale)

Each `.md` carries fields tied to the old names and layout; a rename that ignores them leaves the file
lying about itself:

1. **`related:` wikilinks** point at the old basename (`- "[[ten_sol]]"`). Rewrite each to the paired
   file's **new** stem (`- "[[HT2022 Tentamen - Lösningar]]"`). The 29 pairs are known
   (`cm1000-pairs.json`); re-point both directions.
2. **`source_pdf:`** names the old PDF basename (`"tenta.pdf"`). Since the PDF is renamed to match the
   MD stem, update it to the new PDF name (`"HT2022 Tentamen januari.pdf"`), so the link the pipeline
   trusts still holds.
3. **`source_subfolder:`** is `"Gamla Tentor/HT20xx"`. Update to the new folder
   (`"Gamla Tentor/Tentor"`), or the frontmatter contradicts where the file sits.
4. **The two `_INDEX.md`** (vault and raw). The vault one is regenerated by `cm1000-index.py` from the
   files, so it follows automatically **once that script is taught the new layout**. The raw `_INDEX`
   is out of scope (raw tree untouched) but still points at `HT20xx/…` paths, which now exist only in
   the raw tree — consistent there, so leave it.

Nothing in the MD **body** changes: page markers, image links (`assets/…`), `## Avvikelser` all stay.

## The pipeline's view, and the honest cost

The conversion tools assume `Gamla Tentor/HT20xx/`. This restructure is a **vault-side reorganisation
of the deployed output**, not a re-run of the pipeline. After it:

- `cm1000-deploy.py` would see the vault's new names as **collisions** (its ledger holds the old
  paths) and as **missing** (the work tree still has `HT20xx/` names). **So the pipeline can no longer
  deploy to the vault without being re-pointed.** This is the real tradeoff: the vault's exam tree and
  the pipeline's `out\CM1000\md\` diverge permanently unless the pipeline's layout is changed too.
- **Decision for the author:** the raw tree (pipeline's native target) keeps `HT20xx/`; the vault gets
  the new layout. The pipeline is "done" for CM1000 (F106), so divergence costs nothing unless a file
  is re-conreverted. **To keep the door open**, the plan records the mapping as data
  (`cm1000-restructure-map.json`) and a one-shot script, so a future re-deploy can be replayed. If the
  author would rather keep the two trees identical, the raw tree must be restructured too — but he said
  to leave it alone, so the plan honours that and accepts the divergence, documented.

## Procedure (one guarded script, dry-run first)

1. **Build the map** `(_sol?, old_path) -> (folder, new_stem)` for all 83, from the identity read,
   reconciling `exam_type` against `exam_period`/title (title wins). Resolve the five `Fx?` by body.
   **Assert:** 83 rows, 0 `Fx?`, 0 within-folder name collisions, every solution flag matches
   `doc_type`. Write the map to `cm1000-restructure-map.json` and print it for review.
2. **Snapshot** every exam `.md` and `.pdf` md5 before touching anything (so the move is proven
   content-preserving: only frontmatter's 3 link fields may differ, nothing else).
3. **Move + rename** each `.md` and its `.pdf` into the new folder (`git mv` is irrelevant — gitignored;
   use a plain move, created dirs first). Update the three frontmatter fields and the `related:` stems
   in the `.md` as bytes, preserving BOM/EOL. **One pair at a time**, read back after each.
4. **Delete the now-empty `HT20xx/` folders** in both the MD and PDF trees.
5. **Re-point and re-run `cm1000-index.py`** so the vault `_INDEX.md` reflects the new layout (identity
   table + area matrix unchanged in meaning, paths new).
6. **Verify** (below). Then update the tracked docs that describe this folder.

## Verification (conventions §2; the move is not done until all pass)

- **Count:** 83 `.md` and 83 `.pdf` in the new layout; 0 files left under any `HT20xx/`; folder counts
  match the table (KS1 11 … Tentor 21, Komplettering 1).
- **Content preserved:** every moved file's md5 equals its pre-move md5 **except** the ≤4 changed
  frontmatter lines; a diff shows only those lines.
- **Links:** a link check finds every `assets/…` image resolves (depth changed: `Tentor/` is one level
  deeper than `HT20xx/`? No — same depth, `Gamla Tentor/<type>/` replaces `Gamla Tentor/HT20xx/`, so
  the `../../assets/` prefix is unchanged. **Assert it**, do not assume.)
- **`related:` resolve:** every `[[…]]` names a file that now exists in the new layout.
- **Vault stays clean:** `Vault-Audit.ps1` (the exam tree is under `Filer/`, out of audit scope, so
  this only confirms nothing else broke), `markdownlint` on the vault, `git status` shows **no tracked
  file** newly added under `Filer/` (all still gitignored — the one real safety check).
- **An independent read-only audit** reproduces the counts and spot-checks five renames against the
  documents' own titles, including all three traps.

## Risks and the order

- **Biggest risk: a wrong identity sends a file to the wrong folder.** Mitigated by reading each
  document, the three traps enumerated, the five `Fx?` resolved by body, and the independent audit
  re-checking titles. A residual `Fx?` or collision stops the run.
- **Drive sync + rename is hard to undo.** Mitigated by the md5 snapshot and the map file: the move is
  replayable and reversible from the map. Back up the 83+83 files first to
  `%USERPROFILE%\KTHObsidian-backups\`.
- **Case-only or trailing-space names** — none; all new names differ by more than case.
- **The pipeline/vault divergence** is accepted and documented (above), per "leave the raw tree alone".

**Order:** map + asserts → review the map → backup + snapshot → move/rename/rewrite pair by pair →
delete empty folders → re-point and run index → verify → independent audit → update the tracked docs
(`current-state`, backlog F109, `Vault Standard §4` if it names the HT20xx layout) → report.
**Out of scope:** any commit; the raw tree; re-running the conversion; editing MD bodies.

## Review outcome — one STOP (fixed), then GO WITH CHANGES

Three lenses. The technical lens found a STOP-level defect; it is corrected here and the corrections
are the load-bearing part of the plan.

1. **STOP, fixed — the solution flag must come from `answer_key`, not `doc_type`.** Verified by reading
   the files: `tentamen_sol.md` (HT2021) is `answer_key: true`, 10 solution headings, 29 KB — it is the
   **solutions** to the April 2022 omtentamen, not the problems; `fx1_sol.md` (HT2021) is
   `answer_key: true` (a solution, despite its "UPPGIFTER" title); `omtentamen_sol.md` (HT2025) is
   `answer_key: true` (solutions). My draft read `doc_type`, which is wrongly `exam` on all three, and
   would have mislabelled them as problems **and** collided two pairs. **Correction:** the solution flag
   is `answer_key: true`; `doc_type` is ignored for it. The step-1 assert becomes "every file has
   `answer_key`, and the `- Lösningar` flag equals it" (not "== doc_type").
2. **Two malformed-frontmatter files.** `HT2021/tentamen_sol.md` and `fx1_sol.md` are missing the
   opening `---` (their block starts at `title:`). `answer_key: true` is still present and readable, so
   classification is safe, but the md5 "≤4 changed frontmatter lines" check must treat these two
   specially — the field rewrite still targets the same keys, wherever they sit. Flag both in the map.
3. **The three HT2021 Tentor solutions now resolve without collision.** The corrected HT2021 Tentor
   folder is five distinct files: `HT2021 Tentamen januari.md` (tentamen.md), `HT2021 Tentamen januari
   - Lösningar.md` (Tentamen_sol(1).md), `HT2021 Omtentamen april.md` (Omtentamen_April_2022.md,
   problems), `HT2021 Omtentamen april - Lösningar.md` (tentamen_sol.md, solutions), `HT2021 Omtentamen
   september - Lösningar.md` (sept_tenta_sol.md). The Fx1 collision dissolves the same way: `HT2021
   Fx1.md` (fx1.md) and `HT2021 Fx1 - Lösningar.md` (fx1_sol.md).
4. **Month on BOTH members of a Tentor pair** (premise + conformance): `HT2024 Tentamen januari.md` and
   `HT2024 Tentamen januari - Lösningar.md`, so a second same-label sitting cannot collide on the
   solution name. KS/Fx still need no month.
5. **`source_subfolder` has two forms vault-wide** — `"Canvas/Gamla Tentor/HT20xx"` (38 files) and
   `"Gamla Tentor/HT20xx"` (45). Rewrite only the **trailing `HT20xx` segment** to the new folder,
   preserving whatever prefix each file had.
6. **The deploy divergence is a refusal, not a note** (premise, blocking): a plain `cm1000-deploy.py`
   would re-create the old `HT20xx/` names in the vault beside the new ones. Add a guard to
   `cm1000-deploy.py` that **refuses to deploy CM1000 to the vault** and prints why (the vault's exam
   tree is hand-restructured; re-deploy via the map). Do not merely document it.
7. **Count table corrected:** Fx1 **11**, Fx2 **10** (after the five Fx? fold in), KS1 11, KS2 11, KS3
   10, KS4 8, Tentor 21, Komplettering 1 — **= 83**. The draft's "Fx1 8 / Fx2 8" was wrong (summed 78);
   a verification asserting 8 would have failed the correct result.
8. **Idempotency + dry-run gate** (conventions §3): the move script defaults to a dry run printing the
   full map, takes `-Apply`, and re-runs cleanly after a partial failure (a file already at its target
   is a no-op, not an error). Backup to `%USERPROFILE%\KTHObsidian-backups\` first.
9. **pdf2md docs updated too** (conformance): the vault↔pipeline divergence and the deploy guard are
   recorded in `C:\dev\pdf2md` (RUNLOG and the runbook), not only in the vault.
10. **Verification reads via files, never shell stdout** (T27): the Swedish names (`KS1_Lösningar`,
    `Fx-skrivning_2_lösningar`) truncate a console read silently.
11. **Accepted, noted:** the `assets/` crop stems keep the old names (`ks1_sol__p1_fig1.png`); links
    still resolve because bodies are untouched, and renaming crops would be a far larger, needless
    change. Image-link depth is unchanged (both reviewers confirmed `../../assets/` still resolves).
    F109 is the next free backlog number (read the highest again at write time; a parallel CM1000 agent
    could take it).

**Net:** the plan is sound once the solution flag is `answer_key`. The identity table in
`%TEMP%\classify.txt` is regenerated with that rule and re-checked for collisions before any file moves.
