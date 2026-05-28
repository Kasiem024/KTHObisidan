---
tags: [begrepp, HI1029, KTH, programmering, year2026]
---
# Stack
> **Princip:** LIFO (Last-In, First-Out)
> **Viktigt:** Rekursionens call-stack.

---

## Definition
En **Stack** är en linjär datastruktur där man bara kommer åt det element som senast lades till. Tänk på en stapel med tallrikar.

**Huvudoperationer:**
- `push`: Lägg till överst ($O(1)$).
- `pop`: Ta bort överst ($O(1)$).
- `peek`: Titta på översta utan att ta bort ($O(1)$).

## Tenta-fokus
- **Användning:** Används för att hantera metodanrop ([[Rekursion]]), för att utvärdera matematiska uttryck (postfix) och i algoritmer som *Depth-First Search* (DFS).
- **Implementation:** Kan implementeras effektivt med både en array och en länkad lista.

## Kopplat till
- **ADT:** [[Abstrakt Datatyp (ADT)]]
- **Relaterat:** [[Kö (Queue)]]
- **Logik:** [[Rekursion]]

## Flashcards

Beskriv ADT Stack.(Definition):: En linjär datastruktur som följer LIFO-principen (Last-In, First-Out).

Vad är tidskomplexiteten för push och pop på en stack?:: $O(1)$.
