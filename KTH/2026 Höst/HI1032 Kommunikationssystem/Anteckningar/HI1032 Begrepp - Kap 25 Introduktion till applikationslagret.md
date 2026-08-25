---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 25 – applikationslagret: klient-server- och P2P-paradigm, socket-gränssnitt och iterativ/samtidig server."
---
# HI1032 Begrepp - Kap 25 Introduktion till applikationslagret

Vad är applikationslagrets uppgift?::Att ==tillhandahålla de tjänster användaren faktiskt använder== (webb, e-post m.m.) via en *logisk* process-till-process-förbindelse.

Vilka två paradigm kan värdar utbyta tjänster med på internet? (2)
||
- **Klient-server:** en *alltid igång* server erbjuder tjänster; klienter frågar vid behov.
- **Peer-to-peer (P2P):** ==noder erbjuder tjänster åt varandra direkt==, utan en central server.

**Socket-gränssnitt** (socket interface);;Ett ==API mellan applikationen och transportlagret== som låter program skicka och ta emot data över nätet.

**Socket-adress**;;Kombinationen av en ==IP-adress och ett portnummer== som fullständigt identifierar en process-ändpunkt.

Vad skiljer en iterativ från en samtidig (concurrent) server?
||
- **Iterativ:** hanterar klienter ==en i taget==.
- **Samtidig:** hanterar ==många klienter parallellt== (så många som resurserna tillåter).
