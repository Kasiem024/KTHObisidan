#!/usr/bin/env bash
# preToolUse matcher: shell
#
# Blocks operations that are hard or impossible to undo on this vault. Note that deletions
# here go to Google Drive's cloud trash, not the Windows Recycle Bin, so a mistake is
# recoverable only through drive.google.com.
#
# Exit 2 = block.

INPUT=$(cat)

fail() {
  echo "BLOCKED: $1" >&2
  echo "If this is genuinely needed, do it yourself so it is a deliberate act." >&2
  exit 2
}

# Recursive deletes.
printf '%s' "$INPUT" | grep -qiE 'Remove-Item[^|]*-Recurse' && fail "recursive delete."
printf '%s' "$INPUT" | grep -qiE '\brm[[:space:]]+(-[a-zA-Z]*[rf][a-zA-Z]*[[:space:]]+)+' && fail "recursive/forced rm."

# Destructive git.
printf '%s' "$INPUT" | grep -qiE 'git[[:space:]]+reset[[:space:]]+--hard' && fail "git reset --hard discards work."
printf '%s' "$INPUT" | grep -qiE 'git[[:space:]]+clean[[:space:]]+-[a-zA-Z]*f' && fail "git clean -f deletes untracked files."
printf '%s' "$INPUT" | grep -qiE 'git[[:space:]]+push[^|]*(--force|-f\b)' && fail "force push rewrites published history."
printf '%s' "$INPUT" | grep -qiE 'git[[:space:]]+branch[[:space:]]+-D' && fail "git branch -D force-deletes an unmerged branch. Use -d, and prune first if it refuses."
printf '%s' "$INPUT" | grep -qiE 'git[[:space:]]+checkout[[:space:]]+--[[:space:]]*\.' && fail "git checkout -- . discards all local changes."

# The literature folder is copyrighted course material and is out of scope.
printf '%s' "$INPUT" | grep -qiE 'Litteraturlista' | grep -qiE '(Remove-Item|del |rm )' && fail "the Litteraturlista folder is out of scope."

# Never touch plugin state.
printf '%s' "$INPUT" | grep -qiE '\.obsidian[\\/]' | grep -qiE '(Remove-Item|Set-Content|WriteAllText)' && fail "writing to .obsidian/ would corrupt plugin state, including the review schedule."

exit 0
