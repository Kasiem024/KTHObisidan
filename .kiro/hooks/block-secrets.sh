#!/usr/bin/env bash
# preToolUse matcher: write, shell
#
# This repository is PUBLIC, and so is the site built from it. There are no secrets in the
# vault today and it should stay that way. Blocks writing or committing key material and
# obvious credential patterns.
#
# Exit 2 = block.

INPUT=$(cat)

# Secret-bearing file types and names.
if printf '%s' "$INPUT" | grep -qiE '\.env([."'"'"' /\\]|$)|\.pem([."'"'"' ]|$)|\.p12([."'"'"' ]|$)|\.pfx([."'"'"' ]|$)|id_rsa|id_ed25519|credentials\.json|\.netrc'; then
  echo "BLOCKED: this targets secret or key material." >&2
  echo "This vault is a PUBLIC repository and the site built from it is public too." >&2
  echo "Keep credentials outside the vault entirely. See .kiro/steering/documentation-standard.md" >&2
  exit 2
fi

# Inline credential patterns. Deliberately narrow to avoid firing on study notes about
# security - a note may legitimately discuss the words 'token' or 'password'. These match an
# assignment of a long opaque value, which prose does not do.
if printf '%s' "$INPUT" | grep -qE '(ghp_|github_pat_)[A-Za-z0-9_]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY-----'; then
  echo "BLOCKED: this looks like a real credential (GitHub token, AWS key, or private key)." >&2
  echo "The repository is public. Do not commit it; rotate it if it has been exposed." >&2
  exit 2
fi

exit 0
