---
tags: [begrepp, HI1029, KTH, programmering, year2026]
---
# Heap
> **Komplexitet:** $O(\log n)$ för insättning/borttagning
> **Viktigt:** Komplett träd och Heap-egenskapen.

---

## Definition
En **Heap** är ett *komplett binärt träd* (alla nivåer fyllda utom sista, fylls från vänster) som uppfyller:
- **Max-heap:** Föräldern $\ge$ barnen.
- **Min-heap:** Föräldern $\le$ barnen.

Detta gör att roten alltid innehåller det största (eller minsta) elementet.

## Tenta-fokus
- **Implementation:** Heapar implementeras nästan alltid i en **array** trots att de är träd.
	- Barn till index `i`: `2i + 1` och `2i + 2`.
	- Förälder till index `i`: `(i - 1) / 2`.
- **Operationer:**
	- `offer`/`add`: Lägg sist, bubbla upp ($O(\log n)$).
	- `poll`/`remove`: Ta bort roten, flytta sista elementet till roten, bubbla ner ($O(\log n)$).
- **Användning:** Basen för Heap-sort och [[Kö (Queue)]] (Prioritetsköer).

## Java-tips
- Java-klassen `PriorityQueue` är en implementation av en Min-heap.

## Kopplat till
- **Relaterat:** [[Binärt sökträd (BST)]] (båda är träd, men heapen har striktare form/lösare ordning).
- **ADT:** [[Kö (Queue)]] (Prioritetskö).

## Flashcards

Heap (Definition):: Ett komplett binärt träd som följer heap-egenskapen (t.ex. föräldern är alltid större än barnen i en max-heap).

Varför implementeras en heap ofta i en array?(Definition):: För att den är ett komplett träd, vilket gör att man kan räkna ut föräldra/barn-index utan pekare.

Vad är tidskomplexiteten för att ta bort roten i en Heap?:: $O(\log n)$.
