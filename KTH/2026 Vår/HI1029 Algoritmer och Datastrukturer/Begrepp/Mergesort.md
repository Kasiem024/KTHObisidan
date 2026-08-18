---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Mergesort

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

> **Komplexitet:** Alltid $O(n \log n)$
> **Stabil:** Ja | **Minne:** $O(n)$ extra

---

## Definition
Delar upp listan i två halvor rekursivt tills man har listor med bara ett element. Sedan "mergas" (slås samman) dessa listor i sorterad ordning.

## Tenta-fokus
- **Förutsägbarhet:** Den är garanterat $O(n \log n)$ oavsett indata, till skillnad från Quicksort.
- **Nackdel:** Den kräver en temporär array under sammanslagningen, vilket ger $O(n)$ i extra minnesåtgång.
- **Användning:** Eftersom den är stabil används den ofta för att sortera objekt (där stabilitet är viktigare än för enkla siffror).

## Java-tips
- `Collections.sort()` och `Arrays.sort()` för objekt i Java använder oftast Timsort, som är en hybrid baserad på Mergesort.

## Kopplat till
- **Metod:** [[Rekursion]]
- **Alternativ:** [[Quicksort]]
- **Egenskap:** [[Stabilitet (Sortering)]]

## Flashcards

Vad är den största nackdelen med Mergesort jämfört med Quicksort?:: Den kräver $O(n)$ extra minne för den temporära arrayen vid sammanslagning.

Vad är tidskomplexiteten för Mergesort i värsta fall?:: $O(n \log n)$.
