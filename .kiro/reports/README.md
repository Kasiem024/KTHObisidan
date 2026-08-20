# Audit reports

Dated conformance reports written by the `vault-auditor` agent, one file per run:
`.kiro/reports/YYYY-MM-DD-<slug>.md`.

## Why they are files rather than chat

An audit that only ever appears in a conversation cannot be compared with the last one. On disk
they become a history: whether a count is drifting, whether a convention keeps being broken in
the same folder, whether a fix held.

The agent writes the full report here and returns only a **summary plus the file path** in chat.
The file is the authoritative version.

## What a report contains

- The verdict and the audit's own output, including `notesInScope`.
- Findings as a table: what, how many, which files.
- **What was not checked** — mandatory. A clean audit means the checks that ran found nothing;
  it is not a statement that the vault is good. The audit does not read Swedish prose, judge
  whether a definition is correct, or see anything about the published site.
- Recommended fixes, precise enough for someone else to apply.

## Constraints

The agent's `write` tool is path-restricted to `.kiro/reports/*.md` in `vault-auditor.json`, and
`hooks/block-write-outside-reports.sh` is a second line of defence. It cannot edit a note, the
Standard, or the audit script.

Reports are committed. They are small, they are excluded from the audit, the linter and the
published site along with the rest of `.kiro/`, and the history is the point.

## Relationship to the backlog

`Meta/Vault Findings & Backlog.md` is the change log: what was wrong, what was done, how it was
verified. These reports are observations at a point in time. A report that leads to a change gets
an F-entry; a report that finds nothing just stays here as evidence that nothing was wrong then.
