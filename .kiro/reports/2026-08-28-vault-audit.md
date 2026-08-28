# Vault Audit Report — 2026-08-28

## Verdict

**Vault content: clean.** The audit passes with 516 notes in scope, exit 0.

**CI pipeline: broken.** The self-test (`Test-VaultAudit.ps1`) fails 6 of 40 assertions
on the GitHub Actions runner. The vault is correct; the *test harness* has a bug that only
manifests on CI's environment.

**Local linter: 48 new violations** from MD060 (`table-column-style`), a rule that did not
exist in the CI-pinned version. Not a regression — a version skew.

## Findings

| # | Finding | Count | Affected |
|---|---------|-------|----------|
| 1 | Self-test fails on CI: 5 tag-completeness checks inert | 5 checks | `missingKTHtag`, `missingYearTag`, `missingCourseCode`, `missingTypeTag`, `missingSubjectTag` |
| 2 | Self-test meta-assertion fails (`-ContentOnly keeps every other check`) | 1 check | Same 5 checks above |
| 3 | MD060 `table-column-style` violations (local only) | 48 hits in 3 files | `Ansoff Tillväxtmatris.md`, `LABA Uppgift 1 HI1029 - Kasiem Al-Mshabbak.md`, `Vault Findings & Backlog.md` |

## Finding 1 — Root cause analysis

### The symptom

CI (commit `0061347`, 2026-08-27) runs the self-test on `windows-latest` (Windows Server
2025). Five checks report `NOT REPORTED - this check no longer fires`. All five share one
code path — the block gated by:

```powershell
if($seg.Length -ge 3 -and $seg[0] -eq 'KTH' -and $seg[1] -match '^\d{4}\s' -and $seg[2] -cmatch '^[A-Z]{2}\d{3}[0-9X]')
```

### The cause: 8.3 short-name path mismatch

The CI runner's `$env:TEMP` is `C:\Users\RUNNER~1\AppData\Local\Temp` (8.3 short name for
`runneradmin`). The self-test sets:

```
$fx = Join-Path $env:TEMP 'vault-audit-selftest'
```

giving `$fx = 'C:\Users\RUNNER~1\AppData\Local\Temp\vault-audit-selftest'`.

This is passed as `-Root $fx` to the audit. Inside the audit, `$Root` keeps the short-name
form. But `Get-ChildItem -LiteralPath $Root -Recurse -File` returns items whose `.FullName`
is expanded to the **long-name** form:

```
C:\Users\runneradmin\AppData\Local\Temp\vault-audit-selftest\KTH\2026 Vår\...
```

`RUNNER~1` is 8 chars; `runneradmin` is 11 chars — a 3-character difference. The relative
path is computed as:

```powershell
$rel = $f.FullName.Substring($Root.Length + 1)
```

Because `$Root.Length` is 3 chars too short, `$rel` starts 3 characters too early:

```
Expected: KTH\2026 Vår\HE1033 Kommunikationsnät\Begrepp\q-nokth.md
Actual:   min\AppData\Local\Temp\vault-audit-selftest\KTH\...  (shifted)
```

Then `$seg[0]` is `min` instead of `KTH`, the gate fails, and all five checks are skipped.

### Why it passes locally

The local `$env:TEMP` (`C:\Users\ekasalm\AppData\Local\Temp`) contains no 8.3 short names,
so `$Root` and `$f.FullName` agree on the prefix. The bug is latent locally.

### Why the real vault audit still passes on CI

The real vault audit runs against the checkout at `D:\a\KTHObisidan\KTHObisidan` — no 8.3
names in that path. The tag checks work correctly. The bug only affects the self-test's
temp-dir fixture.

### Recommended fix

In `Vault-Audit.ps1`, after `$Root` is determined, resolve it to a canonical path:

```powershell
$Root = (Get-Item -LiteralPath $Root).FullName
```

This expands `RUNNER~1` to `runneradmin`, so `Substring` math is correct on any machine.
The same one-liner fixes both the normal and `-ContentOnly` paths.

This is a one-line change to the audit script. No notes are touched. Apply, then verify:
1. `Test-VaultAudit.ps1` passes locally (40/40).
2. The vault audit still passes (`RESULT: clean`).
3. Push and confirm CI goes green.

If this is treated as a new trap, it belongs alongside T2 in `.kiro/traps.md` — both are
path-math errors caused by the path string not being what it looks like — but it is
narrower: T2 is about Swedish characters, this is about 8.3 short names.

## Finding 3 — MD060 version skew

MD060 (`table-column-style`) was introduced in markdownlint v0.39.0. CI pins
`markdownlint-cli2@0.18.1` (markdownlint v0.38.0) so this rule does not exist there.
The local install is `markdownlint-cli2 v0.23.2` (markdownlint v0.41.1), where MD060 is
**on by default**.

48 violations across 3 files:

- `KTH/.../Ansoff Tillväxtmatris.md` — 2 hits (compact table style)
- `KTH/.../LABA Uppgift 1 HI1029 - Kasiem Al-Mshabbak.md` — 19 hits (tight table style)
- `Meta/Vault Findings & Backlog.md` — 27 hits (compact table style)

**Options:**

1. **Disable MD060** in `.markdownlint.json` (add `"MD060": false`) — consistent with how
   other Obsidian-generated table quirks are handled (MD010, MD029, MD032).
2. **Pin the local CLI version** to match CI (`npx markdownlint-cli2@0.18.1`).
3. **Upgrade the CI pin** to v0.23.2 and fix the 48 violations.

Option 1 is the path of least resistance and matches the vault's stance on Obsidian's table
output (MD029, MD032 are already off for similar reasons). Add a row to the Vault Standard's
rule table explaining why.

## What was checked

- **Vault audit** (`Vault-Audit.ps1 -Detail`): exit 0, 516 notes in scope, all checks pass.
- **Self-test** (`Test-VaultAudit.ps1`): 40/40 locally; 34/40 on CI (from the log provided).
- **Markdown linter** (`markdownlint-cli2 "**/*.md"`): 538 files linted. 0 issues on CI
  (v0.18.1); 48 MD060 issues locally (v0.23.2).
- **Uncommitted changes**: only `.obsidian/` plugin state (out of scope).
- **Git status**: clean working tree for all in-scope files.

## What was NOT checked

- **Quartz repo** — separate repository, not accessible from this vault. Cannot audit the
  published site, its build pipeline, or its baseline figures.
- **Note content quality** — the audit checks structure, not whether a Swedish definition is
  correct, a flashcard answer is right, or a `## Kopplat till` link is meaningful.
- **Published site rendering** — whether cards render correctly, whether empty sections are
  hidden, whether descriptions appear in meta tags. That requires running the Quartz build.
- **Backlog accuracy** — whether figures in `Vault Findings & Backlog.md` still match reality.
  The documentation standard warns about stale numbers; a separate pass would be needed to
  verify each one.
- **CI workflow correctness beyond the test failure** — the `actions/checkout@v4` Node 20
  deprecation warning is cosmetic (it already runs on Node 24), not a defect.
