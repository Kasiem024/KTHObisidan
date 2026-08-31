---
tags: [begrepp, HI1032, nätverk, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Flashcards HI1032 kap 17 – kopplingsenheter (hubb, switch, router) och virtuella LAN (VLAN)."
---
# HI1032 Begrepp - Kap 17 Kopplingsenheter och VLAN

Vad skiljer en hubb, en switch och en router åt? (3)
||
- **Hubb:** fysiska lagret – ==skickar allt till alla portar== (en enda kollisionsdomän).
- **Switch** (link-layer): datalänklagret – ==vidarebefordrar ramar till rätt port== via MAC-adress.
- **Router:** nätverkslagret – ==vidarebefordrar paket mellan nätverk== via IP-adress.

**Hubb** (hub);;En enkel kopplingsenhet på *fysiska lagret* som ==upprepar inkommande signal till alla portar==; alla portar delar en kollisionsdomän.

**Länklagerswitch** (link-layer switch);;En kopplingsenhet på *datalänklagret* som ==vidarebefordrar ramar till rätt port utifrån MAC-adress== och därmed filtrerar trafiken.

På vilket lager arbetar en router, och vilken adress använder den?::På ==nätverkslagret==; den vidarebefordrar paket mellan olika nät utifrån *IP-adress* (till skillnad från switchen som använder MAC).

**VLAN** (Virtual LAN);;En teknik som ==delar upp ett fysiskt LAN i flera logiska nät via mjukvara==, oberoende av fysisk placering.

Vilka fördelar ger VLAN?::==Mindre broadcast-trafik och bättre säkerhet== – grupper kan skapas logiskt via mjukvara, oberoende av var enheterna sitter fysiskt.
