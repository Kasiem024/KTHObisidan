---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 8 – switching: krets- kontra paketförmedling, datagram/virtuell krets samt switchens uppbyggnad."
---
# HI1032 Begrepp - Kap 08 Switching

Vilka tre traditionella switchningsmetoder finns? (3)
||
- **Kretskoppling** (circuit switching)
- **Paketförmedling** (packet switching)
- **Meddelandeförmedling** (message switching)

**Kretskopplat nät** (circuit-switched);;Ett nät där en ==dedikerad väg (krets) reserveras under hela samtalet==; effektivt bara vid full användning, annars slöseri.

Vilka tre faser har en kretskopplad förbindelse? (3)
||
- **Uppkoppling** (setup) – kretsen etableras
- **Dataöverföring** (data transfer)
- **Nedkoppling** (teardown) – kretsen frigörs

Vad skiljer ett kretskopplat från ett paketförmedlat nät?
||
- **Kretskopplat:** en *dedikerad väg* reserveras i förväg – garanterad kapacitet men slöseri när det är tyst.
- **Paketförmedlat:** data delas i ==paket som delar nätet== – effektivare och kräver ingen reservation.

Vilka två sätt kan ett paketförmedlat nät routa paket på?
||
- **Datagram** (förbindelselöst): varje paket är *självständigt* och kan ta ==egen väg== (routas på destinationsadressen).
- **Virtuell krets** (förbindelseorienterat): en väg sätts upp först, sedan följer alla paket ==samma väg== (via en VC-identifierare).

Vilka fyra huvudkomponenter har en paketswitch? (4)
||
- **Ingångsportar** (input ports)
- **Utgångsportar** (output ports)
- **Routingprocessor**
- **Switchfabric** (kopplingsväv)
