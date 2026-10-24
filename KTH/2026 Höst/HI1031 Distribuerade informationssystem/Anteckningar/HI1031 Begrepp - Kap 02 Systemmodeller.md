---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vad betyder det att en arkitektur är trelagers?::Att varje logisk del ligger på ==sin egen server== (en till en mellan logik och maskin).
<!--SR:!fsrs,2026-10-22T22:34:02.193Z,8,8.07461281,9.75449462,2,8,0,0,2026-10-14T22:34:02.193Z-->

Vilka tre skikt har en trelagersarkitektur? (3)
||
- **Klienten** – visar gränssnittet
- **Applikationsservern** – kör logiken
- **Databasservern** – lagrar datan
<!--SR:!fsrs,2026-11-03T17:00:50.450Z,13,12.64654573,9.82329887,2,15,1,0,2026-10-21T17:00:50.450Z-->

Vad kostar tre lager jämfört med två? (2)
||
- **Mer att sköta** – tre servrar i stället för två
- **Långsammare** – varje anrop går ett steg längre
<!--SR:!fsrs,2026-10-23T18:38:34.886Z,10,9.88223279,9.18556892,2,10,2,0,2026-10-13T18:38:34.886Z-->

## MVC-arkitektur

*MVC beskrivs inte i kursboken — korten nedan bygger på allmän kännedom om mönstret.*

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-11-03T17:02:57.505Z,13,12.87867104,9.66792961,2,12,1,0,2026-10-21T17:02:57.505Z!fsrs,2026-11-06T15:34:23.513Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:34:23.513Z-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.
<!--SR:!fsrs,2026-10-23T11:18:06.442Z,12,11.89312086,8.56466845,2,5,0,0,2026-10-11T11:18:06.442Z!fsrs,2026-11-19T20:07:40.811Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T20:07:40.811Z-->

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-10-27T23:49:34.797Z,13,12.5869073,9.49482927,2,7,0,0,2026-10-14T23:49:34.797Z!fsrs,2026-11-06T15:31:19.427Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:31:19.427Z-->

Hur går flödet i MVC?::Användaren gör något i vyn, ==controllern tolkar det och uppdaterar modellen==, sedan ritas vyn om.
<!--SR:!fsrs,2026-11-19T19:56:58.921Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T19:56:58.921Z-->

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-10-29T08:26:26.697Z,11,10.88333974,9.63800507,2,8,0,0,2026-10-18T08:26:26.697Z!fsrs,2026-11-20T14:44:15.206Z,31,49.73875792,5.70547582,2,5,0,0,2026-10-20T14:44:15.206Z-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att sköta kommunikation och resursdelning.
<!--SR:!fsrs,2026-10-25T11:05:22.522Z,8,7.79696256,8.99953638,2,8,1,0,2026-10-17T11:05:22.522Z-->

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**
<!--SR:!fsrs,2026-10-25T16:05:59.770Z,10,10.28962164,9.25621675,2,8,1,0,2026-10-15T16:05:59.770Z-->

Ge exempel på middleware.::==CORBA, Java RMI och Sun RPC== – lager som låter program på olika datorer anropa varandra.
<!--SR:!fsrs,2026-11-19T19:48:31.646Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T19:48:31.646Z-->

## Fördelar med klient/server

Vad är fördelen med en klient/server-lösning?::Ett ==enkelt och direkt sätt att dela på data och resurser==.
<!--SR:!fsrs,2026-10-22T22:45:05.259Z,8,7.64306442,9.56766665,2,10,1,0,2026-10-14T22:45:05.259Z-->

Hur ser rollerna ut i klient/server?::==Klienter ber servrar== om de resurser som servern håller i, ofta på en annan dator.
<!--SR:!fsrs,2026-11-10T19:45:41.912Z,20,19.96266501,8.52886277,2,8,1,0,2026-10-21T19:45:41.912Z-->

Vad är nackdelen med klient/server?::Den ==skalar dåligt== – all last hamnar på en server som blir flaskhals när användarna blir många.
<!--SR:!fsrs,2026-10-23T11:14:52.556Z,12,11.89312086,8.56466845,2,5,0,0,2026-10-11T11:14:52.556Z-->

## Mobila agenter

**Mobil agent**;;Ett program som ==flyttar sig mellan datorer med sin kod och data==, gör en uppgift åt någon och kommer tillbaka med svaret.
<!--SR:!fsrs,2026-11-06T15:32:04.067Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:32:04.067Z!fsrs,2026-10-27T22:39:51.359Z,13,12.5869073,9.49482927,2,7,0,0,2026-10-14T22:39:51.359Z-->

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-10-22T22:38:14.555Z,8,7.53489788,9.71461246,2,11,1,0,2026-10-14T22:38:14.555Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer
<!--SR:!fsrs,2026-10-27T10:05:32.387Z,10,10.45903885,9.37174705,2,10,1,0,2026-10-17T10:05:32.387Z-->

Varför är en mobil agent en säkerhetsrisk för datorn den besöker?::Datorn måste ==bestämma vilka resurser agenten får använda==, beroende på vem den jobbar åt.
<!--SR:!fsrs,2026-10-26T15:52:29.398Z,11,10.67910077,9.006153,2,8,1,0,2026-10-15T15:52:29.398Z-->

Vilken begränsning har en mobil agent?::Den ==får sällan komma åt det den behöver== – värden misstror kod utifrån och stänger av det mesta.
<!--SR:!fsrs,2026-11-06T15:31:24.963Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:31:24.963Z-->
