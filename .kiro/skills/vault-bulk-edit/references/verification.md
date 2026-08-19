# Verification after a bulk edit

Run all four. A change is not finished until every one passes.

## 1. Spaced-repetition fingerprint — must be identical

The deck is live review data. Count these before and after; any difference that you cannot
explain is data loss.

| Measure | Pattern | Expected (2026-08-19) |
|---|---|---|
| scheduling markers | `<!--SR:` | **1262** in study notes |
| single-line | `(?m)^.+?::\s` | 1070 |
| single-line reversed | `(?m)^.+?;;\s` | 270 |
| multi-line | `(?m)^\s*\|\|\s*$` | 100 |
| multi-line reversed | `(?m)^\s*\?\?\s*$` | 219 |
| disabled | `DISABLEDFLASHCARD` | 13 |

**Count study notes and `Meta/` docs separately.** A naive count reports the docs that
*describe* `<!--SR:-->` alongside real markers — that produced a false "1273 vs 1270"
mismatch and a minute of unnecessary panic. Exclude `\\Meta\\` from the study-note count.

## 2. Audit — must be clean

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"
```

Expected `RESULT: clean - no deviations from the standard.` with `notesInScope=470`, exit
code **0**. Add `-Detail` to list offenders. It exits **1** when not clean, so it can be
gated on.

`-ContentOnly` is for CI only: it skips `courseMissingFolder` and `brokenWikilinks`, which
depend on state git does not store. Locally, run with no switches.

## 3. Markdown lint — must be 0

```powershell
npx markdownlint-cli2 "**/*.md"
```

Expected `Linting: 493 file(s)` / `Summary: 0 error(s)`. Ignores live in
`.markdownlint-cli2.jsonc`; **`.markdownlintignore` is inert** in cli2 and silently linted
36 extra files when it was tried.

Never run `--fix` over the Templater templates — MD034's fix split a `<% %>` expression out
of a URL and broke the course template. They are excluded for that reason.

## 4. Build the live vault and compare

The site's `content/` is a pinned submodule, so a plain build shows the last *pushed* commit,
not your working tree:

```
npx quartz build -d "G:\My Drive\KTHObsidian" -o C:\Temp\out
node tools/check-site.mjs C:\Temp\out
```

Expected: exit 0, and every metric matching `site-baseline.json` — 601 pages, 353 with
callouts, 1965 callouts, 183 images, 0 alt-less, 0 KaTeX errors, 0 card leaks, 43 broken
links (all PDF links; PDFs are deliberately unpublished).

Counts may grow; a drop over 5% fails. That asymmetry is what catches a transformer silently
stopping work.

## Two traps when writing your own checks

**`-match` is case-insensitive.** Searching `NaN` matched "nan" inside fi**nan**siering and
reported 243 corrupted pages when the true count was zero. Use `-cmatch` or
`[regex]::Matches`. Be suspicious of any surprisingly large number.

**State the scope of what you checked.** A "0 pages show raw card syntax" result was wrong
for weeks because it only inspected pages containing `id="flashcards"`, missing 34 notes that
keep cards elsewhere. When grepping built HTML, strip `<script>`, `<pre>` and `<code>` first —
inline JS contains `||` and the Meta docs quote card syntax.
