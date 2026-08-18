---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
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

Nämn en fördel och en nackdel med TCP jämfört med UDP.:: Fördel: Garanterad leverans. Nackdel: Mer overhead och högre latens.
