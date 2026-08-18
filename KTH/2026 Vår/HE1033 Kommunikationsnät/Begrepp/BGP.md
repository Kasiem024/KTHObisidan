---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "### Funktioner - Path Vector: Istället för bara en kostnad ser BGP hela listan av AS-nummer som ett paket måste passera."
created: 2026-05-28
updated: 2026-05-28
---
# BGP

> **Typ:** EGP (External Gateway Protocol)
> **Metod:** Path Vector.

---

## Definition
**BGP (Border Gateway Protocol)** är protokollet som kopplar samman de stora nätverken (Autonoma System, AS) som utgör internet.

### Funktioner
- **Path Vector:** Istället för bara en kostnad ser BGP hela listan av AS-nummer som ett paket måste passera. Detta förhindrar loopar.
- **Policy:** Beslut tas inte alltid på "snabbast väg" utan ofta på affärsregler (t.ex. "skicka inte Telias trafik genom Tele2:s nät").

## Tenta-fokus
- **Roll:** Det enda protokollet som används för global routing mellan olika nätoperatörer.
- **TCP:** BGP använder faktiskt [[TCP]] för att skicka sina uppdateringar (pålitlighet är viktigare än snabbhet här).

## Kopplat till
- **Motpart:** [[OSPF]] (som sköter det interna)
- **Transport:** [[TCP]]

## Flashcards

Vilket routingprotokoll används för att koppla samman olika autonoma system (AS) på Internet?:: BGP.

Vad står förkortningen AS för?:: Autonomous System.
