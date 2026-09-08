#!/usr/bin/env bash
# preToolUse matcher: write   (used by: flashcard-author)
#
# THIS IS THE HARD BLOCK, NOT A BACKSTOP.
#   toolsSettings.write.allowedPaths only *auto-approves* paths and deniedPaths only forces an
#   approval prompt (kiro-cli Trust Configuration; its own precedence table says deniedPaths
#   "always blocks", so the two halves of that doc disagree - either way allowedPaths cannot
#   confine anything). Exit 2 from this hook is the only unconditional stop, so it fails CLOSED.
#
# WHAT IT ALLOWS
#   Exactly one shape: KTH/<Year Season>/<CODE Course>/(Anteckningar|Begrepp)/<name>.md
#   Relative to the vault root, no traversal, nothing under Filer/.
#
# HOW IT READS THE PAYLOAD
#   It tests only the value of the "path" field. Escaped quotes are neutralised first, so a JSON
#   fragment inside "content" cannot pose as a field - an earlier version grepped the whole
#   payload, which let a Meta/ write through whenever the card text happened to mention an
#   allowed path, and blocked a legitimate card whose text mentioned Filer/.
#
# Accepts an optional argument ($1) for the agent name.
# Exit 2 = block, 0 = allow. Keep this file pure ASCII.

INPUT=$(cat)
AGENT="${1:-flashcard-author}"

deny() {
  echo "BLOCKED: ${AGENT} may only write course notes." >&2
  echo "  reason: $1" >&2
  echo "  allowed: KTH/<Year Season>/<CODE Course>/Anteckningar/<name>.md" >&2
  echo "           KTH/<Year Season>/<CODE Course>/Begrepp/<name>.md" >&2
  echo "  vault-relative paths only, no '..', nothing under Filer/." >&2
  echo "If a convention, a doc or a script needs changing, describe the change instead." >&2
  exit 2
}

# Neutralise \" so that JSON strings inside "content" cannot masquerade as a field.
SAN=$(printf '%s' "$INPUT" | sed 's/\\"/__ESCQ__/g')

PATHS=$(printf '%s' "$SAN" \
  | grep -oE '"path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | sed 's/^"path"[[:space:]]*:[[:space:]]*"//; s/"$//')

# No path field means the payload shape is not what this hook understands. Refuse rather than
# wave it through - a silently disabled guard is worse than a loud one.
[ -n "$PATHS" ] || deny "no \"path\" field found in the write payload"

while IFS= read -r p; do
  [ -n "$p" ] || continue
  # Windows separators arrive escaped; collapse both forms to a single forward slash.
  q=$(printf '%s' "$p" | tr '\\' '/' | tr -s '/' | sed 's|^\./||')
  case "$q" in
    *..*)      deny "path traversal in '$p'" ;;
    */Filer/*) deny "'$p' is under Filer/ - attachments and course literature are read-only" ;;
  esac
  printf '%s' "$q" | grep -qE '^KTH/[^/]+/[^/]+/(Anteckningar|Begrepp)/[^/]+\.md$' \
    || deny "'$p' is outside the allowed course-note paths"
done <<EOF
$PATHS
EOF

exit 0
