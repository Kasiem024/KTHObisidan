---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Instickssortering (Insertion sort)

> **Komplexitet:** $O(n^2)$ (värsta fall), $O(n)$ (bästa fall)
> **Stabil:** Ja

---

## Definition
Man tar ett element i taget och "sticker in" det på rätt plats i den redan sorterade delen av listan (tänk hur man sorterar en korthand).

## Tenta-fokus
- **Bästa fall:** Om listan redan är sorterad tar det bara $O(n)$ tid. Detta gör den mycket effektiv för "nästan sorterad" data.
- **Egenskap:** Den är stabil och sorterar "in-place" (kräver inget extra minne).

## Kopplat till
- **Egenskap:** [[Stabilitet (Sortering)]]
- **Alternativ:** [[Urvalssortering (Selection sort)]]

## Flashcards

Vilken sorteringsalgoritm är mest effektiv för "nästan sorterad" data?:: Instickssortering (Insertion sort).

Vad är tidskomplexiteten för Instickssortering i bästa fallet?:: $O(n)$.
