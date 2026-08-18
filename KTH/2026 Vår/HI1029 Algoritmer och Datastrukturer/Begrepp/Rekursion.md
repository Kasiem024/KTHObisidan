---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Rekursion

> **Princip:** En funktion som anropar sig själv.
> **Viktigt:** Basfall och minnesanvändning.

---

## Definition
**Rekursion** innebär att man löser ett problem genom att bryta ner det i mindre delproblem av samma typ.

Två krav för en fungerande rekursion:
1. **Basfall:** Ett villkor som avslutar rekursionen.
2. **Rekursivt steg:** Funktionen anropar sig själv med en "mindre" indata.

## Tenta-fokus
- **Minne:** Varje rekursivt anrop tar upp plats på **Call Stacken** ($O(\text{djup})$). Om rekursionen är för djup får man `StackOverflowError`.
- **Fördel:** Mycket enklare och renare kod för träd- och grafproblem.
- **Nackdel:** Kan vara mindre effektiv än iteration pga overhead vid metodanrop.

## Java-tips
- Var försiktig med rekursion i Java då call-stacken är begränsad. För mycket djupa problem är iteration (loopar) säkrare.

## Kopplat till
- **Strategier:** [[Backtracking]], [[Dynamisk Programmering]]
- **Algoritmer:** [[Quicksort]], [[Mergesort]], [[Binär sökning]]
- **Strukturer:** [[Stack]] (Call-stack)

## Flashcards

Skillnad mellan rekursion och iteration gällande minne?(Definition):: Rekursion tar $O(\text{djup})$ på call-stacken; iteration tar normalt $O(1)$ extra minne.

Vad händer om man glömmer basfallet i en rekursion?:: Man får en oändlig rekursion som leder till `StackOverflowError`.

Varför är rekursion bra för binära träd?:: Eftersom ett träd i sig är en rekursiv datastruktur (en nod har subträd som också är träd).
