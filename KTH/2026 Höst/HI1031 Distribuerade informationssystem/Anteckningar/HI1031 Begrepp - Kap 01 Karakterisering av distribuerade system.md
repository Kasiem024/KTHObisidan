---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

Vad är ett distribuerat system?::Delar på olika datorer i ett nät som samordnar sig ==bara genom att skicka meddelanden==.
<!--SR:!fsrs,2026-10-04T10:16:36.484Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:16:36.484Z-->

Vilka tre saker följer av att datorerna bara pratar via nätet? (3)
||
- **Samtidighet** – allt händer parallellt, utan turordning
- **Ingen gemensam klocka** – datorerna kan inte enas om exakt tid
- **Fel drabbar en del i taget** – resten fortsätter utan att veta om det
<!--SR:!fsrs,2026-10-05T02:36:23.398Z,1,0.72194057,8.91930389,2,5,1,0,2026-10-04T02:36:23.398Z-->

## Exempel på distribuerade system

Ge exempel på distribuerade system. (3)
||
- **Internet** och webben
- **Ett intranät** i en organisation
- **Mobila och trådlösa** system
<!--SR:!fsrs,2026-10-06T02:11:08.572Z,2,1.11985405,9.93342166,2,15,3,0,2026-10-04T02:11:08.572Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-10-10T16:18:36.735Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:18:36.735Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som el eller vatten== i stället för att äga den.
<!--SR:!fsrs,2026-10-12T12:06:06.270Z,14,13.87001142,8.56466845,2,5,0,0,2026-09-28T12:06:06.270Z!fsrs,2026-10-31T20:47:44.240Z,30,39.7586713,6.0091915,2,4,0,0,2026-10-01T20:47:44.240Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser kan man dela?::==Fysiska enheter== – t.ex. skrivare, diskar, processorer, skärmar och lagring.
<!--SR:!fsrs,2026-10-04T02:39:41.101Z,0,0.66916692,8.93300853,3,4,1,0,2026-10-04T02:29:41.101Z-->

Vilka mjukvaruresurser kan man dela?::==Data och tjänster== – t.ex. filer, databaser, webbsidor, e-post och sökmotorer.
<!--SR:!fsrs,2026-10-04T02:45:51.580Z,0,0.22581824,9.63451553,3,5,1,0,2026-10-04T02:35:51.580Z-->

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
<!--SR:!fsrs,2026-10-06T20:55:51.183Z,5,5.03169791,9.39452497,2,7,2,0,2026-10-01T20:55:51.183Z-->

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna är ==olika och ändå måste jobba ihop== – skillnader i nät, hårdvara, operativsystem och språk.
<!--SR:!fsrs,2026-10-31T20:59:35.231Z,30,38.75639122,6.0091915,2,4,0,0,2026-10-01T20:59:35.231Z!fsrs,2026-10-31T20:45:52.640Z,30,39.7586713,6.0091915,2,4,0,0,2026-10-01T20:45:52.640Z-->

Hur kan internet koppla ihop många olika sorters nät?::Varje dator kör ==internetprotokollet== ovanpå sitt eget nät, så programmen märker inte skillnaden.
<!--SR:!fsrs,2026-10-05T02:13:43.485Z,1,0.92174436,9.95025465,2,16,4,0,2026-10-04T02:13:43.485Z-->

## Öppenhet

Vad krävs för att ett system ska vara öppet?::Att de ==viktiga gränssnitten publiceras== så andra kan bygga vidare.
<!--SR:!fsrs,2026-10-15T20:50:52.840Z,14,13.58785025,9.33722942,2,7,0,0,2026-10-01T20:50:52.840Z-->

## Säkerhet

Vilka två säkerhetsutmaningar är ännu inte lösta? (2)
||
- **Överbelastningsattacker** – möts mest genom att straffa den skyldige efteråt, vilket inte är en riktig lösning
- **Säkerhet för mobil kod** – man vet inte vad ett nedladdat program gör
<!--SR:!fsrs,2026-10-05T20:40:01.373Z,3,2.81282746,9.59062726,2,9,1,0,2026-10-02T20:40:01.373Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==fortsätter fungera bra när antalet resurser och användare ökar mycket==.
<!--SR:!fsrs,2026-10-17T11:59:10.065Z,19,18.93235594,7.85571375,2,5,0,0,2026-09-28T11:59:10.065Z!fsrs,2026-10-10T10:10:21.998Z,12,11.80830979,9.02387245,2,6,0,0,2026-09-28T10:10:21.998Z-->

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Hårdvaran för *n* användare ska vara ==högst O(n)== – klarar en filserver 20 användare ska två klara 40.
<!--SR:!fsrs,2026-10-10T16:20:33.398Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:20:33.398Z-->

Hur får man ett system att skala i praktiken?::Man ==lägger till fler servrar och kopior== och cachar det som efterfrågas ofta, så lasten sprids.
<!--SR:!fsrs,2026-10-06T02:10:31.735Z,2,1.9320787,9.41426219,2,7,1,0,2026-10-04T02:10:31.735Z-->

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-10-09T17:26:45.417Z,11,11.30601712,9.02387245,2,6,0,0,2026-09-28T17:26:45.417Z-->

## Samtidighet

Varför är samtidighet en utmaning?::Flera klienter kan nå samma resurs samtidigt, så deras operationer kan ==krocka och ge fel resultat==.
<!--SR:!fsrs,2026-10-04T02:52:46.475Z,0,0.22581824,9.63451553,3,5,1,0,2026-10-04T02:42:46.475Z-->

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-10-06T20:43:08.882Z,4,3.90329534,9.46642836,2,9,1,0,2026-10-02T20:43:08.882Z!fsrs,2026-10-27T12:08:30.021Z,29,29.29428851,4.01060897,2,3,0,0,2026-09-28T12:08:30.021Z-->

## Tjänstekvalitet

Vad menas med utmaningen tjänstekvalitet (QoS)?::Att tjänsten ska ==hålla det den lovar== – till exempel att en video kommer fram i tid, inte bara att den funkar alls.
<!--SR:!fsrs,2026-10-11T02:15:14.691Z,7,6.76476998,7.86010817,2,4,0,0,2026-10-04T02:15:14.691Z-->

## Arvet från HTML

Vilket arv från HTML måste man tänka på?::HTML har ==fasta taggar gjorda för att visas för människor==, inte för program att läsa.
<!--SR:!fsrs,2026-10-07T02:29:57.851Z,3,2.61451761,9.9180055,2,13,1,0,2026-10-04T02:29:57.851Z-->

## Arvet från HTTP

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-10-05T11:57:01.945Z,7,7.19976434,9.4719613,2,7,0,0,2026-09-28T11:57:01.945Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-10-21T22:20:45.379Z,18,17.97134043,9.01831425,2,7,0,0,2026-10-03T22:20:45.379Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressen är bara ==32 bitar== och tar slut. Att byta till 128 bitar tvingar fram ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-10-06T02:36:38.330Z,2,2.2042744,9.7522175,2,10,1,0,2026-10-04T02:36:38.330Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-10-12T11:50:34.770Z,14,14.49190058,8.54346755,2,6,0,0,2026-09-28T11:50:34.770Z-->

Vad är RFC och vad är dess roll?::Internets ==fritt tillgängliga== protokolldokument – vem som helst kan bygga efter dem.
<!--SR:!fsrs,2026-10-11T01:51:56.277Z,7,6.76476998,7.86010817,2,4,0,0,2026-10-04T01:51:56.277Z-->

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-10-17T11:56:49.281Z,19,18.50758643,6.79215857,2,4,0,0,2026-09-28T11:56:49.281Z-->
