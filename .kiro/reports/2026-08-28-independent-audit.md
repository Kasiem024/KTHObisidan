---
tags: [meta]
description: "Independent pre-commit audit of the F63 change set (cross-course concept tags + tag-aware index queries)."
---
# Independent Audit — F63 pre-commit verification (2026-08-28)

**Session:** independent-audit (role: vault-auditor). Read-only; no notes edited.
**Scope:** verify the uncommitted F63 change set is correct and conformant, and that
nothing else is broken. F63 = (1) 21 HE1033 Begrepp notes tagged `HI1032`, four of them
(`TCP`/`UDP`/`DNS`/`HTTP`) also `HI1031`; (2) all 23 course `_index.md` + the index template
made additive `FROM "<folder>" OR #<CODE>` on the Begrepp block; (3) docs synced
(Standard §5, Backlog F63).

## Verdict: PASS

All eight requested checks pass. The change is surgical, conformant, and matches its
documentation. Spaced-repetition data is provably untouched. One non-blocking observation
about F63's quoted separator figures is recorded below (§Observations).

## Per-check results

| # | Check | Result | Evidence |
|---|---|---|---|
| 1 | `Vault-Audit.ps1` (full, no switches) | ✅ PASS | `RESULT: clean`, `notesInScope=516`, exit 0 |
| 2 | `Test-VaultAudit.ps1` self-test | ✅ PASS | `40 assertions, 0 failed, 4.3 s`, exit 0 |
| 3 | `markdownlint-cli2 **/*.md` | ✅ PASS | `Linting: 538 files`, `Summary: 0 issues`, exit 0 |
| 4 | 21 HE1033 Begrepp tag edits | ✅ PASS | all 21 gained `HI1032`; exactly DNS/HTTP/TCP/UDP also gained `HI1031`; no dup tags; `nätverk`+dates intact |
| 5 | 23 indexes + template: additive on Begrepp block only | ✅ PASS | every changed `FROM` is followed by `WHERE contains(tags, "begrepp")`; 1 line/file; code matches folder |
| 6 | Spaced-repetition data untouched | ✅ PASS | diff changes 0 card lines; `<!--SR:-->`=1262 ✓, `DISABLEDFLASHCARD`=33 ✓; `data.json` = buryDate only |
| 7 | `git diff --stat` sanity | ✅ PASS | 51 files reconcile: 45 one-line content + 2 Meta docs + 4 incidental `.obsidian` |
| 8 | F63 entry + Standard §5 describe disk | ✅ PASS | both diffs read; text matches the on-disk changes |

## Detail

### 1–2. Audit + self-test

```
EXITCODE=0
notesInScope=516  (of 660 markdown files)
RESULT: clean - no deviations from the standard.
```

```
40 assertions, 0 failed, 4.3 s
RESULT: all 40 assertions pass.
```

`notesInScope=516` is unchanged — F63 added no notes and removed none. Run locally with no
switches, so `courseMissingFolder` and `brokenWikilinks` were included (T5).

### 3. Linter

`cmd /c "npx markdownlint-cli2 **/*.md > %TEMP%\lint_audit.txt 2>&1"`, exit 0:

```
Finding: **/*.md !.obsidian/** !.trash/** !.kiro/** !**/node_modules/** !**/Filer/**
  !**/*.excalidraw.md !**/Litteraturlista/** !Meta/Obsidian Plugins/Templates/**
Linting: 538 files
Summary: 0 issues in 0 files
```

The `Finding:` line proves the ignores are read from `.markdownlint-cli2.jsonc`, not the inert
`.markdownlintignore` (T4). 538 files, 0 issues — matches F63.

### 4. The 21 HE1033 Begrepp tag edits

Every note's `tags:` line went from the identical base
`[begrepp, HE1033, KTH, nätverk, year2026]` to one of:

- **17 notes** → `[begrepp, HE1033, HI1032, KTH, nätverk, year2026]`
- **4 notes** (DNS, HTTP, TCP, UDP) → `[begrepp, HE1033, HI1031, HI1032, KTH, nätverk, year2026]`

Verified from `git diff` (42 changed tag lines = 21 × removed+added):

- All 21 gained `HI1032`; exactly the four named notes additionally gained `HI1031`. No other
  note carries `HI1031`.
- New codes inserted **right after `HE1033`**, in numeric order (`HE1033, HI1031, HI1032`) —
  course codes stay grouped, as F63 claims.
- **No duplicate tags** in any array; `nätverk`, `KTH`, `year2026` unchanged.
- Course codes match the vocabulary pattern `[A-Z]{2}[0-9]{3}[0-9X]`: `HE1033`, `HI1031`,
  `HI1032` all valid.
- **`created`/`updated` intact**: each note's diff hunk is a single line (the `tags:` line);
  frontmatter dates are visible in the diff context and unchanged (e.g. TCP 2026-05-28, RIP
  2026-08-18). The audit's `created`/`updated`-presence checks also passed.
- Tag *order* is `…HE1033… KTH, nätverk…` (KTH before subject), which differs from the
  Standard's recommended order — but this is **pre-existing** (the old line already had it),
  the order convention is explicitly "recommended, not enforced," and the audit is clean. Not
  a defect introduced by F63.

### 5. The 23 indexes + template (additive, Begrepp block only)

48 changed `FROM` lines (24 files × removed+added). Each is exactly
`FROM "<folder>"` → `FROM "<folder>" OR #<CODE>`, and in **every** hunk the changed line is
immediately followed by `WHERE contains(tags, "begrepp")` — so only the Begrepp block was
touched; the Föreläsningar / Anteckningar / Labb / Alla blocks were not (also confirmed by
`git diff --stat`: exactly one changed line per index). All 23 codes match their folders:

```
HE1026 HF1005 HF1006 HI1024 CM1005 HH1802 HU1801 ME1003 CM1000 HI1027 HI1030 SF1686
CM1008 HE1028 HF1201 HI1025 HI1031 HI1032 HT100X HE1033 HF1012 HI1029 HI1039   (= 23)
```

Template (`Kurs Index Template.md`):

```
-FROM "<% k.courseFolderPath %>"
+FROM "<% k.courseFolderPath %>" OR #<% k.kurskod %>
```

Correct — the template now emits the additive form for any **new** course, so the convention
cannot drift on the next course created.

### 6. Spaced-repetition data untouched

Two independent lines of evidence:

**(a) Diff proof (definitive).** Across the whole `.md` diff, the only added/removed lines
containing card syntax (`::`, `;;`, `||`, `??`, `<!--SR:`, `DISABLEDFLASHCARD`) are diff
lines 610–611 — which are the **F63 Backlog entry's own prose** quoting the numbers, not any
flashcard. **Zero real card lines were added or removed.** Therefore the working-tree card
content is byte-identical to HEAD.

**(b) Absolute counts** via `[regex]::Matches` over 629 authored `.md` files (excluding
`\Meta\`, `\.kiro\`, `\.obsidian\`, `\.trash\`, `node_modules`, `Litteraturlista`):

| Marker | Counted | F63 | |
|---|---|---|---|
| `<!--SR:-->` | 1262 | 1262 | ✅ exact |
| `DISABLEDFLASHCARD` | 33 | 33 | ✅ exact |
| `::` | 1381 | 1378 | +3 |
| `;;` | 441 | 440 | +1 |
| `\|\|` | 169 | 165 | +4 |
| `??` | 221 | 219 | +2 |

The two unambiguous card markers match F63 exactly. See §Observations for the four
separators.

**Plugin state.** `.obsidian/plugins/obsidian-spaced-repetition/data.json` changed one line
only: `"buryDate": "2026-08-26"` → `"2026-08-27"`. That is the daily "cards buried until"
date written by the plugin; no separator setting, deck, or schedule was altered.

### 7. `git diff --stat` sanity

`51 files changed, 128 insertions(+), 77 deletions(-)` reconciles exactly:

| Group | Files | Note |
|---|---|---|
| 21 HE1033 Begrepp notes | 21 | 1 tag line each |
| 23 course `_index.md` | 23 | 1 FROM line each |
| 1 index template | 1 | 1 FROM line |
| `Meta/Vault Findings & Backlog.md` | 1 | +47 (F63 entry) |
| `Meta/Vault Standard.md` | 1 | +4 / −1 (§5) |
| `.obsidian/…/data.json`, `workspace.json`, `workspace-mobile.json`, `Pen.svg` | 4 | incidental Obsidian/plugin state |

= 45 one-line content + 2 docs + 4 `.obsidian` = 51. Untracked: exactly the 2 expected
`.kiro/reports/` files (`2026-08-28-fix-and-audit-prompt.md`,
`2026-08-28-vault-audit.md`) plus 8 `.obsidian/icons/*.svg` (iconize plugin churn).
**No note body changed, no flashcard edited, no whole-file line-ending rewrite.**

Line endings were preserved per file: git's "LF will be replaced by CRLF" warning list
includes only the LF files — the 23 indexes, template, both Meta docs, and the **three**
Begrepp notes HTTP/RIP/Sliding Window — while the other 18 (CRLF) Begrepp notes are absent.
This matches F63's documented claim precisely.

### 8. Docs match disk

- **Backlog F63** (added at line 1916, +47 lines) states 21 notes → `HI1032`, four →
  `HI1031`, 23 indexes + template additive, 516 in scope, 45 files. All independently
  confirmed above.
- **Standard §5** now reads: *"The **Begrepp** list is additive — `FROM "<folder>" OR #<CODE>`
  — so a concept note shared from another course … also surfaces here … see F63 and … Kurs
  Index Template.md."* Accurately describes the implemented query.

## What I checked / did not check

**Checked:** the full audit + its self-test; markdownlint over 538 files; the exact before/after
of all 45 content edits and both doc edits via `git diff`; the SR/separator fingerprint by raw
count *and* by proving the diff touches no card line; the `data.json` change; the working-tree
status (tracked + untracked).

**Did not check:** the Swedish prose/definition correctness of any note; whether the two
courses genuinely share this material pedagogically (took F63's justification as given); the
published Quartz site (out of scope for the vault audit — F63 itself notes the push/submodule
bump is a separate step); anything under `Litteraturlista/`, `.obsidian/` internals, or
`Ericsson/`.

## Observations (non-blocking)

1. **F63's four separator figures are marginally below a naive full-text count.** A raw
   `[regex]::Matches` over authored notes yields `::`=1381, `;;`=441, `||`=169, `??`=221 —
   each 1–4 higher than F63's `1378/440/165/219`. These four symbols are ordinary punctuation
   that also occurs outside flashcards (code fences, Dataview inline fields, prose), so a
   full-text count exceeds a flashcard-only count; F63 evidently measured the narrower set.
   This does **not** affect correctness: the unambiguous `<!--SR:-->` (1262) and
   `DISABLEDFLASHCARD` (33) match exactly, and the diff proves invariance directly, so F63's
   substantive claim ("fingerprint identical before and after") holds. Optional: note the
   counting method next to those numbers in F63 so a re-runner reproduces them.
2. **Incidental `.obsidian` churn** (workspace state, one deleted + eight added iconize SVGs)
   is unrelated to F63 and harmless, but will ride along in the commit unless staged
   selectively. Stage the 45 content files + 2 Meta docs explicitly if a clean commit is
   wanted.

## Recommended fixes

None required for the F63 change — it is correct and conformant. The two observations above
are optional polish, not defects.
