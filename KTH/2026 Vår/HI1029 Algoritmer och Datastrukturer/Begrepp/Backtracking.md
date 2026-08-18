---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Backtracking

> **Princip:** Prova en väg, backa om det skiter sig.
> **Viktigt:** Systematisk sökning.

---

## Definition
En algoritmisk strategi för att hitta lösningar (ofta i spel eller pussel) genom att prova en väg framåt. Om vägen leder till en ogiltig lösning går man tillbaka till föregående steg och provar en annan väg.

## Tenta-fokus
- **Sökträd:** Backtracking traverserar ett "beslutsträd" med *Depth-First Search* (DFS).
- **Basfall:** Viktigt att ha tydliga villkor för när en lösning hittats och när man ska ge upp en väg.
- **Klassiska exempel:** 8-damersproblemet, Sudoku, Labyrint-lösning.

## Kopplat till
- **Metod:** [[Rekursion]]
- **Strukturer:** [[Stack]] (för att hålla koll på vägen)

## Flashcards

Beskriv principen för Backtracking.(Definition):: En metod för att systematiskt söka igenom lösningar genom att prova en väg och "backa" om man når en återvändsgränd.

Vilken typ av sökning (DFS eller BFS) används oftast vid Backtracking?:: DFS (Depth-First Search).
