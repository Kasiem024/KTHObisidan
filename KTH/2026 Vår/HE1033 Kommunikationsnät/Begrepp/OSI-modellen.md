---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
---
# OSI-modellen
> **Lager:** 1-7 (Alla)
> **Mål:** Standardiserat ramverk för nätverkskommunikation.

---

## Definition
En teoretisk modell i sju lager som beskriver hur data skickas från en applikation på en dator till en applikation på en annan.

1. **Fysiska:** Bitströmmar, kablar.
2. **Datalänk:** Felkontroll, [[LLC och MAC]].
3. **Nätverk:** Routing, [[IPv4 och IPv6]].
4. **Transport:** Felrättning, [[TCP]]/[[UDP]].
5. **Session:** Hantering av sessioner.
6. **Presentation:** Kryptering, format.
7. **Applikation:** Gränssnitt för användaren ([[DNS]], [[HTTP]]).

## Tenta-fokus
- **Inkapsling:** Varje lager lägger till sin egen header (PDU). Data $\to$ Segment (L4) $\to$ Paket (L3) $\to$ Ram (L2).
- **Lager-ansvar:** Du måste veta vilket lager som hanterar vad (t.ex. Routing = Lager 3, Switching = Lager 2).

## Kopplat till
- **Modeller:** [[LLC och MAC]]
- **Protokoll:** [[TCP]], [[UDP]], [[IPv4 och IPv6]]

## Flashcards

OSI-modellen (Antal lager):: 7 stycken.

I vilket OSI-lager jobbar en Router?:: Lager 3 (Nätverkslagret).

Vad kallas dataenheten (PDU) i lager 2?:: Ram (Frame).
