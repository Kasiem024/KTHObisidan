#!/usr/bin/env bash
# preToolUse matcher: write
#
# WHY THIS EXISTS
#   The #nosr tag is in the plugin's flashcardTagsToIgnore, so adding it silently removes every
#   card in a note from the review schedule, and removing it silently adds them. Which chapters
#   are in the active deck is a scoping decision that belongs to the author.
#
#   This is not hypothetical. On 2026-09-06 an adversarial review found that a rewrite of
#   HI1031 Kap 02 had added nosr to a note that did not have it, taking 87 freshly written cards
#   out of review, in the same session whose own agent prompt says "ask before changing a deck's
#   scope". Nothing detected it; the change was visible only as a diff against HEAD.
#
# WHAT IT BLOCKS
#   A write that adds nosr to a note that lacks it, or removes it from a note that has it.
#   Proposing the change in words is always allowed - it is applying it unasked that is not.
#
# Exit 2 = block, 0 = allow. Keep this file pure ASCII.

INPUT=$(cat)

SAN=$(printf '%s' "$INPUT" | sed 's/\\"/__ESCQ__/g')

CMD=$(printf '%s' "$SAN" \
  | grep -oE '"command"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | sed 's/^"command"[[:space:]]*:[[:space:]]*"//; s/"$//' | head -n 1)

PATHS=$(printf '%s' "$SAN" \
  | grep -oE '"path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | sed 's/^"path"[[:space:]]*:[[:space:]]*"//; s/"$//')
[ -n "$PATHS" ] || exit 0

while IFS= read -r p; do
  [ -n "$p" ] || continue
  q=$(printf '%s' "$p" | tr '\\' '/' | tr -s '/' | sed 's|^\./||')
  case "$q" in *..*) continue ;; esac
  [ -f "$q" ] || continue

  if grep -q 'nosr' "$q"; then
    FILE_HAS=1
  else
    FILE_HAS=0
  fi
  if printf '%s' "$INPUT" | grep -q 'nosr'; then
    PAYLOAD_HAS=1
  else
    PAYLOAD_HAS=0
  fi

  if [ "$FILE_HAS" -eq 0 ] && [ "$PAYLOAD_HAS" -eq 1 ]; then
    echo "BLOCKED: this write would add the nosr tag to" >&2
    echo "  $q" >&2
    echo "which does not have it. That removes every card in the note from the review schedule." >&2
    echo "Deck scope is the author's decision - propose it and let them decide." >&2
    exit 2
  fi

  if [ "$FILE_HAS" -eq 1 ] && [ "$CMD" = "create" ] && [ "$PAYLOAD_HAS" -eq 0 ]; then
    echo "BLOCKED: this rewrite of" >&2
    echo "  $q" >&2
    echo "would drop its nosr tag, putting every card in the note into the review schedule." >&2
    echo "Deck scope is the author's decision - propose it and let them decide." >&2
    exit 2
  fi
done <<EOF
$PATHS
EOF

exit 0
