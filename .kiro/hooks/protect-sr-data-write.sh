#!/usr/bin/env bash
# preToolUse matcher: write
#
# WHAT THIS PROTECTS
#   The <!--SR:--> comments that carry the live review schedule. Two ways a write destroys them:
#     create      - a whole-file rewrite that omits markers the file already has;
#     strReplace  - an oldStr containing a marker, replaced by a newStr that does not.
#   insert only adds text, so it is allowed.
#
# MARKER IDENTITY, NOT MARKER COUNT
#   Every marker must survive verbatim. Counting was not enough: 41 markers reshuffled onto
#   different cards passes a count check while stealing each card's earned schedule, which is
#   exactly what write-flashcards SKILL.md rule 11 forbids.
#
# HOW IT READS THE PAYLOAD
#   Only the "path" field decides the target, with escaped quotes neutralised first. An earlier
#   version took the first KTH/*.md string anywhere in the payload, so naming a marker-free note
#   in the card text redirected the check to the wrong file and let a real rewrite through.
#
# Exit 2 = block, 0 = allow. Keep this file pure ASCII.

INPUT=$(cat)

SAN=$(printf '%s' "$INPUT" | sed 's/\\"/__ESCQ__/g')

field() {
  printf '%s' "$SAN" \
    | grep -oE "\"$1\"[[:space:]]*:[[:space:]]*\"[^\"]*\"" \
    | sed "s/^\"$1\"[[:space:]]*:[[:space:]]*\"//; s/\"$//" | head -n 1
}

CMD=$(field command)
[ "$CMD" = "create" ] || [ "$CMD" = "strReplace" ] || exit 0

OLDSTR=$(field oldStr)
NEWSTR=$(field newStr)

PATHS=$(printf '%s' "$SAN" \
  | grep -oE '"path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | sed 's/^"path"[[:space:]]*:[[:space:]]*"//; s/"$//')
[ -n "$PATHS" ] || exit 0

refuse() {
  echo "BLOCKED: this write to" >&2
  echo "  $1" >&2
  echo "would remove or alter a <!--SR:--> marker:" >&2
  echo "  $2" >&2
  echo "That comment is a card's earned review schedule. Keep it byte-identical on the line" >&2
  echo "below the card it belongs to. If a card's wording is wrong, add a NEW card and leave the" >&2
  echo "old one alone - write-flashcards SKILL.md rule 11." >&2
  echo "Deleting review history is the author's decision, not yours." >&2
  exit 2
}

while IFS= read -r p; do
  [ -n "$p" ] || continue
  q=$(printf '%s' "$p" | tr '\\' '/' | tr -s '/' | sed 's|^\./||')
  case "$q" in *..*) continue ;; esac
  [ -f "$q" ] || continue

  MARKERS=$(grep -o '<!--SR:[^>]*-->' "$q" 2>/dev/null)
  [ -n "$MARKERS" ] || continue

  while IFS= read -r m; do
    [ -n "$m" ] || continue
    if [ "$CMD" = "create" ]; then
      # A whole-file rewrite must carry every existing marker.
      printf '%s' "$INPUT" | grep -qF -- "$m" || refuse "$q" "$m"
    else
      # strReplace: a marker inside oldStr must reappear in newStr.
      if printf '%s' "$OLDSTR" | grep -qF -- "$m"; then
        printf '%s' "$NEWSTR" | grep -qF -- "$m" || refuse "$q" "$m"
      fi
    fi
  done <<EOF
$MARKERS
EOF
done <<EOF
$PATHS
EOF

exit 0
