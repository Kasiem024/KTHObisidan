---
inclusion: auto
description: Facts about this specific vault and toolchain that fail silently. Read before writing any script or trusting any measurement of this vault.
---

# Traps

Facts about **this** vault and **this** toolchain that will bite you. Every entry came from an actual
wrong result here, and **every one is silent** — none throws, none fails a build. They produce a
plausible wrong answer, which is worse. That is the entry criterion: if it throws, it belongs in
`environment.md`.

There are **twenty-four**. Do not add a twenty-fifth without reproducing it and recording the wrong result
it produced. Each entry is the mechanism, the wrong answer it caused, and what to do instead; the
forensics live in `Meta/Vault Findings & Backlog.md` and `.kiro/lessons-learned.md`.

**T16 to T18 share one shape:** each makes a search return *absent* for text that is present, or
*present everywhere* for a pattern matching nothing. They break the verification rather than the work,
so they make you report a fix that never happened.

---

## T1 — PowerShell 5.1 reads `.ps1` as ANSI, so Swedish literals never match

A script containing `å ä ö` is mis-decoded on load, so comparisons against Swedish text match nothing
and the script exits successfully reporting zero results.

**Produced:** sweeps that "found nothing to change" while hundreds of notes needed changing.

**What to do:** keep every `.ps1` pure ASCII. Match with a wildcard or letter class (`f.rel.sning`,
`\p{L}`, `V.rdekedja`), filter by course code (always ASCII), or put Swedish strings in a separate
UTF-8 data file read with
`[System.IO.File]::ReadAllLines($p, [System.Text.Encoding]::UTF8)`.

## T2 — A mis-decoded path makes `Test-Path` return `$false`, and the loop skips the file

Hit **four separate times**. Output captured from `git` or the console arrives mis-decoded, so a path
containing `å ä ö` no longer exists as far as `Test-Path` is concerned, and a `continue` skips it
silently.

**Produced:** "34 tracked markdown files" when there were **529**; a size audit that measured 34 of
1140 files; an agent's `tools` list read as empty.

**What to do:** never hardcode a path containing Swedish characters. Locate files with
`Get-ChildItem -Filter` on the ASCII part of the name. For repository facts use git itself
(`git ls-tree -r -l HEAD`) after `git config core.quotepath false`, and read sizes from git's own
output rather than the filesystem.

**`core.quotepath false` is only half the fix, and the other half bit three times in one session.**
That setting stops *git* from octal-escaping the bytes; it does nothing about **PowerShell decoding
git's stdout using the console code page**. So `git ls-files` and `git diff --name-only` hand back
`H|-+st` where the tree holds `Höst`, and feeding that string to the next git command matches
nothing — `git diff -- <path>` prints no hunks, `git show HEAD:<path>` returns empty, both exit 0.

**Produced, on 2026-09-26:** a classifier that read the diff of 23 changed notes and reported
`REVIEW DATA ONLY - safe` for **every one**, because each per-file `git diff` returned zero lines.
The real diff was 1035 insertions and 1605 deletions. The same session then read `srMarkers at HEAD
= 0` for three decks that HEAD holds 61, 15 and 0 markers for, and nearly concluded the committed
history had no review data at all.

**What to do:** set the console encoding before invoking git, and restore it afterwards:

```powershell
$prev = [Console]::OutputEncoding
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
try { $paths = @(& git ls-files 'KTH/*') ; ... } finally { [Console]::OutputEncoding = $prev }
```

Verify the round trip before trusting it — `git cat-file -e HEAD:<path>` exits 0 only if the path
resolved. And prefer a form that never sends a path back to git: `git diff --numstat` reports counts
per file in one call, which is how the 1035/1605 figure was finally obtained.

**That form stops being safe the moment you scope it, and that bit again on 2026-10-01.** The whole
point is to send git *no path*; `git diff --numstat -- '<path with å ä ö>'` is a pathspec, so it
matches nothing and prints nothing while exiting 0. It was used to prove that five decks held only
review data, returned zero changed lines, and would have read as *"nothing changed"* on files that
had in fact changed. Take the whole diff in one call and split it per file **in PowerShell**, never by
asking git for a subset.

## T3 — `-match` is case-insensitive

PowerShell's `-match` ignores case by default, so a search for an acronym matches ordinary words
containing it.

**Produced:** `NaN` matched "nan" inside fi**nan**siering and reported **243 corrupted pages**; the
true count was zero. `WHERE` matched "where the competition isn't".

**What to do:** use `-cmatch` or `[regex]::Matches` when case matters. **For a scan over a list of
identifiers — forbidden strings, codenames, tool names — anchor each one with `\b`**, or the same
substring bug reappears as a false *positive*: a scan for `ncu` flagged the word `concurrency` and a
correct passage was reworded for nothing. Treat any surprisingly large count as a suspect measurement,
not a discovery.

## T4 — `.markdownlintignore` is inert

`markdownlint-cli2` does not read it; that is cli **v1** only. The file sits there looking
authoritative and does nothing.

**Produced:** 536 files linted instead of 500, inflating the violation count from **767 to 1673**.

**What to do:** ignores go in `.markdownlint-cli2.jsonc` under `"ignores"`. After changing them, check
the `Linting: N file(s)` line — that number is the proof.

## T5 — The full audit cannot pass on a fresh clone

`courseMissingFolder` looks for empty category folders and git stores no empty directories.
`brokenWikilinks` resolves links into `Litteraturlista/`, which `.gitignore` excludes. Both pass
locally because your disk holds state the repository does not.

**Produced:** **68 + 49 = 117** false failures on a clean clone.

**What to do:** CI uses `-ContentOnly`, which skips exactly those two and still covers every note in
scope. Run the audit with no switches locally. If you add a check that reads untracked state, add it
to that exclusion and say why.

## T6 — `Select-Object -First N` in a pipeline destroys the exit code

Truncating output closes the pipe, which kills the upstream process, and `$LASTEXITCODE` becomes `-1`
regardless of how the command finished.

**Produced:** a clean audit reported as exit `-1`, and a working hook reported as failing.

**What to do:** when you care about the exit code, redirect to `$null` or a file and check
`$LASTEXITCODE` on its own. Never judge success from a truncated pipeline.

## T7 — .NET file APIs ignore `Set-Location`

`[System.IO.File]::ReadAllText('relative\path')` resolves against the **process** working directory,
which `Set-Location` does not change.

**Produced:** reading an agent JSON in the site repo actually looked in the vault, found nothing, and
reported the agent as having no tools.

**What to do:** pass absolute paths to any `[System.IO.*]` call, or use `Resolve-Path` first.

## T8 — Line numbers from a scan go stale the moment you edit

Any insertion or deletion shifts every later line, so a subsequent edit lands on the wrong line —
usually a blank one, so nothing errors.

**Produced:** four code fences skipped in one file because an earlier 3-line replacement had shifted
them by one.

**What to do:** process each file's targets in **descending** line order, or re-derive the line numbers
after every write. Assert the line still looks like what you expect before changing it.

## T9 — After decoding, a BOM is one character, not three bytes

`\xEF\xBB\xBF` is the UTF-8 *byte* sequence. Once the file is a .NET string the BOM is the single
character `U+FEFF`, so a regex written against the byte form never matches.

**Produced:** a frontmatter matcher that failed on every file in the vault at once.

**And the fix this entry used to recommend was itself wrong.** It said to detect with
`[int][char]$raw[0] -eq 0xFEFF`. That only works on a string that still contains the BOM, and
`[System.IO.File]::ReadAllText($path)` **consumes it as a preamble** — so the test never fires and
a script that trusts it strips the BOM on write. Measured: a file whose first three bytes are
`EF BB BF` followed by `hello` reads back with length 5 and `h` as its first character. Nothing was
damaged only because `0 of 629` notes under `KTH/` carry a BOM.

**What to do:** detect from the **bytes**, not the decoded string —
`$b = [System.IO.File]::ReadAllBytes($p)` then
`$b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF`. Preserve it on write
with `New-Object System.Text.UTF8Encoding($hadBom)` and let the **encoding** emit the preamble; do
not also prepend `U+FEFF`, or it is written twice. The working pattern is in `environment.md`.

## T10 — A Windows 8.3 short-name root path throws off `Substring` path math

Related to T2 but a different cause. A root like `C:\Users\RUNNER~1\...` (CI's `$env:TEMP`) is valid
and exists, but `Get-ChildItem` returns each item's `.FullName` in **long** form, so
`$f.FullName.Substring($Root.Length + 1)` starts several characters too early and every derived path
segment shifts. A gate such as `$seg[0] -eq 'KTH'` then quietly fails.

**Produced:** the audit's five path-gated tag checks skipped **every** note in the self-test fixture on
`windows-latest`, so the harness reported **34/40** on CI while showing 40/40 locally. The vault was
clean; the harness had gone blind. Latent locally, because a normal `C:\Users\<name>` path has no short
form (F62).

**What to do:** canonicalise any root before doing arithmetic on it —
`$Root = (Get-Item -LiteralPath $Root).FullName`. More generally, never assume two paths to the same
file are string-comparable; resolve both through `Get-Item` or `Resolve-Path` first.

## T11 — Through `cmd /c`, quoting the markdownlint glob makes it lint zero files

`npx` needs `cmd /c` here. But inside `cmd /c "npx markdownlint-cli2 \"**/*.md\""` the escaped quotes
are passed through as part of the pattern, so the tool globs the literal string `"**/*.md"`, matches
nothing, prints `Linting: 0 files` and exits **0**. The `Finding:` line is the tell: a leading quote
and a trailing slash.

**Produced:** `Linting: 0 files` read as "lint clean" three times in one session while every lintable
file went unchecked.

**What to do:** through `cmd /c`, pass the glob **unquoted** — `cmd /c "npx markdownlint-cli2 **/*.md"`
— and confirm the `Linting: N files` line is non-zero and plausible. Run directly in PowerShell and the
quotes are fine; only the `cmd /c` wrapper breaks them.

---

## T12 — In .NET multiline mode `$` does not absorb `\r`, so an anchored pattern skips every CRLF file

`(?m)$` matches immediately **before** a `\n`, leaving any preceding `\r` unmatched. So a pattern
ending `[ \t]*$` cannot match a line in a CRLF file. **This vault genuinely mixes both conventions**,
which is what makes the bug intermittent: `Meta/Vault Standard.md` is LF and
`Meta/Vault Findings & Backlog.md` is CRLF.

**Produced:** a fence stripper matched **8 of 8** blocks in the LF file and **0 of 6** in the CRLF one,
so a `# Nätverk MOC` example inside a fenced block was counted as a real second H1.

**What to do:** write `[ \t]*\r?$`, and test any line-anchored pattern against a CRLF fixture.
`Test-VaultAudit.ps1` plants `ag-crlf-fence.md` for exactly this reason.

## T13 — `(?s)` makes a frontmatter pattern run past the frontmatter to the next `---`

With `(?s)`, `.` matches newlines, so `\A---\r?\n.*?excalidraw.*?\r?\n---` does **not** mean
"excalidraw appears in the frontmatter". The lazy `.*?` runs to any later `---`, and Markdown uses
`---` as a horizontal rule.

**Produced:** the audit skipped `Meta/Vault Standard.md` and `Meta/Vault Findings & Backlog.md` from
**every** content check, because both discuss the tag and both contain rules. It reported 516 notes,
inspected 514, and printed `RESULT: clean` while both files were missing a required `description`.

**What to do:** capture the frontmatter block **once** —
`[regex]::Match($t,'(?s)\A---\r?\n(.*?)\r?\n---')` — and test the capture group, never the whole
document.

## T14 — Dataview does not honour Obsidian's "Excluded files"

`userIgnoreFilters` filters the tag pane, Search, Graph and Unlinked mentions, so it is easy to assume
a folder excluded there is excluded everywhere. Dataview builds its own index and **never** consults
it — verified by the absence of any `isUserIgnored` reference in the plugin's `main.js`.

**Produced:** five sections of `Atlas/Vault Health Report.md` each listed **77 false positives** from
`Filer/` while the audit reported clean on the same vault. Both tools looked healthy in isolation.

**What to do:** every Dataview query carries its own scope guard
(`!contains(file.folder, "Filer")`). When the audit's scope changes, change the queries in the same
edit, mirroring the audit rather than inventing a second scope.

## T15 — `--resume-id` is silently ignored unless you pass `--agent-engine v2`

`kiro-cli chat --help` documents `--resume-id` and states that `v2` is the default. It is not: with no
flag, and with `v1`, the id is accepted, no history loads, a **brand-new conversation** starts and the
process exits **0**. A nonexistent id behaves identically, so a typo is indistinguishable from a
working resume. `v3` reads the transcript but forks it under a new key.

**Produced:** a resumed session answered "this is your first message" against the transcript it was
pointed at. Reproduced on kiro-cli 2.21.1: two failures on the default engine and one on v1, against
three successes on explicit v2.

**What to do:** always `kiro-cli chat --agent-engine v2 --resume-id <id>`, from the vault root so
steering loads. Under v2 a dead id fails loudly with `error: ACP load_session failed`, so verify a
resume by whether the agent can quote something only that transcript contains — never by exit code.
See `.kiro/sessions.md` for what a resumed session actually restores.

---

## T16 — An unescaped `|` in a "literal" search pattern matches at every position

`[regex]::Matches($text, '| 40 | 50 |')` does not look for a table row. `|` is alternation, and an
alternation containing an empty branch matches at **every character offset**. The same shape catches
`**bold**` (`*` is a quantifier), `(` in a caption, and `.` in a version number. `-match` and
`-replace` take regexes too, so a "quick literal check" is never literal.

**Produced:** a check on whether one table row existed reported **31 372 matches** in a 31 KB file. The
row did exist, so the absurd number read as a formatting quirk rather than a broken test.

**What to do:** for a literal use `.Contains()`, which takes no pattern. If you need a regex, wrap the
literal part in `[regex]::Escape()`. Treat any match count near the file's character length as a broken
pattern, not a finding.

## T17 — A phrase search fails on text that is present, because the file renders it differently

`.Contains("a phrase")` compares your literal to the file's bytes, and the file rarely stores a phrase
the way you typed it. Four variants have each caused a false negative here:

- **Line wrapping.** These docs wrap near 100 columns, so `until this is tested` is stored as
  `until this` + newline + `is tested`.
- **Markdown structure inside the phrase.** A blockquote stores `>` at the start of every line.
- **Digit grouping.** `8 290`, `8,290` and `8290` are three different strings. These files use spaces.
- **Unicode punctuation.** `−10.40` uses U+2212 MINUS, not `-`. Likewise en dashes and `…`.

**Produced:** four wrong answers in one day — a stale claim reported as removed while still in the file,
three load-bearing figures reported missing from a file containing all three, two statistics reported
missing, and one verbatim quote reported absent from the file that quotes it.

**What to do:** normalise both sides before comparing — `[regex]::Replace($t, '\s+', ' ')`, stripping
`>` and `#` markers if the phrase spans a quote. Search the **shortest distinctive fragment** that
cannot wrap. Test every digit-grouping variant. And **never report "absent" from a single negative**:
confirm it with a differently-shaped test, because a false negative is indistinguishable from a real
absence.

## T18 — A backtick inside a double-quoted PowerShell string is an escape, not a character

PowerShell's escape character is the backtick, so inside `"..."` it is consumed by the parser. A regex
for six code-fence backticks hands the engine three. The regex is valid, so nothing complains. The same
applies to `$` in a double-quoted regex, which PowerShell tries to expand as a variable.

**Produced:** a fence count that appeared to jump from **4 to 6** between two runs on an unchanged file.
It bit again the next day while a backlog entry *about this trap* was being written.

**What to do:** put backtick-containing patterns in **single quotes**, where PowerShell performs no
escape processing. Where a double-quoted string is unavoidable, build the character with `[char]0x60`.
For any string mixing quotes, backticks and unicode, use single-quoted text with `{TOKEN}` placeholders
and `.Replace()` them afterwards.

## T19 — `Get-ChildItem -Filter "*Kap NN*"` matches two courses, and `-First 1` picks the wrong one

Two courses run in **2026 Höst** and both number their notes by chapter, so
`-Filter "*Begrepp - Kap 02*.md"` matches `HI1031 Begrepp - Kap 02 Systemmodeller.md` **and**
`HI1032 Begrepp - Kap 02 Nätverksmodeller.md`. Enumeration order is not alphabetical by course —
HI1032 came first — so `Select-Object -First 1` silently measured the other course's deck.

**Produced:** a card census reporting **10 cards** in a deck that held **62**. The figure was absurd
enough to catch, which is the only reason it was caught; a closer pair of decks would have passed.

**What to do:** put the course code in the filter — `-Filter "HI1031 Begrepp - Kap 02*.md"` — and assert
the resolved filename in the output, so the file being measured is visible next to its numbers. Never
combine a loose `-Filter` with `-First 1`. Add **`-File`** while you are there: a `-Filter` also matches
*directories* whose names share the pattern, and `-First 1` will happily hand you one.

---

## T20 — editing part of a multi-line card leaves a broken card that still counts as one

A multi-line flashcard is three things: a front line, a separator line that is exactly `||` or `??`, and
the body bullets. A `strReplace` that targets **only the body** replaces the bullets and leaves the front
and the separator behind, where they silently adopt whatever text follows them. Nothing errors: the file
is still valid Markdown, and the plugin renders a question whose answer belongs to a different card.

**The census cannot see it either.** A card counter looks for lines that *are* `||`, so an orphaned
separator still counts as one multi-line card. Delete one card and add one, and the total is unchanged —
the arithmetic looks perfect while the deck holds a question with no answer.

**Produced:** in HI1031's chapter 10 deck, replacing the two bullets under
`Vilka tva legitima skal till anonymitet ger boken? (2)` left that front line and its `||` sitting
directly above an unrelated `::` card. `TOTAL=58` was exactly the expected number. It was found only by
reading the region back afterwards.

**What to do:** when editing a card, put the **whole block** in the `oldStr` — front line through last
body line — so a mismatch fails loudly instead of half-succeeding. Then read the block back. Card counts
are evidence about quantity, never about structure.

## T21 — `.Split("a string")` splits on every character in it, not on the string

.NET Framework's `String.Split` has no overload taking a single `string`, so PowerShell 5.1
coerces the argument to `char[]` and splits on **each character independently**. A separator like
`" -> "` therefore splits on space, `-` and `>`, which shreds any value containing a hyphen. It
also yields empty elements where the characters were adjacent, so the result *looks* like a
parsing artifact rather than a wrong separator.

**Produced:** an inbound-link count for HI1031's `Begrepp/` folder that reported **8 of 14 notes
with zero inbound links**, when every one of the 14 had at least one. The edge list was built as
`"$src -> $tgt"` and read back with `.Split(" -> ")`, so `Peer-to-peer -> Klient-server-modellen`
became nine elements ending in `modellen`, and no target name ever matched a real note. The
zeros were plausible for a small young folder, which is why the figure was nearly reported.

**What to do:** use the PowerShell operator `-split ' -> '`, which is a regex and treats the
whole string as one separator, or the explicit .NET overload
`.Split([string[]]@(' -> '), [StringSplitOptions]::None)`. Better still, do not serialise a pair
into a string and parse it back — keep the two values in a two-element array or a hashtable.
Nothing throws in any of these cases, so the only tell is a count that is suspiciously round.

---

## T22 — `sr-baseline.json` is one global file, so a parallel agent silently redates your baseline

`Get-SRIntegrity.ps1 -Save` writes to a **single fixed path**, and `-Compare` reads whatever is there.
The protocol assumes one editor. Run several agents against the same vault and any one of them calling
`-Save` replaces the snapshot the others are measuring against — with no warning, because a baseline
file with a newer timestamp is indistinguishable from the one you took.

**Produced, on 2026-09-26:** a baseline was taken at 22:56 before a rework of ten decks. One of the
agents re-saved it at 23:53, mid-run. The `-Compare` afterwards reported HI1031 chapter 1 as
`cards 27 -> 25` and listed no change at all for chapters 2, 11 and 16 — all three already rewritten
before the new snapshot. The real figures were 43 → 24 cards and 142 → 73 markers across the ten
decks. The comparison looked clean and precise, and was measuring the last twenty minutes of a
four-hour edit.

**What to do:** read the `baseline taken at <timestamp>` line the script prints and check it is
**yours**. If several agents will touch decks, do not rely on the shared baseline at all: take your
own per-file fingerprint first — bytes, cards per separator, `<!--SR:` count — and check the
arithmetic against that. The claim that must hold is *markers removed equals cards deleted that had
markers*, per file, and a vault total can never show it.

## T23 — two scripts report on the information stream and twelve on stdout, so one capture idiom silently fails

`Write-Host` writes to the **information stream**, not to stdout. So `& $script | Out-String` captures
*nothing* while the text scrolls past in the terminal, and a file written from that pipeline contains
only whatever the script emitted on the success stream. `Write-Output` is the opposite: `Out-String`
works and `6> $path` captures nothing.

**The folder is mixed, and that is the trap.** Measured 2026-10-01 across all 14 `.ps1` files:

| Reports on | Scripts |
|---|---|
| information stream, needs `6>` | `Test-DeckHygiene.ps1`, `Test-DocHygiene.ps1` |
| stdout, needs `\| Out-String` | the other **twelve**, including `Vault-Audit.ps1`, `Test-VaultAudit.ps1`, `Get-SRIntegrity.ps1` |

**Produced, on 2026-09-26:** a capture of `Test-DeckHygiene.ps1` across two scopes wrote a file holding
four lines — two headers and two `EXITCODE=` lines — with every finding missing. Read on its own, that
file says the run found nothing. **Then the opposite, on 2026-10-01:** `Vault-Audit.ps1 -Detail 6> $path`
produced a file containing one blank line and `AUDIT_EXIT=1`, while the two offending filenames went to
the terminal. The same session had just written this entry claiming *every* script used `Write-Host`,
which is how the second failure happened.

**What to do:** check which family the script belongs to before capturing it, or sidestep the question
with `powershell -NoProfile -File <script>` and read the terminal. **And `6>` writes UTF-16LE with a
BOM**, so a reader expecting UTF-8 then fails with `stream did not contain valid UTF-8`; recover it with
`[System.IO.File]::ReadAllText($p, [System.Text.Encoding]::Unicode)`. That half is in `environment.md`
under *Capture output to a file, not to stdout*. Cross-check an exit code against a report that
actually contains lines — an `EXITCODE=0` next to an empty body proves nothing.

## T24 — a function parameter named `$args` silently swallows every argument you pass

`$args` is one of PowerShell's automatic variables. Declare it as your own parameter —
`function Invoke-Gate([string]$file, [string[]]$args)` — and the splat `@args` inside that function
no longer refers to what the caller passed. The call binds nothing, the wrapped script runs with
**no arguments at all**, and nothing warns: the script has defaults, so it does something plausible.

**Produced, on 2026-10-01, twice in one session.** A gate runner invoked
`Test-DeckHygiene.ps1 -Course HI1031` and `-SelfTest` through such a wrapper. Both ran with no
arguments, so both reported the **whole-vault survey** instead: `exit 1`, `cardsInScope=355`,
`65 finding(s)`. The truth for that scope was `exit 0`, 254 cards, clean. A false failure on a clean
deck, and it was caught only because the same figure appeared three times for three different scopes.

**What to do:** never name a parameter `$args`. Use `$argList`, `$extra`, `$switches`. The same
applies to the other automatics that are easy to reach for — `$input`, `$error`, `$host`, `$matches`.
And when a wrapper runs the same script under several scopes, assert that the scope line in the
output differs between runs; identical figures from different arguments mean the arguments never
arrived.
`geometric repack` error from git on Google Drive, `npm` needing `cmd /c`, stdout truncating on Swedish
characters, long inline commands refused with `Access is denied. (os error 5)`, and three PowerShell
5.1 parsing details (case-insensitive variable names, a built-in alias beating a function you define,
and `if` not being an expression).

## Keeping this file honest

A trap that no longer reproduces is a **finding against this file**, not against the vault. Delete it
and note the removal. The same applies to any number quoted here.

**Each entry is mechanism, consequence, instruction — in that order, and no longer than it has to be.**
This file is loaded into every session, so a paragraph of retelling here costs more than the same
paragraph anywhere else. Detailed forensics belong in `Meta/Vault Findings & Backlog.md`; the reasoning
about why a check was insufficient belongs in `.kiro/lessons-learned.md`.
