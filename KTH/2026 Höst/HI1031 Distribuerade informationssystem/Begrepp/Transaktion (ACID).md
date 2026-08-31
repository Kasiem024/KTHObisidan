---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Begrepp: transaktion och ACID (HI1031)."
---
# Transaktion (ACID)

## Definition

En sekvens av operationer som utförs som ==en enda odelbar enhet== – antingen commit:as alla eller ingen (abort). Egenskaperna sammanfattas i **ACID**: Atomicitet, Konsistens, Isolering, Varaktighet. Samtidiga transaktioner hålls isär med *samtidighetskontroll* (låsning, optimistisk, tidsstämpelordning).

## Kopplat till

- [[Tvåfas-commit (2PC)]]

## Flashcards

**Transaktion**;;En sekvens av operationer som utförs som ==en odelbar enhet== – allt commit:as eller inget (abort).

Vilka egenskaper sammanfattas i ACID? (4)
||
- **Atomicitet** – allt eller inget
- **Konsistens** – giltigt tillstånd → giltigt tillstånd
- **Isolering** – transaktioner stör inte varandra
- **Varaktighet** – resultatet överlever krascher
