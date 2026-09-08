# Doc reorg judgment review (2026-09-08)

Adversarial architecture review of today's `.kiro` steering reorganisation. Scope: was this the
*right* reorganisation, and does it make agents in this repo work better? Mechanics (did the move
execute cleanly) were left to a separate reviewer. I read anything, edited nothing except this
report.

## Verdict

**Keep the relocation, but the change is half-finished and should be extended, not left as-is.**
The reorg fixed a genuine silent bug: `inclusion: auto` on files sitting *outside* `steering/` did
nothing, so `traps.md` and `current-state.md` had been declaring auto-load and not loading. Fixing
that, and the two trims to `documentation-standard.md` and `scripts.md`, are correct and should
stand. But the fix was applied by *relocating whole files* rather than by applying the reorg's own
stated principle to them. The principle is "steering says what to do; everything else says why."
Measured against `traps.md` -- the flagship file it promoted into always-on context -- **75.6% of
the trap-body text and about 76% of the whole file is "why," not "what to do."** Of the roughly
22,600 characters the reorg *added* to always-on context, only about 6,300 (~28%) is load-bearing
instruction; the other ~72% is war-story narrative and a self-describing manual. The reorg wrote
the right rule and then broke it on the two files it touched most. Recommendation: **stand in part,
extend the rest** -- split instruction from narrative in `traps.md` and `current-state.md`, and
de-duplicate `environment.md` against `traps.md`. Doing so removes no instruction and cuts always-on
size by roughly a fifth.

## Measured baseline

All character counts are of the current on-disk files, measured by reading each with .NET
`ReadAllText` and taking `.Length` (no BOM present on any steering file):

| File | chars | "because" | F-refs | date-refs |
|---|---:|---:|---:|---:|
| product.md | 6,200 | 3 | 3 | 2 |
| conventions.md | 6,321 | 1 | 2 | 3 |
| environment.md | 8,750 | 3 | 3 | 6 |
| documentation-standard.md | 6,366 | 4 | 6 | 1 |
| scripts.md | 10,158 | 8 | 5 | 2 |
| traps.md | 19,117 | 9 | 3 | 5 |
| current-state.md | 3,456 | 4 | 3 | 3 |
| **TOTAL** | **60,368** | | | |

Note the headline figure has already drifted: the task brief quotes **59,168**; the files on disk
today sum to **60,368**, about 1,200 chars more. `git diff --numstat HEAD` shows `environment.md` at
`+110/-1` lines since the last commit `cecab1d`, so it is still growing. A doc-reorg whose own
size figure is stale within a day is a small live demonstration of the exact failure mode this
vault documents repeatedly (F58; lessons-learned "a doc full of exact numbers goes stale").

At the brief's ~3.7 chars/token, always-on steering is now about **16,300 tokens**. The reorg's net
addition is about **+5,900 tokens** (`traps.md` 19,117 + `current-state.md` 3,456, less the trims).

## Q1 -- Is 16,000 tokens of always-on context a good trade? What would I cut?

The premise (long always-on context competes with the user's request for instruction-following) is
the task's, and I did not benchmark it. But the size-agnostic version of the argument is stronger:
**signal-to-noise**. Whatever the window size, every always-on token competes with the user's actual
request for the model's attention, and I measured that ~72% of what the reorg added is not
instruction.

The case that the previous ~38,395 was better on the common path: `product.md` states the two
activities that dominate sessions are *studying* and *authoring flashcards*. Neither writes
PowerShell, invokes markdownlint, writes a Dataview query, or resumes a CLI session -- and those
four activities are what essentially all of `traps.md` is about. So for the majority of sessions,
the reorg added ~5,900 tokens of script-writing lore that the session will never act on, in
exchange for sparing a discipline step ("load the traps before you write a script") on the minority
path. That is the wrong trade for the common case.

What I would cut, specifically, in order of return:

1. **The 18 "What it produced:" war stories in `traps.md`** -- 11,608 chars, the largest single
   block of narrative in steering. An agent following "What to do:" does not need the anecdote that
   motivated it. Move them to `lessons-learned.md` (manual), which is where the reorg's own
   principle says "why" belongs. Loss: nothing an agent needs *to act*; the motivation stays one
   `inclusion: manual` load away.
2. **The `environment.md` <-> `traps.md` duplication** (Q7) -- at least eight facts, some verbatim
   war stories, are carried by both always-on files. Cut from one. Loss: none; this is pure
   redundancy and a live drift risk.
3. **The self-manual half of `current-state.md`** -- 1,826 chars (52.8%) that explain the file's own
   format every session (Q5). Loss: none; move it to `.kiro/README.md`.

Cutting 1-3 removes no instruction and takes always-on from ~60,400 to ~47,000 chars, about a 22%
reduction. I would *not* cut `conventions.md` section 1 (SR-data protection) or the "What to do:"
rules themselves -- those are the load-bearing core.

## Q2 -- Was `traps.md` the right file to promote? How many traps are genuinely pre-emptive?

I judged all 18 on one axis -- does knowing it change the *first* artifact an agent writes
(pre-emptive), or does it only help interpret an already-suspicious result (reactive/diagnostic)?

Genuinely pre-emptive (12): T1 (keep .ps1 ASCII), T2 (never hardcode Swedish paths), T6 (do not
truncate a pipeline whose exit code you need), T7 (absolute paths to .NET APIs), T8 (edit in
descending line order), T9 (BOM is one char), T11 (unquoted glob through cmd /c), T12 (`\r?$` not
`$`), T13 (capture frontmatter once), T14 (every Dataview query carries its scope guard), T16
(`.Contains`/`[regex]::Escape` for literals), T18 (single-quote backtick patterns).

Mostly reactive/diagnostic (4): T3 (the memorable half is "treat a surprisingly large count as
suspect"), T5 (only bites when a fresh clone shows 117 failures), T10 (only bites when a CI
path-check silently skips everything), T15 (`--resume-id` -- and this one targets the CLI operator,
almost never the in-session agent). T17 is mixed (pre-emptive "search short fragments" + reactive
"never report a negative from a single test").

So on the brief's own axis the count is favourable to promotion: ~12-13 of 18 are pre-emptive. But
that axis flatters the decision, and here is the sharper finding: **every one of the 18 is
*conditional*.** Not one is needed unless the session writes a PowerShell script, invokes
markdownlint, writes a Dataview query, or resumes a session. The correct comparison is that
`.kiro/skills/vault-bulk-edit` and `.kiro/skills/add-a-convention` -- which cover the *same*
script-and-sweep activity -- are **load-on-demand**, not always-on. The architecture already has the
right mechanism for this domain (a skill that loads when you start the job), and `traps.md` was
promoted *past* it into always-on. That is an internal inconsistency: the same trigger domain is
treated two ways. A `fileMatch`/manual `traps.md` that loads when a `.ps1` is about to be written
would fire at exactly the right moment and cost zero tokens on the common path.

Conclusion: promoting the *rules* was defensible; promoting the *whole narrative file*, always-on,
past an existing on-demand mechanism for the same domain, was not.

## Q3 -- Was leaving `lessons-learned.md` out correct? Is any actual instruction lost?

I read `lessons-learned.md` in full (17,745 chars, 13 entries). For each entry's "Rule added" I
checked whether the rule survives elsewhere:

- Entries whose rule is now in **steering**: the nine-wrong-results entry -> T16/T17/T18
  (`traps.md`); silent-tool-no-ops -> T4; my-own-measurement -> T2/T3/T6/T7; two-measurements-one-unit
  -> the trimmed figure paragraph in `documentation-standard.md`; auto-fix-danger -> conventions.md's
  "Never run `--fix` on the Templater templates" (confirmed present); stale-numbers -> the
  "keeping this file honest" discipline in `documentation-standard.md`/`scripts.md`.
- Entries whose rule is in a **skill or the Standard**: baseline-row -> query-notebooklm skill
  (out of scope here); check-cannot-fail and both-directions -> add-a-convention skill;
  detector-precision -> vault-bulk-edit skill; predicate-blocklist -> `Meta/Vault Standard.md`.

I then grep'd steering for the three rules that looked like they might live *only* in
lessons-learned: detector precision / false-positive-rate, "delegation is good at noticing bad at
counting," and "vet an incoming outside document by source-class and agenda vocabulary." Result:
`false.positive|precision|recall|delegat|domain class|outside document` returns **nothing relevant**
in steering (the two hits are about backlog-recording style and `Test-SRIntegrity`, not these
rules). So those three rules are genuinely absent from steering.

**This is not a Critical finding, and leaving the file out was correct.** All three absent rules are
*meta-practices* -- how to build a check, how to run a delegated review, how to adopt an outside
document -- and every one of them surfaces in exactly the situation `lessons-learned.md`'s own
`description` names as its load trigger: "when a check turns out to have been insufficient, or before
adding one." No *normal-work* instruction (edit a note, author a card, run the audit) is lost. The
file's header is explicit and honest: "the rules themselves live in `.kiro/steering/`." It is a
rationale log, and demoting a rationale log to manual is the principle working as intended.

**The one real defect is discoverability, and it is moderate.** I grep'd all of steering for
`lessons-learned`: the *only* reference is line 90 of `current-state.md`, and that line is a cell in
the "Where the durable facts live" table -- inside the self-manual half of the file, not an
instruction. In particular, `documentation-standard.md`'s section "A rule without a check will
drift" -- which describes the exact activity that should trigger reading lessons-learned -- does
**not** point to it. So the manual file is nearly orphaned from the always-on set. Fix is one line
(see P5).

## Q4 -- Does the principle survive contact with the files?

Precisely measured for `traps.md`, because it has clean markers. Splitting each of the 18 trap
sections at "What to do:": instruction text ("What to do:" onward) = **4,671 chars**; everything
before it (heading + mechanism + "What it produced:") = **11,608 chars**; plus **2,778 chars** of
non-trap prose (intro, "Related but not silent," "Keeping this file honest"). So:

- **traps.md instruction share: 24.4%** (4,671 of 19,117). Justification/narrative: **75.6%.**
- Within trap bodies alone, "why" is **71.3%.**

For the other six I judged from reading, with the proxy counts above as support:

| File | Est. non-instruction share | Note |
|---|---:|---|
| product.md | ~80% | Highest, but *appropriate* -- a product file is identity/goals by nature. Not a violation. |
| environment.md | ~65% | War-story catalog; 6 dated incidents; **duplicates `traps.md`**. A violation. |
| traps.md | **75.6% (measured)** | The promoted flagship. The clearest violation. |
| scripts.md | ~50% | "Which one to reach for" is instruction, but wrapped in "written because the same question came up twice" rationale. |
| documentation-standard.md | ~55% | Improved by the trim; still carries the stale-number narrative. |
| conventions.md | ~45% | Mixes hard rules with the `userIgnoreFilters` JS-source explanation. |
| current-state.md | ~53% self-manual (measured) + near-zero instruction | See Q5. |

Worst offenders that *contradict* the principle: **`traps.md` (75.6%, measured) and
`environment.md`** (redundant war stories). `product.md`'s high "why" is exempt -- context about what
the vault is and what the author optimises for is precisely what a product steering file should
carry. So yes: **the reorg's own principle does not survive contact with the file it chose to
promote.** By its own rule, `traps.md` in its current form does not belong wholesale in steering; its
"What to do:" lines do.

## Q5 -- Is `current-state.md` worth a permanent slot?

The *concept* is sound: an always-on "what is in flight" file stops an agent redoing finished work,
and that is a real failure mode. But the *execution* does not deserve a permanent slot as written.
Measured: 3,456 chars total, of which **1,826 (52.8%)** is a self-describing manual -- the sections
"What this file is for," "When to write it," "When to clear it," "Template," and "Where the durable
facts live." That half is loaded into every session to explain the file's own format, forever. The
actual transient state today is the top block ("nothing in flight; working tree 40 modified / 28
untracked; two untracked exposures worth naming").

So an agent currently pays ~900 tokens every session, more than half of it a tutorial, to be told
"nothing in flight." The right shape is a thin always-on status header plus a one-line pointer, with
the format guide moved to `.kiro/README.md`. That keeps the valuable part (the status) always-on and
removes the manual. The file should not be deleted from steering -- just reduced to what is actually
state.

## Q6 -- What did the trims cost that a diff cannot show?

I pulled the real diff. `documentation-standard.md` is `+34/-41` lines vs HEAD: it removed a long
war story (the 2026-08-26 note-count movements and the NTFS-vs-Linux 1270/693 page saga) and
replaced it with a compressed version that points to `F58/F61/F67` and keeps the instruction ("read
the backlog entry before changing a figure"). **That trim is the principle done right** -- detail to
the backlog, instruction retained -- and it costs nothing, because the compressed paragraph *still*
cites 516 notes, 396 concept notes, 538 linted files, 693 pages, 85 broken links as examples. So the
order-of-magnitude anchors survive in always-on context.

`scripts.md` is a different story: it is untracked (new since `cecab1d`, so no diff baseline), and it
now states its figure policy explicitly -- "No figure is reproduced here, deliberately." Every count
is gone. Was that right? On balance yes: staleness is the single most-documented harm in this repo
(two lessons-learned entries, F58), and removing exact figures kills it. But the brief's worry is
real and I will name where it bites: the vault's *worst* traps -- T2 ("34 tracked files" that were
529) and T10 (audit measured "34 of 40") -- are precisely silent *under*-counts, and an
order-of-magnitude anchor is the cheapest defence against them. The mitigation is that
`documentation-standard.md` retains the "~516 notes" anchor one file over, so always-on context is
not anchor-free. Net: removing exact figures from `scripts.md` was right; the only place I would add
back a *bracketed* magnitude ("~500 notes, not 50 or 5,000") is the `notesInScope` /
`Get-SRIntegrity` rows, because that is the file you are reading when you write the very scripts T2
and T10 describe. Low priority, ~15 tokens.

## Q7 -- What is still wrong or missing that nobody has noticed?

**(a) `product.md` has no frontmatter -- a latent silent-drop risk, not just a cosmetic one.** It is
the only steering file with neither `inclusion:` nor `description:`. Functionally it still loads
(steering defaults to included), so today it is a uniformity defect -- ironic in the file that
preaches "Uniformity ... a change that introduces a second way of doing something is a regression."
But the deeper point, in a vault whose entire ethos is "silent failures are the enemy": the single
most important context file (what the vault *is*) relies on default-inclusion behaviour rather than
an explicit `inclusion: auto`. If the loader ever changes to require the flag, `product.md` drops out
silently. Add the frontmatter. Two minutes.

**(b) `environment.md` and `traps.md` duplicate a cluster of facts, both always-on.** Measured by
literal `.Contains` across all seven files, these appear in *both*: the `243 corrupted pages`
example, `geometric repack`, `Access is denied. (os error 5)`, `0xFEFF`, the `$R/$r` case-insensitive
variable story ("...variable names are case-insensitive"), the `rd` alias story ("is an alias for
it"), and the `if` "is not an expression" note. The `.ps1`-reads-as-ANSI fact appears in *three*
always-on files (environment.md, scripts.md, traps.md -- confirmed with a backtick-free fragment
after the backticked one gave a T17 false negative). This directly violates
`documentation-standard.md`'s own "Duplicated rules drift apart," and two copies of the same war
story *will* drift.

**(c) `conventions.md` restates `Meta/Vault Standard.md` while telling you not to.** It opens with
"Meta/Vault Standard.md is the source of truth ... Do not restate it here" -- then restates the
four-separator table and the `userIgnoreFilters` regex mechanism, both of which are in the Standard
(§4 and §6). Some of this is deliberate emphasis for expensive-to-undo rules (SR data), which I would
keep; the `userIgnoreFilters` JS-source walkthrough is a full duplicate that should be a pointer.

**(d) Should anything else move?** `environment.md` and `traps.md` should be merged or cleanly
divided (loud-and-immediate issues vs silent ones) so no fact lives in both. Nothing else needs to
move *in*: the reorg correctly identified the only two files that were lying about their inclusion.

## What to do next (prioritised, with cost)

1. **Split `traps.md`: keep "What to do:" always-on, move "What it produced:" to
   `lessons-learned.md`.** Saves ~10,000 chars (~2,700 tokens) always-on; applies the reorg's own
   principle to its own file. Cost: ~1 hr edit + re-run `Test-DocHygiene.ps1` (the only thing that
   checks `.kiro/` encoding). Highest value.
2. **De-duplicate `environment.md` <-> `traps.md`.** Pick one home per fact. Saves ~1,500-2,000
   chars and removes a drift risk. Cost: ~30 min + `Test-DocHygiene.ps1`.
3. **Reduce `current-state.md` to a status header + one-line pointer; move its format manual to
   `.kiro/README.md`.** Saves ~1,800 chars always-on. Cost: ~20 min.
4. **Add `inclusion: auto` + `description:` frontmatter to `product.md`.** Removes the latent
   silent-drop risk and restores uniformity. Cost: 2 min.
5. **Wire discoverability of `lessons-learned.md`: one line in `documentation-standard.md`'s "A rule
   without a check will drift" section -- "before adding a check, read `.kiro/lessons-learned.md`."**
   Cost: 2 min.
6. **Replace `conventions.md`'s `userIgnoreFilters` walkthrough with a pointer to Standard section
   6** (keep the SR-data emphasis). Cost: 20 min.
7. **(Optional) Restore a bracketed order-of-magnitude anchor to `scripts.md`'s `notesInScope` /
   `Get-SRIntegrity` rows.** Cost: ~5 min; low priority since the anchor survives in
   `documentation-standard.md`.

Doing 1-3 alone takes always-on steering from ~60,400 to ~47,000 chars (~22% smaller,
~13,000 tokens) while removing **zero** instruction -- only relocating narrative to where the reorg
itself says it belongs.

## Files read in full

- `.kiro/lessons-learned.md` (17,745 chars) -- every entry.
- `Meta/Vault Standard.md` -- full (for the Q7 redundancy check).
- `.kiro/README.md` -- full.
- All seven `.kiro/steering/*.md` files -- full (auto-loaded and independently measured).
- `git diff HEAD` of `documentation-standard.md` -- full; `scripts.md` diff was empty (untracked).

Not read (out of scope or not needed): `.kiro/skills/query-notebooklm/` and flashcard skills,
`.kiro/research/`, other reports. Measurements were taken with ASCII PowerShell scripts written to
`%TEMP%` and read back from file, using literal `.Contains` for fact-fragment tests, per traps
T16/T17/T18.
