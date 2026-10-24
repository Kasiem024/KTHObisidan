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
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

Vad är ett distribuerat system?::Delar på olika datorer i ett nät som samordnar sig ==bara genom att skicka meddelanden==.
<!--SR:!fsrs,2026-11-06T15:34:15.185Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:34:15.185Z-->

Vilka tre saker följer av att datorerna bara pratar via nätet? (3)
||
- **Samtidighet** – allt händer parallellt, utan turordning
- **Ingen gemensam klocka** – datorerna kan inte enas om exakt tid
- **Fel drabbar en del i taget** – resten fortsätter utan att veta om det
<!--SR:!fsrs,2026-10-28T08:19:19.653Z,10,10.37992727,9.23067658,2,9,1,0,2026-10-18T08:19:19.653Z-->

## Exempel på distribuerade system

Ge exempel på distribuerade system. (3)
||
- **Internet** och webben
- **Ett intranät** i en organisation
- **Mobila och trådlösa** system
<!--SR:!fsrs,2026-11-03T14:23:37.742Z,13,13.25662737,9.79469083,2,19,3,0,2026-10-21T14:23:37.742Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-11-09T18:49:59.864Z,30,33.5747802,8.0568255,2,5,0,0,2026-10-10T18:49:59.864Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som el eller vatten== i stället för att äga den.
<!--SR:!fsrs,2026-11-03T15:46:38.718Z,21,21.33478233,9.0323884,2,6,0,0,2026-10-13T15:46:38.718Z!fsrs,2026-10-31T20:47:44.240Z,30,39.7586713,6.0091915,2,4,0,0,2026-10-01T20:47:44.240Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser kan man dela?::==Fysiska enheter== – t.ex. skrivare, diskar, processorer, skärmar och lagring.
<!--SR:!fsrs,2026-11-01T14:17:01.479Z,11,11.23527876,9.42085122,2,10,1,0,2026-10-21T14:17:01.479Z-->

Vilka mjukvaruresurser kan man dela?::==Data och tjänster== – t.ex. filer, databaser, webbsidor, e-post och sökmotorer.
<!--SR:!fsrs,2026-10-30T08:15:14.033Z,8,7.51778839,9.81518485,2,14,2,0,2026-10-22T08:15:14.033Z-->

## De åtta utmaningarna

Vilka åtta utmaningar räknar boken upp? (8)
||
- **Heterogenitet**
- **Öppenhet**
- **Säkerhet**
- **Skalbarhet**
- **Felhantering**
- **Samtidighet**
- **Transparens**
- **Tjänstekvalitet**
<!--SR:!fsrs,2026-10-24T22:41:29.848Z,10,9.62820579,9.70859408,2,9,2,0,2026-10-14T22:41:29.848Z-->

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna är ==olika och ändå måste jobba ihop== – skillnader i nät, hårdvara, operativsystem och språk.
<!--SR:!fsrs,2026-10-31T20:59:35.231Z,30,38.75639122,6.0091915,2,4,0,0,2026-10-01T20:59:35.231Z!fsrs,2026-10-31T20:45:52.640Z,30,39.7586713,6.0091915,2,4,0,0,2026-10-01T20:45:52.640Z-->

## Öppenhet

Vad krävs för att ett system ska vara öppet?::Att de ==viktiga gränssnitten publiceras== så andra kan bygga vidare.
<!--SR:!fsrs,2026-11-04T13:04:55.901Z,19,18.6706087,9.54525038,2,8,0,0,2026-10-16T13:04:55.901Z-->

## Säkerhet

Vilka två säkerhetsutmaningar är ännu inte lösta? (2)
||
- **Överbelastningsattacker** – möts mest genom att straffa den skyldige efteråt, vilket inte är en riktig lösning
- **Säkerhet för mobil kod** – man vet inte vad ett nedladdat program gör
<!--SR:!fsrs,2026-10-22T15:47:31.910Z,9,8.80919111,9.5619171,2,11,1,0,2026-10-13T15:47:31.910Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==fortsätter fungera bra när antalet resurser och användare ökar mycket==.
<!--SR:!fsrs,2026-11-17T08:21:26.164Z,30,31.2188104,8.56175123,2,6,0,0,2026-10-18T08:21:26.164Z!fsrs,2026-10-27T18:52:23.654Z,17,16.87737052,9.33722942,2,7,0,0,2026-10-10T18:52:23.654Z-->

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Hårdvaran för *n* användare ska vara ==högst O(n)== – klarar en filserver 20 användare ska två klara 40.
<!--SR:!fsrs,2026-11-09T18:35:23.266Z,30,33.5747802,8.0568255,2,5,0,0,2026-10-10T18:35:23.266Z-->

Hur får man ett system att skala i praktiken?::Man ==lägger till fler servrar och kopior== och cachar det som efterfrågas ofta, så lasten sprids.
<!--SR:!fsrs,2026-10-27T10:04:00.220Z,10,10.45903885,9.37174705,2,10,1,0,2026-10-17T10:04:00.220Z-->

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-10-25T22:11:33.693Z,16,16.04473826,9.33722942,2,7,0,0,2026-10-09T22:11:33.693Z-->

## Samtidighet

Varför är samtidighet en utmaning?::Flera klienter kan nå samma resurs samtidigt, så deras operationer kan ==krocka och ge fel resultat==.
<!--SR:!fsrs,2026-11-03T16:46:19.816Z,13,12.92818069,9.42085122,2,10,1,0,2026-10-21T16:46:19.816Z-->

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-10-23T12:09:01.936Z,9,9.49221474,9.62156676,2,11,1,0,2026-10-14T12:09:01.936Z!fsrs,2026-10-27T12:08:30.021Z,29,29.29428851,4.01060897,2,3,0,0,2026-09-28T12:08:30.021Z-->

## Tjänstekvalitet

Vad menas med utmaningen tjänstekvalitet (QoS)?::Att tjänsten ska ==hålla det den lovar== – till exempel att en video kommer fram i tid, inte bara att den funkar alls.
<!--SR:!fsrs,2026-10-23T11:19:38.705Z,12,11.89312086,8.56466845,2,5,0,0,2026-10-11T11:19:38.705Z-->

## Arvet från HTML

Vilket arv från HTML måste man tänka på?::HTML har ==fasta taggar gjorda för att visas för människor==, inte för program att läsa.
<!--SR:!fsrs,2026-11-07T10:51:24.088Z,16,15.85644953,9.79342634,2,16,1,0,2026-10-22T10:51:24.088Z-->

## Arvet från HTTP

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-10-28T16:05:36.803Z,13,12.71787569,9.74271968,2,9,0,0,2026-10-15T16:05:36.803Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-11-22T08:15:04.713Z,31,41.07500249,8.67550899,2,8,0,0,2026-10-22T08:15:04.713Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressen är bara ==32 bitar== och tar slut. Att byta till 128 bitar tvingar fram ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-10-26T10:17:41.308Z,9,8.90012569,9.70868951,2,13,1,0,2026-10-17T10:17:41.308Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-11-04T09:58:43.281Z,22,22.06406843,9.01831425,2,7,0,0,2026-10-13T09:58:43.281Z-->

Vad är RFC och vad är dess roll?::Internets ==fritt tillgängliga== protokolldokument – vem som helst kan bygga efter dem.
<!--SR:!fsrs,2026-10-23T11:44:55.128Z,12,11.89312086,8.56466845,2,5,0,0,2026-10-11T11:44:55.128Z-->

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-11-17T08:26:08.969Z,30,34.9016157,7.85571375,2,5,0,0,2026-10-18T08:26:08.969Z-->
