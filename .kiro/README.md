# .kiro — agent context for this vault

Context for AI agents working on this vault. Modelled on the `.kiro` layout used in
`Kana-App`, trimmed to what a single-author Obsidian vault actually needs.

| Path | Purpose |
|---|---|
| `steering/product.md` | What the vault is, who it is for, what matters |
| `steering/conventions.md` | Hard rules; what must never be touched |
| `steering/environment.md` | Windows / PowerShell / Google Drive / encoding pitfalls |
| `steering/documentation-standard.md` | Which docs to update, and where each fact belongs |
| `hooks/*.sh` | `preToolUse` guards — read stdin, `exit 2` blocks |
| `agents/vault-auditor.*` | Read-only conformance inspector |

## Steering vs. the vault's own docs

Steering files hold **how to work on** the vault. They deliberately do not restate the
conventions themselves — those live in `Meta/Vault Standard.md`, which is the single source of
truth, with the change log in `Meta/Vault Findings & Backlog.md`.

Two of the steering files carry `inclusion: auto` frontmatter so they load without being
asked for. `product.md` is plain, matching the reference repo.

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

They are a backstop, not a guarantee — a `preToolUse` hook sees the command, not the diff. The
real protection is the rules in `steering/conventions.md`.

## Excluded from the vault's own tooling

This folder is not study content, so it is excluded from both:

- `Meta/Obsidian Plugins/Scripts/Vault-Audit.ps1` — otherwise these files would be audited as
  notes and fail for having no tags or `description`.
- `ignorePatterns` in the Quartz repo's `quartz.config.yaml` — otherwise this documentation
  would be published on the public site. Quartz does not skip dot-folders automatically; it
  only ignores the ones listed.
