#!/usr/bin/env bash
# preToolUse matcher: write   (used by: vault-auditor)
#
# The vault-auditor may only write its dated reports, never a note. Exit 2 = block.
# Accepts an optional argument ($1) for the agent name.
#
# This is a backstop. The hard guarantee is toolsSettings.write.allowedPaths in the agent
# JSON, which restricts writes to .kiro/reports/*.md.

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
