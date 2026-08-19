---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "En Kö fungerar som en vanlig mänsklig kö: den som kommer först får hjälp först."
created: 2026-05-28
updated: 2026-05-28
---
# Kö (Queue)

> **Princip:** FIFO (First-In, First-Out)
> **Viktigt:** Bufferthantering och BFS.

---

## Definition

En **Kö** fungerar som en vanlig mänsklig kö: den som kommer först får hjälp först.

**Huvudoperationer:**
- `enqueue`/`add`: Lägg till sist ($O(1)$).
- `dequeue`/`remove`: Ta bort först ($O(1)$).

## Tenta-fokus

- **Cirkulär array:** Vid implementation med en array används ofta en "cirkulär array" för att undvika att behöva skifta element vid varje `dequeue` ($O(1)$ istället för $O(n)$).
- **Prioritetskö:** En speciell typ av kö där element med högst prioritet får gå före. Implementeras oftast med en [[Heap]].
- **Användning:** Används i *Breadth-First Search* (BFS).

## Kopplat till

- **ADT:** [[Abstrakt Datatyp (ADT)]]
- **Relaterat:** [[Stack]]
- **Implementation:** [[Heap]] (för prioritetskö)

## Flashcards

Beskriv ADT Kö (Queue).(Definition):: En linjär datastruktur som följer FIFO-principen (First-In, First-Out).

Varför använder man ofta en cirkulär array för att implementera en kö?:: För att kunna göra både insättning (bak) och borttagning (fram) i $O(1)$ utan att behöva flytta på alla element.
