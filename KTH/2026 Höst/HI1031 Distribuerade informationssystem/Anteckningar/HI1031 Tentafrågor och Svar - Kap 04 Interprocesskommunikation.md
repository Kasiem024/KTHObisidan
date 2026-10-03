---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-09-08
updated: 2026-09-15
description: "Svar på kursens sex tentafrågor om interprocesskommunikation: hur ett IPC-anrop karakteriseras, vad XML är och används till, tre typer av IPC, portar med flera mottagare, IPC jämfört med distribuerade objekt, och vad virtualisering ger."
---
# HI1031 Tentafrågor och Svar - Kap 04 Interprocesskommunikation

Noten täcker de sex tentafrågorna och ingenting annat. Varje fråga har fakta ur boken och ett **Muntligt
svar** med talpunkterna i den ordning du säger dem.

## Fråga 1 – På vilka olika sätt kan man karakterisera ett IPC-anrop?

Bokens avsnitt: 4.2.1

IPC görs med två operationer, **send** och **receive**. En process skickar ett meddelande — ==en sekvens
av bytes== — till en destination, och en process där tar emot det. Boken karakteriserar ett anrop på
**fyra sätt**.

**1. Synkront eller asynkront.** Varje destination har en **kö**.

- **Synkront:** ==både send och receive blockerar==. `send` blockerar till motsvarande `receive` görs,
  `receive` till ett meddelande kommer.
- **Asynkront:** `send` är ==icke-blockerande== — sändaren fortsätter så snart meddelandet kopierats till
  en lokal buffert, och överföringen sker ==parallellt==.
- **Bokens slutsats, värd att kunna:** med trådar har blockerande `receive` ==inga nackdelar==, eftersom
  en tråd kan blockera medan andra jobbar. Icke-blockerande *ser* effektivare ut men lägger komplexitet
  på mottagaren, så ==dagens system brukar inte ha icke-blockerande receive==.

**2. Meddelandets destination.** Meddelanden går till ett par ==(internetadress, lokal port)==, där porten
är en destination inuti en dator angiven som ett heltal. **En port har exakt en mottagare men kan ha många
sändare** — multicast är undantaget.

**3. Tillförlitlighet**, definierad med ==giltighet och integritet==. Giltig: meddelanden ==garanteras
komma fram trots ett "rimligt" antal tappade paket==; otillförlitlig om de inte garanteras ==ens vid ett
enda== tappat paket. Integritet: de kommer fram ==oskadade och utan dubbletter==.

**4. Ordning.** Vissa tillämpningar kräver ==sändarordning==, och för dem ==räknas fel ordning som ett
fel==.

### Muntligt svar

1. Ge **ramen**: IPC är `send` och `receive`, och boken karakteriserar ett anrop på fyra sätt.
2. **Synkront eller asynkront**, förklarat med kön: synkront blockerar båda, asynkront har
   icke-blockerande send.
3. Lägg till **bokens slutsats**: med trådar har blockerande `receive` inga nackdelar, så dagens system
   erbjuder oftast inte den icke-blockerande varianten.
4. **Destinationen**: (adress, port) – en mottagare, men många sändare.
5. **Tillförlitlighet**, alltså giltighet och integritet, och **ordning** – sändarordning, där fel
   ordning räknas som ett fel.

På vilka sätt kan man karakterisera ett IPC-anrop? (4)
||
- **Synkront eller asynkront** – synkront blockerar både send och receive, asynkront har en icke-blockerande send som fortsätter så snart meddelandet kopierats till en buffert; med trådar har blockerande receive inga nackdelar, så det är det vanliga valet
- **Destinationen** – meddelandet går till ett par av internetadress och port, där en port har exakt en mottagare men kan ha många sändare
- **Tillförlitligheten** – giltighet, att meddelanden kommer fram trots en del tappade paket, och integritet, att de kommer fram hela och utan dubbletter
- **Ordningen** – vissa tillämpningar kräver sändarordning, och för dem räknas fel ordning som ett fel

## Fråga 2 – Beskriv vad XML är och vad det kan användas till

Bokens avsnitt: 4.3.3, plus 4.3

**Vad det är.** XML, *Extensible Markup Language*, är ett **märkspråk** definierat av **W3C** — alltså en
==textbaserad kodning som representerar både en text och dess struktur eller utseende==. HTML gjordes för
==hur en webbsida ser ut== och XML för ==strukturerade dokument==.

**Skillnaden mot HTML:** XML:s taggar beskriver ==den logiska strukturen== hos det de omsluter, HTML:s
säger ==hur webbläsaren ska visa== texten. Och XML är **extensible** — ==du får definiera egna taggar==,
medan HTML har en fast uppsättning. Ska dokumentet användas av ==mer än en tillämpning måste taggnamnen
vara överenskomna==, och därför är **SOAP** ett XML-format vars taggar är ==publicerade==.

**Det är självbeskrivande, och det är poängen.** CORBA CDR behöver inte vara det, eftersom sändare och
mottagare redan känner ordningen och typerna. XML skulle användas av ==flera tillämpningar för olika
syften==, och taggarna plus **namnrymder** gör det möjligt — en tillämpning kan använda ==flera
uppsättningar definitioner utan namnkollisioner==. Taggarna ger en andra vinst: en tillämpning kan
==välja bara de delar den behöver== och ==påverkas inte om någon lägger till information för en annan
tillämpning==.

**Vad det används till, enligt boken:** **webbtjänster** i första hand — klienter pratar med dem i XML
(SOAP), och XML ==definierar deras gränssnitt och andra egenskaper==. Dessutom **arkivering och
återsökning**, där ett XML-arkiv kan bli ==större än ett binärt== men går att ==läsa på vilken dator som
helst==, samt **specifikation av användargränssnitt** och **kodning av konfigurationsfiler**.

**Priset måste med.** Text i stället för binärt, plus taggarna, gör ==meddelandena stora==, vilket ==tar
längre tid att bearbeta och skicka, och kräver mer lagring==. Motmedlet: ==HTTP 1.1 tillåter
komprimering==.

### Muntligt svar

1. **Definiera**: ett märkspråk från W3C för strukturerade dokument.
2. Ge **skillnaden mot HTML**: XML:s taggar beskriver strukturen, HTML:s utseendet. Och du får hitta på
   egna taggar.
3. Säg att det är **självbeskrivande**, och varför: det ska kunna användas av flera tillämpningar som inte
   känner varandra i förväg. Nämn namnrymder.
4. Ge **användningarna**: webbtjänster och SOAP först, sedan arkivering, gränssnitt och
   konfigurationsfiler.
5. Ge **priset**: text plus taggar ger stora meddelanden och längre tider – men HTTP 1.1 kan komprimera.

Beskriv vad XML är. (3)
||
- **Vad det är** – ett märkspråk från W3C, alltså en textbaserad kodning som beskriver både en text och dess struktur
- **Mot HTML** – XML:s taggar beskriver den logiska strukturen medan HTML:s säger hur webbläsaren ska visa texten, och XML är extensible så du får hitta på egna taggar
- **Självbeskrivande** – så att tillämpningar som inte känner varandra i förväg kan läsa det, och namnrymder gör att flera uppsättningar taggar kan samsas utan krockar

Vad kan XML användas till, och vad kostar det? (2)
||
- **Används till** – webbtjänster och SOAP i första hand, sedan arkivering och återsökning, specifikation av användargränssnitt och kodning av konfigurationsfiler
- **Priset** – text med taggar ger stora meddelanden som tar längre tid att bearbeta och skicka och kräver mer lagring, men HTTP 1.1 kan komprimera

## Fråga 3 – Beskriv tre olika typer av IPC

Bokens avsnitt: 4.2.3, 4.2.4 och 4.4

Ta de tre kapitlet bygger på: **UDP-datagram, TCP-strömmar och multicast.**

**1. UDP-datagram — meddelandeöverföring, den enklaste formen.** Sändaren skickar ett ==enskilt
meddelande==, och de oberoende paketen kallas ==datagram==. Ett datagram skickas ==utan bekräftelse och
utan omsändning==, så blir det fel kan meddelandet ==inte komma fram alls==. Båda parter skapar först en
**socket** bunden till en lokal adress och port. Felmodellen är ==utelämnandefel och leverans i fel
ordning==, och meddelandet kan ==trunkeras vid ankomsten== om det är för stort för mottagarens
byte-array. ==DNS och Voice over IP== använder UDP, just för att slippa omkostnaderna för garanterad
leverans.

**2. TCP-strömmar — en tvåvägsström av bytes** ==utan meddelandegränser==. Det ger en byggsten för
==producent-konsument==: data köas hos mottagaren till konsumenten är redo.

- **Vad strömmen döljer:** meddelandestorlekar, ==tappade meddelanden== via bekräftelser och omsändning,
  ==flödeskontroll== som bromsar en skrivare snabbare än läsaren, samt ==dubbletter och ordning==. Även
  destinationen döljs: processerna ==upprättar en förbindelse== med `connect` och `accept` och sedan
  skriver och läser de bara i strömmen, ==utan att ange adress och port==. Uppkopplingen kan bli ==en
  betydande omkostnad för en enda fråga och ett enda svar==.
- **Men TCP är inte tillförlitlig kommunikation.** Passerar paketförlusten en gräns, eller kapas eller
  överbelastas nätet, ==förklarar TCP förbindelsen bruten==. Två följder: processerna kan ==inte skilja
  ett nätfel från att processen i andra änden dött==, och de kan ==inte veta om det de nyligen skickade
  kom fram==.

**3. Multicast — ett meddelande till en grupp.** En **multicast-operation** skickar ==ett enda meddelande
från en process till varje medlem i en grupp==, normalt så att ==medlemskapet är transparent för
sändaren==. Det enklaste protokollet ger ==inga garantier== om leverans eller ordning. **IP multicast**
byggs ovanpå IP och är på programmeringsnivå ==bara tillgängligt via UDP==. Fråga 4 går igenom vad det
duger till och var det brister.

### Muntligt svar

1. Namnge de tre: **UDP-datagram, TCP-strömmar, multicast.**
2. **UDP:** enskilda meddelanden, ingen bekräftelse, ingen omsändning – utelämnandefel och fel ordning.
   DNS och VoIP använder det för att slippa omkostnaderna.
3. **TCP:** en tvåvägsström av bytes utan meddelandegränser, som döljer storlekar, förluster,
   flödeskontroll och ordning. Uppkoppling först, sedan bara läs och skriv.
4. Lägg till **TCP:s begränsning**: det är inte tillförlitlig kommunikation, för vid tillräcklig förlust
   förklaras förbindelsen bruten – och då vet processen inte om felet var nätet eller den andra processen.
5. **Multicast:** ett meddelande till varje gruppmedlem, medlemskapet transparent för sändaren, och bara
   tillgängligt via UDP.

Beskriv tre olika typer av IPC. UDP och TCP. (3)
||
- **De tre** – UDP-datagram, TCP-strömmar och multicast
- **UDP-datagram** – enskilda meddelanden utan bekräftelse och utan omsändning, så felmodellen är utelämnandefel och leverans i fel ordning; DNS och Voice over IP använder det just för att slippa omkostnaderna för garanterad leverans
- **TCP-strömmar** – en tvåvägsström av bytes utan meddelandegränser, som döljer storlekar, tappade meddelanden, flödeskontroll och ordning; man kopplar upp först med connect och accept och sedan bara läser och skriver i strömmen

Beskriv tre olika typer av IPC. TCP:s begränsning och multicast. (2)
||
- **TCP är inte tillförlitlig kommunikation** – passerar paketförlusten en gräns förklarar TCP förbindelsen bruten, och då kan processen varken skilja ett nätfel från att den andra processen dött eller veta om det den nyss skickade kom fram
- **Multicast** – ett enda meddelande från en process till varje medlem i en grupp, normalt med medlemskapet transparent för sändaren; IP multicast byggs ovanpå IP och nås på programmeringsnivå bara via UDP

## Fråga 4 – Är det speciellt bra att en port kan ha flera mottagare? Utveckla

Bokens avsnitt: 4.2.2 för utgångsläget, 4.4 och 4.4.2 för svaret

**Räta ut premissen först, för boken säger något annat.** Normalt har ==en port exakt en mottagare men kan
ha många sändare==, och en process kan ==inte dela en port== med andra processer på samma dator.
**Undantaget är IP multicast** — där ==delas portar faktiskt==: när ett multicast-meddelande kommer till en
dator skickas ==kopior till alla lokala sockets== som gått med i adressen och är bundna till portnummret.
Så frågan handlar om multicast.

**Svaret är ja, och boken ger fyra saker det gör möjligt:**

1. **Feltolerans med replikerade tjänster.** Tjänsten är en ==grupp av servrar==, förfrågan multicastas
   till alla, som gör ==samma operation==. ==Även när några går ner kan klienterna betjänas.==
2. **Att hitta tjänster i spontana nät.** Servrar och klienter använder multicast för att ==hitta
   tillgängliga upptäckartjänster==. ==Jini använder IP multicast== till det.
3. **Bättre prestanda med replikerad data.** Replikerna kan ligga i ==användarnas egna datorer==, och varje
   gång datan ändras ==multicastas det nya värdet== till processerna som sköter dem.
4. **Spridning av händelsenotifieringar**, och ==publish-subscribe kan använda gruppmulticast==.

**Men — och det är vad "utveckla" frågar efter — IP multicast räcker inte hela vägen.**

- Felmodellen är ==samma som UDP:s, utelämnandefel==. Ett meddelande ==garanteras inte nå någon bestämd
  medlem== ens vid ett enda utelämnandefel: ==några men inte alla== kan få det. Boken kallar det
  ==otillförlitlig multicast==.
- **Var det brister:** tappas ett datagram ==mellan två multicast-routrar== får ==ingen mottagare bortom
  den routern== meddelandet. Går en router ner missar medlemmarna bortom den det, ==medan lokala medlemmar
  kan få det==.
- **Ordningen är också ett problem.** IP-paket kommer ==inte nödvändigtvis i den ordning de skickades==, så
  några medlemmar kan få ==samma sändares datagram i annan ordning än andra==, och meddelanden från ==två
  olika sändare== kommer inte nödvändigtvis i ==samma ordning hos alla==.

**Hur mycket det skadar beror på användningen, och det är den bästa poängen i svaret.** Replikerade
tjänster är det hårda fallet: servrarna startar i samma tillstånd och måste göra samma operationer i samma
ordning, så det krävs att ==antingen alla eller ingen== får varje förfrågan — ==missar en enda medlem en
förfrågan blir den inkonsistent== — och oftast att ==alla får dem i samma ordning==. Tjänsteupptäckt är det
lätta fallet: förfrågningar multicastas ==med jämna mellanrum==, så ==en enstaka förlust är inget
problem==.

**Därför behövs starkare garantier ovanpå:** **tillförlitlig multicast**, där ett skickat meddelande ==tas
emot av alla medlemmar eller av ingen==, och **totalt ordnad multicast**, den strängaste, där ==alla
meddelanden når alla medlemmar i samma ordning==. Kapitel 15 visar hur de implementeras.

### Muntligt svar

1. **Räta ut premissen:** normalt har en port exakt en mottagare men många sändare, och processer kan inte
   dela portar. Undantaget är IP multicast, så frågan handlar om multicast.
2. Säg **ja**, och ge de fyra sakerna: feltolerans med replikerade tjänster, tjänsteupptäckt i spontana
   nät, replikerad data för prestanda, och händelsenotifieringar.
3. Vänd sedan: **IP multicast är otillförlitlig**, med samma utelämnandefel som UDP – några men inte alla
   får meddelandet. Ge ett konkret ställe: en router som tappar eller går ner tar med sig alla bortom sig.
4. Lägg till **ordningsproblemet**: medlemmar kan få samma sändares meddelanden i olika ordning.
5. Gör poängen om att **det beror på användningen**: replikerade tjänster kräver alla-eller-ingen och samma
   ordning, medan tjänsteupptäckt klarar en enstaka förlust.
6. Avsluta med **vad som behövs**: tillförlitlig multicast och totalt ordnad multicast, byggda ovanpå.

Är det bra att en port kan ha flera mottagare? Lägg upp argumentet. (3)
||
- **Räta ut premissen** – normalt har en port en mottagare men många sändare och processer kan inte dela en port; undantaget är IP multicast, där en kopia går till alla lokala sockets som gått med, så frågan gäller multicast
- **Ja** – det ger feltolerans med replikerade tjänster, tjänsteupptäckt i spontana nät, bättre prestanda med replikerad data, och spridning av händelsenotifieringar
- **Men** – IP multicast är otillförlitlig med samma utelämnandefel som UDP, så några men inte alla får meddelandet, och tappas ett datagram mellan två routrar får ingen bortom den det

En port med flera mottagare: utveckla varför svaret beror på användningen. (2)
||
- **Beror på bruket** – replikerade tjänster är hårda fallet, för alla eller ingen måste få varje förfrågan och oftast i samma ordning, annars blir en server inkonsistent; tjänsteupptäckt är lätta fallet, för förfrågningar skickas med jämna mellanrum så en enstaka förlust gör inget
- **Vad som behövs** – starkare garantier ovanpå: tillförlitlig multicast, där alla eller ingen tar emot, och totalt ordnad multicast, där alla får meddelandena i samma ordning

## Fråga 5 – Vad är skillnaderna och likheterna mellan IPC och distribuerade objekt?

Bokens avsnitt: 4.1 för lagren, 4.3.4 för objektreferenser, 5.4 och 5.4.1 för objektmodellen

**Säg relationen först, för den svarar på både likhet och skillnad:** de är ==inte alternativ, de är
lager==. IPC — sockets, meddelandeöverföring, multicast-stöd — är det ==undre middleware-lagret==, och
fjärranrop och distribuerade objekt är ==lagret direkt ovanpå==. Distribuerade objekt ==byggs med IPC==.

**Likheterna.** **Allt blir bytes till slut:** datastrukturerna måste ==plattas till en sekvens av bytes==
före överföring och byggas upp igen vid ankomsten, alltså ==marshalling==, och båda behöver det. Båda måste
==namnge en destination==, och båda får hantera att datorer lagrar tal olika — ==big-endian och
little-endian== — och använder olika teckenkodningar. Båda bygger i praktiken på ==request-reply==, alltså
att en part skickar en förfrågan och väntar på ett svar, och kan ge anropssemantik som ==at-least-once==
(metoden kan hinna köras mer än en gång) och ==at-most-once== (den körs aldrig mer än en gång).

**Skillnaderna, och här ligger kärnan.**

- **Abstraktionen.** IPC är ==meddelandeöverföring==: `send` och `receive` på byte-sekvenser. Ett
  distribuerat objekt ger ==metodanrop== på ett objekt som kan ligga någon annanstans, och ==detaljerna
  döljs==.
- **Hur destinationen anges.** IPC använder ==(internetadress, port)==. Ett distribuerat objekt använder en
  **fjärrobjektreferens**, ==giltig i hela systemet och unik i tid och rum==, som ==aldrig återanvänds==
  efter att objektet tagits bort — gamla anropare kan ha den kvar. Sista fältet bär
  ==gränssnittsinformation==.
- **Gränssnitt.** Varje fjärrobjekt har ett **fjärrgränssnitt** som anger ==vilka metoder som får anropas
  på distans==. Objekt i andra processer kan ==bara== anropa dem; lokala objekt kan anropa alla.
- **Inkapsling tvingas fram.** Att klient och server ligger i olika processer gör att tillståndet nås
  ==bara via objektets metoder==, så ==obehöriga metoder kan inte röra det==. Och eftersom flera fjärranrop
  kan komma samtidigt kan objektet ==skydda sig självt==.
- **Heterogenitet blir gratis.** Just för att objekt bara nås via metoder får ==olika platser använda olika
  dataformat==, utan att klienterna märker det.
- **Parameteröverföringen är rikare.** Du kan skicka parametrar ==inte bara med värde utan också med
  objektreferens==, vilket är attraktivt när parametern är ==stor eller komplex==: mottagaren kan ==nå
  objektet med ett nytt fjärranrop== i stället för att ==hela värdet skickas över nätet==.

### Muntligt svar

1. **Säg relationen först:** de är lager, inte alternativ. IPC är det undre middleware-lagret,
   distribuerade objekt byggs ovanpå.
2. **Likheten som betyder mest:** allt måste marshallas till bytes ändå, alltså packas ihop till en
   byte-sekvens och plockas isär igen, och båda hanterar byteordning och teckenkodning. Båda bygger på
   request-reply.
3. **Abstraktionen:** send och receive på bytes, mot metodanrop där detaljerna döljs.
4. **Destinationen:** adress och port, mot en fjärrobjektreferens som är unik i tid och rum och bär
   gränssnittsinformation.
5. **Inkapsling och heterogenitet:** olika processer tvingar fram inkapsling, och eftersom allt går via
   metoder får platserna använda olika dataformat obemärkt.
6. Avsluta med **parameteröverföringen**: du kan skicka en objektreferens i stället för värdet, vilket är
   vinsten när parametern är stor.

Vilka är likheterna mellan IPC och distribuerade objekt? (3)
||
- **Relationen** – de är inte alternativ utan lager: IPC är det undre middleware-lagret och distribuerade objekt byggs ovanpå det
- **Allt blir bytes** – båda måste marshalla, alltså platta data till en byte-sekvens och bygga upp den igen, och båda sköter byteordning och teckenkodning
- **Request-reply** – båda bygger på att skicka en förfrågan och vänta på svar, och kan ge at-least-once och at-most-once

Vilka är skillnaderna mellan IPC och distribuerade objekt? (3)
||
- **Abstraktion och adress** – IPC är meddelandeöverföring med send och receive på bytes och adresseras med internetadress och port, distribuerade objekt ger metodanrop där detaljerna döljs och adresseras med en fjärrobjektreferens som är unik i tid och rum
- **Inkapsling** – att klient och server ligger i olika processer gör att tillståndet bara nås via objektets metoder, och eftersom allt går via metoder kan olika platser dessutom använda olika dataformat obemärkt
- **Parametrar** – du kan skicka en objektreferens i stället för värdet, vilket vinner när parametern är stor, för då når mottagaren objektet med ett nytt anrop i stället för att hela värdet går över nätet

## Fråga 6 – Vad vinner man på virtualisering?

Bokens avsnitt: 4.5 och 4.5.1 för nätverksvirtualisering, 7.7.1 för systemvirtualisering

Boken har **två slags virtualisering**, och frågan säger inte vilket som avses. Ta båda, och börja med nät
eftersom det är kapitel 4:s.

**Nätverksvirtualisering (4.5)** handlar om att bygga ==många olika virtuella nät ovanpå ett befintligt
nät==, som internet. Varje virtuellt nät kan utformas för ==en bestämd distribuerad tillämpning== och har
==eget adresseringssätt, egna protokoll och egna routingalgoritmer==.

**Varför det behövs:** allt fler olika slags tillämpningar samsas i internet, och det vore ==opraktiskt att
ändra internetprotokollen för att passa var och en== — ==det som förbättrar den ena kan skada den andra==.

**Den stora vinsten, och den knyter ihop kursen:** det ==ger en idé om hur man kommer runt problemet i
Saltzers end-to-end-argument== — boken hedgar med "suggests an answer", så säg inte att det löser det.
Virtualiseringen kringgår det: man bygger ett ==tillämpningsspecifikt virtuellt nät ovanpå ett
befintligt== och ==optimerar det för just den tillämpningen, utan att ändra det underliggande nätets
egenskaper==.

Ett **overlay-nät** är ett virtuellt nät av ==noder och virtuella länkar== ovanpå ett underliggande nät,
som ger ==något som annars inte finns==: en tjänst anpassad för en klass av tillämpningar, ==effektivare
drift== i en viss miljö, eller en ==extra funktion== som multicast eller säker kommunikation.

- **Tre fördelar:** nya nättjänster ==utan att ändra det underliggande nätet==, vilket boken kallar
  avgörande ==givet hur svårt det är att ändra routrarnas funktion==; de ==uppmuntrar experiment== och
  anpassning till särskilda tillämpningsklasser; och ==flera overlays kan samexistera==, vilket ger en
  ==öppnare och mer utbyggbar nätarkitektur==.
- **Två nackdelar:** ==ett extra lager av indirektion==, som kan kosta prestanda, och ==högre komplexitet==
  än TCP/IP:s relativt enkla arkitektur.

**Systemvirtualisering (7.7.1)** ger ==flera virtuella maskiner ovanpå en fysisk maskinarkitektur==, där
==varje virtuell maskin kör en egen instans av ett operativsystem==, styrda av en **hypervisor**. Vinsten
mot processer, som historiskt gjorde samma jobb, är ==säkerhet, renare uppdelning av uppgifter och
exaktare debitering== per användare. De
konkreta vinsterna boken pekar på: virtuella maskiner kan ==migreras ganska enkelt==, vilket ger
flexibilitet i driften och kan ==minska investeringen i serverdatorer och sänka energiförbrukningen==, och
det ==möjliggör direkt infrastructure as a service==.

### Muntligt svar

1. **Säg att det finns två slag** – nätverks- och systemvirtualisering. Pressas du på tid, ta
   nätverksvirtualisering först, eftersom det är kapitlets.
2. **Nät:** många virtuella nät ovanpå ett befintligt, vart och ett med egen adressering, egna protokoll
   och egen routing, utformat för en bestämd tillämpning.
3. Ge **motivet och den stora vinsten**: man kan inte ändra internetprotokollen för allas skull, för det
   som hjälper en tillämpning skadar en annan. Ett tillämpningsspecifikt virtuellt nät antyder ett svar på
   dilemmat i Saltzers end-to-end-argument – optimering utan att ändra nätet under.
4. Ge **overlays för- och nackdelar**: nya tjänster utan att ändra nätet, experiment, flera samexisterar –
   mot ett extra lager indirektion och mer komplexitet.
5. **System:** flera virtuella maskiner med egna operativsystem på en fysisk maskin, styrda av en
   hypervisor. Vinsten mot processer är säkerhet, ren uppdelning och exakt debitering.
6. Avsluta med **de starkaste konkreta vinsterna**: maskiner kan migreras ganska enkelt, vilket sänker både
   hårdvaruinvestering och energiförbrukning, och det möjliggör infrastructure as a service.

Vad vinner man på virtualisering - nätverksvirtualisering? (3)
||
- **Vad det är** – många virtuella nät ovanpå ett befintligt nät som internet, vart och ett med egen adressering, egna protokoll och egen routing och utformat för en bestämd tillämpning
- **Varför det behövs** – man kan inte ändra internetprotokollen för allas skull eftersom det som hjälper en tillämpning skadar en annan, och ett tillämpningsspecifikt nät antyder en väg runt problemet i Saltzers end-to-end-argument
- **Overlays** – ett overlay ger nya tjänster utan att ändra nätet under, uppmuntrar experiment och låter flera samexistera, men kostar ett extra lager indirektion och mer komplexitet

Vad vinner man på virtualisering - systemvirtualisering? (2)
||
- **Vad det är** – flera virtuella maskiner på en fysisk maskin, där varje maskin kör sitt eget operativsystem, styrda av en hypervisor
- **Vinsten** – mot processer ger det säkerhet, ren uppdelning och exakt debitering, och maskiner kan migreras enkelt vilket sänker hårdvara och energi och möjliggör infrastructure as a service

## Luckor och källor

**Ingen av de sex frågorna saknar svar i boken.** Två behöver material utanför kapitel 4: **fråga 5**
hämtar objektmodellen ur **5.4 och 5.4.1**, medan kapitel 4 bara ger fjärrobjektreferensens format i
**4.3.4**; och **fråga 6** hämtar systemvirtualisering ur **7.7.1**, utanför kursens läslista, eftersom
kapitel 4 bara täcker nätverksvirtualisering. Frågan säger inte vilket slag som avses, så båda står här.

**Medvetet utanför noten**, eftersom ingen tentafråga rör det: Java-API:er och kodexempel, CORBA CDR:s
byte-layout och IDL, Javas serialisering i detalj, XML:s element- och attributsyntax, välformat, CDATA och
DTD:er, multicast-adressblocken, Skype och Xen som fallstudier, full- och paravirtualisering, samt hela
§4.6 om MPI.
