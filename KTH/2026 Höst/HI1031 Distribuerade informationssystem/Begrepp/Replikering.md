---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Begrepp: replikering (HI1031)."
---
# Replikering

## Definition

Att ==hålla kopior av samma data på flera datorer== för att öka *prestanda*, *tillgänglighet* och *feltolerans*. Kräver en konsistensmodell (t.ex. linjäriserbarhet eller sekventiell konsistens) och genomförs med passiv (primary-backup) eller aktiv replikering.

## Kopplat till

- [[Konsensus]]
- [[Transaktion (ACID)]]
- [[Skalbarhet]]

## Flashcards

**Replikering**;;Att ==hålla kopior av samma data på flera datorer== för prestanda, tillgänglighet och feltolerans.

Vad skiljer passiv (primary-backup) från aktiv replikering?
||
- **Passiv:** all trafik via en *primär* replika; backup tar över vid krasch.
- **Aktiv:** *alla* replikor bearbetar varje förfrågan (via multicast).
