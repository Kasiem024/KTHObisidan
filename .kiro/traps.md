---
inclusion: auto
description: Facts about this specific vault and toolchain that fail silently. Read before writing any script or trusting any measurement of this vault.
---

# Traps

Facts about **this** vault and **this** toolchain that will bite you. Not principles — you
could get scripting advice anywhere. Nothing here is derivable from general knowledge; every
entry came from an actual wrong result in this repository.

**Every trap here is silent.** None raises an error, fails a build, or prints a warning. They
produce a plausible wrong answer, which is far worse. That is the entry criterion: if it
throws, it does not belong here, it belongs in a normal doc.

There are **ten**. Do not add an eleventh without verifying it the same way — reproduce it, and
record the wrong result it produced.

---

## T1 — PowerShell 5.1 reads `.ps1` as ANSI, so Swedish literals never match

A script file containing `å ä ö` is mis-decoded on load. String comparisons against Swedish
text then match nothing, the script completes successfully, and reports zero results.

**What it produced:** sweeps that "found nothing to change" while hundreds of notes needed
changing.

**What to do:** keep every `.ps1` pure ASCII. Match with a wildcard or letter class
(`f.rel.sning`, `\p{L}`, `V.rdekedja`), filter by course code (always ASCII), or put Swedish
strings in a separate UTF-8 data file read with
`[System.IO.File]::ReadAllLines($p, [System.Text.Encoding]::UTF8)`.

## T2 — A mis-decoded path makes `Test-Path` return `$false`, and the loop skips the file

The most expensive trap here, hit **four separate times**. Output captured from `git` or the
console arrives mis-decoded, so a path containing `å ä ö` no longer exists as far as
`Test-Path` is concerned. A `continue` then skips it with no error.

**What it produced:** "34 tracked markdown files" when there were **529**; a size audit that
measured 34 of 1140 files; an agent's `tools` list read as empty.

**What to do:** never hardcode a path containing Swedish characters. Locate files with
`Get-ChildItem -Filter` on the ASCII part of the name. For repository facts use git itself
(`git ls-tree -r -l HEAD`) after `git config core.quotepath false`, and read sizes from git's
own output rather than the filesystem.

## T3 — `-match` is case-insensitive

PowerShell's `-match` ignores case by default, so a search for an acronym silently matches
ordinary words containing it.

**What it produced:** searching `NaN` matched "nan" inside fi**nan**siering and reported
**243 corrupted pages**; the true count was zero. A search for `WHERE` matched "where the
competition isn't".

**What to do:** use `-cmatch` or `[regex]::Matches` when case matters. Treat any
surprisingly large count as a suspect measurement, not a discovery.

## T4 — `.markdownlintignore` is inert

`markdownlint-cli2` does not read it; that is cli **v1** only. The file sits there looking
authoritative and does nothing.

**What it produced:** 536 files linted instead of 500, pulling in the Excalidraw drawings and
inflating the violation count from **767 to 1673**.

**What to do:** ignores go in `.markdownlint-cli2.jsonc` under `"ignores"`. After changing
them, check the `Linting: N file(s)` line — that number is the proof.

## T5 — The full audit cannot pass on a fresh clone

`courseMissingFolder` looks for category folders that are empty, and git stores no empty
directories. `brokenWikilinks` resolves links into `Litteraturlista/`, which `.gitignore`
excludes. Both pass locally because your disk holds state the repository does not.

**What it produced:** **68 + 49 = 117** false failures on a clean clone.

**What to do:** CI uses `-ContentOnly`, which skips exactly those two and still covers all
561 notes. Run the audit with no switches locally. If you add a check that reads untracked
state, add it to that exclusion and say why.

## T6 — `Select-Object -First N` in a pipeline destroys the exit code

Truncating a command's output closes the pipe, which kills the upstream process, and
`$LASTEXITCODE` becomes `-1` regardless of how the command actually finished.

**What it produced:** a clean audit reported as exit `-1`, and a working hook reported as
failing — both read as real defects for a minute.

**What to do:** when you care about the exit code, redirect to `$null` or a file and check
`$LASTEXITCODE` on its own. Never judge success from a truncated pipeline.

## T7 — .NET file APIs ignore `Set-Location`

`[System.IO.File]::ReadAllText('relative\path')` resolves against the **process** working
directory, which PowerShell's `Set-Location` does not change.

**What it produced:** reading an agent JSON in the site repo actually looked in the vault,
found nothing, and reported the agent as having no tools at all.

**What to do:** pass absolute paths to any `[System.IO.*]` call, or use `Resolve-Path` first.

## T8 — Line numbers from a scan go stale the moment you edit

Any insertion or deletion shifts every later line in that file, and a subsequent edit then
lands on the wrong line — usually a blank one, so nothing errors.

**What it produced:** four code fences skipped in one file because an earlier 3-line
replacement had shifted them by one.

**What to do:** process each file's targets in **descending** line order, or re-derive the
line numbers after every write. Guard the edit by asserting the line still looks like what
you expect before changing it.

## T9 — After decoding, a BOM is one character, not three bytes

`\xEF\xBB\xBF` is the UTF-8 *byte* sequence. Once the file is a .NET string, the BOM is the
single character `U+FEFF`, so a regex written against the byte form never matches.

**What it produced:** a frontmatter matcher that failed on every file in the vault at once.

**What to do:** detect with `[int][char]$raw[0] -eq 0xFEFF` and preserve it on write with
`New-Object System.Text.UTF8Encoding($hadBom)`.

## T10 — A Windows 8.3 short-name root path throws off Substring path math

Closely related to T2, but a different cause: not Swedish decoding, **Windows 8.3 short names**.
A root path like `C:\Users\RUNNER~1\...` (CI's `$env:TEMP`, the short form of `runneradmin`) is
a valid, existing path — `Test-Path` and `Get-ChildItem` both accept it. But `Get-ChildItem`
returns each item's `.FullName` in **long** form (`...\runneradmin\...`), so
`$f.FullName.Substring($Root.Length + 1)` starts several characters too early. Every derived
path segment is then shifted, and a gate such as `$seg[0] -eq 'KTH'` quietly fails.

**What it produced:** `Vault-Audit.ps1`'s five path-gated tag checks (`missingKTHtag`,
`missingYearTag`, `missingCourseCode`, `missingTypeTag`, `missingSubjectTag`) skipped every note
in the self-test fixture on `windows-latest`, so `Test-VaultAudit.ps1` reported **34/40** on CI
while showing **40/40** locally. The vault was clean; the harness had gone silently blind.
Latent locally because a normal `C:\Users\<name>` path has no short form (F62).

**What to do:** canonicalise any root path before doing arithmetic on it —
`$Root = (Get-Item -LiteralPath $Root).FullName` expands the 8.3 name to its long form so
`$Root` and `$f.FullName` share a prefix. More generally, never assume two paths to the same
file are string-comparable; resolve both through `Get-Item` / `Resolve-Path` first.

---

## Related but not silent

These are documented in `environment.md` because they announce themselves, so they are not
traps: git on Google Drive printing a benign `geometric repack` error (the push succeeds),
`npm` needing `cmd /c`, and shell stdout truncating on Swedish characters.

## Keeping this file honest

A trap that no longer reproduces is a **finding against this file**, not against the vault.
Delete it and note the removal. The same applies to any number quoted here.
