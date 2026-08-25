---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 12 – distribuerade filsystem: filtjänstarkitektur, tillståndslös kontra tillståndsbärande server, cachning samt NFS och AFS."
---
# HI1031 Begrepp - Kap 12 Distribuerade filsystem

**Distribuerat filsystem**;;En tjänst som låter program ==lagra och komma åt filer på fjärrservrar precis som lokala filer==, med jämförbar prestanda och tillförlitlighet.

Vilka tre delar brukar man dela upp en filtjänst i? (3)
||
- **Flat file service** – läser/skriver filinnehåll via unika fil-id (UFID)
- **Directory service** – översätter filnamn till fil-id
- **Client module** – körs hos klienten och binder ihop tjänsterna till ett vanligt fil-API

Vad är skillnaden mellan en tillståndslös och en tillståndsbärande filserver?
||
- **Tillståndslös** (stateless): servern ==minns inget mellan anrop== – varje begäran är komplett i sig, vilket gör omstart efter krasch enkel (t.ex. NFS).
- **Tillståndsbärande** (stateful): servern *minns* öppna filer och klienter – kan ge bättre prestanda men blir känsligare för krascher.

**Tillståndslös server** (stateless);;En server som ==inte sparar någon information mellan anrop==; varje förfrågan innehåller allt som behövs, vilket gör återhämtning efter krasch enkel.

**Cachning** (i filsystem);;Att ==spara kopior av filer eller filblock nära klienten== för att minska nätverkstrafik och svarstid; kräver mekanismer för att hålla kopiorna aktuella.

**One-copy update semantics**;;Idealet att operationer på en distribuerad fil ==ska bete sig som om det bara fanns en enda kopia==, trots cachning och replikering.

Vad kännetecknar Sun NFS-designen?::En ==tillståndslös filserver== där klienter *monterar* fjärrkataloger så att de ser ut som en del av det lokala filträdet.

Vad kännetecknar Andrew File System (AFS)?::==Cachning av hela filer== hos klienten plus *callbacks* – servern meddelar när en cachad fil ändrats – vilket ger god skalbarhet.
