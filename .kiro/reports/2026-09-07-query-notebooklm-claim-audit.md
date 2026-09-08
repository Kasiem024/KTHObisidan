# Claim audit: `query-notebooklm` skill

Adversarial audit, 2026-09-07. Target: the five files under `.kiro/skills/query-notebooklm/`
(`SKILL.md` + four `references/`). Evidence: the five Deep Research reports and the distilled
findings file in `.kiro/research/`, checked with PowerShell scripts (`.Contains()` for literals,
en-dash/`http`-aware counting, block extraction for character counts). Roughly **35 distinct
load-bearing claims** were examined.

## Verdict

The skill's *adversarial* content is accurate and holds up well: every self-critical claim I could
re-derive — the fabricated tree-depth statistic, the index-shifted shift-vector table, the number
drift (`49.7 %` vs `49.45 %`), the "Reddit domain" cross-attribution, the title-clause counts (9 of
19 in run 4), the five-section report-structure result, and the named-works verification — checks
out against the report files exactly. The failures are in the skill's *own bookkeeping figures*,
which is precisely where it sets itself the highest bar ("every figure measured or labelled by how
it is known"). Three figures fail that bar: the custom-instructions contract is **703 characters,
not the "952" claimed**; the per-run source count is quoted as **"20–50" eleven times (all four uses
in `SKILL.md`) although the skill elsewhere records that "20" was falsified and the range is
"18–50"**; and query-time filtering is called **"untested" in one paragraph and "tested … and it
works" in another of the same file**. None is dangerous, none is Critical, but each is exactly the
kind of un-reproducible or stale figure the skill exists to prevent.

## Findings

| Severity | File and section | The claim | What is wrong | How verified |
|---|---|---|---|---|
| **Major** | `references/notebook-setup.md` §1 "Custom instructions"; also `SKILL.md` step 4 | notebook-setup: *"The contract below is 952, so it fits nine times over."* SKILL: *"The output contract costs 952 characters, so set it once in the notebook's custom instructions"* | The custom-instructions contract block actually measures **703 characters** (704 with trailing newline). `952` is the length of the *query-block skeleton* in `round-template.md` (which is correctly 952) — it has been mis-copied onto the contract, a ~35 % overstatement. "Fits nine times over" is reasoning from the wrong number (703 fits ~14×; even 952 fits ~10×). | Extracted every 4-backtick fenced block and counted LF-joined chars: notebook-setup §1 block = **703**; round-template query skeleton = **952**; corpus-acquisition acquisition skeleton = **1513**. |
| **Major** | `SKILL.md` (Stage 0 + three anti-pattern rows); `references/corpus-acquisition.md`; `round-template.md`; `reading-a-report.md` | *"each run returns **20–50**"*, *"each run costs 20–50"*, *"a wasted 20–50 slots"* | The skill's own corrected figure is **"18–50 imported, 23–51 cited"** (`notebook-setup.md` figures table, which adds: *"The earlier figure of forty-to-a-hundred is withdrawn: its lower bound is falsified"*; `corpus-acquisition.md`: *"a third returned 18, so the range … had to be redone"*). Run 3 imported 18. `20` is neither the imported floor (18) nor the cited floor (23), yet "20–50" survives **11 times** — including all four uses in `SKILL.md`, which never states 18–50. | En-dash-aware count: `20–50` = 11 (SKILL 4, corpus-acquisition 4, round-template 2, reading-a-report 1); `18–50` = 2. Imported per run 1–5 = 40, 50, **18**, 26, 27 (min 18). |
| **Major** | `references/corpus-acquisition.md` — lever list item 3 vs "What is still untested" | Item 3: *"Filter at query time … Cheap, needs no human — but **untested**, so do not lean on it while deselection is available."* Later: *"**Query-time filtering: tested 2026-09-07, and it works.**"* | Direct internal contradiction in one file. The lever-3 prose is stale — not updated after the 2026-09-07 test it later describes in detail. | Read both passages; `untested` occurs 2× and `tested` 9× in the file. The excluded-domain list (`fast.io, rewriteai.com, eyesift.com, gradpilot.com, proofreaderpro.ai`) matches run 4's "Not documented" section verbatim, confirming the "tested" side. |
| **Minor** | `references/corpus-acquisition.md` (failure-rate paragraph) and `references/notebook-setup.md` (figures table) | *"Across four runs, 16 of 150 cited sources failed to import — **10.7 %**"*; figures table: *"Import failure rate \| **2 of 92** cited sources"* | `16 of 150` is correct for runs 1–4 but the *same comparison table* already contains run 5 (8 failed, 35 cited); a five-run figure is **24/185 = 13.0 %**. The `2 of 92` (2.2 %, runs 1–2) is superseded by 10.7 % and carries no "superseded" marker, though it is dated 2026-09-06. | Failed per run = 1, 1, 5, 9, 8; cited = 41, 51, 23, 35, 35. 16/150 = 10.67 %; 24/185 = 12.97 %; 2/92 = 2.17 %. |
| **Minor** | `references/corpus-acquisition.md` run-comparison table | *"Peer-reviewed / preprint share \| 23 of 40 … 57.5 % \| 23 of 50 … 46.0 % \| 13 of 23 … 56.5 % \| 18 of 35 … 51.4 % \| 19 of 35 … 54.3 %"*, and *"Run 3's share, 56.5 %, is statistically indistinguishable from run 1's 57.5 %"* | The share's **denominator changes basis by column**: it equals the *Imported* row for runs 1–2 (40, 50) but the *Sources cited* row for runs 3–5 (23, 35, 35), where imported was 18, 26, 27. It is internally consistent only if read as "size of the report's reference list" (which I confirmed), because the failed sources are excluded from that list in the meta runs but included in the text runs. The skill flags the *numerator* unit change ("official-or-arXiv" vs "journal-or-arXiv") but not this denominator change; on an imported basis run 3 is 13/18 = 72.2 %, not 56.5 %. All percentages themselves are arithmetically exact. | URL-list counts per report = 40, 50, 23, 35, 35 (34 https + 1 http for run 5) — these equal the denominators; imported (18, 26, 27) differ. Percentages recomputed from the printed fractions: all exact. Numerators (the "23/23/13/18/19 official" counts) were **not** independently reclassified. |
| **Minor** | `references/corpus-acquisition.md` ("Settled on 2026-09-06") vs `references/notebook-setup.md` ("The meta-notebook is closed" → "Three things remain untested") | corpus-acquisition lists *"Custom instructions govern every Studio output"* as **settled**; notebook-setup lists *"Whether custom instructions govern Studio output as documented … Generate one report and look for the provenance fields"* as still to do. | Terminological tension: the same fact is "settled/documented" in one file and an open verification task in another. Reconcilable (third-party-documented vs independently-measured-by-us), but a reader gets mixed signals about whether it is tested. | Read all three passages (§1 states it as third-party documented; the closing table lists it as untested-by-us). |

## Figures I reproduced (and they hold)

- **Acquisition-prompt skeleton = 1 513 characters** — measured exactly 1513. (`corpus-acquisition.md` ×2, `notebook-setup.md` figures table.)
- **Query-block skeleton = 952 characters** — measured exactly 952. (`round-template.md`; `notebook-setup.md` figures-table row "Query skeleton length".) *The 952 figure is correct here; the error is only its reuse for the contract.*
- **Sources cited per run = 41 / 51 / 23 / 35 / 35** — reference-list URL counts = 40 / 50 / 23 / 35 / 35, and the missing one in runs 1, 2, 5 is the failed import (identity `cited = imported + failed`: 41=40+1, 51=50+1, 23=18+5, 35=26+9, 35=27+8, all hold). Run 5's 35th is an `http://` link.
- **Imported = 40 / 50 / 18 / 26 / 27** — consistent with the identity above.
- **Discard counts 42 / 84 / 142** — literal fragments "42 sources" (run 3), "84 sources" (run 4), "142 sources" (run 5) each present exactly once.
- **Peer-reviewed-share percentages 57.5 / 46.0 / 56.5 / 51.4 / 54.3** — each exact for its printed fraction (denominator basis is the Minor finding above).
- **Import-failure arithmetic** — 16/150 = 10.7 % (runs 1–4); 2/92 = 2.2 % (runs 1–2); "five-fold" ≈ 10.7/2.2 = 4.9.
- **Slot total "90 of 300"** — 40 + 50 imported = 90. (Research-folder "74" = 18+26+27 imported + 3 auto-added reports; not quoted in the skill.)
- **Tree-depth fabrication (reading-a-report.md / distilled tier D)** — the report's `6.1 ± 1.1` vs `4.8 ± 1.1` is present in run 3; the paper's real values `6.83`, `6.70`, `6.56`, `0.017` are **absent from all five reports** (the single `0.017` hit is a flattened-table artifact: `deep-seek-v3`+`0.0`+`17.3` → `v30.017.3`, not the error bar). Direction-reversal claim confirmed.
- **Number drift** — `49.7`, `61.3→11.6` present in run 4; `49.45` and `11.77` absent from all reports. `61.22` present (report's own baseline), consistent with the skill's careful wording.
- **Index-shifted table (reading-a-report.md / tier D)** — run 5's table values `7.1`, `7.2`, `33.5`, `33.8` present; corrected values `38.3`, `37.4`, `39.8` and the string `Original corpus` absent from all reports (so the correction came from the primary, as claimed).
- **Cross-attribution** — `Reddit domain` absent from all reports; `60,000` (with comma) present in run 4. Matches the skill's account.
- **RAID Table 16 numbers** — `85.0`, `96.7` absent from the reports (the skill says they came from the primary paper, not the reports). Confirmed.
- **Title clause** — run 4 has **9** "title not verified" rows of 19 inventory rows; run 3 has 0 (clause not yet active) and puts `PMC11422446` in the author column with a title differing from its URL-list title; run 5 has 7. All match `reading-a-report.md` / `README.md`.
- **Report-structure lever ("Tested and it works")** — run 1 contains **none** of the five section labels; runs 2–5 contain **all five** (Findings / Single-source claims / Not documented / Source inventory / Discarded). Sound.
- **Named-works lever ("tested … and it works")** — run 5 contains the "Verification of Specific Requested Works and Resources" section addressing all three named works. Sound.
- **ResearchGate never imports** — researchgate.net URL counts = 0, 0, 4, 8, 8 across runs, matching the acquisition-log narrative (12 across the two 2026-09-07 text runs).

## Claims I could not check, and why

- **The two measured input limits (3 800 / 5 000 characters)** and the **~1 200-char floor under load** — require pasting into NotebookLM / Deep Research; no local artifact exists. Labelled "Measured" / "Official Google support" in the skill.
- **Numeric reproducibility ("zero drift over 6 questions × 3 runs")** — the three query transcripts were not archived in `.kiro/research/`, so the measurement cannot be re-derived here. Asserted as measured; not independently re-checkable.
- **Query-time-filtering test result** (the answer marking "56.65 %" excluded, etc.) — rests on a chat answer that is not stored in the repo. Only the excluded-domain list is re-checkable (and it matches run 4).
- **Corpus-state figures**: "235 registered / 223 unique", "six documents had no author / looked AI-generated", "one paper dated 2027", source-cap tiers "50/100/300/500/600" — these are notebook UI / provenance facts, not present in the report files. Labelled "Observed" / "third-party" in the skill.
- **The numerators of the peer-reviewed shares** (how many of each run's sources are "official-or-arXiv" / "journal-or-arXiv") — reclassifying every URL by hand is subjective and out of proportion; I verified the denominators and the arithmetic only.
- **"This skill produced write-flashcards' evidence.md (§1–§22) … two numbers were over-claimed"** — `write-flashcards` is explicitly out of scope for this audit; not examined.
