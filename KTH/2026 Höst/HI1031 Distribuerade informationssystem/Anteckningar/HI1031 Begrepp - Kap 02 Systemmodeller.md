---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vad betyder det att en arkitektur är trelagers?::Att varje logisk del ligger på ==sin egen server== (en till en mellan logik och maskin).
<!--SR:!fsrs,2026-10-07T22:25:24.812Z,4,4.30232995,9.49868051,2,6,0,0,2026-10-03T22:25:24.812Z-->

Vilka tre skikt har en trelagersarkitektur? (3)
||
- **Klienten** – visar gränssnittet
- **Applikationsservern** – kör logiken
- **Databasservern** – lagrar datan
<!--SR:!fsrs,2026-10-05T01:19:14.296Z,2,1.73576847,9.92266635,2,11,1,0,2026-10-03T01:19:14.296Z-->

Vad kostar tre lager jämfört med två? (2)
||
- **Mer att sköta** – tre servrar i stället för två
- **Långsammare** – varje anrop går ett steg längre
<!--SR:!fsrs,2026-10-05T01:18:37.729Z,2,0.70956381,9.42901114,2,7,2,0,2026-10-03T01:18:37.729Z-->

## MVC-arkitektur

*MVC beskrivs inte i kursboken — korten nedan bygger på allmän kännedom om mönstret.*

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-10-05T02:27:44.107Z,1,1.45999813,9.80586095,2,8,1,0,2026-10-04T02:27:44.107Z!fsrs,2026-10-04T10:16:06.847Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:16:06.847Z-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.
<!--SR:!fsrs,2026-10-11T02:38:51.558Z,7,6.76476998,7.86010817,2,4,0,0,2026-10-04T02:38:51.558Z!fsrs,2026-10-09T22:25:10.132Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:25:10.132Z-->

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-10-04T11:51:45.130Z,6,5.73070012,8.90945907,2,5,0,0,2026-09-28T11:51:45.130Z!fsrs,2026-10-04T10:14:18.747Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:14:18.747Z-->

Hur går flödet i MVC?::Användaren gör något i vyn, ==controllern tolkar det och uppdaterar modellen==, sedan ritas vyn om.
<!--SR:!fsrs,2026-10-09T22:22:48.723Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:22:48.723Z-->

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-10-04T20:51:45.080Z,3,3.26379175,9.26707788,2,5,0,0,2026-10-01T20:51:45.080Z!fsrs,2026-10-04T10:10:04.537Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:10:04.537Z-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att sköta kommunikation och resursdelning.
<!--SR:!fsrs,2026-10-09T22:21:52.879Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:21:52.879Z-->

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**
<!--SR:!fsrs,2026-10-08T02:16:22.686Z,4,4.13856993,8.36800982,2,6,1,0,2026-10-04T02:16:22.686Z-->

Ge exempel på middleware.::==CORBA, Java RMI och Sun RPC== – lager som låter program på olika datorer anropa varandra.
<!--SR:!fsrs,2026-10-09T22:26:17.105Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:26:17.105Z-->

## Fördelar med klient/server

Vad är fördelen med en klient/server-lösning?::Ett ==enkelt och direkt sätt att dela på data och resurser==.
<!--SR:!fsrs,2026-10-05T22:20:36.971Z,2,1.6955875,9.41426219,2,7,1,0,2026-10-03T22:20:36.971Z-->

Hur ser rollerna ut i klient/server?::==Klienter ber servrar== om de resurser som servern håller i, ofta på en annan dator.
<!--SR:!fsrs,2026-10-04T10:17:53.273Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:17:53.273Z-->

Vad är nackdelen med klient/server?::Den ==skalar dåligt== – all last hamnar på en server som blir flaskhals när användarna blir många.
<!--SR:!fsrs,2026-10-11T02:43:30.452Z,7,6.76476998,7.86010817,2,4,0,0,2026-10-04T02:43:30.452Z-->

## Mobila agenter

**Mobil agent**;;Ett program som ==flyttar sig mellan datorer med sin kod och data==, gör en uppgift åt någon och kommer tillbaka med svaret.
<!--SR:!fsrs,2026-10-04T10:09:38.337Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:09:38.337Z!fsrs,2026-10-04T11:57:14.153Z,6,5.73070012,8.90945907,2,5,0,0,2026-09-28T11:57:14.153Z-->

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-10-06T22:20:08.923Z,3,2.35457675,9.74362846,2,9,1,0,2026-10-03T22:20:08.923Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer
<!--SR:!fsrs,2026-10-06T02:31:35.416Z,2,1.9320787,9.41426219,2,7,1,0,2026-10-04T02:31:35.416Z-->

Varför är en mobil agent en säkerhetsrisk för datorn den besöker?::Datorn måste ==bestämma vilka resurser agenten får använda==, beroende på vem den jobbar åt.
<!--SR:!fsrs,2026-10-05T02:37:34.894Z,1,0.72194057,8.91930389,2,5,1,0,2026-10-04T02:37:34.894Z-->

Vilken begränsning har en mobil agent?::Den ==får sällan komma åt det den behöver== – värden misstror kod utifrån och stänger av det mesta.
<!--SR:!fsrs,2026-10-04T09:51:44.621Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T09:51:44.621Z-->
