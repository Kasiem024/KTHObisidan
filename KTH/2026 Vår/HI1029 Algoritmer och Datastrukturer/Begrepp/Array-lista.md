---
tags: [begrepp, HI1029, KTH, programmering, year2026]
---
# Array-lista
> **Komplexitet:** $O(1)$ indexering, $O(n)$ insättning/borttagning (mitt/början)
> **Viktigt:** Amorterad tid och array-kopiering.

---

## Definition
En **Array-lista** är en dynamisk [[Abstrakt Datatyp (ADT)|ADT]] som använder en underliggande array för att lagra element. När arrayen blir full skapas en ny, större array och alla element kopieras över.

## Tenta-fokus
- **Amorterad tid:** Att lägga till sist (`add`) är oftast $O(1)$, men $O(n)$ när arrayen måste expanderas. I genomsnitt (amorterat) räknas det som $O(1)$.
- **Prestanda:** Mycket snabb för läsning via index, men långsam om man ofta lägger till eller tar bort i början (eftersom alla element efteråt måste skiftas).

## Java-tips
- Implementeras i Java som `ArrayList`.

## Kopplat till
- **ADT:** [[Abstrakt Datatyp (ADT)]]
- **Alternativ:** [[Länkad lista]]
- **Användning:** [[Stack]], [[Kö (Queue)]]

## Flashcards

Tidskomplexitet för get(index) i en array-lista:: $O(1)$.

Tidskomplexitet för add(index, element) i en array-lista:: $O(n)$, eftersom efterföljande element måste skiftas.

Vad innebär amorterad $O(1)$ för en array-lista?:: Att operationen oftast tar konstant tid, och den dyra expansionen ($O(n)$) sker så sällan att genomsnittet förblir lågt.
