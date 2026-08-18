---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Hashtabell

> **Komplexitet:** $O(1)$ (förväntad tid)
> **Viktigt:** Hashfunktionens kvalitet och krockhantering.

---

## Definition
En **Hashtabell** är en datastruktur som mappar nycklar till värden med hjälp av en *hashfunktion*. Den ger extremt snabb åtkomst genom att räkna ut exakt var i minnet ett element ska ligga.

### Kollisionshantering
Eftersom flera nycklar kan hasha till samma index behövs strategier:
- **Öppen adressering:** Om platsen är upptagen, leta efter nästa lediga (t.ex. linjär probering).
- **Länkning (Chaining):** Varje index pekar på en [[Länkad lista]] där krockande element sparas.

## Tenta-fokus
- **Worst-case:** Om alla element hamnar på samma index (pga dålig hashfunktion) blir sökningen $O(n)$.
- **Java-krav:** Om du skriver en egen klass och overridar `equals()`, **måste** du även overrida `hashCode()`. Om två objekt är lika måste de ge samma hashkod.
- **Lastfaktor:** När tabellen blir för full (t.ex. 75%) försämras prestandan drastiskt och den bör expanderas.

## Java-tips
- `HashMap` och `HashSet` är de vanligaste implementationerna i Java API.

## Kopplat till
- **Alternativ:** [[Binärt sökträd (BST)]] (om ordning krävs)
- **Bas:** [[Tidskomplexitet (Big O)]], [[Abstrakt Datatyp (ADT)]]

## Flashcards

Hashtabell (Genomsnittlig komplexitet):: $O(1)$ för sökning, insättning och borttagning.

Hur hanteras krockar med länkning (chaining)?(Definition):: Varje index i tabellen pekar på en lista där alla krockande element lagras.

Vad krävs av equals() och hashCode() i Java?(Definition):: Om `a.equals(b)` är sant, måste `a.hashCode() == b.hashCode()` vara sant.
