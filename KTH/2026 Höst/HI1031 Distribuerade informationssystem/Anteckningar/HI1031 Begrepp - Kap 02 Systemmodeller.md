---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vilka tre funktionsdelar delar boken en tillämpning i? (3)
||
- **Presentationslogik** – samspelet med användaren och vyn som visas
- **Applikationslogik** – den tillämpningsspecifika behandlingen, även kallad affärslogik
- **Datalogik** – den varaktiga lagringen, normalt i en databas

Vad betyder det att en arkitektur är trelagers?::Det finns en ==en-till-en-avbildning från logisk del till fysisk server==.
<!--SR:!fsrs,2026-09-10T06:40:13.759Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:13.759Z-->

Vilka är de tre skikten? (3)
||
- **Skikt 1** – klientens vy och kontroller
- **Skikt 2** – en applikationsserver med applikationslogiken
- **Skikt 3** – en databasserver med ett relationsgränssnitt
<!--SR:!fsrs,2026-09-10T06:29:28.190Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:28:28.190Z-->

Vilken är den största vinsten med treskikt?::Applikationslogiken ligger ==samlad på ett ställe==, så mjukvaran blir lättare att underhålla.

Vad kostar treskikt jämfört med tvåskikt? (2)
||
- **Drift** – tre servrar att sköta i stället för två
- **Prestanda** – mer nättrafik och högre fördröjning per operation

Varför kan skikt 1 göras enkelt?::Det är ==bara ett användargränssnitt==, utan applikationslogik, vilket ger inbyggt stöd för tunna klienter.

Hur fördelas de tre delarna i tvåskikt?::De kläms in i två processer, normalt genom att ==applikationslogiken delas mellan klient och server==.

Vad är fördelen med tvåskikt?::==Låg fördröjning== – ett enda meddelandeutbyte räcker för en operation.

Vad är nackdelen med tvåskikt?::Applikationslogiken ==delas över en processgräns==, vilket begränsar vilka delar som kan anropas direkt från vilka andra.

Vad menas med n-skiktsarkitektur?::Tillämpningen delas i ==n logiska delar, var och en på en egen server==.

Vilket exempel på n-skikt ger boken, och varför?::==Wikipedia==, som behöver klara upp till ==60 000 sidförfrågningar per sekund==.

Vad skiljer skiktning från flerskikt? (2)
||
- **Skiktning** – *vertikal* uppdelning i abstraktionslager, där varje lager bara använder lagret under
- **Flerskikt** – fördelar *ett* lagers funktion över lämpliga servrar

**Applikationsserver**;;Den kategori av middleware som ger direkt stöd för treskikt genom att ==skilja applikationslogiken från datalagringen==.
<!--SR:!fsrs,2026-09-10T06:40:26.983Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:26.983Z!2000-01-01,1,250-->

## MVC-arkitektur

Vad måste du säga om källan när du svarar på MVC-frågan?::Att ==MVC inte finns i boken== – svaret bygger på allmän kunskap om mönstret.
<!--SR:!fsrs,2026-09-10T06:29:56.134Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:28:56.134Z-->

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-09-10T06:29:45.550Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:28:45.550Z!2000-01-01,1,250-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-09-10T06:40:18.431Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:18.431Z!2000-01-01,1,250-->

Hur går flödet i MVC?::Användaren agerar i vyn → ==controllern tolkar== → modellen uppdateras → modellen säger till → vyn ritas om.

Vad vinner man på MVC:s uppdelning? (2)
||
- **Flera vyer** kan visa samma modell
- **Modellen kan testas** utan något gränssnitt alls
<!--SR:!fsrs,2026-09-10T06:40:30.607Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:30.607Z-->

Vad skiljer MVC från trelager? (egen slutsats)::MVC delar upp ==kod efter roll inne i en tillämpning==; trelager fördelar ==funktion över olika servrar==.
<!--SR:!fsrs,2026-09-10T06:40:36.862Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:36.862Z-->

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-09-10T06:40:51.658Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:51.658Z!2000-01-01,1,250-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att åstadkomma kommunikation och resursdelning.

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**

**Plattform** (i bokens lagermodell);;De ==lägsta lagren: hårdvara plus operativsystem==. Boken ger fem exempel, bland dem Intel x86/Windows och ARM/Symbian.

Vad höjer middleware nivån på? (5)
||
- **Fjärranrop**
- **Gruppkommunikation** mellan processer
- **Händelsenotifieringar**
- **Uppdelning, placering och replikering** av delade dataobjekt
- **Multimediadata i realtid**

Vad är syftet med middleware, i två ord?::==Interoperabilitet och portabilitet== – att olika system funkar ihop och att kod går att flytta.

Vilka sex kategorier av middleware räknar boken upp?::==Distribuerade objekt, distribuerade komponenter, publish-subscribe, meddelandeköer, webbtjänster och peer-to-peer.==
<!--SR:!fsrs,2026-09-10T06:29:36.902Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:28:36.902Z-->

Vilka exempel ger boken på middleware för distribuerade objekt?::==CORBA== och ==Java RMI== som plattformar, ==RM-ODP== som standard.
<!--SR:!fsrs,2026-09-10T06:40:47.666Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:47.666Z-->

Vad ger middleware utöver programmeringsabstraktioner?::==Infrastrukturtjänster==, till exempel CORBA:s tjänster för säkerhet och tillförlitlighet.
<!--SR:!fsrs,2026-09-10T06:40:08.607Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:08.607Z-->

Vad säger end-to-end-argumentet?::Vissa saker blir pålitliga ==bara om tillämpningen i ändpunkterna sköter dem själv==, så det är inte alltid värt att bygga in dem i kommunikationssystemet.

Vilket exempel ger boken på end-to-end-argumentet?::==E-post med stora bilagor==: TCP klarar inte större nätavbrott, så posttjänsten håller reda på hur långt den kommit och fortsätter över en ny TCP-förbindelse.

Vad går end-to-end-argumentet emot?::Idén att ==all kommunikation kan abstraheras bort== med tillräckligt bra middleware.

## Fördelar med klient/server

Vad är fördelen med klient/server, med bokens ord?::Ett ==direkt och relativt enkelt sätt att dela data och andra resurser==.

Hur beskriver boken klient/servers ställning?::==Historiskt viktigast, mest citerad== när distribuerade system diskuteras, och ==fortfarande mest använd==.

Hur ser rollerna ut i klient/server?::==Klientprocesser vänder sig till enskilda serverprocesser==, som kan ligga på andra datorer, för att komma åt resurserna servern sköter.

Ge tre exempel på att en server själv är klient. (3)
||
- En **webbserver** är ofta klient hos en lokal filserver som lagrar sidorna
- Webbservrar är **klienter hos DNS**
- En **söktjänst** svarar på frågor och kör samtidigt web crawlers mot andra webbservrar

Vilken samtidighetsfördel visar söktjänstexemplet?::Server- och crawleruppgifterna är ==helt oberoende== – de behöver knappt synkroniseras och kan köra samtidigt i egna trådar.

Vilka fyra placeringsstrategier ger boken? (4)
||
- **Flera servrar**
- **Caching**
- **Mobil kod**
- **Mobila agenter**

Vilka två sätt finns att använda flera servrar?::==Dela upp== objekten mellan dem, som webben gör, eller ==replikera== dem, som Sun NIS gör med lösenordsfilen.

**Cache**;;Ett lager av ==nyligen använda dataobjekt som ligger närmare klienten== än objekten själva.

Vad vinner man på en proxyserver?::Den ger en ==delad cache== och ökar tillgänglighet och prestanda genom att ==minska lasten== på nätet och webbservrarna.

Vad vinner man på mobil kod hos klienten?::==Bra svarstider==, eftersom man slipper nätets fördröjning och varierande bandbredd.

Vilken transparens ger RPC och RMI?::Minst ==åtkomst- och lokaliseringstransparens== – man anropar som om operationen låg lokalt.

Vad är klient/servers svaghet?::Den ==skalar dåligt== – en tjänst på en enda adress kan inte växa förbi värddatorns kapacitet och bandbredden i dess nätanslutning.

## Mobila agenter

**Mobil agent**;;Ett ==körande program, både kod och data==, som reser från dator till dator, utför en uppgift ==för någons räkning== och till slut kommer tillbaka med resultatet.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-10T06:40:42.598Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:42.598Z-->

Vad gör en mobil agent på varje plats den besöker?::==Många anrop mot lokala resurser==, till exempel läser enskilda databasposter.

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-09-10T06:40:22.463Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:22.463Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer

Varför är en mobil agent ett hot mot värden?::Värden måste ==bestämma vilka lokala resurser agenten får använda==, och det avgörs av vem agenten agerar för.

Vad måste följa med en mobil agents kod och data?::==Identiteten hos den agenten agerar för==, och den måste följa med på ett säkert sätt.

Hur är en mobil agent själv utsatt?::Den kan ==misslyckas med sin uppgift om den nekas åtkomst== till information den behöver.

Varför tvivlar boken på nyttan med mobila agenter?::Samma uppgifter går att lösa med vanliga fjärranrop – ==web crawlers fungerar bra== så – så användbarheten kan vara begränsad.
<!--SR:!fsrs,2026-09-10T06:40:03.527Z,0,0.212,6.4133,1,1,0,0,2026-09-10T06:39:03.527Z-->

Vad skiljer mobil kod från en mobil agent?::Mobil kod ==laddas ned och körs hos mottagaren==, som en applet. En mobil agent ==bär med sig sin data och flyttar sig vidare==.
