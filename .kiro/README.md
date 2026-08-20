# .kiro — agent context for this vault

Context for AI agents working on this vault. Modelled on the `.kiro` layout used in
`Kana-App`, trimmed to what a single-author Obsidian vault actually needs.

| Path | Purpose |
|---|---|
| `steering/product.md` | What the vault is, who it is for, what matters |
| `steering/conventions.md` | Hard rules; what must never be touched |
| `steering/environment.md` | Windows / PowerShell / Google Drive / encoding pitfalls |
| `steering/documentation-standard.md` | Which docs to update, and where each fact belongs |
| `traps.md` | The nine things that fail **silently**. Read before trusting a measurement |
| `lessons-learned.md` | Where a miss becomes a new rule |
| `current-state.md` | What is unfinished right now. Empty when nothing is in flight |
| `skills/` | **Procedures** for the recurring jobs, loaded on demand |
| `reports/` | Dated audit reports, written by `vault-auditor` |
| `hooks/*.sh` | `preToolUse` guards — read stdin, `exit 2` blocks |
| `agents/vault-auditor.*` | Conformance inspector; writes reports, never edits notes |

## The four kinds of knowledge here

Keeping these apart is what stops the docs drifting into each other:

- **`Meta/Vault Standard.md`** — the rules themselves. Single source of truth.
- **`steering/`** — how to *work on* the vault. Loaded automatically.
- **`skills/`** — how to *carry out* a recurring job, step by step. Loaded on demand.
- **`traps.md` + `lessons-learned.md`** — what has actually gone wrong here, and why each check
  exists. Traps are silent failure modes; lessons are cases where everything was green and the
  result was still wrong.

## Skills

| Skill | Use it when |
|---|---|
| `vault-bulk-edit` | Changing more than a handful of notes. Includes `references/verification.md` with the exact post-edit checks and expected numbers. |
| `add-a-convention` | Adding or changing a rule, so it cannot drift back. |

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
| `block-destructive.sh` | `shell` | Recursive deletes, `reset --hard`, `clean -f`, force push, `branch -D` |
| `block-secrets.sh` | `write`, `shell` | Key material and credential patterns — this repo is public |
| `block-write-outside-reports.sh` | `write` | Any write by `vault-auditor` outside `.kiro/reports/` |

They are a backstop, not a guarantee — a `preToolUse` hook sees the command, not the diff. Where
a hard guarantee is needed, restrict the tool instead. `vault-auditor` is the worked example: its
`write` tool is confined by `toolsSettings.write.allowedPaths` to `.kiro/reports/*.md`, and the
hook above is only a second line of defence.

## Excluded from the vault's own tooling

This folder is not study content, so it is excluded from all three:

- `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1` — otherwise these files would be audited as
  notes and fail for having no tags or `description`.
- `.markdownlint-cli2.jsonc` — not study prose, so not linted.
- `ignorePatterns` in the Quartz repo's `quartz.config.yaml` — otherwise this documentation
  would be published on the public site. Quartz does not skip dot-folders automatically; it
  only ignores the ones listed.
