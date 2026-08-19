---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "Tidskomplexitet är ett teoretiskt mått som används för att analysera en algoritms effektivitet när indatans storlek växer."
created: 2026-05-28
updated: 2026-05-28
---
# Tidskomplexitet (Big O)

> **Mål:** Förstå hur algoritmers körtid skalar med indatastorlek $n$.
> **Viktigt:** Fokusera på tillväxttakt snarare än exakta sekunder.

---

## Definition

Tidskomplexitet är ett teoretiskt mått som används för att analysera en algoritms effektivitet när indatans storlek $n$ växer. Genom att använda **Big O-notation** kan vi beskriva algoritmens "värsta fall" oberoende av specifik hårdvara.

### Vanliga komplexitetsklasser

- $O(1)$: Konstant tid (t.ex. indexering i en array).
- $O(\log n)$: Logaritmisk tid (t.ex. binär sökning).
- $O(n)$: Linjär tid (t.ex. genomgång av en lista).
- $O(n \log n)$: Lin-logaritmisk tid (t.ex. [[Mergesort]] eller [[Quicksort]]).
- $O(n^2)$: Kvadratisk tid (t.ex. [[Urvalssortering (Selection sort)|Urvalssortering]]).

## Tenta-fokus

- **Varför teoretisk analys?** För att kunna jämföra algoritmer oberoende av hårdvara och programmeringsspråk.
- **Dominerande term:** Vid analys behåller vi endast termen med högst tillväxttakt och tar bort konstanter. $T(n) = 3n^2 + 5n + 2 \implies O(n^2)$.
- **Analysera kod:** Var uppmärksam på nästlade loopar ($O(n^2)$) och loopar där sökrymden halveras ($O(\log n)$).

## Kopplat till

- **Grundpelare:** [[Rekursion]]
- **Implementationer:** [[Binär sökning]], [[Quicksort]], [[Hashtabell]]

## Flashcards

Tidskomplexitet (Definition):: Ett teoretiskt mått på hur en algoritms tidsåtgång växer i förhållande till indatans storlek $n$.

Varför analyserar man algoritmer teoretiskt?(Definition):: För att kunna jämföra effektivitet oberoende av hårdvara, operativsystem och programmeringsspråk.

Vad innebär det att en algoritm är $O(n^2)$?(Definition):: Att exekveringstiden i värsta fallet växer proportionellt mot kvadraten av indatans storlek.
