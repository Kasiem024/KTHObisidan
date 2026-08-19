---
inclusion: auto
description: Windows, PowerShell, Google Drive and encoding pitfalls specific to this vault. Read before running any script or shell command against it.
---

# Environment — KTH Obsidian Study Vault

The vault lives on **Google Drive** at `G:\My Drive\KTHObsidian`, on **Windows**, edited
through **PowerShell 5.1**. Each of the following has already caused a wrong result or a
silent no-op here.

## PowerShell 5.1 reads `.ps1` as ANSI

A script file containing `å ä ö` is mis-decoded, so Swedish literals silently fail to match.
**Keep every `.ps1` pure ASCII.** To work with Swedish text:

- match with a wildcard or letter class — `f.rel.sning`, `\p{L}`, `V.rdekedja`;
- or put the Swedish strings in a separate **UTF-8 data file** and read them with
  `[System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)`.

Course codes are ASCII, so filter by those where possible.

## Long inline commands get mangled

A multi-line command passed inline to the shell can arrive corrupted and then match nothing
— failing silently rather than erroring. Write a `.ps1` and run it:

```
powershell -NoProfile -ExecutionPolicy Bypass -File "<script>"
```

## Capture output to a file, not to stdout

Shell stdout capture truncates on Swedish characters. Write results to a file under `%TEMP%`
and read that file instead.

## `-match` is case-insensitive

This has produced two false alarms already. Searching for `NaN` matched "nan" inside
fi**nan**siering and reported 243 corrupted pages; the real count was zero. A search for
`WHERE` matched "where the competition isn't". Use `-cmatch` / `[regex]::Matches` when case
matters, and be suspicious of a check that reports a surprisingly large number.

## Always read and write UTF-8, preserving the BOM

```powershell
$raw = [System.IO.File]::ReadAllText($path)
$hadBom = ($raw.Length -gt 0 -and [int][char]$raw[0] -eq 0xFEFF)
[System.IO.File]::WriteAllText($path, $new, (New-Object System.Text.UTF8Encoding($hadBom)))
```

Note that `\xEF\xBB\xBF` in a regex matches *characters*, not bytes — after decoding, a BOM
is the single char `U+FEFF`. Getting this wrong made a frontmatter matcher fail on every
file at once.

## git on Google Drive prints a benign error

`git push` from the vault emits:

```
error: failed to perform geometric repack
packed-refs: Function not implemented
```

**The push still succeeds.** It is a Drive filesystem quirk. Confirm with
`git ls-remote origin refs/heads/main` rather than trusting the message.

## Deletions go to Drive's cloud trash

Not the Windows Recycle Bin. Recovery is via drive.google.com. Prefer moving files over
deleting them, and ask before deleting anything.

## npm needs `cmd /c`

PowerShell's execution policy blocks `npm.ps1`. Run npm and npx through `cmd /c`.
