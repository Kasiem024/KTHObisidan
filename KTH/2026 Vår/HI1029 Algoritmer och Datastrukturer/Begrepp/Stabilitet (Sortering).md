---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "En sorteringsalgoritm är stabil om element med samma sorteringsnyckel behåller sin ursprungliga inbördes ordning efter sorteringen."
created: 2026-05-28
updated: 2026-05-28
---
# Stabilitet (Sortering)

> **Mål:** Bevara inbördes ordning för lika element.
> **Viktigt:** Avgörande vid sortering i flera steg.

---

## Definition

En sorteringsalgoritm är **stabil** om element med samma sorteringsnyckel behåller sin ursprungliga inbördes ordning efter sorteringen.

### Exempel

Om vi har en lista med studenter sorterad på namn, och vi sedan sorterar på betyg:
- En **stabil** algoritm behåller studenter med samma betyg sorterade på namn.
- En **icke-stabil** algoritm kan kasta om ordningen för studenter med samma betyg.

## Tenta-fokus

- **Vilka är stabila?**
	- Stabila: [[Mergesort]], [[Instickssortering (Insertion sort)|Instickssortering]].
	- Icke-stabila: [[Quicksort]], [[Urvalssortering (Selection sort)|Urvalssortering]], [[Heap]]-sort.
- **Varför spelar det roll?** Ofta en teorifråga på tentan. Svaret handlar om att kunna sortera i flera led (t.ex. först på förnamn, sen på efternamn).

## Kopplat till

- **Algoritmer:** [[Mergesort]], [[Quicksort]], [[Instickssortering (Insertion sort)|Instickssortering]], [[Urvalssortering (Selection sort)|Urvalssortering]]

## Flashcards

Vad innebär det att en sorteringsalgoritm är stabil?(Definition):: Att element med samma värde behåller sin inbördes ordning från ursprungslistan.

Namnge en stabil och en icke-stabil sorteringsalgoritm.:: Stabil: Mergesort. Icke-stabil: Quicksort.
