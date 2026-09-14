---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 1, avgränsade till tentafrågorna: exempel på distribuerade system, resursdelning, de åtta utmaningarna, arvet från IP, HTTP och HTML samt internetprotokollens och RFC-seriens roll."
---
# HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system

## Vad ett distribuerat system är

**Distribuerat system**;;Delar av hårdvara eller mjukvara som sitter på ==datorer i ett nät och samordnar sig bara genom att skicka meddelanden==.
<!--SR:!fsrs,2026-09-14T06:21:11.402Z,4,3.94605407,1,2,2,0,0,2026-09-10T06:21:11.402Z!fsrs,2026-09-13T06:13:26.377Z,2,1.09134713,9.24662422,2,6,1,0,2026-09-11T06:13:26.377Z-->

## Exempel på distribuerade system

Vilka tre slags system pekar bokens sammanfattning ut? (3)
||
- **Internet** – användarna når sina tjänster var de än är
- **Intranät** – varje organisation driver ett eget
- **Små system av mobila datorer** och andra små enheter på trådlöst nät
<!--SR:!fsrs,2026-09-12T09:54:36.307Z,1,0.07142473,9.78726147,2,6,1,0,2026-09-11T09:54:36.307Z-->

Varför är webbsök ett svårt distribuerat problem?::Hela webbens innehåll ska indexeras – boken säger ==över 63 miljarder sidor== – och sedan sökas igenom.
<!--SR:!fsrs,2026-09-20T07:12:58.555Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:12:58.555Z-->

**Molntjänster** (cloud computing);;Att ==hyra datorkraft som en tjänst, likt el eller vatten== – program, lagring och beräkning hyrs i stället för att ägas, ofta betalt per användning.
<!--SR:!fsrs,2026-09-14T06:11:49.538Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-11T06:11:49.538Z!fsrs,2026-09-13T14:54:03.113Z,4,3.94605407,1,2,2,0,0,2026-09-09T14:54:03.113Z-->

## Resurser som är värda att dela

Vilka hårdvaruresurser nämner boken? (5)
||
- **Skrivare**
- **Diskar och lagring**
- **Processorer**
- **Digitalkamerans videoström**
- **Ljudförbindelsen i ett mobilsamtal**
<!--SR:!fsrs,2026-09-12T09:52:27.371Z,1,0.16685376,9.84381751,2,6,0,0,2026-09-11T09:52:27.371Z-->

Vilka mjukvaruresurser nämner boken? (5)
||
- **Filer**
- **Databaser**
- **Webbsidor**
- **Söktjänst** eller valutaomvandlare
- **E-post och kalendrar**
<!--SR:!fsrs,2026-09-12T07:23:33.180Z,0,0.01001893,9.97363406,3,9,1,0,2026-09-12T07:13:33.180Z-->

Vad bryr användarna sig om att dela?::==Data och tjänster== – en databas, webbsidor, en söktjänst – ==inte diskarna och processorerna== under dem.
<!--SR:!fsrs,2026-09-13T06:14:57.041Z,2,0.46347318,9.89232553,2,8,1,0,2026-09-11T06:14:57.041Z-->

**Tjänst** (service);;En egen del av ett system som ==sköter en grupp resurser som hör ihop och släpper fram dem== till användare och program – en filtjänst genom read, write och delete.
<!--SR:!fsrs,2026-09-12T09:50:10.767Z,1,0.00420146,9.95595821,2,14,1,0,2026-09-11T09:50:10.767Z!fsrs,2026-09-13T09:53:31.977Z,2,2.01850261,6.79877821,2,3,0,0,2026-09-11T09:53:31.977Z-->

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
<!--SR:!fsrs,2026-09-12T07:24:02.160Z,0,0.63697811,7.39223814,3,3,1,0,2026-09-12T07:14:02.160Z-->

## Heterogenitet

**Heterogenitet** (heterogeneity);;Att delarna är ==olika och ändå måste jobba ihop== – skillnader i nät, hårdvara, operativsystem och språk.
<!--SR:!fsrs,2026-09-14T18:15:59.365Z,4,3.94605407,1,2,2,0,0,2026-09-10T18:15:59.365Z!fsrs,2026-09-13T15:01:07.925Z,4,3.94605407,1,2,2,0,0,2026-09-09T15:01:07.925Z-->

Hur kan internet ha många olika nättyper utan att programmen märker det?::Varje dator har en ==version av internetprotokollen för sitt slags nät==, så skillnaden döljs.
<!--SR:!fsrs,2026-09-12T09:50:38.286Z,1,0.65545843,9.49441771,2,6,1,0,2026-09-11T09:50:38.286Z-->

Vilket problem ger olika programmeringsspråk?::De ==lagrar tecken och datastrukturer på olika sätt==, till exempel arrayer och poster.
<!--SR:!fsrs,2026-09-13T18:18:06.223Z,3,0.34106117,9.85229162,2,7,0,0,2026-09-10T18:18:06.223Z-->

Vad gör middleware åt heterogenitet?::Det är ett ==lager som döljer skillnaderna i nät, hårdvara, operativsystem och språk== – CORBA är exemplet.
<!--SR:!fsrs,2026-09-13T07:12:45.746Z,1,0.45419061,9.91919168,2,8,1,0,2026-09-12T07:12:45.746Z-->

Vilken del av heterogeniteten sköter middleware själv?::==Skillnaderna i operativsystem och hårdvara==.
<!--SR:!fsrs,2026-09-13T07:17:58.406Z,1,0.41145618,9.72735891,2,6,1,0,2026-09-12T07:17:58.406Z-->

Vilken del är redan dold innan middleware kommer in?::==Skillnaderna mellan näten==, av internetprotokollen som middleware oftast ligger ovanpå.
<!--SR:!fsrs,2026-09-13T06:12:32.328Z,2,1.3363301,8.37949113,2,4,0,0,2026-09-11T06:12:32.328Z-->

**Mobil kod** (mobile code);;Kod som ==flyttas från en dator till en annan och körs hos mottagaren== – Java-applets är bokens exempel, JavaScript i webbsidor den vanligaste formen idag.
<!--SR:!fsrs,2026-09-12T09:50:03.187Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T09:50:03.187Z!fsrs,2026-09-14T06:20:59.949Z,4,3.94605407,1,2,2,0,0,2026-09-10T06:20:59.949Z-->

Hur gör en virtuell maskin kod körbar på många slags datorer?::==Kompilatorn gör kod för den virtuella maskinen== i stället för för en bestämd processor.
<!--SR:!fsrs,2026-09-13T06:10:13.730Z,2,1.59985609,9.42783916,2,5,0,0,2026-09-11T06:10:13.730Z-->

## Öppenhet

**Öppenhet** (openness);;Hur lätt ett system går att ==bygga ut och göra om==; för distribuerade system avgörs det av hur lätt man lägger till nya tjänster som delar resurser.
<!--SR:!fsrs,2026-09-13T09:52:14.912Z,2,2.01850261,6.79877821,2,3,0,0,2026-09-11T09:52:14.912Z!fsrs,2026-09-12T09:53:27.726Z,1,0.22495104,8.39432857,2,4,1,0,2026-09-11T09:53:27.726Z-->

Vad krävs för öppenhet?::Att ==de viktiga gränssnitten publiceras==, så att utvecklare kommer åt specifikationen och dokumentationen.
<!--SR:!fsrs,2026-09-12T14:52:59.762Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T14:52:59.762Z-->

Vilken risk följer med att bygga ett öppet system av delar från olika leverantörer?::Man måste ==testa att varje del verkligen följer den publicerade standarden==.
<!--SR:!fsrs,2026-09-13T09:49:47.730Z,2,0.92428556,9.24662422,2,6,1,0,2026-09-11T09:49:47.730Z-->

## Säkerhet

Vad måste säkerheten ge, utöver att dölja innehållet i ett meddelande?::Att man ==säkert vet vem== meddelandet skickades för.
<!--SR:!fsrs,2026-09-13T05:51:49.739Z,3,1.0764589,9.24084127,2,5,0,0,2026-09-10T05:51:49.739Z-->

Vilka två säkerhetsutmaningar är ännu inte lösta? (2)
||
- **Överbelastningsattacker** – möts mest genom att straffa den skyldige efteråt, vilket inte är en riktig lösning
- **Säkerhet för mobil kod** – man vet inte vad ett nedladdat program gör
<!--SR:!fsrs,2026-09-15T06:12:40.248Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-11T06:12:40.248Z-->

**Överbelastningsattack** (denial of service);;En attack där tjänsten ==dränks i så många meningslösa frågor att riktiga användare inte kommer fram==.
<!--SR:!fsrs,2026-09-13T15:00:13.805Z,4,3.94605407,1,2,2,0,0,2026-09-09T15:00:13.805Z!fsrs,2026-09-12T14:55:05.120Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T14:55:05.120Z-->

## Skalbarhet

**Skalbar** (scalable);;Ett system som ==fortsätter fungera bra när antalet resurser och användare ökar mycket==.
<!--SR:!fsrs,2026-09-14T09:50:55.876Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-11T09:50:55.876Z!fsrs,2026-09-13T05:47:43.949Z,3,2.71763926,7.84078413,2,4,0,0,2026-09-10T05:47:43.949Z-->

Vilket krav ställer boken på resursbehovet i ett skalbart system?::Hårdvaran för *n* användare ska vara ==högst O(n)== – klarar en filserver 20 användare ska två klara 40.
<!--SR:!fsrs,2026-09-20T07:14:20.143Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:14:20.143Z-->

Hur blev DNS av med sin föregångares flaskhals?::Namntabellen ==delades upp mellan servrar över hela internet== och sköts lokalt, i stället för en enda huvudfil.
<!--SR:!fsrs,2026-09-20T07:17:23.674Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:17:23.674Z-->

Vilka två tekniker används för resurser som efterfrågas väldigt ofta? (2)
||
- **Caching** – en kopia av det man nyss använt sparas nära klienten
- **Replikering** – flera kopior hålls på olika servrar
<!--SR:!fsrs,2026-09-13T05:45:58.698Z,3,2.71763926,7.84078413,2,4,0,0,2026-09-10T05:45:58.698Z-->

**Replikering** (replication);;Att ==hålla kopior av samma data på flera servrar==, så att datan går att nå även efter att en server kraschat.
<!--SR:!fsrs,2026-09-13T05:52:20.515Z,3,2.71763926,7.84078413,2,4,0,0,2026-09-10T05:52:20.515Z!fsrs,2026-09-14T18:16:06.936Z,4,3.94605407,1,2,2,0,0,2026-09-10T18:16:06.936Z-->

## Felhantering

Varför är felhantering svårt i distribuerade system?::Felen är ==partiella== – vissa delar går sönder medan andra kör vidare.
<!--SR:!fsrs,2026-09-12T09:55:41.336Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T09:55:41.336Z-->

Vilka fem tekniker för att hantera fel räknar boken upp? (5)
||
- **Upptäcka** felet
- **Maskera** felet
- **Tolerera** felet
- **Återhämta** från felet
- **Redundans**
<!--SR:!fsrs,2026-09-12T15:04:23.811Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T15:04:23.811Z-->

Vad är svårigheten med att upptäcka fel?::Vissa hittas med ==checksummor==, men andra – som en kraschad server ute på internet – går inte att upptäcka, bara misstänka.
<!--SR:!fsrs,2026-09-13T09:51:20.126Z,2,0.32868632,9.85746311,2,8,1,0,2026-09-11T09:51:20.126Z-->

Ge två exempel på att maskera ett fel. (2)
||
- **Skicka om** ett meddelande som inte kom fram
- **Skriva data till två diskar**, så att den ena är hel om den andra går sönder
<!--SR:!fsrs,2026-09-12T07:28:11.952Z,0,0.02609664,9.92169749,3,6,1,0,2026-09-12T07:18:11.952Z-->

Vad betyder det att en klient *tolererar* fel?::Den ==säger till användaren i stället för att hålla på i evighet== – som webbläsaren som inte når servern.
<!--SR:!fsrs,2026-09-13T18:18:22.661Z,3,0.90880403,9.24084127,2,5,0,0,2026-09-10T18:18:22.661Z-->

Ge två exempel på redundans i internet. (2)
||
- **Minst två vägar** mellan varje par av routrar
- **Varje DNS-namntabell** på minst två servrar
<!--SR:!fsrs,2026-09-14T06:12:06.354Z,3,2.49363211,8.37949113,2,4,0,0,2026-09-11T06:12:06.354Z-->

**Tillgänglighet** (availability, som mått);;==Hur stor del av tiden ett system går att använda==. Distribuerade system blir ofta tillgängliga, för bara det som rörde den trasiga delen går ner.
<!--SR:!fsrs,2026-09-12T09:58:39.931Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T09:58:39.931Z!fsrs,2026-09-14T18:18:11.496Z,4,3.94605407,1,2,2,0,0,2026-09-10T18:18:11.496Z-->

## Samtidighet

Hur gör man ett objekt säkert när flera kör i det samtidigt?::Operationerna ==synkroniseras så att datan förblir konsistent==, med vanliga tekniker som semaforer.
<!--SR:!fsrs,2026-09-20T07:13:12.746Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:13:12.746Z-->

## Transparens

**Nätverkstransparens**;;Det gemensamma namnet på ==åtkomst- och lokaliseringstransparens==, som boken kallar de två viktigaste.
<!--SR:!fsrs,2026-09-12T14:53:04.674Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T14:53:04.674Z!fsrs,2026-09-13T14:59:41.990Z,4,3.94605407,1,2,2,0,0,2026-09-09T14:59:41.990Z-->

**Lokaliseringstransparens** (location);;När en resurs kan nås ==utan att man vet var den står==, fysiskt eller i nätet.
<!--SR:!fsrs,2026-09-13T14:52:50.754Z,4,3.94605407,1,2,2,0,0,2026-09-09T14:52:50.754Z!fsrs,2026-09-13T05:46:39.778Z,3,2.71763926,7.84078413,2,4,0,0,2026-09-10T05:46:39.778Z-->

**Feltransparens** (failure);;När ==fel döljs så att användare och program blir klara== fast hårdvara eller mjukvara gått sönder.
<!--SR:!fsrs,2026-09-14T18:18:46.594Z,4,3.94605407,1,2,2,0,0,2026-09-10T18:18:46.594Z!fsrs,2026-09-12T10:38:40.027Z,4,4.37161444,5.20002037,2,2,0,0,2026-09-08T10:38:40.027Z-->

**Mobilitetstransparens** (mobility);;När ==resurser och klienter kan flyttas utan att det påverkar== användarna eller programmen.
<!--SR:!fsrs,2026-09-14T06:16:50.847Z,3,2.15820648,8.90450831,2,5,0,0,2026-09-11T06:16:50.847Z!fsrs,2026-09-12T10:49:00.445Z,4,4.37161444,5.20002037,2,2,0,0,2026-09-08T10:49:00.445Z-->

Hur visar e-post feltransparens?::Posten ==kommer fram till slut även när servrar eller länkar går sönder== – felen döljs genom att den skickas om, om det så tar dagar.
<!--SR:!fsrs,2026-09-12T14:53:24.850Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T14:53:24.850Z-->

När är transparens *inte* bra?::När resursens identitet spelar roll – ett dokument skrivs ut på ==en namngiven skrivare nära användaren==.
<!--SR:!fsrs,2026-09-12T09:51:33.278Z,1,0.03296819,9.93775284,2,8,1,0,2026-09-11T09:51:33.278Z-->

## Tjänstekvalitet

Vilka egenskaper avgör en tjänsts kvalitet (QoS)? (4)
||
- **Tillförlitlighet**
- **Säkerhet**
- **Prestanda**
- **Anpassningsförmåga** – att systemet ställer om sig när resurserna ändras
<!--SR:!fsrs,2026-09-13T18:17:55.063Z,3,1.00430456,9.24084127,2,5,0,0,2026-09-10T18:17:55.063Z-->

Hur har prestandadelen av QoS fått ny betydelse?::Från ==svarstid och hur mycket systemet hinner== till att ==klara utlovade tider==.
<!--SR:!fsrs,2026-09-13T06:07:28.292Z,2,0.89193172,9.77242402,2,6,0,0,2026-09-11T06:07:28.292Z-->

**Tidskritiska data** (time-critical data);;Dataströmmar som måste ==behandlas eller skickas i jämn takt==, till exempel videobilder som ska visas inom bestämda tidsgränser.
<!--SR:!fsrs,2026-09-13T09:54:54.925Z,2,2.01850261,6.79877821,2,3,0,0,2026-09-11T09:54:54.925Z!fsrs,2026-09-15T06:09:44.712Z,4,3.73012759,7.84078413,2,4,0,0,2026-09-11T06:09:44.712Z-->

## Webben

Vilka tre standarder bygger webben på? (3)
||
- **HTML** – sidans innehåll och layout
- **URL:er** – pekar ut dokument och andra resurser
- **Klient-server med HTTP** – hur webbläsaren hämtar resurser
<!--SR:!fsrs,2026-09-13T09:53:49.020Z,2,0.52419145,9.42783916,2,5,0,0,2026-09-11T09:53:49.020Z-->

På vilka två sätt är webben ett öppet system? (2)
||
- **Standarderna är fritt publicerade**, så vilken läsare som helst kan hämta från vilken server som helst
- **Nya slags resurser** kan publiceras, och nya innehållstyper hanteras med plugin-moduler
<!--SR:!fsrs,2026-09-13T05:49:03.510Z,3,1.0764589,9.24084127,2,5,0,0,2026-09-10T05:49:03.510Z-->

Varför har webben kunnat växa utan att ändra sin grundarkitektur?::Standarderna den bygger på är ==enkla och publicerades tidigt==.
<!--SR:!fsrs,2026-09-12T15:08:47.825Z,3,0.88200608,9.24084127,2,5,0,0,2026-09-09T15:08:47.825Z-->

## Arvet från HTML

Vilket arv från HTML gör det svårt för program att prata med varandra?::En ==fast uppsättning byggdelar, hopkopplade med hur saken ska visas för en människa==.
<!--SR:!fsrs,2026-09-13T06:10:00.117Z,2,0.17228615,9.88568673,2,7,0,0,2026-09-11T06:10:00.117Z-->

Vad löser XML som HTML inte klarar?::XML är ==självbeskrivande== – det bär namnen, typerna och strukturen på dataelementen.
<!--SR:!fsrs,2026-09-12T09:52:48.377Z,1,0.04243902,9.90052417,2,7,1,0,2026-09-11T09:52:48.377Z-->

Varför körs JavaScript i webbläsaren i stället för på servern?::För ==bättre samspel med användaren== – man får till exempel direkt veta att ett fält är fel ifyllt.
<!--SR:!fsrs,2026-09-14T06:09:28.465Z,3,2.15820648,8.90450831,2,5,0,0,2026-09-11T06:09:28.465Z-->

## Arvet från HTTP

Vilka fyra drag hos HTTP räknar boken upp? (4)
||
- **Fråga och svar** – klienten frågar, servern svarar med innehållet eller ett fel som 404
- **Innehållstyper** – servern anger vilken typ svaret har
- **En resurs per fråga**
- **Enkel åtkomstkontroll**
<!--SR:!fsrs,2026-09-13T07:17:35.252Z,1,0.13143933,9.95510632,2,11,0,0,2026-09-12T07:17:35.252Z-->

Vilket arv från HTTP gör att en sida med nio bilder kostar tio anrop?::==En resurs per fråga== – klienten pekar ut exakt en resurs per HTTP-fråga.
<!--SR:!fsrs,2026-09-13T05:46:09.290Z,3,1.18386285,9.24084127,2,5,0,0,2026-09-10T05:46:09.290Z-->

Vad är HTTP:s förvalda åtkomstkontroll?::Ingen – ==vem som helst med nätåtkomst kan nå alla publicerade resurser==.
<!--SR:!fsrs,2026-09-13T18:17:44.539Z,3,1.84061869,7.84078413,2,4,0,0,2026-09-10T18:17:44.539Z-->

Hur begränsar man åtkomsten till en HTTP-resurs?::Servern ställs in att skicka en ==utmaning== som klienten måste svara på, till exempel med ett lösenord.
<!--SR:!fsrs,2026-09-12T15:01:32.781Z,3,2.08884117,7.84078413,2,4,0,0,2026-09-09T15:01:32.781Z-->

## Arvet från IP

Vilket arv från IP måste man ta hänsyn till?::Adressrymden sattes till ==32 bitar== och tar slut; bytet till 128 bitar kräver ändringar i massor av mjukvara.
<!--SR:!fsrs,2026-09-13T15:00:31.493Z,4,3.49472844,7.83424026,2,5,0,0,2026-09-09T15:00:31.493Z-->

Varför finns det ingen *korrekt* lösning på IP-adressproblemet?::Man kan inte ==veta hur stort behovet blir om många år==, och för stora adresser kostar plats i meddelanden och lagring.
<!--SR:!fsrs,2026-09-13T05:52:11.715Z,3,2.71763926,7.84078413,2,4,0,0,2026-09-10T05:52:11.715Z-->

## IP:s och RFC:s roll

Vilken roll har internetprotokollen haft för distribuerade system?::De blev den ==gemensamma standard alla enades om==, så att program var som helst kan skicka meddelanden till varandra.
<!--SR:!fsrs,2026-09-14T06:16:34.011Z,3,2.3479313,7.84078413,2,4,0,0,2026-09-11T06:16:34.011Z-->

**RFC** (Request For Comments);;Serien av dokument, ==som var och en har ett eget nummer==, som internetprotokollens byggare startade och som är internets tekniska dokumentation.
<!--SR:!fsrs,2026-09-13T18:15:44.415Z,3,1.84061869,7.84078413,2,4,0,0,2026-09-10T18:15:44.415Z!fsrs,2026-09-20T07:16:31.145Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-12T07:16:31.145Z-->

Vad publicerades när i RFC-serien? (2)
||
- **Internets kommunikationsprotokoll** – i början av 1980-talet
- **Programmen ovanpå** – filöverföring, e-post och telnet, i mitten av 1980-talet
<!--SR:!fsrs,2026-09-14T07:17:04.981Z,2,0.58578604,9.42783916,2,5,0,0,2026-09-12T07:17:04.981Z-->

Varför går publicering via RFC förbi den officiella standardiseringen?::Den officiella vägen är ==tungrodd och långsam==.
<!--SR:!fsrs,2026-09-15T06:13:37.759Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-11T06:13:37.759Z-->
