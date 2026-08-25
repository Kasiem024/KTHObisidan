---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 27 – nätverkshantering: SNMP (manager/agent, trap) samt SMI och MIB."
---
# HI1032 Begrepp - Kap 27 Nätverkshantering

Vad menas med nätverkshantering (network management)?::Att ==övervaka, testa, konfigurera och felsöka== nätets komponenter så att de uppfyller organisationens krav.

Vad är skillnaden mellan en manager och en agent i SNMP?
||
- **Manager:** en *host* som kör SNMP-klienten och ==övervakar och styr==.
- **Agent:** en *router/host* som kör SNMP-servern, ==håller data och utför åtgärder== samt kan skicka *trap*-varningar.

Vilka tre protokoll samverkar i internets nätverkshantering? (3)
||
- **SNMP** – definierar paketen och läser/ändrar värden
- **SMI** – regler för hur objekt *namnges och typas*
- **MIB** – *definierar de faktiska objekten* som ska hanteras

**SNMP** (Simple Network Management Protocol);;Protokollet som ==låter en manager läsa och ändra värden hos agenter== (routrar/servrar) för att övervaka och styra nätet.

**SMI** (Structure of Management Information);;De ==regler som anger hur hanterade objekt namnges och vilka datatyper== de har (men inte vilka objekt som finns).

**MIB** (Management Information Base);;En ==samling av de objekt (variabler) som kan hanteras== hos en enhet, namngivna enligt SMI:s regler – som en databas av metadata.

Vad är en *trap* i SNMP?::Ett ==meddelande som en agent skickar oombedd till managern== för att varna om en ovanlig händelse.
