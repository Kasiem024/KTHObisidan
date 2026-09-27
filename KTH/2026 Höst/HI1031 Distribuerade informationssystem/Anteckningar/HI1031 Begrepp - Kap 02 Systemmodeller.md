---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 2, avgränsade till tentafrågorna om arkitektur: trelagersarkitektur, MVC, middleware, fördelarna med klient/server och mobila agenter."
---
# HI1031 Begrepp - Kap 02 Systemmodeller

## Trelagersarkitektur

Vad betyder det att en arkitektur är trelagers?::Att varje logisk del ligger på ==sin egen server== (en till en mellan logik och maskin).
<!--SR:!fsrs,2026-09-15T15:37:01.440Z,1,0.26052705,8.39265542,2,3,0,0,2026-09-14T15:37:01.440Z-->

Vilka tre skikt har en trelagersarkitektur? (3)
||
- **Klienten** – visar gränssnittet
- **Applikationsservern** – kör logiken
- **Databasservern** – lagrar datan
<!--SR:!fsrs,2026-09-21T16:19:49.541Z,0,0.15703249,9.91521101,3,6,1,0,2026-09-21T16:09:49.541Z-->

## MVC-arkitektur

*MVC beskrivs inte i kursboken — korten nedan bygger på allmän kännedom om mönstret.*

**Model** (i MVC);;Datan, reglerna för den och systemets tillstånd. Den vet ==inget om gränssnittet==.
<!--SR:!fsrs,2026-09-23T16:06:47.999Z,2,1.50518987,8.91819814,2,4,0,0,2026-09-21T16:06:47.999Z!2000-01-01,1,250-->

**View** (i MVC);;Delen som ==läser ur modellen och visar den== för användaren.

**Controller** (i MVC);;Delen som tar emot användarens inmatning och ==översätter den till operationer på modellen==.
<!--SR:!fsrs,2026-09-24T16:02:24.170Z,3,2.330136,8.37949113,2,4,0,0,2026-09-21T16:02:24.170Z!2000-01-01,1,250-->

Hur går flödet i MVC?::Användaren gör något i vyn, ==controllern tolkar det och uppdaterar modellen==, sedan ritas vyn om.

## Middleware

**Middleware**;;Ett lager av mjukvara vars syfte är att ==dölja heterogenitet och ge programmeraren en bekväm programmeringsmodell==.
<!--SR:!fsrs,2026-09-15T15:31:13.981Z,1,0.26052705,8.39265542,2,3,0,0,2026-09-14T15:31:13.981Z!2000-01-01,1,250-->

Vad är middleware rent konkret?::==Processer eller objekt på flera datorer== som pratar med varandra för att sköta kommunikation och resursdelning.

Vilka fyra lager har boken, nedifrån och upp? (4)
||
- **Hårdvara**
- **Operativsystem**
- **Middleware**
- **Tillämpningar och tjänster**

## Fördelar med klient/server

Vad är fördelen med en klient/server-lösning?::Ett ==enkelt och direkt sätt att dela på data och resurser==.

Hur ser rollerna ut i klient/server?::==Klienter ber servrar== om de resurser som servern håller i, ofta på en annan dator.

## Mobila agenter

**Mobil agent**;;Ett program som ==flyttar sig mellan datorer med sin kod och data==, gör en uppgift åt någon och kommer tillbaka med svaret.
<!--SR:!2000-01-01,1,250!fsrs,2026-09-24T16:01:37.202Z,3,2.330136,8.37949113,2,4,0,0,2026-09-21T16:01:37.202Z-->

Vad är vinsten med en mobil agent?::==Fjärranrop byts mot lokala anrop==, vilket ger lägre kommunikationskostnad och kortare tid.
<!--SR:!fsrs,2026-09-15T15:32:22.788Z,1,0.11248012,9.44205284,2,4,0,0,2026-09-14T15:32:22.788Z-->

Ge bokens två användningsexempel för mobila agenter. (2)
||
- **Installera och underhålla mjukvara** på datorerna i en organisation
- **Jämföra priser** hos flera leverantörer genom att besöka varje plats och köra databasoperationer

Varför är en mobil agent en säkerhetsrisk för datorn den besöker?::Datorn måste ==bestämma vilka resurser agenten får använda==, beroende på vem den jobbar åt.
