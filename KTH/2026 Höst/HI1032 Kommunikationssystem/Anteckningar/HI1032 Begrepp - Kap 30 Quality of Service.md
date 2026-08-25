---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 30 – Quality of Service: dataflödesegenskaper, schemaläggning, traffic shaping samt IntServ/RSVP och DiffServ."
---
# HI1032 Begrepp - Kap 30 Quality of Service

Vilka fyra egenskaper beskriver ett dataflödes krav på QoS? (4)
||
- **Tillförlitlighet** (reliability) – tål inte paketförlust (t.ex. e-post)
- **Fördröjning** (delay) – kräver låg latens (t.ex. telefoni)
- **Jitter** – tål inte varierande fördröjning (t.ex. ljud/video)
- **Bandbredd** (bandwidth) – kräver hög datatakt (t.ex. video)

**Jitter** (i QoS);;==Variationen i fördröjning== mellan paket i samma flöde; ljud och video tål det dåligt medan e-post inte bryr sig.

Vilka schemaläggningsmetoder används för att förbättra QoS? (3)
||
- **FIFO-kö** – först in, först ut
- **Prioritetskö** – högre prioritet skickas först
- **Weighted fair queuing** – köer får bandbredd efter vikt

Vad skiljer leaky bucket från token bucket (traffic shaping)?
||
- **Leaky bucket:** släpper ut trafik i en ==jämn, fast takt== oavsett hur den kom in.
- **Token bucket:** tillåter ==sparad burstighet== – man samlar tokens när man är tyst och kan sedan skicka en skur.

Vad skiljer Integrated Services (IntServ) från Differentiated Services (DiffServ)?
||
- **IntServ:** *flödesbaserat* – resurser ==reserveras per flöde== i förväg (via RSVP); skalar dåligt.
- **DiffServ:** *klassbaserat* – paket ==märks i klasser== (DS-fält) och behandlas efter prioritet; skalar bättre.

**RSVP** (Resource Reservation Protocol);;Protokollet som IntServ använder för att ==reservera resurser (t.ex. bandbredd) längs vägen== för ett flöde i förväg.

**Admission control** (i QoS);;Att en router ==tackar ja eller nej till ett nytt flöde== beroende på om den har resurser (bandbredd, buffert) kvar.
