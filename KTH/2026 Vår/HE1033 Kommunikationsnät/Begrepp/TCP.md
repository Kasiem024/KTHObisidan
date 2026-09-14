---
tags: [begrepp, HE1033, HI1031, HI1032, KTH, nätverk, year2026]
description: "TCP (Transmission Control Protocol) säkerställer att data kommer fram felfritt och i rätt ordning."
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
<!--SR:!fsrs,2026-09-13T07:18:02.717Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-12T07:18:02.717Z-->

Nämn en fördel och en nackdel med TCP jämfört med UDP.:: Fördel: Garanterad leverans. Nackdel: Mer overhead och högre latens.
<!--SR:!fsrs,2026-09-13T09:54:04.140Z,2,2.3065,2.11121424,2,2,0,0,2026-09-11T09:54:04.140Z-->
