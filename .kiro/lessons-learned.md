---
inclusion: auto
description: The feedback loop. When something passed every check and was still wrong, it gets recorded here and the miss becomes a new rule. Read when a check turns out to have been insufficient.
---

# Lessons learned

Without this file, the rules stay exactly as smart as the day they were written. With it, every
miss makes them better.

This is **not** for violations the checks already catch — those are just findings, and they go
in `Meta/Vault Findings & Backlog.md`. This is for the cases where everything was green and the
result was still wrong.

## When to add an entry

- A check passed and the thing it was supposed to protect was broken anyway.
- A measurement produced a confident number that turned out to be false.
- A rule turned out to be wrong, or to have a case it did not cover.
- A doc said something that was true when written and silently stopped being true.

## Format

```markdown
## YYYY-MM-DD — short title

**What happened:** what was done, and what went wrong with it.
**Why the checks missed it:** which check should have caught this, and why it did not.
**Rule added:** the new or amended rule, and where it now lives.
**Lesson:** one sentence a future reader can act on.
```

---

## 2026-08-19 — a verification is only as good as its stated scope

**What happened:** "0 pages show raw flashcard syntax" was reported and believed for weeks. In
fact 34 notes were publishing raw `::` syntax, covering roughly 1,280 cards that had never
rendered.

**Why the checks missed it:** the check only inspected pages containing `id="flashcards"`. Every
one of the 34 notes keeps its cards under a different heading, so they could not appear in the
sample by construction. The scope was never stated, so the number read as a statement about the
whole site.

**Rule added:** every verification states what it examined. `tools/check-site.mjs` now prints a
mandatory `NOT CHECKED` block on every run, and the site steering says a pass means "the checks
that ran found nothing", never "the site is good".

**Lesson:** a claim scoped to a subset is indistinguishable from a claim about everything unless
you say which it is.

## 2026-08-19 — an auto-fix can be more dangerous than the defect

**What happened:** `markdownlint --fix` wrapped a bare URL in angle brackets and split a
Templater `<% %>` expression out of it, producing `<https://...kurs/><% CODE %>`. Every future
course index would have contained a broken link.

**Why the checks missed it:** the linter's rule was correct in general and wrong for a file that
is not valid Markdown until rendered. Nothing verified the *template* after the sweep, only the
notes.

**Rule added:** `Meta/Obsidian Plugins/Templates/**` is excluded from linting, and the
`add-a-convention` skill requires checking templates by generating a note from them rather than
by linting them.

**Lesson:** a generic tool applied to a file with non-Markdown syntax will confidently corrupt
it; exclude the file rather than trusting the rule.

## 2026-08-19 — a check that cannot fail is not a check

**What happened:** `Vault-Audit.ps1` printed `RESULT: deviations found` and exited **0**. Any CI
step calling it would have passed unconditionally.

**Why the checks missed it:** nobody had ever run it expecting failure. It was only ever read by
a human who looked at the text.

**Rule added:** the audit exits 1 when not clean, and the `add-a-convention` skill requires
verifying a new check in **both** directions — clean gives 0, a deliberately broken file gives 1.

**Lesson:** test that a check fails, not only that it passes.

## 2026-08-19 — silent tool no-ops beat loud errors, every time

**What happened:** a `.markdownlintignore` file was created and looked authoritative.
`markdownlint-cli2` does not read it. 536 files were linted instead of 500 and the violation
count read 1673 instead of 767.

**Why the checks missed it:** the tool reported success. Nothing compares the number of files
linted against the number expected.

**Rule added:** recorded as trap T4 in `.kiro/traps.md`; after changing ignores, check the
`Linting: N file(s)` line, because that number is the only proof the config took effect.

**Lesson:** when a config file is added, verify the tool actually read it — silence is not
agreement.

## 2026-08-19 — my own measurement is the most likely thing to be wrong

**What happened:** across one session, four separate "findings" were artifacts of the
measurement rather than the vault: 243 corrupted pages that did not exist (case-insensitive
`-match`), 34 tracked markdown files that were really 529 (mis-decoded Swedish paths), an audit
reporting exit `-1` while clean (`Select-Object` closing the pipe), and an agent with no tools
(.NET ignoring `Set-Location`).

**Why the checks missed it:** none of these produced an error. Every one returned a plausible
number.

**Rule added:** `.kiro/traps.md` collects them as T2, T3, T6 and T7, with the rule that a
surprisingly large or small count is treated as a suspect measurement until re-derived a second
way.

**Lesson:** before reporting a surprising number, reproduce it by a different method.

## 2026-08-20 — a doc full of exact numbers is a doc that will go stale

**What happened:** the steering and skill files now quote hard figures — 470 notes, 601 pages,
1965 callouts, 43 broken links, 1262 scheduling markers. They were all correct when written.

**Why the checks missed it:** nothing verifies documentation against reality. A confident wrong
number is worse than no number, because it is quoted rather than checked.

**Rule added:** every file quoting live numbers carries a "keeping this file honest" note — a
figure that no longer matches is a finding **against the doc**, and the doc is fixed in the same
change. `site-baseline.json` is the machine-checked copy of the site figures; prose copies are
convenience, not truth.

**Lesson:** when a number in a doc disagrees with a fresh measurement, fix the doc — do not
adjust the measurement to match.
