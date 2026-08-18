---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# LLC och MAC

> **Lager:** OSI 2 (Datalänk)
> **Viktigt:** Uppdelning av ansvar i lager 2.

---

## Definition
Datalänklagret är uppdelat i två underlager för att separera mjukvaru- och hårdvaruansvar.

1. **LLC (Logical Link Control):** Den övre delen. Hanterar flödeskontroll, felkontroll och talar om för nätverkslagret vilket protokoll som används.
2. **MAC (Media Access Control):** Den undre delen. Hanterar fysisk adressering ([[MAC-adress]]) och reglerar hur flera enheter delar på samma fysiska medium.

## Tenta-fokus
- **Oberoende:** LLC-lagret gör att mjukvaran kan vara densamma oavsett om man använder Ethernet, Wifi eller Token Ring.

## Kopplat till
- **Adressering:** [[MAC-adress]]
- **Hårdvara:** [[Ethernet-ramen]]
- **Metoder:** [[CSMA-CD och CSMA-CA]]

## Flashcards

Vilka två underlager ingår i datalänklagret?(2):: LLC (Logical Link Control) och MAC (Media Access Control).

Vilket underlager hanterar den fysiska adresseringen (MAC-adresser)?:: MAC-underlagret.
