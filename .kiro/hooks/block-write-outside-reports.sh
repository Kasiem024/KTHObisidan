#!/usr/bin/env bash
# preToolUse matcher: write   (used by: vault-auditor)
#
# The vault-auditor may only write its dated reports, never a note. Exit 2 = block.
# Accepts an optional argument ($1) for the agent name.
#
# THIS IS THE HARD BLOCK, NOT A BACKSTOP.
#   toolsSettings.write.allowedPaths only *auto-approves* paths; it does not confine anything, and
#   vault-auditor.json carries no deniedPaths at all. Exit 2 from this hook is the only
#   unconditional stop, so it fails CLOSED. See .kiro/README.md and the 2026-09-06 adversarial
#   review, which falsified the earlier claim that allowedPaths was the guarantee.

INPUT=$(cat)

# Allow if the target is inside .kiro/reports/ (either path separator).
if printf '%s' "$INPUT" | grep -qE '\.kiro[\\/]reports[\\/]'; then
  exit 0
fi

AGENT="${1:-vault-auditor}"
echo "BLOCKED: ${AGENT} may only write under .kiro/reports/." >&2
echo "It inspects and reports; it never edits notes, the Standard, or the audit script." >&2
echo "If a fix is needed, describe it precisely and let someone else apply it." >&2
exit 2
