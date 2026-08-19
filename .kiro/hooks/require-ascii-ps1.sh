#!/usr/bin/env bash
# preToolUse matcher: write
#
# PowerShell 5.1 reads .ps1 files as ANSI, so a script containing Swedish characters is
# mis-decoded and its literals silently fail to match - the script "runs fine" and changes
# nothing. Keep .ps1 files pure ASCII and match Swedish with wildcards, or read the strings
# from a separate UTF-8 data file.
#
# Exit 2 = block.

INPUT=$(cat)

# Only interested in writes to a PowerShell script.
if ! printf '%s' "$INPUT" | grep -qiE '\.ps1'; then
  exit 0
fi

# LC_ALL=C makes grep treat input as bytes, so any byte >= 0x80 is a non-ASCII character.
if printf '%s' "$INPUT" | LC_ALL=C grep -qP '[\x80-\xFF]'; then
  echo "BLOCKED: this .ps1 contains non-ASCII characters." >&2
  echo "PowerShell 5.1 reads .ps1 as ANSI, so Swedish literals will be corrupted and will" >&2
  echo "match nothing - silently. Use a wildcard (f.rel.sning, \\p{L}) or read the Swedish" >&2
  echo "strings from a separate UTF-8 data file. See .kiro/steering/environment.md" >&2
  exit 2
fi

exit 0
