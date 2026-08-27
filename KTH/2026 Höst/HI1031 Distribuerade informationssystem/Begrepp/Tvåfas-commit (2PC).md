---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-26
description: "Begrepp: tvåfas-commit (2PC) (HI1031)."
---
# Tvåfas-commit (2PC)

## Definition

Det vanligaste *atomiska commit-protokollet* för distribuerade transaktioner: i **fas 1** frågar en koordinator alla deltagare om de kan commit:a (röstning), i **fas 2** meddelas det ==gemensamma beslutet== (commit eller abort). Säkerställer att alla servrar gör samma sak – aldrig en blandning.

## Kopplat till

- [[Transaktion (ACID)]]

## Flashcards

**Tvåfas-commit** (2PC);;Ett atomiskt commit-protokoll: fas 1 = röstning om alla kan commit:a, fas 2 = ==sprid det gemensamma beslutet== (commit/abort).
