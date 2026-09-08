# Adversarial review — the `query-notebooklm` skill (2026-09-06)

Read-only review. The only file written was this report. Targets:
`.kiro/skills/query-notebooklm/SKILL.md` and `.kiro/skills/query-notebooklm/references/round-template.md`.
Cross-checked against `.kiro/skills/write-flashcards/references/evidence.md`,
`.kiro/skills/write-flashcards/SKILL.md`, `.kiro/README.md`, `.kiro/skills/SKILL.md` and the two
prior reviews under `.kiro/reports/`.

All character counts and file facts below are tool output, produced by a pure-ASCII PowerShell
script run against the real files and written to `%TEMP%` (per `environment.md`, to dodge Swedish
stdout truncation). The audit was run via `-File` so the shell reports the true process exit code
(trap T6). The verbatim measurement output:

```
FILE: ...\query-notebooklm\SKILL.md
  hasBOM=False  CRLF=0  LFonly=183  totalChars=12896
FILE: ...\query-notebooklm\references\round-template.md
  hasBOM=False  CRLF=0  LFonly=224  totalChars=12609
BLOCK: ACQUISITION PROMPT (full block)
  lines=11  sumOfLineChars=605
  LF join, no trailing NL   = 615      CRLF join = 625
BLOCK: QUERY SKELETON (full block, incl 1..8 <question> lines)
  lines=20  sumOfLineChars=933
  LF join, no trailing NL   = 952      LF+trailing = 953      CRLF = 971
BLOCK: QUERY SKELETON (contract only, through "Answer each question separately")
  lines=15  sumOfLineChars=891
  LF join, no trailing NL   = 905
BLOCK: WORKED ROUND (full block, 8 real questions)
  lines=17  sumOfLineChars=1232
  LF join, no trailing NL   = 1248     CRLF = 1264
ARTIFACT CHECK:
  path=...\Temp\nblm-limits  exists=False
  Build-PasteTests.ps1 exists=False
```

Bottom line up front: the skill is largely internally consistent and its citations of the
`write-flashcards` files all check out. Three real defects exist — one stale question count, one
whole stale section left behind by the "measured" revision, and a test-block method that points at
deleted files and cannot reproduce the boundary numbers it reports. The much-feared numeric drift
(3 800 / 5 000 / 952 / 300 / 40–100 / 235–223) is **not** present beyond those; **952 is exactly
right**.

---

## 1. Contradictions found

| # | What disagrees | Side A | Side B | Verdict |
|---|---|---|---|---|
| **A** | Questions per round: **eight** vs **ten** | `SKILL.md:83` "So **six to eight** specific questions per round"; corroborated by `round-template.md:200` "**Six to eight** questions per round", the query skeleton numbered to `8. <question>`, and the worked round's 8 questions | `SKILL.md:154` (anti-pattern table) "Twenty questions in one round \| **Six to ten**, then a follow-up round" | **Real.** One stale cell. Every other statement of the cap says 6–8; this one says 6–10. Classic leftover from an earlier draft. |
| **B** | Are the limits known, and do the test blocks exist? | `round-template.md:143` heading "**Unknowns worth measuring once**"; `:145` "**Both character limits are unknown**, and hitting one costs a round trip. **The test blocks are built:**" (present tense); `:147` "regenerable with `Build-PasteTests.ps1`" | `round-template.md:179` "Measured 2026-09-06. **Both maxima are now established.**"; `SKILL.md:35` "hard character limit of 5 000 (**measured**)" and step 4 "3 800 characters (hard maximum, **measured**)"; filesystem: `nblm-limits\` and `Build-PasteTests.ps1` **do not exist** | **Real.** The whole section intro (143–147) is pre-measurement text the "measured" revision never reconciled. It calls the now-established limits "unknown" and claims deleted files "are built". |
| **C** | Which blocks the experiment used | `round-template.md:146` fixed set `N = 1 000, 2 000, 4 000, 8 000, 12 000, 16 000, 24 000` — no 3 800, no 5 000 | `round-template.md:183` "At exactly **3 800** the end code `Z3800Q` came back"; `:213` "`Z3800Q` for the 3 800 block"; `:165` instruction to "**bisect** … between the last good length and the first bad one" | **Real (method vs results).** The documented generator produces only the coarse grid; the headline result rests on a 3 800-length block (and a 5 000 one) that the grid never contains and the doc never explains how to make. See §4/§7. |

No other figure disagrees with itself. Checked every occurrence of 3 800, 5 000, 3 600, 4 800, 952,
300, 40–100, 30–50, 235/223, "six" (documents) and "three to six" (runs) across both files: all
consistent. In particular `235 registered / 223 unique` (`SKILL.md:50–51`) matches `evidence.md`,
"Six … looked AI-generated" matches `evidence.md`'s six synthesis papers, and 952 is verified below.

---

## 2. The `952` claim, measured

**Claim (three places):** `SKILL.md:83` "the skeleton alone costs 952 characters"; `SKILL.md`
§"The output contract…" "The query skeleton below, without any questions filled in, measures **952
characters** — a quarter of the 3 800"; `round-template.md` §Results "The skeleton without questions
measures **952 characters**".

**Method.** Read `round-template.md` as UTF-8 bytes; located the ```` ```text ```` fence that opens
the "Query block skeleton" and the closing fence; took the 20 lines strictly between them
(the header, the four provenance bullets, the two rules, "Answer each question separately…", a blank
line, and the placeholder lines `1. <question>` … `8. <question>`); summed each line's `.Length`
(933) and added the inter-line newlines.

**Result: 952 — exact match.** 933 text chars + 19 LF newlines (20 lines, no trailing newline) =
**952**. The file is LF with no BOM (`CRLF=0`), so LF-no-trailing is the natural reading; under CRLF
it would be 971, with a trailing newline 953. "Without any questions filled in" means the numbered
placeholders are present but empty — dropping the `1.`–`8.` scaffold ("contract only") gives 905, so
952 is specifically the skeleton **with** the empty numbered slots. The claim is correct and "a
quarter of 3 800" (952 / 3800 = 25.1 %) is fair.

---

## 3. Claims about the `write-flashcards` files — all check out

Every attribution the skill makes to `evidence.md` / `write-flashcards/SKILL.md` was verified
present, in the stated form. I found **no** misattribution — reported plainly because a manufactured
finding is worse than none.

| Skill's claim | Where it lives in the cited files | Verdict |
|---|---|---|
| van Gog & Kester 2012, circuit troubleshooting, **70.07 % vs 51.25 %** at one week, **`d = 0.66` against testing** (`round-template.md` worked round, Q3 note) | `evidence.md` §11 table + "`t(37) = 2.06, p < .05, d = 0.66` — in favour of not testing"; `write-flashcards/SKILL.md` "What cards are for" ("70 % … 51 % … `d = 0.66` against testing") | **Verbatim match.** |
| **Adesope** contradicts **Rowland** on multiple-choice; surfaced only by asking for disconfirming evidence; left one rule tagged `[contested]` | `evidence.md` §9 "found multiple-choice stronger than short-answer, which contradicts the direction in Rowland 2014"; `write-flashcards/SKILL.md` rule 4 is `[contested]` and cites "Adesope et al.'s meta-analysis found multiple-choice *stronger*" | **Match.** |
| The **`[OTÄCKT]`** tier / "not covered" list | `evidence.md` Tiers table defines `[OTÄCKT]`; §21 "Not covered by any source" is the list | **Match** (see minor nuance below). |
| **Atomicity is untested**, hence `[heuristic]` (`round-template.md` Q7 note) | `evidence.md` §14 "No study compares … one compound card versus several atomic ones … Wozniak's own assertion `[HEURISTIK]`"; `write-flashcards/SKILL.md` rule 2 is `[heuristic]` | **Match.** |
| **Two effect sizes over-claimed**, survived into a rule, caught by an adversarial review; "two effect sizes attributed to two studies when both belonged to one, and a latency finding written up as a probability finding" (`SKILL.md` intro + Verify §1) | `write-flashcards/SKILL.md` rule 5 (`d = 0.27–0.31` both **Siefke**) and rule 9 (Radvansky & Copeland, "**That study reports latencies, not accuracy**") are both now `[indirect]`. `.kiro/reports/2026-09-06-flashcard-agent-adversarial-review-2.md` "Doc" rows record exactly these: *"Rule 5 attributes d = 0.27–0.31 to two studies when both numbers are Siefke … Rule 9 claims retrieval probability falls but quotes only latencies … Both tags downgraded `[measured]` → `[indirect]`"* | **Match**, and independently corroborated by the prior report. |

**Minor nuance (not a misattribution).** The skill's tier table lists five tiers as the vocabulary
that "produced `evidence.md`". `evidence.md` in fact uses two more in its body — `[BOK]` (§12,
Mayer) and `[OKÄND PROVENIENS]` (§15) — which its own Tiers table also omits. The skill doesn't
claim exclusivity, so this is a loose-end in `evidence.md` more than a false claim in the skill, but
a reader taking the skill's five as complete would be surprised.

---

## 4. Assertions resting only on the vault author's (relayed) report

None of these has a documentary source in the skill; all trace to one person's account of one
NotebookLM/Gemini setup. The skill states most of them as flat fact.

| Assertion | How it is stated | Where the advice breaks if the report is wrong |
|---|---|---|
| Cited sources auto-added; uncited must be added by hand (`SKILL.md` Stage 0) | Hedged once ("in **this user's setup**"), then treated as the load-bearing premise of the whole Stage 0 | If cited sources are *not* auto-added, the entire "the Deep Research prompt is a request for a bibliography" framing collapses — the central idea of the skill. |
| **Max 300 sources per notebook** (`SKILL.md:43`, and "300" throughout) | Flat fact | **The most dangerous one.** NotebookLM's source cap is plan-dependent and has changed over time (free tiers have been far below 300). If the real cap is e.g. 50, then "three to six runs", "keep 30–50 free" and "a run can eat a third of it" are all wrong — you would get 0–1 runs and the budgeting advice inverts. |
| **Each run returns 40–100** sources (`SKILL.md:43` and passim) | Flat fact | Drives "three to six runs" and every "wasted 40–100 slots" warning; if runs return far fewer/more, the run-budget math is off. |
| **ResearchGate never imports** (`SKILL.md`) | Flat fact ("has never worked") | Advice to treat such papers as "named but not importable / add by hand" is only right if the failure is truly categorical rather than intermittent. |
| Submitting a Deep Research prompt runs a real report and **adds 40–100 padding sources** (`SKILL.md` anti-patterns; `round-template.md:216`) | Flat fact | The elaborate "never test the limit in a working notebook / use a scratch notebook" protocol exists only for this; harmless if wrong, but wasted ceremony. |
| Character limits **3 800 / 5 000** ("measured") | `SKILL.md:35` and step 4 call both "measured" with no caveat | These are single paste-trials by the user. `round-template.md:180–184` is more honest — it notes the 3 800 figure "carries the stronger evidence" (end code returned) while 5 000 is only "no error". `SKILL.md` flattens that distinction. |

**Recommended framing (words only):** attribute this cluster to the author's report with the date,
and single out the 300-source cap as plan-/version-dependent rather than a constant, since the run
budget is built on it.

---

## 5. Is the advice actionable?

**Fit computations (all pass), from the measurement block above:**

- **Acquisition skeleton fits 5 000.** Empty block = **615** chars (LF) / 625 (CRLF); the fixed
  scaffolding is ~605 chars, leaving ~4 385 for the actual question. Fits with vast margin, and
  under the 4 800 working target. Confirmed.
- **Query skeleton + 6–8 questions fits 3 800.** Empty skeleton = 952; the worked round (8 real
  questions, contract omitted per "use the format I gave earlier") = **1 248** (LF) / 1 264 (CRLF).
  Even a *first* round that pastes the full 952 contract **and** eight real questions is bounded
  above by 952 + 1 248 = **2 200** (an over-count, it double-counts the intro), i.e. ~1 600 under the
  cap. Fits comfortably. Confirmed.
- **Worked example matches the stated rules:** 8 questions, inside "six to eight"; opens with "use
  the format I gave earlier", consistent with "send the contract once". One redundancy — its Q8
  ("what does no source in this notebook answer?") re-implements the contract's per-question rule 1
  as a separate sweep. Harmless, but a reader may wonder which mechanism is canonical.

**Gaps and ambiguities for a first-time agent:**

1. **"The query skeleton below … measures 952 characters"** (`SKILL.md`, output-contract section)
   points at a **table** ("Ask for | Because without it"), not a pasteable skeleton. The actual
   952-char block lives in `references/round-template.md`. An agent reading `SKILL.md` alone finds
   no block to paste and could paste the table. Fix: change "below" to a pointer to
   `references/round-template.md`.
2. **Question cap is ambiguous** because of contradiction A — is it 8 or 10? Pick one (6–8, to match
   the skeleton and worked round) and fix `SKILL.md:154`.
3. **The deleted test blocks (item 7).** `round-template.md:145–147` says the blocks "are built" and
   are "regenerable with `Build-PasteTests.ps1`"; both the `%TEMP%\nblm-limits\` directory and the
   script are **gone** (`exists=False`, and a temp-tree glob for `Build-PasteTests.ps1` /
   `nblm-limit-*.txt` returned nothing). So the document points at artifacts that no longer exist.
   Can it be rebuilt from prose alone? **Only partially.** The three-outcome logic (refused → hard
   limit; end code returned → whole; end code missing → silent truncation) and the `Z<N>Q` code
   trick are fully described. But four things needed for a faithful rebuild are missing:
   - **padding content is unspecified** (repeated char? lorem? it must not itself read as an
     instruction, since the block ends "reply with nothing but the end code");
   - **whether `N` is the total length or padding-before-the-code** is unstated ("Blocks of exact
     character length" vs "padding to an exact length and appending the code" disagree) — and at a
     boundary like 3 800 that ±6 chars is exactly what the test resolves;
   - the **exact instruction wording** is given only approximately, not verbatim;
   - the **boundary blocks that produced the answers (3 800, 5 000) are not in the fixed `N` set**
     and the doc never says `Build-PasteTests.ps1` takes an arbitrary `N`, so the "bisect" step
     (`:165`) cannot be reproduced from the documentation. (Contradiction C.)

---

## 6. Convention conformance

- **Registered in both tables:** yes. `.kiro/README.md` "## Skills" table lists `query-notebooklm`;
  `.kiro/skills/SKILL.md` table lists it too. ✓
- **Frontmatter valid:** `SKILL.md` has `name: query-notebooklm` + a `description`. ✓ The reference
  file has no frontmatter, which matches the format (only `SKILL.md` carries it; `write-flashcards`
  references are the same). ✓
- **LF, no BOM:** both files `hasBOM=False`, `CRLF=0` — pure LF. ✓ (measurement block).
- **"SKILL.md is navigation; detail in references/":** **borderline.** `SKILL.md` is 12 896 chars —
  slightly *larger* than its own reference (12 609) — and carries a full procedure, the complete
  tier table, a large anti-patterns table and a Verify section, i.e. a lot of the "answer". Content
  is duplicated across the two files (the provenance asks, the "not covered"/"contradicts" rules,
  the 3 800/5 000/3 600/4 800 numbers, the question count). That duplication is precisely the drift
  surface that produced contradictions A and B. Not out of line with the (also-large)
  `write-flashcards/SKILL.md`, so I flag it as a maintainability risk rather than a hard violation.
- **Vault audit:** run via `-File`:

  ```
  === VAULT AUDIT  2026-09-06 17:49 ===
  root=G:\My Drive\KTHObsidian
  notesInScope=516  (of 673 markdown files)

  RESULT: clean - no deviations from the standard.
  ```

  **RESULT: clean, process exit code 0.** (`.kiro/` is out of audit scope, so neither the skill nor
  this report affects it.)
- **Peripheral, outside this skill (noted because I read the file for this section):**
  `.kiro/README.md` top table still says *"`traps.md` | The **nine** things that fail silently"*,
  while `traps.md` opens "There are **fourteen**." A stale count in `README.md`, not in the skill.

---

## 7. What I could not verify, and what it would take

- **The tool behaviours in §4** — auto-add of cited sources, the 300-source cap, 40–100 per run,
  ResearchGate imports, and slot consumption on submit. I have only the relayed report; NotebookLM
  and Gemini are reachable only through the user. To verify: have the user read back the current
  source count / plan limit from the notebook UI, and confirm one uncited source stayed out and one
  ResearchGate link failed.
- **The real 3 800 / 5 000 limits.** I verified the skeleton arithmetic (952) and that both prompt
  types fit, but I cannot paste into NotebookLM/Deep Research; the limits themselves are the user's
  single trials. To verify: re-run a boundary paste (a `Z3800Q`/`Z3900Q` pair) and check the
  returned end code.
- **`Build-PasteTests.ps1`'s parameterisation and the original blocks.** The script and
  `%TEMP%\nblm-limits\` are deleted (confirmed absent). Whether it accepted an arbitrary `N` (needed
  to make the 3 800/5 000 blocks) is unknowable from the doc. To verify: recover the script from git
  history if it was ever committed, or rewrite it and re-measure.
- **The historical over-claim narrative in §3** is *confirmed* rather than open — the current
  `[indirect]` tags on rules 5 and 9 plus the `-review-2.md` "Doc" rows match the skill's account —
  so nothing there is left unverified.

---

## Proposed fixes (words only — nothing applied)

1. **A:** `SKILL.md:154` — change "Six to ten" to "Six to eight" so all four statements and the
   skeleton agree.
2. **B:** rewrite `round-template.md:143–147`. Retitle the section (it is no longer about
   "Unknowns"), change "Both character limits are unknown" to the measured statement, and stop
   claiming the blocks "are built" — either mark them deleted or move the fixed-`N` description into
   the "if it needs redoing" method as history.
3. **C / item 7:** in the method, state that `Build-PasteTests.ps1` took an arbitrary target length
   (used by the bisection to make the 3 800/5 000 blocks), or inline the block spec so it survives
   the script: padding rule, whether `N` counts the trailing code, and the verbatim instruction line.
4. **§4:** attribute the NotebookLM/Deep-Research behaviours to the author's report with the date,
   and flag the 300-source cap as plan-/version-dependent, since the run budget rests on it. Carry
   `round-template.md`'s "3 800 is better-evidenced than 5 000" nuance up into `SKILL.md:35`.
5. **§5.1:** fix "the query skeleton below" to point to `references/round-template.md`, where the
   pasteable block actually is.
6. **§3 minor:** add `[BOK]` and `[OKÄND PROVENIENS]` to the tier list (or note that `evidence.md`
   extends it), so the five are not read as exhaustive.
