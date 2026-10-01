---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vad betyder det att en arkitektur är trelagers?::Att varje logisk del ligger på ==sin egen server== (en till en mellan logik och maskin).
<!--SR:!fsrs,2026-10-03T13:56:00.471Z,3,2.90506292,9.26707788,2,5,0,0,2026-09-30T13:56:00.471Z-->

Vilka tre skikt har en trelagersarkitektur? (3)
||
- **Klienten** – visar gränssnittet
- **Applikationsservern** – kör logiken
- **Databasservern** – lagrar datan
<!--SR:!fsrs,2026-10-02T21:01:38.599Z,1,0.86584905,9.93737536,2,10,1,0,2026-10-01T21:01:38.599Z-->

Vad kostar tre lager jämfört med två? (2)
||
- **Mer att sköta** – tre servrar i stället för två
- **Långsammare** – varje anrop går ett steg längre
<!--SR:!fsrs,2026-10-02T21:02:36.527Z,1,0.1266823,9.443226,2,6,2,0,2026-10-01T21:02:36.527Z-->

## MVC-arkitektur

*MVC beskrivs inte i kursboken — korten nedan bygger på allmän kännedom om mönstret.*

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-10-02T11:53:36.826Z,4,3.83161071,9.26707788,2,5,0,0,2026-09-28T11:53:36.826Z!fsrs,2026-10-04T10:16:06.847Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:16:06.847Z-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.
<!--SR:!fsrs,2026-10-03T10:18:42.719Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:18:42.719Z!fsrs,2026-10-03T10:13:33.837Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:13:33.837Z-->

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-10-04T11:51:45.130Z,6,5.73070012,8.90945907,2,5,0,0,2026-09-28T11:51:45.130Z!fsrs,2026-10-04T10:14:18.747Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:14:18.747Z-->

Hur går flödet i MVC?::Användaren gör något i vyn, ==controllern tolkar det och uppdaterar modellen==, sedan ritas vyn om.
<!--SR:!fsrs,2026-10-03T10:18:34.846Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:18:34.846Z-->

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-10-04T20:51:45.080Z,3,3.26379175,9.26707788,2,5,0,0,2026-10-01T20:51:45.080Z!fsrs,2026-10-04T10:10:04.537Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:10:04.537Z-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att sköta kommunikation och resursdelning.
<!--SR:!fsrs,2026-10-03T09:52:38.740Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T09:52:38.740Z-->

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**
<!--SR:!fsrs,2026-10-03T20:57:15.543Z,2,1.19769966,8.38116261,2,5,1,0,2026-10-01T20:57:15.543Z-->

Ge exempel på middleware.::==CORBA, Java RMI och Sun RPC== – lager som låter program på olika datorer anropa varandra.
<!--SR:!fsrs,2026-10-03T10:11:35.363Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:11:35.363Z-->

## Fördelar med klient/server

Vad är fördelen med en klient/server-lösning?::Ett ==enkelt och direkt sätt att dela på data och resurser==.
<!--SR:!fsrs,2026-10-03T20:49:02.848Z,2,0.56381019,9.42846228,2,6,1,0,2026-10-01T20:49:02.848Z-->

Hur ser rollerna ut i klient/server?::==Klienter ber servrar== om de resurser som servern håller i, ofta på en annan dator.
<!--SR:!fsrs,2026-10-04T10:17:53.273Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:17:53.273Z-->

Vad är nackdelen med klient/server?::Den ==skalar dåligt== – all last hamnar på en server som blir flaskhals när användarna blir många.
<!--SR:!fsrs,2026-10-03T10:18:53.454Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:18:53.454Z-->

## Mobila agenter

**Mobil agent**;;Ett program som ==flyttar sig mellan datorer med sin kod och data==, gör en uppgift åt någon och kommer tillbaka med svaret.
<!--SR:!fsrs,2026-10-04T10:09:38.337Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:09:38.337Z!fsrs,2026-10-04T11:57:14.153Z,6,5.73070012,8.90945907,2,5,0,0,2026-09-28T11:57:14.153Z-->

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-10-03T21:01:14.111Z,2,1.2482807,9.75815825,2,8,1,0,2026-10-01T21:01:14.111Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer
<!--SR:!fsrs,2026-10-03T20:52:02.024Z,2,0.56381019,9.42846228,2,6,1,0,2026-10-01T20:52:02.024Z-->

Varför är en mobil agent en säkerhetsrisk för datorn den besöker?::Datorn måste ==bestämma vilka resurser agenten får använda==, beroende på vem den jobbar åt.
<!--SR:!fsrs,2026-10-03T09:58:26.741Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T09:58:26.741Z-->

Vilken begränsning har en mobil agent?::Den ==får sällan komma åt det den behöver== – värden misstror kod utifrån och stänger av det mesta.
<!--SR:!fsrs,2026-10-04T09:51:44.621Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T09:51:44.621Z-->
