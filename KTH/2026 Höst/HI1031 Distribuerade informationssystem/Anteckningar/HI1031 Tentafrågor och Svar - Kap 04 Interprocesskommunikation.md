---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-08
updated: 2026-09-09
description: "Svar på kursens sex tentafrågor om interprocesskommunikation: hur ett IPC-anrop karakteriseras, vad XML är och används till, tre typer av IPC, portar med flera mottagare, IPC jämfört med distribuerade objekt, och vad virtualisering ger."
---
# HI1031 Tentafrågor och Svar - Kap 04 Interprocesskommunikation

Noten täcker de sex tentafrågorna för kapitel 4 och ingenting annat. Varje fråga har fakta ur boken och
ett **Muntligt svar** med talpunkter i den ordning du ska säga dem. Står det **Så kan du tänka** är det
mina ord, inte bokens.

## Fråga 1 – På vilka olika sätt kan man karakterisera ett IPC-anrop?

Bokens avsnitt: 4.2.1

IPC görs med två operationer, **send** och **receive**. En process skickar ett meddelande — ==en sekvens
av bytes== — till en destination, och en annan process där tar emot det. Boken karakteriserar ett anrop
på **fyra sätt**.

**1. Synkront eller asynkront.** Varje destination har en **kö**. Sändaren lägger i en ==fjärrkö==,
mottagaren plockar ur sin ==lokala kö==.

- **Synkront:** ==både send och receive blockerar==. `send` blockerar till motsvarande `receive` görs,
  `receive` blockerar till ett meddelande kommer.
- **Asynkront:** `send` är ==icke-blockerande== — sändaren fortsätter så snart meddelandet kopierats till
  en lokal buffert, och överföringen sker ==parallellt==.
- **Bokens slutsats, värd att kunna:** med trådar, som i Java, har blockerande `receive` ==inga
  nackdelar== — en tråd kan blockera medan andra jobbar. Icke-blockerande *ser* effektivare ut men lägger
  komplexitet på mottagaren, så ==dagens system brukar inte ha icke-blockerande receive==.

**2. Meddelandets destination.** Meddelanden skickas till ett par ==(internetadress, lokal port)==. En
port är en destination inuti en dator, angiven som ett heltal. **En port har exakt en mottagare, men kan
ha många sändare** — multicast är undantaget. Vem som helst som känner portnummret får skicka dit, och
servrar publicerar sina portnummer.

**3. Tillförlitlighet**, definierad med ==giltighet och integritet==. Giltighet: tjänsten är tillförlitlig
om meddelanden ==garanteras komma fram trots ett "rimligt" antal tappade paket==, och otillförlitlig om de
inte garanteras ==ens vid ett enda== tappat paket. Integritet: de ska komma fram ==oskadade och utan
dubbletter==.

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

## Fråga 2 – Beskriv vad XML är och vad det kan användas till

Bokens avsnitt: 4.3.3, plus 4.3

**Vad det är.** XML, *Extensible Markup Language*, är ett **märkspråk** definierat av **W3C**. Ett
märkspråk är en ==textbaserad kodning som representerar både en text och dess struktur eller utseende==.
Både XML och HTML kommer från **SGML**. HTML gjordes för ==hur en webbsida ser ut==, XML för
==strukturerade dokument==.

**Skillnaden mot HTML:** XML:s taggar beskriver ==den logiska strukturen== hos det de omsluter. HTML:s
taggar säger ==hur webbläsaren ska visa== texten. Och XML är **extensible** — ==du får definiera egna
taggar==, medan HTML har en fast uppsättning. Men ska dokumentet användas av ==mer än en tillämpning måste
taggnamnen vara överenskomna==, och därför är **SOAP** ett XML-format vars taggar är ==publicerade==.

**Det är självbeskrivande, och det är poängen.** CORBA CDR behöver inte vara det, för sändare och
mottagare känner redan ordningen och typerna. XML skulle användas av ==flera tillämpningar för olika
syften==, och taggarna plus **namnrymder** gör det möjligt — en namnrymd är en uppsättning namn
==refererad med en URL==, så en tillämpning kan använda ==flera uppsättningar definitioner utan
namnkollisioner==. Taggarna ger en andra vinst: en tillämpning kan ==välja bara de delar den behöver== och
==påverkas inte om någon lägger till information för en annan tillämpning==. Ett **schema** anger sedan
vilka element och attribut som får finnas, i vilken ordning och av vilken typ — en SOAP-mottagare
==validerar med samma schema som avsändaren kodade med==.

**Vad det används till, enligt boken:** **webbtjänster** i första hand — klienter pratar med dem i XML
(SOAP), och XML ==definierar deras gränssnitt och andra egenskaper==. Dessutom **arkivering och
återsökning**, där ett XML-arkiv kan bli ==större än ett binärt== men går att ==läsa på vilken dator som
helst==, samt **specifikation av användargränssnitt** och **kodning av konfigurationsfiler i
operativsystem**.

**Priset måste med.** Text i stället för binärt, plus taggarna, gör ==meddelandena stora==, vilket ger
==tar längre tid att bearbeta och skicka, och kräver mer lagring==. Motmedlet: ==HTTP 1.1 tillåter
komprimering==.

**Så mycket struktur behöver du:** ett **element** är teckendata mellan matchande start- och sluttagg, och
att ett element kan ==omsluta ett annat== ger ==hierarkisk data== — boken kallar det en mycket viktig del av
XML. Ett **attribut** är ett namn-värde-par i starttaggen: ==elementet är behållaren för data, attributet
märker upp den==. Och dokumentet måste vara **välformat** — varje starttagg har en sluttagg, taggarna är
==korrekt nästlade==, och det finns ==ett enda rotelement==.

### Muntligt svar

1. **Definiera**: ett märkspråk från W3C för strukturerade dokument, ur SGML precis som HTML.
2. Ge **skillnaden mot HTML**: XML:s taggar beskriver strukturen, HTML:s utseendet. Och du får hitta på
   egna taggar.
3. Säg att det är **självbeskrivande**, och varför: det ska kunna användas av flera tillämpningar som inte
   känner varandra i förväg. Nämn namnrymder.
4. Ge **användningarna**: webbtjänster och SOAP först, sedan arkivering, gränssnitt och
   konfigurationsfiler.
5. Ge **priset**: text plus taggar ger stora meddelanden och längre tider – men HTTP 1.1 kan komprimera.
6. Har du tid: nämn **schema**, och att avsändare och mottagare av ett SOAP-meddelande använder samma.

## Fråga 3 – Beskriv tre olika typer av IPC

Bokens avsnitt: 4.2.3, 4.2.4 och 4.4

Ta de tre kapitlet bygger på: **UDP-datagram, TCP-strömmar och multicast.**

**1. UDP-datagram — meddelandeöverföring, den enklaste formen.** Sändaren skickar ett ==enskilt
meddelande==, och de oberoende paketen kallas ==datagram==. Ett datagram skickas ==utan bekräftelse och
utan omsändning==, så blir det fel kan meddelandet ==inte komma fram alls==. Båda parter skapar först en
**socket** bunden till en lokal adress och port.

- **Felmodell:** ==utelämnandefel== och ==leverans i fel ordning==. Meddelandet kan dessutom
  ==trunkeras vid ankomsten== om det är för stort för mottagarens byte-array.
- **Används av** ==DNS== och ==Voice over IP==, just för att man slipper omkostnaderna för garanterad
  leverans.

**2. TCP-strömmar — en tvåvägsström av bytes** ==utan meddelandegränser==. Det ger en byggsten för
==producent-konsument==: data köas hos mottagaren till konsumenten är redo.

- **Vad strömmen döljer:** meddelandestorlekar, ==tappade meddelanden== via bekräftelser och omsändning,
  ==flödeskontroll== som blockerar en skrivare snabbare än läsaren, samt ==dubbletter och ordning==.
- **Destinationen döljs också:** processerna ==upprättar en förbindelse== först och sedan skriver och läser
  de bara i strömmen, ==utan att ange adress och port==. Uppkopplingen är `connect` följd av `accept`, och
  det kan bli ==en betydande omkostnad för en enda fråga och ett enda svar==.
- **Felmodell:** checksummor och sekvensnummer ger integritet, timeout och omsändning ger giltighet.
  **Men TCP är inte tillförlitlig kommunikation** — passerar paketförlusten en gräns, eller kapas eller
  överbelastas nätet, ==förklarar TCP förbindelsen bruten==. Boken ger två följder av det: processerna kan
  ==inte skilja ett nätfel från att processen i andra änden dött==, och de kan ==inte veta om det de
  nyligen skickade kom fram==.
- **Används av** ==HTTP, FTP, Telnet och SMTP==.

**3. Multicast — ett meddelande till en grupp.** En **multicast-operation** skickar ==ett enda meddelande
från en process till varje medlem i en grupp==, normalt så att ==medlemskapet är transparent för
sändaren==. Det enklaste protokollet ger ==inga garantier== om leverans eller ordning.

- **IP multicast** byggs ovanpå IP, och gruppen anges med en ==klass D-adress==. Sändaren ==känner inte
  medlemmarna eller gruppens storlek==, medlemskapet är ==dynamiskt==, och man ==får skicka utan att vara
  medlem==. På programmeringsnivå är det ==bara tillgängligt via UDP==.
- **Felmodell:** ==samma som UDP, alltså utelämnandefel==, vilket gör den ==otillförlitlig==.

**Så kan du tänka:** de tre skiljer sig på en enda axel — hur mycket arbete protokollet gör för dig. UDP
gör nästan inget och är snabbast, TCP gör ordning och omsändning men kostar en uppkoppling, och multicast
byter bort båda garantierna mot att nå många på en gång.

### Muntligt svar

1. Namnge de tre: **UDP-datagram, TCP-strömmar, multicast.**
2. **UDP:** enskilda meddelanden, ingen bekräftelse, ingen omsändning – utelämnandefel och fel ordning.
   DNS och VoIP använder det för att slippa omkostnaderna.
3. **TCP:** en tvåvägsström av bytes utan meddelandegränser, som döljer storlekar, förluster,
   flödeskontroll och ordning. Uppkoppling först, sedan bara läs och skriv.
4. Lägg till **TCP:s begränsning**: det är inte tillförlitlig kommunikation, för vid tillräcklig förlust
   förklaras förbindelsen bruten – och då vet processen inte om felet var nätet eller den andra processen.
5. **Multicast:** ett meddelande till varje gruppmedlem, medlemskapet transparent för sändaren, bara via
   UDP – och samma utelämnandefel som UDP.
6. Avsluta med **axeln**: de skiljer sig på hur mycket protokollet gör åt dig, och vad det kostar.

## Fråga 4 – Är det speciellt bra att en port kan ha flera mottagare? Utveckla

Bokens avsnitt: 4.2.2 för utgångsläget, 4.4 och 4.4.2 för svaret

**Räta ut premissen först, för boken säger något annat.** Normalt har ==en port exakt en mottagare men kan
ha många sändare==, och en process kan ==inte dela en port== med andra processer på samma dator.
**Undantaget är IP multicast** — de processerna ==delar faktiskt portar==: när ett multicast-meddelande
kommer till en dator skickas ==kopior till alla lokala sockets== som gått med i adressen och är bundna till
portnummret. Så frågan handlar om multicast.

**Svaret är ja, och boken ger fyra saker det gör möjligt:**

1. **Feltolerans med replikerade tjänster.** Tjänsten är en ==grupp av servrar==, förfrågan multicastas
   till alla, som gör ==samma operation==. ==Även när några går ner kan klienterna betjänas.==
2. **Att hitta tjänster i spontana nät.** Servrar och klienter använder multicast för att ==hitta
   tillgängliga upptäckartjänster==. ==Jini använder IP multicast== till det.
3. **Bättre prestanda med replikerad data.** Replikerna kan ligga i ==användarnas egna datorer==, och varje
   gång datan ändras ==multicastas det nya värdet== till processerna som sköter dem.
4. **Spridning av händelsenotifieringar.** Bokens exempel: ändrar någon sin status i Facebook får alla
   vännerna notifieringar. Och ==publish-subscribe kan använda gruppmulticast==.

**Men — och det är vad "utveckla" frågar efter — IP multicast räcker inte hela vägen.**

- Felmodellen är ==samma som UDP:s, utelämnandefel==. Ett meddelande ==garanteras inte nå någon bestämd
  medlem== ens vid ett enda utelämnandefel: ==några men inte alla== kan få det. Boken kallar det
  ==otillförlitlig multicast==.
- **Var det brister:** tappas ett datagram ==mellan två multicast-routrar== får ==ingen mottagare bortom
  den routern== meddelandet. Går en router ner missar medlemmarna bortom den det, ==medan lokala medlemmar
  kan få det==.
- **Ordningen är också ett problem.** IP-paket kommer ==inte nödvändigtvis i den ordning de skickades==, så
  några medlemmar kan få ==samma sändares datagram i annan ordning än andra==. Och meddelanden från ==två
  olika sändare== kommer inte nödvändigtvis i ==samma ordning hos alla==.

**Hur mycket det skadar beror på användningen, och det är den bästa poängen i svaret.** Replikerade
tjänster är det hårda fallet: servrarna startar i samma tillstånd och måste göra samma operationer i samma
ordning, så det krävs att ==antingen alla eller ingen== får varje förfrågan — ==missar en enda medlem en
förfrågan blir den inkonsistent== — och oftast att ==alla får dem i samma ordning==. Tjänsteupptäckt är
det lätta fallet: förfrågningar multicastas ==med jämna mellanrum==, så ==en enstaka förlust är inget
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

## Fråga 5 – Vad är skillnaderna och likheterna mellan IPC och distribuerade objekt?

Bokens avsnitt: 4.1 för lagren, 4.3.4 för objektreferenser, 5.4 och 5.4.1 för objektmodellen

**Säg relationen först, för den svarar på både likhet och skillnad:** de är ==inte alternativ, de är
lager==. IPC — sockets, meddelandeöverföring, multicast-stöd — är det ==undre middleware-lagret==, och
fjärranrop och distribuerade objekt är ==lagret direkt ovanpå==. Distribuerade objekt ==byggs med IPC==.

**Likheterna.** **Allt blir bytes till slut:** datastrukturerna måste ==plattas till en sekvens av bytes==
före överföring och byggas upp igen vid ankomsten, vilket är ==marshalling==, och båda behöver det. Båda
måste ==namnge en destination==, och båda får hantera att datorer lagrar tal olika — ==big-endian och
little-endian== — och använder olika teckenkodningar. Båda bygger också i praktiken på ==request-reply==
och kan ge anropssemantik som ==at-least-once== (metoden kan hinna köras mer än en gång) och
==at-most-once== (den körs aldrig mer än en gång).

**Skillnaderna, och här ligger kärnan.**

- **Abstraktionen.** IPC är ==meddelandeöverföring==: `send` och `receive` på byte-sekvenser. Ett
  distribuerat objekt ger ==metodanrop== på ett objekt som kan ligga någon annanstans, och ==detaljerna
  döljs==.
- **Hur destinationen anges.** IPC använder ==(internetadress, port)==. Ett distribuerat objekt använder en
  **fjärrobjektreferens**, ==giltig i hela systemet== och ==unik i tid och rum==, byggd av exempelvis
  ==värddatorns adress, processens portnummer, tiden för skapandet och ett lokalt objektnummer==, med
  ==gränssnittsinformation== i sista fältet. Den får ==aldrig återanvändas== efter att objektet tagits bort,
  för gamla anropare kan ha den kvar.
- **Gränssnitt.** Varje fjärrobjekt har ett **fjärrgränssnitt** som anger ==vilka metoder som får anropas
  på distans==. Objekt i andra processer kan ==bara== anropa dem; lokala objekt kan anropa alla.
- **Inkapsling, en riktig vinst.** Att klient och server ligger i olika processer ==tvingar fram
  inkapsling==: tillståndet nås ==bara via objektets metoder==, så ==obehöriga metoder kan inte röra det==.
  Och eftersom flera fjärranrop kan komma samtidigt kan objektet ==skydda sig självt==.
- **Heterogenitet blir gratis.** Just för att objekt bara nås via metoder får ==olika platser använda olika
  dataformat==, och klienterna ==märker det inte==.
- **Parameteröverföringen är rikare.** Du kan skicka parametrar ==inte bara med värde utan också med
  objektreferens==. Det är attraktivt när parametern är ==stor eller komplex==: mottagaren kan ==nå objektet
  med ett nytt fjärranrop== i stället för att ==hela värdet skickas över nätet==.

**Så kan du tänka:** frågan handlar om var arbetet ligger. Med IPC gör ==du== jobbet — format, felfall,
portar. Med distribuerade objekt gör ==middleware== det, och du betalar med ett lager du inte ser in i.

### Muntligt svar

1. **Säg relationen först:** de är lager, inte alternativ. IPC är det undre middleware-lagret,
   distribuerade objekt byggs ovanpå.
2. **Likheten som betyder mest:** allt måste marshallas till bytes ändå, och båda hanterar byteordning och
   teckenkodning. Båda vilar på request-reply.
3. **Abstraktionen:** send och receive på bytes, mot metodanrop där detaljerna döljs.
4. **Destinationen:** adress och port, mot en fjärrobjektreferens som är unik i tid och rum och bär
   gränssnittsinformation.
5. **Inkapsling och heterogenitet:** olika processer tvingar fram inkapsling, och eftersom allt går via
   metoder får platserna använda olika dataformat obemärkt.
6. Avsluta med **parameteröverföringen**: du kan skicka en objektreferens i stället för värdet, vilket är
   vinsten när parametern är stor.

## Fråga 6 – Vad vinner man på virtualisering?

Bokens avsnitt: 4.5 och 4.5.1 för nätverksvirtualisering, 7.7.1 för systemvirtualisering

Boken har **två slags virtualisering**. Ta båda, och börja med nät eftersom det är kapitel 4:s.

**Nätverksvirtualisering (4.5)** handlar om att bygga ==många olika virtuella nät ovanpå ett befintligt
nät==, som internet. Varje virtuellt nät kan utformas för ==en bestämd distribuerad tillämpning== och har
==eget adresseringssätt, egna protokoll och egna routingalgoritmer==.

**Varför det behövs:** allt fler olika slags tillämpningar samsas i internet, och det vore ==opraktiskt att
ändra internetprotokollen för att passa var och en== — ==det som förbättrar den ena kan skada den andra==.

**Den stora vinsten, och den knyter ihop kursen:** det ==ger en idé om hur man kommer runt problemet i
Saltzers end-to-end-argument== — boken hedgar med "suggests an answer", så säg inte att det löser det.
Argumentet säger att ==vissa funktioner bara kan göras helt och tillförlitligt med hjälp från
tillämpningen i ändpunkterna==, så man bör inte bygga in dem i nätet. Virtualiseringen kringgår
det: man bygger ett ==tillämpningsspecifikt virtuellt nät ovanpå ett befintligt== och ==optimerar det
för just den tillämpningen, utan att ändra det underliggande nätets egenskaper==.

Ett **overlay-nät** är ett virtuellt nät av ==noder och virtuella länkar== ovanpå ett underliggande nät,
som ger ==något som annars inte finns==: en tjänst anpassad för en klass av tillämpningar, ==effektivare
drift== i en viss miljö, eller en ==extra funktion== som multicast eller säker kommunikation.

- **Tre fördelar:** nya nättjänster ==utan att ändra det underliggande nätet==, vilket boken kallar
  avgörande ==givet hur svårt det är att ändra routrarnas funktion==; de ==uppmuntrar experiment== och
  anpassning till särskilda tillämpningsklasser; och ==flera overlays kan samexistera==, vilket ger en
  ==öppnare och mer utbyggbar nätarkitektur==.
- **Två nackdelar:** ==ett extra lager av indirektion==, som kan kosta prestanda, och ==högre komplexitet==
  än TCP/IP:s relativt enkla arkitektur.

**Systemvirtualisering (7.7.1)** har som mål ==flera virtuella maskiner, alltså virtuella hårdvarubilder,
ovanpå en fysisk maskinarkitektur==, där ==varje virtuell maskin kör en egen instans av ett
operativsystem==. Virtualiseringssystemet ==fördelar de fysiska processorerna och övriga resurser== mellan
dem.

**Vinsten jämfört med processer**, som historiskt gjorde samma jobb: det ger ==säkerhet och renare
uppdelning av uppgifter==, och gör att man kan ==fördela och ta betalt för varje användares
resursanvändning mer exakt==.

**Bokens användningsfall är svaret på "vad vinner man":**

- **På servrar:** ge varje tjänst en egen virtuell maskin och ==fördela maskinerna optimalt över de fysiska
  servrarna==. Till skillnad från processer kan virtuella maskiner ==migreras ganska enkelt==, vilket ger
  ==flexibilitet i driften== och kan ==minska investeringen i serverdatorer och sänka
  energiförbrukningen== — en nyckelfråga för stora serverhallar.
- **Molntjänster:** virtualisering ==möjliggör direkt infrastructure as a service==.
- **Dynamik och blandade miljöer:** maskiner kan skapas och tas bort ==med liten omkostnad==, vilket
  tillämpningar som flerspelarspel online behöver, och man kan köra ==flera operativsystem på ett
  skrivbord==.

**Hur det görs, och termen du måste kunna:** ett ==tunt lager mjukvara== ovanpå den fysiska arkitekturen,
kallat **virtual machine monitor** eller **hypervisor**. I **full virtualisering** ger den ett ==identiskt
gränssnitt== mot den fysiska arkitekturen, så ==befintliga operativsystem kan köra transparent och
oförändrat==. Men det är ==svårt att få bra prestanda== på många arkitekturer, ==x86 inräknad==, så det
finns **paravirtualisering** med ett ==modifierat gränssnitt== — bättre prestanda, men
==operativsystemen måste portas== till det.

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
6. Avsluta med **de starkaste konkreta vinsterna**: maskiner kan migreras enkelt, vilket sänker både
   hårdvaruinvestering och energiförbrukning, det möjliggör infrastructure as a service – och tillämpningar
   behöver inte skrivas om.

## Luckor och källor

**Ingen av de sex frågorna saknar svar i boken.** Två behöver material utanför kapitel 4: **fråga 5**
hämtar objektmodellen ur **5.4 och 5.4.1**, medan kapitel 4 bara ger fjärrobjektreferensens format i
**4.3.4**; och **fråga 6** hämtar systemvirtualisering ur **7.7.1**, utanför kursens läslista, eftersom
kapitel 4 bara täcker nätverksvirtualisering. Frågan säger inte vilket slag som avses, så ta båda.

**En sak att inte bli förvirrad av.** Boken har ett korrekturfel i §4.2.1: den hänvisar till §4.5.1 för
multicast-portar, men rätt avsnitt är **§4.4.1**. Söker du upp det i boken, gå dit.

**Det som inte är utskrivet här** frågas inte av någon tentafråga: Java-API:er och kodexempel, CORBA CDR:s
byte-layout och IDL, Javas serialisering i detalj, XML:s CDATA och DTD:er, multicast-adressblocken, Skype
och Xen som fallstudier, samt hela §4.6 om MPI.
