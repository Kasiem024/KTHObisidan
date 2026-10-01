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
<!--SR:!fsrs,2026-10-03T10:12:46.808Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:12:46.808Z-->

## Exempel på distribuerade system

Ge exempel på distribuerade system. (3)
||
- **Internet** och webben
- **Ett intranät** i en organisation
- **Mobila och trådlösa** system
<!--SR:!fsrs,2026-10-01T10:16:49.660Z,1,0.29293889,9.95122883,2,11,2,0,2026-09-30T10:16:49.660Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-10-10T16:18:36.735Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:18:36.735Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som el eller vatten== i stället för att äga den.
<!--SR:!fsrs,2026-10-12T12:06:06.270Z,14,13.87001142,8.56466845,2,5,0,0,2026-09-28T12:06:06.270Z!fsrs,2026-09-30T15:29:20.553Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:29:20.553Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser kan man dela?::==Fysiska enheter== – t.ex. skrivare, diskar, processorer, skärmar och lagring.
<!--SR:!fsrs,2026-10-03T10:13:48.373Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:13:48.373Z-->

Vilka mjukvaruresurser kan man dela?::==Data och tjänster== – t.ex. filer, databaser, webbsidor, e-post och sökmotorer.
<!--SR:!fsrs,2026-10-03T10:14:30.155Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:14:30.155Z-->

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
<!--SR:!fsrs,2026-10-01T10:11:38.917Z,3,3.47768359,9.11018088,2,6,2,0,2026-09-28T10:11:38.917Z-->

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna är ==olika och ändå måste jobba ihop== – skillnader i nät, hårdvara, operativsystem och språk.
<!--SR:!fsrs,2026-10-01T10:15:27.612Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-15T10:15:27.612Z!fsrs,2026-09-30T15:28:49.120Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:28:49.120Z-->

Hur kan internet koppla ihop många olika sorters nät?::Varje dator kör ==internetprotokollet== ovanpå sitt eget nät, så programmen märker inte skillnaden.
<!--SR:!fsrs,2026-10-01T10:08:16.671Z,1,0.30123455,9.94839535,2,12,3,0,2026-09-30T10:08:16.671Z-->

## Öppenhet

Vad krävs för att ett system ska vara öppet?::Att de ==viktiga gränssnitten publiceras== så andra kan bygga vidare.
<!--SR:!fsrs,2026-09-30T16:06:59.487Z,9,9.2662958,9.02387245,2,6,0,0,2026-09-21T16:06:59.487Z-->

## Säkerhet

Vilka två säkerhetsutmaningar är ännu inte lösta? (2)
||
- **Överbelastningsattacker** – möts mest genom att straffa den skyldige efteråt, vilket inte är en riktig lösning
- **Säkerhet för mobil kod** – man vet inte vad ett nedladdat program gör
<!--SR:!fsrs,2026-10-02T10:14:56.267Z,2,1.52412928,9.60500389,2,8,1,0,2026-09-30T10:14:56.267Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==fortsätter fungera bra när antalet resurser och användare ökar mycket==.
<!--SR:!fsrs,2026-10-17T11:59:10.065Z,19,18.93235594,7.85571375,2,5,0,0,2026-09-28T11:59:10.065Z!fsrs,2026-10-10T10:10:21.998Z,12,11.80830979,9.02387245,2,6,0,0,2026-09-28T10:10:21.998Z-->

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Hårdvaran för *n* användare ska vara ==högst O(n)== – klarar en filserver 20 användare ska två klara 40.
<!--SR:!fsrs,2026-10-10T16:20:33.398Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:20:33.398Z-->

Hur får man ett system att skala i praktiken?::Man ==lägger till fler servrar och kopior== och cachar det som efterfrågas ofta, så lasten sprids.
<!--SR:!fsrs,2026-10-01T10:10:49.982Z,1,0.11836996,9.44267659,2,5,1,0,2026-09-30T10:10:49.982Z-->

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-10-09T17:26:45.417Z,11,11.30601712,9.02387245,2,6,0,0,2026-09-28T17:26:45.417Z-->

## Samtidighet

Varför är samtidighet en utmaning?::Flera klienter kan nå samma resurs samtidigt, så deras operationer kan ==krocka och ge fel resultat==.
<!--SR:!fsrs,2026-10-03T10:12:06.659Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:12:06.659Z-->

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-10-02T15:22:11.751Z,3,1.98419122,9.48068067,2,8,1,0,2026-09-29T15:22:11.751Z!fsrs,2026-10-27T12:08:30.021Z,29,29.29428851,4.01060897,2,3,0,0,2026-09-28T12:08:30.021Z-->

## Tjänstekvalitet

Vad menas med utmaningen tjänstekvalitet (QoS)?::Att tjänsten ska ==hålla det den lovar== – till exempel att en video kommer fram i tid, inte bara att den funkar alls.
<!--SR:!fsrs,2026-10-03T10:00:46.074Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:00:46.074Z-->

## Arvet från HTML

Vilket arv från HTML måste man tänka på?::HTML har ==fasta taggar gjorda för att visas för människor==, inte för program att läsa.
<!--SR:!fsrs,2026-10-01T15:19:11.161Z,2,0.89675638,9.91342239,2,11,1,0,2026-09-29T15:19:11.161Z-->

## Arvet från HTTP

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-10-05T11:57:01.945Z,7,7.19976434,9.4719613,2,7,0,0,2026-09-28T11:57:01.945Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-10-03T16:09:26.757Z,12,11.67848133,8.54346755,2,6,0,0,2026-09-21T16:09:26.757Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressen är bara ==32 bitar== och tar slut. Att byta till 128 bitar tvingar fram ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-10-02T16:06:26.407Z,11,11.24989886,9.02098861,2,7,0,0,2026-09-21T16:06:26.407Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-10-12T11:50:34.770Z,14,14.49190058,8.54346755,2,6,0,0,2026-09-28T11:50:34.770Z-->

Vad är RFC och vad är dess roll?::Internets ==fritt tillgängliga== protokolldokument – vem som helst kan bygga efter dem.
<!--SR:!fsrs,2026-10-03T10:11:24.147Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-30T10:11:24.147Z-->

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-10-17T11:56:49.281Z,19,18.50758643,6.79215857,2,4,0,0,2026-09-28T11:56:49.281Z-->
