---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "En Abstrakt Datatyp (ADT) är en specifikation av en mängd data och de operationer som kan utföras på denna data."
created: 2026-05-28
updated: 2026-05-28
---
# Abstrakt Datatyp (ADT)

> **Mål:** Skilja på *vad* en datastruktur gör och *hur* den gör det.
> **Princip:** Inkapsling och gränssnitt.

---

## Definition

En **Abstrakt Datatyp (ADT)** är en specifikation av en mängd data och de operationer som kan utföras på denna data. Den definierar *gränssnittet* men inte den tekniska implementationen.

### Exempel på ADT:er

- **Stack:** (LIFO - Last In, First Out)
- **Kö:** (FIFO - First In, First Out)
- **Prioritetskö**
- **Lista** (t.ex. Java `List`-interface)

## Tenta-fokus

- **Skillnaden ADT vs Datastruktur:** Detta är en klassisk tentafråga. ADT:n är "kontraktet" (t.ex. en Stack), medan datastrukturen är den faktiska koden (t.ex. en array eller länkad lista).
- **Abstraktion:** Fördelen är att man kan byta implementation (t.ex. från Array till Länkad lista) utan att den som använder ADT:n behöver ändra sin kod.

## Java-tips

- I Java motsvaras ADT:er ofta av **Interfaces** (t.ex. `List`, `Queue`, `Set`).

## Kopplat till

- **Implementationer:** [[Array-lista]], [[Länkad lista]], [[Stack]], [[Kö (Queue)]]
- **Prestanda:** [[Tidskomplexitet (Big O)]]

## Flashcards

Abstrakt Datatyp (ADT) (Definition):: En teoretisk specifikation som definierar data och operationer utan att ange teknisk implementation.

Hur förhåller sig en datastruktur till en ADT?(Definition):: Datastrukturen är den konkreta tekniska implementationen (t.ex. array eller länkad lista) av ADT:n.
