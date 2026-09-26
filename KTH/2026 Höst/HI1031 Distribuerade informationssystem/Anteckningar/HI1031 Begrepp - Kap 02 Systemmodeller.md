---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
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
<!--SR:!fsrs,2026-09-15T15:37:01.440Z,1,0.26052705,8.39265542,2,3,0,0,2026-09-14T15:37:01.440Z-->

Vilka är de tre skikten? (3)
||
- **Skikt 1** – klientens vy och kontroller
- **Skikt 2** – en applikationsserver med applikationslogiken
- **Skikt 3** – en databasserver med ett relationsgränssnitt
<!--SR:!fsrs,2026-09-21T16:19:49.541Z,0,0.15703249,9.91521101,3,6,1,0,2026-09-21T16:09:49.541Z-->

Vilken är den största vinsten med treskikt?::Applikationslogiken ligger ==samlad på ett ställe==, så mjukvaran blir lättare att underhålla.

Vad kostar treskikt jämfört med tvåskikt? (2)
||
- **Drift** – tre servrar att sköta i stället för två
- **Prestanda** – mer nättrafik och högre fördröjning per operation

Varför kan skikt 1 göras enkelt?::Det är ==bara ett användargränssnitt==, utan applikationslogik, vilket ger inbyggt stöd för tunna klienter.

Vad är fördelen med tvåskikt?::==Låg fördröjning== – ett enda meddelandeutbyte räcker för en operation.

Vad är nackdelen med tvåskikt?::Applikationslogiken ==delas över en processgräns==, vilket begränsar vilka delar som kan anropas direkt från vilka andra.

Vad menas med n-skiktsarkitektur?::Tillämpningen delas i ==n logiska delar, var och en på en egen server==.

Vad skiljer skiktning från flerskikt? (2)
||
- **Skiktning** – *vertikal* uppdelning i abstraktionslager, där varje lager bara använder lagret under
- **Flerskikt** – fördelar *ett* lagers funktion över lämpliga servrar

## MVC-arkitektur

Vad måste du säga om källan när du svarar på MVC-frågan?::Att ==MVC inte finns i boken== – svaret bygger på allmän kunskap om mönstret.
<!--SR:!fsrs,2026-10-21T16:08:23.214Z,30,34.00489997,3.58131923,2,3,0,0,2026-09-21T16:08:23.214Z-->

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-09-23T16:06:47.999Z,2,1.50518987,8.91819814,2,4,0,0,2026-09-21T16:06:47.999Z!2000-01-01,1,250-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-09-24T16:02:24.170Z,3,2.330136,8.37949113,2,4,0,0,2026-09-21T16:02:24.170Z!2000-01-01,1,250-->

Hur går flödet i MVC?::Användaren agerar i vyn → ==controllern tolkar== → modellen uppdateras → modellen säger till → vyn ritas om.

Vad vinner man på MVC:s uppdelning? (2)
||
- **Flera vyer** kan visa samma modell
- **Modellen kan testas** utan något gränssnitt alls
<!--SR:!fsrs,2026-09-15T10:48:28.763Z,0,0.03141681,9.85140709,1,4,0,0,2026-09-15T10:47:28.763Z-->

Vad skiljer MVC från trelager? (egen slutsats)::MVC delar upp ==kod efter roll inne i en tillämpning==; trelager fördelar ==funktion över olika servrar==.
<!--SR:!fsrs,2026-09-21T16:30:30.457Z,0,0.04970229,9.85140709,1,4,0,0,2026-09-21T16:29:30.457Z-->

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-09-15T15:31:13.981Z,1,0.26052705,8.39265542,2,3,0,0,2026-09-14T15:31:13.981Z!2000-01-01,1,250-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att åstadkomma kommunikation och resursdelning.

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**

**Plattform** (i bokens lagermodell);;De ==lägsta lagren: hårdvara plus operativsystem==.

Vad höjer middleware nivån på? (5)
||
- **Fjärranrop**
- **Gruppkommunikation** mellan processer
- **Händelsenotifieringar**
- **Uppdelning, placering och replikering** av delade dataobjekt
- **Multimediadata i realtid**

Vad är syftet med middleware, i två ord?::==Interoperabilitet och portabilitet== – att olika system funkar ihop och att kod går att flytta.

Vilka sex kategorier av middleware räknar boken upp?::==Distribuerade objekt, distribuerade komponenter, publish-subscribe, meddelandeköer, webbtjänster och peer-to-peer.==
<!--SR:!fsrs,2026-09-14T15:36:42.735Z,0,0.12575017,8.80630447,1,2,0,0,2026-09-14T15:35:42.735Z-->

Vad säger end-to-end-argumentet?::Vissa saker blir pålitliga ==bara om tillämpningen i ändpunkterna sköter dem själv==, så det är inte alltid värt att bygga in dem i kommunikationssystemet.

Vilket exempel ger boken på end-to-end-argumentet?::==E-post med stora bilagor==: TCP klarar inte större nätavbrott, så posttjänsten håller reda på hur långt den kommit och fortsätter över en ny TCP-förbindelse.

## Fördelar med klient/server

Vad är fördelen med klient/server, med bokens ord?::Ett ==direkt och relativt enkelt sätt att dela data och andra resurser==.

Hur ser rollerna ut i klient/server?::==Klientprocesser vänder sig till enskilda serverprocesser==, som kan ligga på andra datorer, för att komma åt resurserna servern sköter.

Ge tre exempel på att en server själv är klient. (3)
||
- En **webbserver** är ofta klient hos en lokal filserver som lagrar sidorna
- Webbservrar är **klienter hos DNS**
- En **söktjänst** svarar på frågor och kör samtidigt web crawlers mot andra webbservrar

Vilka fyra placeringsstrategier ger boken? (4)
||
- **Flera servrar**
- **Caching**
- **Mobil kod**
- **Mobila agenter**

Vad vinner man på mobil kod hos klienten?::==Bra svarstider==, eftersom man slipper nätets fördröjning och varierande bandbredd.

Vilken transparens ger RPC och RMI?::Minst ==åtkomst- och lokaliseringstransparens== – man anropar som om operationen låg lokalt.

Vad är klient/servers svaghet?::Den ==skalar dåligt== – en tjänst på en enda adress kan inte växa förbi värddatorns kapacitet och bandbredden i dess nätanslutning.

## Mobila agenter

**Mobil agent**;;Ett ==körande program, både kod och data==, som reser från dator till dator, utför en uppgift ==för någons räkning== och till slut kommer tillbaka med resultatet.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-24T16:01:37.202Z,3,2.330136,8.37949113,2,4,0,0,2026-09-21T16:01:37.202Z-->

Vad gör en mobil agent på varje plats den besöker?::==Många anrop mot lokala resurser==, till exempel läser enskilda databasposter.

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-09-15T15:32:22.788Z,1,0.11248012,9.44205284,2,4,0,0,2026-09-14T15:32:22.788Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer

Varför är en mobil agent ett hot mot värden?::Värden måste ==bestämma vilka lokala resurser agenten får använda==, och det avgörs av vem agenten agerar för.

Hur är en mobil agent själv utsatt?::Den kan ==misslyckas med sin uppgift om den nekas åtkomst== till information den behöver.

Varför tvivlar boken på nyttan med mobila agenter?::Samma uppgifter går att lösa med vanliga fjärranrop – ==web crawlers fungerar bra== så – så användbarheten kan vara begränsad.
<!--SR:!fsrs,2026-09-15T15:34:11.376Z,1,0.11248012,9.44205284,2,4,0,0,2026-09-14T15:34:11.376Z-->

Vad skiljer mobil kod från en mobil agent?::Mobil kod ==laddas ned och körs hos mottagaren==, som en applet. En mobil agent ==bär med sig sin data och flyttar sig vidare==.
