#!/usr/bin/env bash
# preToolUse matcher: shell
#
# The vault holds a live spaced-repetition schedule. Blocks shell commands that look like a
# bulk rewrite of scheduling comments or card separators.
#
# Best-effort by nature: a preToolUse hook sees the command, not the resulting diff. The real
# guarantee is the rule in .kiro/steering/conventions.md - never rewrite a card separator
# into another form and never strip an <!--SR:--> comment. This catches the obvious sweep.
#
# Exit 2 = block.

INPUT=$(cat)

# A replace/delete operation is the dangerous shape. A read (grep, Select-String, findstr)
# over the same text is fine and common.
if ! printf '%s' "$INPUT" | grep -qiE '(-replace|Set-Content|WriteAllText|Out-File|\bsed\b|\bawk\b)'; then
  exit 0
fi

if printf '%s' "$INPUT" | grep -qiE 'SR:'; then
  echo "BLOCKED: this looks like a bulk rewrite touching <!--SR:--> scheduling data." >&2
  echo "Those comments carry the live review schedule for ~1900 flashcards and must never" >&2
  echo "be stripped. The published site converts cards at BUILD time instead - see the" >&2
  echo "Quartz repo's plugins/flashcards/. If you really need this, do it yourself." >&2
  exit 2
fi

# Rewriting one separator form into another destroys reversed cards.
if printf '%s' "$INPUT" | grep -qE "';;'|\";;\"|'\\?\\?'|\"\\?\\?\""; then
  echo "BLOCKED: this looks like a rewrite of flashcard separators." >&2
  echo "';;' and '??' are the REVERSED card forms - they generate a back-to-front card too." >&2
  echo "Normalising them to '::' or '||' would silently delete half the deck." >&2
  echo "See .kiro/steering/conventions.md section 1." >&2
  exit 2
fi

exit 0
