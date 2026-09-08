# .kiro — agent context for this vault

Context for AI agents working on this vault. Modelled on the `.kiro` layout used in
`Kana-App`, trimmed to what a single-author Obsidian vault actually needs.

| Path | Purpose |
|---|---|
| `steering/product.md` | What the vault is, who it is for, what matters |
| `steering/conventions.md` | Hard rules; what must never be touched |
| `steering/environment.md` | Windows / PowerShell / Google Drive / encoding pitfalls |
| `steering/documentation-standard.md` | Which docs to update, and where each fact belongs |
| `steering/scripts.md` | The reusable measurement scripts — read **before** writing a new one, or quoting a number |
| `steering/traps.md` | The eighteen things that fail **silently**. Read before trusting a measurement |
| `steering/current-state.md` | What is unfinished right now. Empty when nothing is in flight |
| `lessons-learned.md` | Where a miss became a new rule. **Not** auto-loaded: it explains *why* the rules exist, and the rules live in `steering/` |
| `skills/` | **Procedures** for the recurring jobs, loaded on demand |
| `reports/` | Dated audit reports, written by `vault-auditor` |
| `research/` | Raw output from tools that cannot export cleanly — chiefly Gemini Deep Research reports, kept **verbatim as sources**, never edited or linted. Plus the distillation that sorts their figures by how hard each was checked. Its own `README.md` explains why the reports are not a reliable record |
| `sessions.md` | Which chat transcripts still hold undistilled state, and how to reopen one. Empty when none |
| `hooks/*.sh` | `preToolUse` guards — read stdin, `exit 2` blocks |
| `agents/vault-auditor.*` | Conformance inspector; writes reports, never edits notes |
| `agents/flashcard-author.*` | Card author; writes course notes only, grounded in the course literature |

## The four kinds of knowledge here

Keeping these apart is what stops the docs drifting into each other:

- **`Meta/Vault Standard.md`** — the rules themselves. Single source of truth.
- **`steering/`** — how to *work on* the vault, plus what fails silently and what is in flight.
  **Everything in this folder is loaded automatically; nothing outside it is.** That is why
  `traps.md` and `current-state.md` live here: an agent that has not read the traps repeats them,
  and one that has not read the state file redoes finished work.
- **`skills/`** — how to *carry out* a recurring job, step by step. Loaded on demand.
- **`lessons-learned.md`** — why each check exists: the cases where everything was green and the
  result was still wrong. Read it before adding a rule, not before doing the work.

**Steering says what to do; everything else says why.** A file that only justifies a rule does not
belong in `steering/`, because it spends context on history an agent does not need to act correctly.

## Where every durable fact lives

`steering/current-state.md` is deliberately thin, because almost everything a new session needs is
already permanent:

| Need | Where |
|---|---|
| The rules | `Meta/Vault Standard.md` |
| What changed and how it was verified | `Meta/Vault Findings & Backlog.md`, F-numbered |
| How to do a recurring job | `.kiro/skills/` |
| What fails silently | `.kiro/steering/traps.md` |
| Why a check exists | `.kiro/lessons-learned.md` |
| What a script measures, and what it counts | `.kiro/steering/scripts.md` |
| What is unfinished right now | `.kiro/steering/current-state.md` |
| Which transcript still holds undistilled state | `.kiro/sessions.md` |

### Writing the state file

Write it **before** a long-running operation, so an interruption is recoverable, and when pausing a
multi-step task. **Not** for finished work — that belongs in the backlog. Reset it to "nothing in
flight" as soon as the task is done and pushed; a stale state file is worse than an empty one, because
it describes a situation that no longer exists.

```markdown
# Current state

**Status: in progress — <one line: what is being done>**

Started: YYYY-MM-DD

## Done so far
- <step>, verified by <evidence>

## Next step
<the single next action>

## Decisions made
- <decision> — because <reason>

## Verified numbers at this point
- audit: clean / N deviations
- lint: N files, N errors
- build: pages / callouts / leaks

## Do not redo
- <things already tried that did not work, so they are not repeated>
```

Measurements are a fifth kind, and they live in **code**: `Meta/Obsidian Plugins/Scripts/`,
indexed by `steering/scripts.md`. A number in prose goes stale silently; a script records
*what it counts* alongside the count. Check that index before writing a script or quoting a
figure — re-deriving a measurement by hand is how two honest measurements end up disagreeing.

`sessions.md` is **not** a sixth kind. It holds no knowledge, only pointers to chat transcripts
whose content has not yet become one of the five — so a row in it is a debt against this list, and
it is deleted once the debt is paid. An empty `sessions.md` is the healthy state.

## Skills

| Skill | Use it when |
|---|---|
| `vault-bulk-edit` | Changing more than a handful of notes. Includes `references/verification.md` with the exact post-edit checks and expected numbers. |
| `add-a-convention` | Adding or changing a rule, so it cannot drift back. |
| `write-flashcards` | Adding or improving flashcards. Includes `references/formulation.md` (reasoning and worked examples) and `references/evidence.md` (what is measured, with effect sizes, and what is only heuristic). |
| `query-notebooklm` | Getting evidence out of a corpus only the user can reach, by handing them one pasteable block per round. `references/notebook-setup.md` covers the four per-notebook settings that decide what a round costs; `references/corpus-acquisition.md` covers building the corpus with Deep Research; `references/reading-a-report.md` is the eleven-check list for distrusting what comes back, with the eleven measured ways a report or answer has misled us; `references/round-template.md` holds the query block, the two measured input limits, and the round that produced `write-flashcards`' evidence. |

Format is the Agent Skills open format: a directory with `SKILL.md` (frontmatter `name` +
`description`, concise body) plus optional `references/` for detail. `SKILL.md` is navigation;
if the answer is in a reference file, read it before acting. Skills are auto-discovered, which
is why "make the agent know about X" is a skill, not a new agent.

## Hooks

Each hook reads the tool input on **stdin**, exits `0` to allow and `2` to block with a
message on stderr. They are registered per-agent under `hooks.preToolUse` in the agent JSON,
invoked through Git bash:

```json
{ "matcher": "shell", "command": "\"C:\\Program Files\\Git\\bin\\bash.exe\" .kiro/hooks/block-destructive.sh", "timeout_ms": 3000 }
```

| Hook | Matcher | Blocks |
|---|---|---|
| `require-ascii-ps1.sh` | `write` | A `.ps1` containing non-ASCII, which PowerShell 5.1 would silently corrupt |
| `protect-sr-data.sh` | `shell` | Bulk rewrites of `<!--SR:-->` data or card separators |
| `protect-sr-data-write.sh` | `write` | A `create` omitting a marker the file has, or a `strReplace` whose `oldStr` carries one that `newStr` drops |
| `block-deck-scope-change.sh` | `write` | Adding `nosr` to a note that lacks it, or removing it from one that has it |
| `block-destructive.sh` | `shell` | Recursive deletes, `reset --hard`, `clean -f`, force push, `branch -D` |
| `block-secrets.sh` | `write`, `shell` | Key material and credential patterns — this repo is public |
| `block-write-outside-reports.sh` | `write` | Any write by `vault-auditor` outside `.kiro/reports/` |
| `block-write-outside-course-notes.sh` | `write` | Any write by `flashcard-author` outside `KTH/<Year Season>/<Course>/(Anteckningar\|Begrepp)/*.md` |

### `toolsSettings` does not confine anything — the hook is the only hard block

This was documented backwards here until 2026-09-06, and the wrong version was the stated rationale
for both agents' safety. From the kiro-cli Trust Configuration reference: `allowedPaths` are
"glob patterns for **auto-approved** paths" and `deniedPaths` "always require approval". So
`toolsSettings` decides *what happens without asking*, not *what is possible*; a path in neither
list simply prompts. (The same doc's precedence table says `deniedPaths` "always blocks", so the
reference contradicts itself — untested here either way.) `allowedTools` is broader still: a tool
listed there is trusted wherever it is pointed, which is why `write` was removed from
`flashcard-author`'s `allowedTools`.

**Consequence: a `preToolUse` hook returning exit 2 is the only unconditional stop, so the write
hooks fail closed.** `block-write-outside-course-notes.sh` refuses a payload it cannot parse rather
than waving it through, and tests only the value of the `path` field — with escaped quotes
neutralised first, because grepping the whole payload let a `Meta/` write through whenever the card
text happened to mention an allowed path, and blocked a legitimate card whose text mentioned
`Filer/`.

`protect-sr-data.sh` inspects a shell command; `protect-sr-data-write.sh` inspects a write payload,
which is the one damage mode the shell hook cannot see. It compares marker **identity**, not count:
41 markers reshuffled onto different questions passes a count check while stealing every card's
earned schedule.

Two residual gaps, both known and neither fixed:

- **A hook whose interpreter is missing fails open.** Any exit code other than 2 allows the tool, so
  moving Git for Windows silently removes every guard (reproduced: exit 255). Wrapping the command
  as `cmd /c ""…bash.exe" <hook> || exit /b 2"` converts that to a block — verified in a shell,
  **not** verified against the hook runner, so it is not deployed. Timeout behaviour is undocumented.
- **Whether the engine fires these hooks per write is not observable from outside a live run.**
  Registration, syntax and script behaviour are all verified; the invocation is not.

Every hook above was tested by piping simulated payloads and checking real exit codes — 25 cases
across the three write hooks, including path traversal, a decoy path in the payload content, and a
missing interpreter. A hook that never fires is worse than no hook, and two of these did not fire
until an adversarial review reported it (`.kiro/reports/2026-09-06-*`).

## Excluded from the vault's own tooling

This folder is not study content, so it is excluded from all three:

- `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1` — otherwise these files would be audited as
  notes and fail for having no tags or `description`.
- `.markdownlint-cli2.jsonc` — not study prose, so not linted.
- `ignorePatterns` in the Quartz repo's `quartz.config.yaml` — otherwise this documentation
  would be published on the public site. Quartz does not skip dot-folders automatically; it
  only ignores the ones listed.
