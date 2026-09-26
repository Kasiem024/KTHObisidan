---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

**Distribuerat system**;;Delar av hårdvara eller mjukvara som sitter på ==datorer i ett nät och samordnar sig bara genom att skicka meddelanden==.
<!--SR:!fsrs,2026-09-28T15:04:08.734Z,14,14.21704924,4.01060897,2,3,0,0,2026-09-14T15:04:08.734Z!fsrs,2026-09-29T16:31:13.368Z,8,7.7984309,9.30817754,2,8,1,0,2026-09-21T16:31:13.368Z-->

## Exempel på distribuerade system

Vilka tre slags system pekar bokens sammanfattning ut? (3)
||
- **Internet** – användarna når sina tjänster var de än är
- **Intranät** – varje organisation driver ett eget
- **Små system av mobila datorer** och andra små enheter på trådlöst nät
<!--SR:!fsrs,2026-09-15T15:36:15.621Z,1,0.29100666,9.84400262,2,7,1,0,2026-09-14T15:36:15.621Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-10-10T16:18:36.735Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:18:36.735Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som en tjänst, likt el eller vatten== – program, lagring och beräkning hyrs i stället för att ägas, ofta betalt per användning.
<!--SR:!fsrs,2026-09-20T15:13:08.783Z,6,6.04908239,7.86010817,2,4,0,0,2026-09-14T15:13:08.783Z!fsrs,2026-09-30T15:29:20.553Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:29:20.553Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser nämner boken? (5)
||
- **Skrivare**
- **Diskar och lagring**
- **Processorer**
- **Digitalkamerans videoström**
- **Ljudförbindelsen i ett mobilsamtal**
<!--SR:!fsrs,2026-09-15T15:20:10.082Z,1,0.50744333,9.88154715,2,7,0,0,2026-09-14T15:20:10.082Z-->

Vilka mjukvaruresurser nämner boken? (5)
||
- **Filer**
- **Databaser**
- **Webbsidor**
- **Söktjänst** eller valutaomvandlare
- **E-post och kalendrar**
<!--SR:!fsrs,2026-09-22T16:10:00.429Z,1,0.07841585,9.95987863,2,12,1,0,2026-09-21T16:10:00.429Z-->

Vad bryr användarna sig om att dela?::==Data och tjänster== – en databas, webbsidor, en söktjänst – ==inte diskarna och processorerna== under dem.
<!--SR:!fsrs,2026-09-15T15:24:30.622Z,1,0.99873924,9.91374904,2,9,1,0,2026-09-14T15:24:30.622Z-->

**Tjänst** (service);;En egen del av ett system som ==sköter en grupp resurser som hör ihop och släpper fram dem== till användare och program – en filtjänst genom read, write och delete.
<!--SR:!fsrs,2026-09-15T15:33:04.888Z,1,0.00604219,9.95600975,2,16,2,0,2026-09-14T15:33:04.888Z!fsrs,2026-09-21T15:26:26.371Z,7,7.34231088,6.7872078,2,4,0,0,2026-09-14T15:26:26.371Z-->

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

Hur kan internet ha många olika nättyper utan att programmen märker det?::Varje dator har en ==version av internetprotokollen för sitt slags nät==, så skillnaden döljs.
<!--SR:!fsrs,2026-09-15T15:21:31.515Z,1,0.30694292,9.80445623,2,8,2,0,2026-09-14T15:21:31.515Z-->

Vilket problem ger olika programmeringsspråk?::De ==lagrar tecken och datastrukturer på olika sätt==, till exempel arrayer och poster.
<!--SR:!fsrs,2026-09-16T15:05:54.686Z,2,1.23242258,9.8376677,2,8,0,0,2026-09-14T15:05:54.686Z-->

Vad gör middleware åt heterogenitet?::Det är ett ==lager som döljer skillnaderna i nät, hårdvara, operativsystem och språk== – CORBA är exemplet.
<!--SR:!fsrs,2026-09-17T15:03:29.207Z,3,1.80545608,9.87741768,2,9,1,0,2026-09-14T15:03:29.207Z-->

**Mobil kod** (mobile code);;Kod som ==flyttas från en dator till en annan och körs hos mottagaren== – Java-applets är bokens exempel, JavaScript i webbsidor den vanligaste formen idag.
<!--SR:!fsrs,2026-09-21T10:49:16.109Z,6,5.74357914,8.55184025,2,5,0,0,2026-09-15T10:49:16.109Z!fsrs,2026-09-28T15:32:30.511Z,14,14.21704924,4.01060897,2,3,0,0,2026-09-14T15:32:30.511Z-->

## Öppenhet

**Öppenhet** (openness);;Hur lätt ett system går att ==bygga ut och göra om==; för distribuerade system avgörs det av hur lätt man lägger till nya tjänster som delar resurser.
<!--SR:!fsrs,2026-09-19T15:19:10.884Z,5,5.22024091,7.86010817,2,4,0,0,2026-09-14T15:19:10.884Z!fsrs,2026-09-15T15:29:55.006Z,1,0.14932824,9.443226,2,6,2,0,2026-09-14T15:29:55.006Z-->

Vad krävs för öppenhet?::Att ==de viktiga gränssnitten publiceras==, så att utvecklare kommer åt specifikationen och dokumentationen.
<!--SR:!fsrs,2026-09-30T16:06:59.487Z,9,9.2662958,9.02387245,2,6,0,0,2026-09-21T16:06:59.487Z-->

Vilken risk följer med att bygga ett öppet system av delar från olika leverantörer?::Man måste ==testa att varje del verkligen följer den publicerade standarden==.
<!--SR:!fsrs,2026-09-26T16:33:57.558Z,5,5.15369702,9.47579645,2,8,1,0,2026-09-21T16:33:57.558Z-->

## Säkerhet

Vad måste säkerheten ge, utöver att dölja innehållet i ett meddelande?::Att man ==säkert vet vem== meddelandet skickades för.
<!--SR:!fsrs,2026-09-17T15:12:16.315Z,3,3.29879294,9.2268288,2,6,0,0,2026-09-14T15:12:16.315Z-->

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

Hur blev DNS av med sin föregångares flaskhals?::Namntabellen ==delades upp mellan servrar över hela internet== och sköts lokalt, i stället för en enda huvudfil.
<!--SR:!fsrs,2026-10-10T16:31:40.879Z,19,18.86782,7.09510771,2,4,0,0,2026-09-21T16:31:40.879Z-->

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-09-19T15:20:20.886Z,5,5.39537051,8.55184025,2,5,0,0,2026-09-14T15:20:20.886Z-->

Vilka fem tekniker för att hantera fel räknar boken upp? (5)
||
- **Upptäcka** felet
- **Maskera** felet
- **Tolerera** felet
- **Återhämta** från felet
- **Redundans**
<!--SR:!fsrs,2026-09-30T16:23:04.909Z,9,9.2662958,9.02387245,2,6,0,0,2026-09-21T16:23:04.909Z-->

## Samtidighet

Varför är samtidighet en utmaning, och vad kan gå fel?::Flera klienter vill åt samma resurs samtidigt. Att ta ==en i taget begränsar genomströmningen==, så man kör flera parallellt – och då kan operationerna krocka. Bokens exempel är två auktionsbud som byter belopp med varandra.

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-09-21T10:47:38.607Z,6,5.74357914,8.55184025,2,5,0,0,2026-09-15T10:47:38.607Z!fsrs,2026-09-13T14:59:41.990Z,4,3.94605407,1,2,2,0,0,2026-09-09T14:59:41.990Z-->

**Lokaliseringstransparens** (location);;När en resurs kan nås ==utan att man vet var den står==, fysiskt eller i nätet.
<!--SR:!fsrs,2026-09-30T15:19:20.486Z,16,15.9366778,4.01060897,2,3,0,0,2026-09-14T15:19:20.486Z!fsrs,2026-10-01T16:06:05.264Z,10,9.69636302,9.02387245,2,6,0,0,2026-09-21T16:06:05.264Z-->

## Tjänstekvalitet

Vilka egenskaper avgör en tjänsts kvalitet (QoS)? (4)
||
- **Tillförlitlighet**
- **Säkerhet**
- **Prestanda**
- **Anpassningsförmåga** – att systemet ställer om sig när resurserna ändras
<!--SR:!fsrs,2026-09-25T16:36:24.140Z,4,4.27435011,9.64086687,2,7,0,0,2026-09-21T16:36:24.140Z-->

Hur har prestandadelen av QoS fått ny betydelse?::Från ==svarstid och hur mycket systemet hinner== till att ==klara utlovade tider==.
<!--SR:!fsrs,2026-09-14T15:38:05.783Z,0,0.12531729,9.9557859,3,8,1,0,2026-09-14T15:28:05.783Z-->

## Webben

Vilka tre standarder bygger webben på? (3)
||
- **HTML** – sidans innehåll och layout
- **URL:er** – pekar ut dokument och andra resurser
- **Klient-server med HTTP** – hur webbläsaren hämtar resurser
<!--SR:!fsrs,2026-09-15T15:06:18.141Z,1,1.32369684,9.60540134,2,6,0,0,2026-09-14T15:06:18.141Z-->

På vilka två sätt är webben ett öppet system? (2)
||
- **Standarderna är fritt publicerade**, så vilken läsare som helst kan hämta från vilken server som helst
- **Nya slags resurser** kan publiceras, och nya innehållstyper hanteras med plugin-moduler
<!--SR:!fsrs,2026-09-27T16:02:04.514Z,6,5.83304229,9.4719613,2,7,0,0,2026-09-21T16:02:04.514Z-->

Varför har webben kunnat växa utan att ändra sin grundarkitektur?::Standarderna den bygger på är ==enkla och publicerades tidigt==.
<!--SR:!fsrs,2026-09-17T15:30:18.725Z,3,3.16776378,9.2268288,2,6,0,0,2026-09-14T15:30:18.725Z-->

## Arvet från HTML

Vilket arv från HTML gör det svårt för program att prata med varandra?::En ==fast uppsättning byggdelar, hopkopplade med hur saken ska visas för en människa==.
<!--SR:!fsrs,2026-09-16T15:11:34.914Z,2,0.72757855,9.87102941,2,8,0,0,2026-09-14T15:11:34.914Z-->

Vad löser XML som HTML inte klarar?::XML är ==självbeskrivande== – det bär namnen, typerna och strukturen på dataelementen.
<!--SR:!fsrs,2026-09-16T15:22:48.899Z,2,0.28202326,9.88585202,2,8,1,0,2026-09-14T15:22:48.899Z-->

## Arvet från HTTP

Vilka fyra drag hos HTTP räknar boken upp? (4)
||
- **Fråga och svar** – klienten frågar, servern svarar med innehållet eller ett fel som 404
- **Innehållstyper** – servern anger vilken typ svaret har
- **En resurs per fråga**
- **Enkel åtkomstkontroll**
<!--SR:!fsrs,2026-09-22T16:32:49.759Z,1,1.27385187,9.94564956,2,13,0,0,2026-09-21T16:32:49.759Z-->

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-09-18T15:12:51.033Z,4,3.47788559,9.2268288,2,6,0,0,2026-09-14T15:12:51.033Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-10-03T16:09:26.757Z,12,11.67848133,8.54346755,2,6,0,0,2026-09-21T16:09:26.757Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressrymden sattes till ==32 bitar== och tar slut; bytet till 128 bitar kräver ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-10-02T16:06:26.407Z,11,11.24989886,9.02098861,2,7,0,0,2026-09-21T16:06:26.407Z-->

Varför finns det ingen *korrekt* lösning på IP-adressproblemet?::Man kan inte ==veta hur stort behovet blir om många år==, och för stora adresser kostar plats i meddelanden och lagring.
<!--SR:!fsrs,2026-10-01T16:13:10.123Z,10,9.69636302,9.02387245,2,6,0,0,2026-09-21T16:13:10.123Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-09-20T15:28:43.785Z,6,6.45744755,7.82817172,2,5,0,0,2026-09-14T15:28:43.785Z-->

**RFC** (Request For Comments);;Serien av dokument, ==som var och en har ett eget nummer==, som internetprotokollens byggare startade och som är internets tekniska dokumentation.
<!--SR:!fsrs,2026-09-29T16:09:09.245Z,8,8.42815849,9.02387245,2,6,0,0,2026-09-21T16:09:09.245Z!fsrs,2026-09-20T07:16:31.145Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:16:31.145Z-->

Vad publicerades när i RFC-serien? (2)
||
- **Internets kommunikationsprotokoll** – i början av 1980-talet
- **Programmen ovanpå** – filöverföring, e-post och telnet, i mitten av 1980-talet
<!--SR:!fsrs,2026-09-15T15:11:18.166Z,1,1.27537838,9.60540134,2,6,0,0,2026-09-14T15:11:18.166Z-->

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-09-15T06:13:37.759Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-11T06:13:37.759Z-->
