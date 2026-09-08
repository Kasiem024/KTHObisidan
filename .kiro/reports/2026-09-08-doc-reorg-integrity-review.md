# Doc-reorg integrity review (2026-09-08)

Adversarial review of the "steering says what to do, everything else says why"
documentation reorganisation. Read-only; no vault file was edited.

## Verdict

The reorganisation is **sound**. Both moves are real git renames with history preserved
(`R100` staged), all nine reference edits landed with zero old paths left in any live doc
(confirmed four independent ways), both agent JSONs are still valid and now load
`file://.kiro/steering/traps.md`, `scripts.md` and the Scripts folder name the identical set
of nine `.ps1`, and all four checks pass (audit clean, `Test-DocHygiene` clean,
`Test-ScriptHygiene` clean, markdownlint 540 files / 0 issues). Most importantly, **nothing
load-bearing was lost in the two trims**: every removed line is either a dated measurement a
named script now owns or narrative the backlog holds, and I verified F58/F59, F61, F67 and F71
actually contain what the trims now point at. No rule was dropped from either file. Findings
are all **Minor** and none is a defect in the reorg's substance: the claimed "character counts"
mix units (the "before" figures are character counts, the "after" figures are byte counts);
one retained cross-reference in `documentation-standard.md` ("re-derived later in this file ...
85 broken links") now half-dangles because the trim removed the later derivation; and two files
(`lessons-learned.md`, `Meta/Vault Standard.md`) carry a coherent second edit beyond the one the
claim list enumerated. I compared **all 17** backup files against their current state:
11 that changed were content-diffed (10 by line-level `Compare-Object`, `traps.md` by SHA-256),
and the 6 deliberately-unchanged files (the backlog plus five reports) were confirmed unchanged.

## Findings

| Sev | Claim | Measured | Verdict |
|---|---|---|---|
| None | Both moves show as renames (`R`) in `git status --short`; history preserved | `RM .kiro/traps.md -> .kiro/steering/traps.md` and `RM .kiro/current-state.md -> .kiro/steering/current-state.md`; `git diff --staged -M` scores both **R100** | **Verified** |
| None | Each of nine reference edits matched exactly one occurrence | Backup old-ref counts (1/1/1/**3**/1/1/1) all converted; current has **0** old refs, N new refs, per file | **Verified** |
| Minor | "...across **nine files**" | It is **seven files / nine edits** (`lessons-learned.md` carries three of the nine) | Wording only; substance correct |
| None | Zero dead refs to `.kiro/traps.md` / `.kiro/current-state.md` in live docs | grep (path form), grep (bare name), a 65-file PowerShell scan, and `Test-DocHygiene` all agree: every hit is in `.kiro/reports/**` or the backlog; **non-excluded = 0** | **Verified** |
| None | Both agent JSONs load `file://.kiro/steering/traps.md` and parse | `ConvertFrom-Json` OK for both; each has exactly 1 new ref, 0 old | **Verified** |
| None | Nothing load-bearing lost in the trims; backlog holds what they point at | Every removed item is a dated measurement (script-owned) or narrative (backlog-owned); F58/F59, F61, F67, F71 verified to contain the referenced facts; no rule removed | **Verified** |
| Minor | (`documentation-standard.md`) retained sentence: "re-derived **later in this file** (693 pages, **85** broken links)" | `85` no longer appears anywhere later in the file after the trim; `693` recurs once (as an assertion, not a re-derivation) | Stale internal cross-reference introduced by the trim |
| None | `scripts.md` names every existing script and vice versa | 9 named == 9 present; both set-differences empty; `Test-ScriptHygiene` clean (61 checks) | **Verified** |
| Minor | Claimed sizes: `scripts.md` 10 483 -> 10 203; `documentation-standard.md` 8 119 -> 6 388 (labelled characters) | Chars: 10483 -> **10158** and 8119 -> **6366**. Bytes: 10528 -> **10203** and 8148 -> **6388**. The "before" numbers are char counts; the "after" numbers are byte counts | Each number is a real measurement, but the pair mixes units, so neither the "characters" label nor the implied delta is internally consistent |
| Minor | (`lessons-learned.md`) claim listed "inclusion: auto -> manual" + 3 ref edits | The `description` frontmatter was **also** extended ("... insufficient, **or before adding one. NOT auto-loaded - this file explains why the rules exist; the rules themselves live in .kiro/steering/.**") | Coherent with the manual switch, but a change beyond those enumerated |
| Minor | (`Meta/Vault Standard.md`) claim listed one reference edit | The file also carries a second, undisclosed edit: the `updated` bullet was rewritten from "The Obsidian Linter plugin auto-updates `updated` on save" to "**`updated` is maintained by hand** ... It was removed in F75" | Coherent (F75 is a real closed entry, dated 2026-09-08); outside the stated reorg scope |
| None | All four checks pass | audit exit 0 "RESULT: clean" (`notesInScope=517`); `Test-DocHygiene` exit 0 clean; `Test-ScriptHygiene` exit 0 clean; markdownlint exit 0, "Linting: 540 files", 0 issues | **Verified** |

## Content lost in the trims

I diffed each trimmed file against its backup line by line. Every removed item is classified
below. **No rule was removed from either file** - `scripts.md`'s "Rules for adding one" (1-6)
is byte-identical across the diff, and both numbered rules plus the "fix the doc" and "read the
backlog entry" paragraphs survive intact in `documentation-standard.md`.

### `scripts.md` (chars 10483 -> 10158)

1. **The 11-row measured-values table** ("Measured 2026-09-06 18:00": notes in scope `516`;
   concept notes `396`; `## Definition`/`## Flashcards` `342 / 342`; `## Kopplat till`/`## Tenta-fokus`
   `319 / 42`; concept collections `53`; cards-without-`## Flashcards` `62`; `.md` excluded from
   tag index `112 of 673`; inline tags/junk/real `69 / 52 / 17`; `<!--SR:` studyNotes/wholeVault
   `1369 / 1441`; active-deck/`nosr`-excluded `2218 / 130`; notes tagged `nosr` `31`).
   **Judgement: dated measurements, correctly dropped.** Each figure is owned by a named script,
   and the replacement value-free table preserves the script-to-figure-family mapping. This is
   the file's own stated policy ("No figure is reproduced here, deliberately"). Live proof it was
   right to drop: the audit today reports `notesInScope=517`, not `516`.
2. **"the 1369 above was 1358 the previous afternoon ... reviews, not drift"** - narrative about a
   dropped dated value. Correctly dropped.
3. **"the denominator `673` counts every `.md` in the vault including `.kiro/`, so it changes when
   a report is written"** - a definitional note tied to the dropped `112 of 673` value; the
   definition is owned by `Get-ObsidianExcludes.ps1`. Acceptable to drop.
4. **The `nosr` caveat** ("their move from `32 / 2186 / 219` to `31 / 2218 / 130` on 2026-09-06 was
   not review drift - F71 removed the tag from HI1031 Kap 02, which returned its cards to the
   active deck"), compressed to "F71 is the example of a `nosr` change that looked like review
   drift and was not." **Judgement: narrative + dated values, pointer preserved and VERIFIED** -
   F71 (line 2509) documents "`nosr` was removed at the author's explicit request" on
   "HI1031 Begrepp - Kap 02 Systemmodeller.md".

### `documentation-standard.md` (chars 8119 -> 6366)

1. **"The `1262` above was `studyNotes` on 2026-08-27; on 2026-09-05 the same unit measured 1354
   ... not drift (F67)."** Dated measurement + narrative. **Pointer VERIFIED**: F67 (line 2101)
   restates "studyNotes 1354" and "The `1262` in F61/F65/F66 was correct for its date ... the
   difference is content authored since, not drift."
2. **The two vault-figure-movement paragraphs** (`470`->`561`->`520`->`516`, `352`->`441`->`400`->`396`,
   `493`->`583`->`542`->`538`, markers held at `1262`, the four cross-course duplicates
   `OSI-modellen`/`TCP`/`UDP`/`DNS`, 23 disabled cards). Dated + narrative. **Pointer VERIFIED**:
   F61 (line 1829) documents the OSI/TCP/UDP/DNS consolidation and "notes in scope 520 -> 516 ...
   concept notes 400 -> 396".
3. **The site-figure narrative** (`1270` from a CI log vs `693` local; 448-byte redirect stub;
   `KTH/2026-Höst/.../Replikering.html`; "NTFS is case-insensitive"; `1269 = 576 + 693`;
   `brokenInternalLinks` `85`). Dated + narrative. **Pointer VERIFIED**: F58 (line 1654) holds the
   `1270` figure and the broken-links story, and F59 - its explicit same-day follow-up - holds the
   full `1270`-vs-`693` resolution, the 448-byte stub, the NTFS collapse, `1269 = 576 + 693`, and
   the `85` figure. The core mechanism is also retained in the doc's "declared unit" subsection.
   *Caveat:* the definitive `693` resolution and the `85` figure live in **F59**, not F58, so a
   reader following the "F58 for the site's pages" pointer must read F58-F59 (they are contiguous).
   This is a pre-existing citation style, not introduced today.
4. **Rule-2 colour** ("artifacts returning 403 and the anonymous API rate-limited at 60/hour").
   Narrative detail; the rule itself is retained. Acceptable.
5. **"The lesson generalises: before changing a number, establish what it counts. Both sides ..."**
   Retained in substance as "Neither platform was wrong; nothing recorded what 'pages' meant."

The one wrinkle the trims introduced (Minor, above): the **retained** first paragraph still says
the figures "were re-derived **later in this file** (693 pages, 85 broken links)", but the later
re-derivation was the very narrative removed in item 3, so `85` no longer recurs and `693` recurs
only as an assertion. No figure is lost (both sit inline in that sentence and in the backlog);
only the "later in this file" promise is now stale.

## What I verified as correct

- **The two moves are genuine renames.** `git status --short` shows `RM ... -> ...` for both;
  `git diff --staged -M --name-status` scores both **R100** (100% similarity, pure rename). For
  `traps.md` the working-tree `M` is only a pending LF->CRLF normalisation - the raw content is
  byte-identical: **SHA-256 `671A7EA7...52D0BD` on backup and current alike**, both 19220 bytes.
- **All nine reference edits, no collateral.** Per-file backup->current: agents 1->1 each,
  `vault-auditor-prompt.md` 1->1, `lessons-learned.md` **3->3**, `sessions.md` 1->1,
  `Meta/Vault Standard.md` 1->1, `current-state.md` 1->1. Every backup old-ref became a new-ref;
  **0** old refs remain in any of them.
- **Zero dead references in live docs**, confirmed four ways: `grep '\.kiro/traps\.md'` (5 hits, all
  in `.kiro/reports/**`), `grep '\.kiro/current-state\.md'` (1 hit, the backlog), a bare-name grep
  `(traps|current-state)\.md` (every live-doc hit is the new path or a conceptual mention), a
  65-file PowerShell scan (non-excluded dead-ref files = **0**), and `Test-DocHygiene`'s own
  dead-reference check reporting clean.
- **Agent JSON validity + payload**: both parse via `ConvertFrom-Json`; each `resources` array now
  has exactly one `file://.kiro/steering/traps.md` and zero `file://.kiro/traps.md`.
- **`scripts.md` <-> folder agreement**: named `.ps1` = {Get-NoteStructureCensus, Get-ObsidianExcludes,
  Get-SRIntegrity, Get-TagInventory, Test-DocHygiene, Test-ScriptHygiene, Test-SRIntegrity,
  Test-VaultAudit, Vault-Audit} (9); folder `.ps1` = the identical 9; both differences empty.
- **`README.md` rewrite is internally consistent.** Folder table now lists `steering/traps.md`
  "The **eighteen** things that fail silently" (was "fourteen"/root `traps.md`),
  `steering/current-state.md`, and `lessons-learned.md` marked "**Not** auto-loaded". The "four
  kinds" section asserts "**Everything in this folder is loaded automatically; nothing outside it
  is.**" This does **not** contradict steering: `lessons-learned.md` is now `inclusion: manual` and
  sits outside `steering/`, while `traps.md`/`current-state.md` are inside `steering/` with
  `inclusion: auto`. Empirically confirmed by this very session's auto-loaded context: every
  `steering/*` file (including the two moved ones) was loaded; `lessons-learned.md` was not.
- **`current-state.md`'s own cross-references survive the move**: its table row is updated to
  `.kiro/steering/traps.md`; the remaining rows (`.kiro/lessons-learned.md`, `.kiro/sessions.md`,
  `.kiro/skills/`) point at files that did not move and are still correct.
- **`traps.md`'s internal references are not broken by relocation**: it cites `.kiro/sessions.md`
  (absolute, still correct) and bare `environment.md`/`conventions.md` (now co-located in
  `steering/`, so they resolve at least as well as before).
- **All four checks pass** (exit 0 each): audit "RESULT: clean" `notesInScope=517`;
  `Test-DocHygiene` "clean - no encoding, whitespace, corruption or dead-reference findings";
  `Test-ScriptHygiene` "clean - 13 files, 61 checks passed"; markdownlint "Linting: **540** files"
  (non-zero, unquoted glob through `cmd /c` per T11) with "0 issues".
- **The deliberately-unchanged set is genuinely unchanged** (claim 8): the five backup reports are
  byte-for-byte identical to their current copies (13982, 19180, 15099, 6406, 6344), and
  `Meta/Vault Findings & Backlog.md` still carries its pre-reorg reference at line 2711 - both left
  alone by design.

## What I could not check, and why

- **Kiro's auto-load mechanics for root-level `.kiro/*.md`.** I cannot prove from outside the
  engine whether `traps.md`/`current-state.md` were auto-loaded *before* the move (at root) or only
  *after* (in `steering/`). The end state is what the docs describe and is internally consistent,
  and the empirical fact that all `steering/*` files loaded into this session (and
  `lessons-learned.md` did not) matches the intended design.
- **Attribution of the two out-of-scope edits.** `lessons-learned.md`'s description extension and
  `Meta/Vault Standard.md`'s `updated`/F75 rewrite are present in the backup->current diff and are
  coherent, but whether they were made intentionally as part of this session's work or belong to a
  neighbouring task is not determinable from the artifacts. I confirmed only that they are
  internally sound (F75 exists and matches) and introduce no dead reference or corruption.
- **`git diff HEAD -M` renders `traps.md` as add+delete rather than a rename**, a working-tree-vs-HEAD
  artifact of the pending EOL normalisation. This does not weaken the claim: the authoritative
  index view (`git diff --staged -M`) and `git status --short` both report it as a rename, and the
  content hash proves identity. The wider working tree (HEAD still `cecab1d`, ~40 modified /
  ~28 untracked, including `conventions.md`/`environment.md`/`product.md` modified for reasons
  outside this reorg, and `scripts.md`/`sessions.md`/`flashcard-author.json` still untracked) is
  long-standing uncommitted state, not part of this review's scope.
