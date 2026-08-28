# Task: Fix vault CI failures + audit the Quartz site repo

You have full read/write access to two repositories:

1. **Vault repo** at `G:\My Drive\KTHObsidian`
2. **Quartz site repo** at `C:\dev\KTHObsidianQuartz`

Read `.kiro/steering/` in each repo before doing anything — they contain hard rules,
environment traps, and conventions specific to each project. `Meta/Vault Standard.md` in
the vault is the source of truth for vault conventions. `PROJECT-NOTES.md` in the Quartz
repo is the source of truth for the site.

---

## Part 1 — Fix the vault's CI failures

An audit on 2026-08-28 found two issues. The full report is at
`.kiro/reports/2026-08-28-vault-audit.md`. The vault content is clean; only the tooling
needs fixing.

### Fix A: 8.3 short-name path bug in `Vault-Audit.ps1`

**Problem:** On CI (`windows-latest`, Windows Server 2025), the self-test
(`Test-VaultAudit.ps1`) fails 6 of 40 assertions. The runner's `$env:TEMP` contains an 8.3
short name (`C:\Users\RUNNER~1\...`), but `Get-ChildItem` returns expanded long-name paths.
The `$f.FullName.Substring($Root.Length+1)` math is then off, so `$seg[0]` is not `KTH` and
5 path-gated tag checks silently skip every note.

**Fix:** In `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1`, after the block that determines
`$Root` (around line 30, after the `if(-not $Root)` / `while` / `if($d)` block), add:

```powershell
$Root = (Get-Item -LiteralPath $Root).FullName
```

This resolves 8.3 short names before any path arithmetic. One line, no note changes.

**Verify:**
1. Run the self-test: `powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Test-VaultAudit.ps1"` — must report 40/40.
2. Run the vault audit: `powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"` — must report `RESULT: clean`.
3. Run the linter: `cmd /c "npx markdownlint-cli2 **/*.md"` from the vault root — must report 0 errors on 538 files (ignore MD060 until Fix B is applied; use `cmd /c` because npm needs it in this environment).

### Fix B: Disable MD060 in `.markdownlint.json`

**Problem:** The local markdownlint (v0.23.2, markdownlint v0.41.1) reports 48 MD060
(`table-column-style`) violations across 3 files. CI pins v0.18.1 (markdownlint v0.38.0)
which doesn't have this rule, so CI passes but local runs fail. This is a version skew, not
a content problem.

**Fix:** Add `"MD060": false` to `.markdownlint.json` (vault root). Then add a row to the
table in `Meta/Vault Standard.md` (section at the top that lists rules deliberately switched
off):

| Rule | Off because |
| --- | --- |
| MD060 table column style | Obsidian writes compact tables with inconsistent pipe spacing |

**Verify:** `cmd /c "npx markdownlint-cli2 **/*.md"` must report `0 issues in 538 files`
(not 48).

### Documentation updates

1. **`Meta/Vault Findings & Backlog.md`** — add a new F-numbered entry (next after the
   current last) documenting both fixes: what was wrong, what was done, how it was verified,
   with the real numbers. Follow the style of existing entries.
2. **`.kiro/traps.md`** — consider adding a T10 for the 8.3 short-name trap if it meets the
   criteria (silent, produces a plausible wrong result). It's closely related to T2 but
   distinct: T2 is Swedish-character decoding, this is Windows 8.3 short names. Update the
   count at the top ("There are **nine**") if you add one.

### Commit and push (vault)

Stage only the files you changed (not `.obsidian/`). Commit with a message like:

```
fix(audit): resolve 8.3 short-name path mismatch; disable MD060
```

Push to `main`. CI should go green (40/40 self-test, 0 lint errors, audit clean).

---

## Part 2 — Audit the Quartz site repo

The vault auditor could not inspect this repo. Perform a full audit:

### 2a. Check the build

```
npx quartz build -d "G:\My Drive\KTHObsidian" -o C:\Temp\out
```

Use `-d` pointing at the **live vault**, not the pinned `content/` submodule (which may be
behind). Build into an **empty** directory.

### 2b. Run the site checker

```
node tools/check-site.mjs C:\Temp\out
```

Compare results against `site-baseline.json`. The key invariants:
- Raw flashcard syntax (`::`, `;;`, `||`, `??`) in visible page text: **must be 0**
- `<img>` without `alt`: **must be 0**
- KaTeX errors: **must be 0**
- `brokenInternalLinks`: must not exceed the baseline (currently 44)
- Page count and other metrics: drops over 5% from baseline are failures

### 2c. Check the CI workflow

Look at `.github/workflows/` — is the deploy pipeline passing? Check for the same kind of
issues the vault had (pinned versions, deprecated actions, etc.).

### 2d. Check `PROJECT-NOTES.md` accuracy

The documentation standard warns that stale numbers are a finding against the doc. Verify
that key figures in `PROJECT-NOTES.md` (page count, broken links, callout count, etc.) match
what `check-site.mjs` actually reports.

### 2e. Update the content submodule

If the vault push from Part 1 succeeds, the Quartz repo's `content/` submodule should be
updated to point at the new vault HEAD:

```
cd C:\dev\KTHObsidianQuartz
git -C content pull origin main
git add content
git commit -m "chore: update vault submodule to latest"
```

Then rebuild and re-check to confirm nothing broke.

### 2f. Write a report

Put your findings at `C:\dev\KTHObsidianQuartz\.kiro\reports\2026-08-28-site-audit.md`
(create the directory if needed). Same format as the vault report: verdict, table of
findings, what was checked, what was not checked, recommended fixes.

### Commit and push (Quartz)

If everything passes, commit any fixes plus the submodule update on a branch and push. Do
**not** push directly to `main` without confirming with the user — the Quartz repo deploys
automatically on push to `main`.

---

## Environment reminders

- **Windows, PowerShell 5.1** — keep `.ps1` files pure ASCII. Swedish chars get garbled.
- **`npm` needs `cmd /c`** — PowerShell blocks `npm.ps1`. Use `cmd /c "npx ..."`.
- **Google Drive** — `git push` prints a benign `geometric repack` error. The push succeeds.
- **Never touch `<!--SR:-->` comments or flashcard separators** (`::`, `;;`, `||`, `??`).
  They are live spaced-repetition data.
- **Read `.kiro/traps.md`** in both repos before writing any script.
- **Shell stdout truncates Swedish** — write results to a file under `%TEMP%` and read that.
