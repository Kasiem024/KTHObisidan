---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Quicksort

> **Komplexitet:** $O(n \log n)$ (medel), $O(n^2)$ (värsta fall)
> **Stabil:** Nej | **In-place:** Ja

---

## Definition
En rekursiv algoritm som väljer ett *pivot-element* och delar upp listan i två delar: de som är mindre än pivot och de som är större. Sedan sorteras delarna rekursivt.

## Tenta-fokus
- **Värsta fall:** Sker om man väljer ett dåligt pivot-element (t.ex. minsta eller största i varje steg). Detta händer ofta på redan sorterad data om man alltid väljer det första elementet.
- **Praktik:** Trots $O(n^2)$ i värsta fall är den oftast snabbare än Mergesort i praktiken pga låga konstanter och bra cache-utnyttjande.

## Java-tips
- `Arrays.sort()` i Java använder en variant av Quicksort för primitiva typer.

## Kopplat till
- **Metod:** [[Rekursion]]
- **Alternativ:** [[Mergesort]]
- **Egenskap:** [[Stabilitet (Sortering)]]

## Flashcards

Hur uppkommer worst-case $O(n^2)$ för Quicksort?(Definition):: När pivot-elementet konsekvent blir det största eller minsta elementet (t.ex. vid redan sorterad data om man väljer första/sista elementet).

Är Quicksort stabil?:: Nej.
