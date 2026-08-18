---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Iterator

> **Mål:** Sekventiell genomgång av en samling.
> **Viktigt:** Effektivitet för länkade listor.

---

## Definition
En **Iterator** är ett objekt som används för att stega igenom elementen i en samling (t.ex. en lista) ett efter ett utan att exponera samlingens inre struktur.

## Tenta-fokus
- **Varför behövs den?** Om man använder en `for`-loop med `get(i)` på en [[Länkad lista]] blir tidskomplexiteten $O(n^2)$. Med en iterator blir den $O(n)$ eftersom iteratorn kommer ihåg var den är.
- **Fail-fast:** De flesta iteratorer i Java kastar ett exception om samlingen ändras (t.ex. `add`/`remove`) samtidigt som man itererar.

## Java-tips
- För att kunna använda en "for-each" loop (`for (E e : list)`) måste klassen implementera interfacet `Iterable`.

## Kopplat till
- **Strukturer:** [[Länkad lista]], [[Array-lista]]
- **Prestanda:** [[Tidskomplexitet (Big O)]]

## Flashcards

Varför är iteratorer viktiga för effektivitet i en länkad lista?:: För att de tillåter genomgång i $O(n)$, medan upprepad användning av `get(index)` i en loop skulle ta $O(n^2)$.

Vilket interface i Java krävs för att en klass ska kunna användas i en for-each loop?:: `Iterable`.
