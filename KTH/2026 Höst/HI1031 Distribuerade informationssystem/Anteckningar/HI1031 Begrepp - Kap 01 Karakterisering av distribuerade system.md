---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

Vad är ett distribuerat system?::Delar på olika datorer i ett nät som samordnar sig ==bara genom att skicka meddelanden==.

Vilka tre saker följer av att datorerna bara pratar via nätet? (3)
||
- **Samtidighet** – allt händer parallellt, utan turordning
- **Ingen gemensam klocka** – datorerna kan inte enas om exakt tid
- **Fel drabbar en del i taget** – resten fortsätter utan att veta om det

## Exempel på distribuerade system

Ge exempel på distribuerade system. (3)
||
- **Internet** och webben
- **Ett intranät** i en organisation
- **Mobila och trådlösa** system
<!--SR:!fsrs,2026-09-15T15:36:15.621Z,1,0.29100666,9.84400262,2,7,1,0,2026-09-14T15:36:15.621Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-10-10T16:18:36.735Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:18:36.735Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som el eller vatten== i stället för att äga den.
<!--SR:!fsrs,2026-09-20T15:13:08.783Z,6,6.04908239,7.86010817,2,4,0,0,2026-09-14T15:13:08.783Z!fsrs,2026-09-30T15:29:20.553Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:29:20.553Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser kan man dela?::==Fysiska enheter== – t.ex. skrivare, diskar, processorer, skärmar och lagring.

Vilka mjukvaruresurser kan man dela?::==Data och tjänster== – t.ex. filer, databaser, webbsidor, e-post och sökmotorer.

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
<!--SR:!fsrs,2026-09-21T16:45:51.845Z,0,0.80203099,9.12407659,3,5,2,0,2026-09-21T16:35:51.845Z-->

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna är ==olika och ändå måste jobba ihop== – skillnader i nät, hårdvara, operativsystem och språk.
<!--SR:!fsrs,2026-10-01T10:15:27.612Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-15T10:15:27.612Z!fsrs,2026-09-30T15:28:49.120Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:28:49.120Z-->

Hur kan internet koppla ihop många olika sorters nät?::Varje dator kör ==internetprotokollet== ovanpå sitt eget nät, så programmen märker inte skillnaden.
<!--SR:!fsrs,2026-09-15T15:21:31.515Z,1,0.30694292,9.80445623,2,8,2,0,2026-09-14T15:21:31.515Z-->

## Öppenhet

Vad krävs för att ett system ska vara öppet?::Att de ==viktiga gränssnitten publiceras== så andra kan bygga vidare.
<!--SR:!fsrs,2026-09-30T16:06:59.487Z,9,9.2662958,9.02387245,2,6,0,0,2026-09-21T16:06:59.487Z-->

## Säkerhet

Vilka två säkerhetsutmaningar är ännu inte lösta? (2)
||
- **Överbelastningsattacker** – möts mest genom att straffa den skyldige efteråt, vilket inte är en riktig lösning
- **Säkerhet för mobil kod** – man vet inte vad ett nedladdat program gör
<!--SR:!fsrs,2026-09-25T10:49:59.111Z,10,10.20986938,6.79215857,2,4,0,0,2026-09-15T10:49:59.111Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==fortsätter fungera bra när antalet resurser och användare ökar mycket==.
<!--SR:!fsrs,2026-09-22T15:24:18.944Z,8,7.79156209,6.79215857,2,4,0,0,2026-09-14T15:24:18.944Z!fsrs,2026-09-20T15:05:46.207Z,6,5.78310352,8.55184025,2,5,0,0,2026-09-14T15:05:46.207Z-->

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Hårdvaran för *n* användare ska vara ==högst O(n)== – klarar en filserver 20 användare ska två klara 40.
<!--SR:!fsrs,2026-10-10T16:20:33.398Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:20:33.398Z-->

Hur får man ett system att skala i praktiken?::Man ==lägger till fler servrar och kopior== och cachar det som efterfrågas ofta, så lasten sprids.

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-09-19T15:20:20.886Z,5,5.39537051,8.55184025,2,5,0,0,2026-09-14T15:20:20.886Z-->

## Samtidighet

Varför är samtidighet en utmaning?::Flera klienter kan nå samma resurs samtidigt, så deras operationer kan ==krocka och ge fel resultat==.

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-09-21T10:47:38.607Z,6,5.74357914,8.55184025,2,5,0,0,2026-09-15T10:47:38.607Z!fsrs,2026-09-13T14:59:41.990Z,4,3.94605407,1,2,2,0,0,2026-09-09T14:59:41.990Z-->

## Tjänstekvalitet

Vad menas med utmaningen tjänstekvalitet (QoS)?::Att tjänsten ska ==hålla det den lovar== – till exempel att en video kommer fram i tid, inte bara att den funkar alls.

## Arvet från HTML

Vilket arv från HTML måste man tänka på?::HTML har ==fasta taggar gjorda för att visas för människor==, inte för program att läsa.
<!--SR:!fsrs,2026-09-16T15:11:34.914Z,2,0.72757855,9.87102941,2,8,0,0,2026-09-14T15:11:34.914Z-->

## Arvet från HTTP

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-09-18T15:12:51.033Z,4,3.47788559,9.2268288,2,6,0,0,2026-09-14T15:12:51.033Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-10-03T16:09:26.757Z,12,11.67848133,8.54346755,2,6,0,0,2026-09-21T16:09:26.757Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressen är bara ==32 bitar== och tar slut. Att byta till 128 bitar tvingar fram ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-10-02T16:06:26.407Z,11,11.24989886,9.02098861,2,7,0,0,2026-09-21T16:06:26.407Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-09-20T15:28:43.785Z,6,6.45744755,7.82817172,2,5,0,0,2026-09-14T15:28:43.785Z-->

Vad är RFC och vad är dess roll?::Internets ==fritt tillgängliga== protokolldokument – vem som helst kan bygga efter dem.

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-09-15T06:13:37.759Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-11T06:13:37.759Z-->
