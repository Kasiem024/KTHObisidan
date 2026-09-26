---
tags: [begrepp, HE1033, HI1031, HI1032, KTH, nätverk, year2026, nosr]
description: TCP (Transmission Control Protocol) säkerställer att data kommer fram felfritt och i rätt ordning.
created: 2026-05-28
updated: 2026-05-28
---
# TCP

> **Lager:** OSI 4 (Transport)
> **Egenskap:** Connection-oriented, Reliable.

---

## Definition

**TCP (Transmission Control Protocol)** säkerställer att data kommer fram felfritt och i rätt ordning.

### Funktioner

- **Handskakning:** SYN $\to$ SYN-ACK $\to$ ACK (Tre-vägs).
- **Sekvensnummer:** Håller koll på ordningen och upptäcker förluster.
- **Flödeskontroll:** Använder *Sliding Window* för att inte överbelasta mottagaren.
- **Congestion Control:** Saktar ner sändningen om nätverket är segt.

## Tenta-fokus

- **Flags:** Ha koll på SYN, ACK, FIN (avsluta) och RST (reset).
- **Tillförlitlighet:** Om ett paket saknas bekräftas det inte, och sändaren gör en omsändning ([[ARQ-protokoll]]).

## Kopplat till

- **Alternativ:** [[UDP]]
- **Metod:** [[ARQ-protokoll]]

## Flashcards

Vilka tre steg ingår i en TCP-handskakning?:: SYN, SYN-ACK, ACK.
<!--SR:!fsrs,2026-09-23T07:45:00.807Z,0,0.27407583,9.80203995,3,6,2,0,2026-09-23T07:35:00.807Z-->

Nämn en fördel och en nackdel med TCP jämfört med UDP.:: Fördel: Garanterad leverans. Nackdel: Mer overhead och högre latens.
<!--SR:!fsrs,2026-10-19T06:21:08.550Z,24,23.84081329,6.49889507,2,4,0,0,2026-09-25T06:21:08.550Z-->
