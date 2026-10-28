# Plan: record and act on what the CM1000 finishing session taught (2026-10-25)

**Status:** implemented 2026-10-25 18:20, after three reviews (outcome at the end); record and
verification in the backlog's **F108**; an independent audit reproduced every figure (PASS). **Goal:** every lesson from the session that finished CM1000
lands in a durable home, and every lesson a script could have prevented becomes a script change with a
test. Nothing is committed in either repository; the author has not asked.

## Evidence, measured 2026-10-25 15:50

- **E1, a silent trap, reproduced in isolation.** The shell tool's captured output ends at the first
  non-ASCII character that PowerShell, or a Python process that has not reconfigured stdout, prints:
  `Write-Output 'L1'; Write-Output ('L2 ' + [char]0xF6); ...` returned only `L1`, exit 0, stderr
  empty; `python -c "print('P1'); print(chr(246))"` returned only `P1`. Output that is already UTF-8
  survives, which is why the cm1000 scripts (stdout reconfigured in `cm1000_paths.py`) print `ö`
  fine. It produced at least six false "found nothing" reads this session: the F106 heading search,
  the HT2025 identity check, a pair confirmation showing 1 of 14 files, a cut final-check report.
  `traps.md`'s footer lists it among failures that "throw rather than mislead"; it does not throw.
- **E2, the deployed trees left the pipeline.** `cm1000-deploy.py dry` now reports `to_write=0
  unchanged=568 collisions=116`; 116 = 29 pairs x 2 files x 2 trees. The `related:` lines were written
  straight into both deployed trees, so the work tree no longer holds them; the next merge and deploy
  cannot carry them, and a forced deploy would strip them. `_INDEX.md` was written the same way.
- **E3.** The empty `KTH/2025 Höst/SF1686 Flervariabelanalys/` folder is gone (`Test-Path` False), so
  `current-state.md` and `reentry.md` parked item 3 are stale. **E10.** HEAD moved `b7bbe4f` to
  `ac18f97` (the committing agent); `reentry.md`'s repository state is stale.
- **E4, the parenthesis regex has two more copies.** `cm1000-verify.py:166` strips image links with
  `\([^)]*\)`, which leaves `__pN_figM.png)` behind for `Tentamen_sol(1)` crops as spurious verifier
  tokens that reviewers then accepted as artifacts; `cm1000-checklist.py:65` captures the same way.
- **E5, most figure differences were the instrument.** Of about 40 differences decided this session,
  about 30 were noise: 25 spellings of "no label" (`(inga)`, `(inga etiketter inuti figuren)` against
  `inga tryckta`), 1 set label split on its comma (`{1, 2}`), about 10 labels just outside a tight
  crop, 6 blocks a part file wrote without the code fence, 4 drawings that never got a crop. The briefs
  give three forms for "no labels" (brief-C graphs, brief-Cpart `anm:`, none for figure blocks).
- **E6, three gate weaknesses.** The decisions file is read without BOM tolerance, so an `UNSURE` on
  line 1 behind a BOM would pass; any line containing `only in A` decides every no-crop difference;
  crop short names match as substrings (`p2_fig1` inside `p2_fig10`).
- **E7.** `cm1000-acceptscan.py` prints 12 lines ending `UNMATCHED (read each) 102` with one shown;
  the full list is only in `logs\batchN-accept-scan.txt`, which the output never names.
- **E8.** The index generator keyed true identities by basename, which collided across years
  (HT2021 and HT2025 `tentamen_sol`); caught only by reading the output. The index, related, final-check
  and tree-compare scripts exist only in `%TEMP%`.
- **E9.** `.kiro/lessons-learned.md` is mixed again (1109 CRLF, 33 LF) an hour after I normalized it
  to CRLF; git stores it LF and the write tool appends LF. `Test-DocHygiene.ps1` does not report it.
- **E11, what worked.** Four subagent calls of at most four one-unit stages read 15 units with no
  timeout; telling stages to begin each decision line with the verbatim figcompare text fixed the gate
  mismatches. The first subagent report claimed "figcompare rerun = 0 differences" while the file
  still held one: the file is the evidence, never the summary.

## A. pdf2md scripts (each change gets a self-test case)

- **A1, one copy of each fragile rule.** `cm1000_paths.py` gains `read_text()` (utf-8-sig) and
  `IMG_LINK_RE` (an image link captured up to its extension). Used by unitgate, figcompare, cjoin,
  acceptscan, verify (link stripping, E4), checklist (E4), merge and links. Two copies of one regex
  is how one bug was fixed twice and missed twice.
- **A2, figcompare stops reporting its own noise (E5).** Every "no label" spelling reads as empty;
  labels and edges split on commas at brace depth 0 only; a C file with a `bild:` line outside a code
  fence exits 2 instead of reporting "only in A".
- **A3, the gate closes E6.** BOM-tolerant reads; crop short names match on boundaries; each no-crop
  difference needs its own decision line containing its verbatim text. The two decision files that
  pass today only through the generic token (4-31, 4-66) get their verbatim lines first.
- **A4.** acceptscan ends by naming the file that holds the full list (E7).
- **A5, the %TEMP% scripts become pipeline steps (E2, E8).** `cm1000-related.py` (pairs as data, runs
  on the work tree after every merge), `cm1000-index.py` (per tree, keyed by relative path, written
  after deploy), `cm1000-finalcheck.py`, `cm1000-treecmp.py`. Then `related` on the work tree, and
  `deploy dry` must show `collisions=0`.
- **A6, briefs.** One form for "no printed labels" in A, C and Cpart; `etiketter:` holds only text
  printed inside the drawing; a decision line is the verbatim figcompare line, then ` — A RIGHT:` or
  ` — C RIGHT:` and the reason; Cpart shows the fence.
- **A7, written down for the next course, not built now:** pad figure crops (about ten decisions this
  session were labels just outside the crop); list drawings with no crop for C as page images.
- **A8, regression after all script changes:** self-test (old and new cases), gates for batches 1-4
  (79 units must pass), merge (95 OK, merged count not above parts), related, deploy dry, links
  (0 broken), treecmp (95 identical), finalcheck. **A9:** re-run `cm1000-progress.py`, whose own
  `logs\progress.txt` my `>` redirect overwrote with a traceback.

## B. pdf2md docs

- **B1.** `docs\RUNBOOK_TEX_MATH_BATCH.md`: a finishing section (merge, related, deploy, index, links,
  finalcheck, treecmp, in that order, and why derived content enters through the work tree); the E5
  noise classes and their fixes; the E1 trap; the subagent limits confirmed again.
- **B2.** `prep\cm1000\README.md`: the new scripts and the pipeline order.
- **B3.** `docs\CONVERSION_LOG.md` §56 (CM1000 complete, the session's lessons); `comms\STATUS.md`
  CM1000 row done, 95/95.
- **B4.** pdf2md `.kiro\steering\environment.md` (E1; never redirect into a file the script writes) and
  `conversion-method.md` (fix the instrument before adjudicating its output; derived data through the
  work tree).
- **B5.** The three Kiro knowledge bases that still index `C:\pdf2md\` are re-pointed to `C:\dev\pdf2md\`.

## C. Vault scripts

- **C1.** `Test-DocHygiene.ps1` reports mixed line endings in authored `.kiro` docs (E9).
  `lessons-learned.md` is normalized to LF, git's stored form and the write tool's, with a backup and
  a text-identical proof. Then `Test-ScriptHygiene.ps1` clean and the `scripts.md` row updated.

## D. Vault docs

- **D1.** `traps.md` T27 for E1 (reproduced above, wrong results named), the footer corrected, count 27.
- **D2.** `lessons-learned.md`: E5 (instrument noise cost more review than real errors), E6 (a BOM
  could have passed an UNSURE), E2 (derived data written around the pipeline), E8 (basename identity),
  E9 (normalizing to a file's majority drifted back), E1 (documented, yet misread six times).
- **D3.** Backlog **F108** (F107 is the highest today; re-read before writing).
- **D4.** `current-state.md` in flight for this pass, reset when done, SF1686 lines removed;
  `reentry.md` repository state (`ac18f97`), parked item 3 removed, pointer to F108.
- **D5.** Vault `environment.md`, *Capture output to a file*: point at T27; read results with the
  read tool, never by printing them.

## Order and done criteria

A (one script per step, self-test after each) → A8 → B → C → D → final checks: vault audit with no
switch, lint, Test-DocHygiene, Test-ScriptHygiene; pdf2md self-test and the A8 set. Then an
independent read-only audit subagent, then the report. **Out of scope:** commits, re-converting any
document, editing any deliverable beyond its `related:` line.

## Review outcome (premise, conformance, technical: all GO WITH CHANGES) and the changes adopted

1. **E3 was wrong by the time it was read.** The SF1686 folder was back at 17:32 (gone at 15:50) —
   `environment.md`'s Drive re-creation, a second time. D4 no longer touches the SF1686 lines; they stay,
   with the date it returned, and it stays his call.
2. **Lessons go to the repository they are about.** E2, E5, E6 and E8 are pdf2md lessons: RUNBOOK and
   pdf2md steering only. The vault's `lessons-learned.md` gets the vault-side ones: E1, E9, the stale
   E3 plan, and "the file is the evidence, never the subagent's summary" (E11).
3. **No commit id in `reentry.md`**, which is the mistake `current-state.md` warns about; point at
   `git status`.
4. **A5's done criterion is md5, not `collisions=0`.** Snapshot every deployed `.md` and `.png` first;
   afterwards all must be unchanged. `related:` is re-applied to the work tree with the same bytes;
   `deploy.py` refreshes its ledger for files that are already identical, so the 116 stop colliding.
   `merge.py` calls the related step itself, so a merge can never strip the links again. `_INDEX.md`
   stays written per tree by `cm1000-index.py`, as `deploy.py`'s docstring already says it is.
5. **A2 before A3, then re-run everything.** After figcompare changes, re-run it for every unit with
   figure work and re-gate all four batches. A unit the stricter gate fails is a finding to read, never
   a decision file to pad. A self-test case must prove a real label difference still fires.
6. **C1 flags only truly mixed files** (CRLF and lone LF in one file), never uniform CRLF, which every
   fresh clone has under `core.autocrlf=true` (the T5 shape).
7. **Order by value:** A1-A3 and A5 first, A4/A9/B5 last.
