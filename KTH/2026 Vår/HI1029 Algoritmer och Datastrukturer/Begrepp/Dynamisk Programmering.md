---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Dynamisk Programmering

> **Princip:** Lös delproblem en gång, spara resultatet.
> **Viktigt:** Överlappande delproblem.

---

## Definition
En metod för att lösa problem genom att bryta ner dem i mindre delproblem. Till skillnad från vanlig rekursion sparas resultaten från delproblemen så att man slipper räkna ut samma sak flera gånger (**memoization**).

### Krav
1. **Optimal understruktur:** Lösningen på det stora problemet kan byggas av lösningar på mindre delproblem.
2. **Överlappande delproblem:** Samma delproblem dyker upp många gånger under beräkningen.

## Tenta-fokus
- **Memoization vs Tabulering:**
	- *Memoization (Top-down):* Rekursion med en tabell för att spara resultat.
	- *Tabulering (Bottom-up):* Iteration (loopar) som fyller en tabell från de minsta fallen uppåt.
- **Exempel:** Fibonacci-tal, Ryggsäcksproblemet (Knapsack), Kortaste vägen.

## Kopplat till
- **Metod:** [[Rekursion]]
- **Alternativ:** "Brute force" (mycket långsammare)

## Flashcards

Hur fungerar Dynamisk Programmering?(Definition):: Man delar upp problemet i överlappande delproblem, löser dem en gång och sparar resultaten för att undvika onödiga omberäkningar.

Vad är skillnaden mellan memoization och tabulering?:: Memoization är top-down (ofta rekursivt), tabulering är bottom-up (ofta iterativt).
