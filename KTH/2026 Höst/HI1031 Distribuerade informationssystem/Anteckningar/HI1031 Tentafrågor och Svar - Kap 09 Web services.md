---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-09
updated: 2026-09-09
description: "Svar på tentafrågorna för kapitel 9 om web services: vad en webbtjänst är och när den används, låg koppling, REST med sina sex principer och hypermedias roll, jämförelsen mot distribuerade objekt, SOA, samt relationen mellan Ajax och webbtjänster."
---

# HI1031 Tentafrågor och Svar - Kap 09 Web services

Kapitlet har fem tentafrågor. Fråga 2 om REST har **två källor** som delvis säger olika saker, och
fråga 5 om Ajax kräver att du själv bygger bryggan — boken gör det aldrig. Båda sakerna står
förklarade i `## Luckor och källor` sist.

## 1. Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster

Bokens avsnitt: §9.1 och §9.2, plus §9.3 om tjänstebeskrivningar.

**Vad det är.** Ett webbtjänstgränssnitt består **normalt** av en ==samling operationer som en klient
kan använda över internet==. Tjänsten identifieras av en ==URI==, och klienten skickar meddelanden
formaterade i ==XML==. Operationerna kan bakom kulisserna utföras av vad som helst — program, objekt
eller databaser.

**Varför de finns: webbläsaren är för allmän.** I den ursprungliga klient-servermodellen var **båda**
sidor funktionellt specialiserade. Webbläsaren är tvärtom en ==generell klient==, och det begränsar
vilka tillämpningar man kan bygga. Webbtjänster ==går tillbaka till den gamla modellen==: en
tillämpningsspecifik klient pratar med en tjänst som har ett funktionellt specialiserat gränssnitt.
Följden är att **webbtjänster inte kan nås direkt av en webbläsare**.

**Blanda inte ihop web server och web service.** En ==webbserver== ger en grundläggande HTTP-tjänst.
En ==webbtjänst== ger en tjänst byggd på de operationer som står i dess gränssnitt. En webbtjänst kan
tillhandahållas av en webbserver, men servern **behöver inte** vara en webbserver.

**Tjänstebeskrivningen ersätter binder-tjänsten.** En webbtjänst ger **normalt** en
==tjänstebeskrivning==: gränssnittsdefinitionen plus hur meddelanden ska skickas (till exempel SOAP
över HTTP) och tjänstens URI. Den är ==överenskommelsen mellan klient och server== om vad tjänsten
erbjuder, och används **normalt** för att generera klientens ==stubbar== automatiskt — den lokala kod
som paketerar anropet och skickar det vidare. Att URI:n ligger **i** beskrivningen ==gör en separat
binder eller namntjänst onödig==, vilket annars behövs i de flesta mellanprogram. Priset: ==URI:n kan
inte ändras== när beskrivningen väl är publicerad.

**När de används.**

- **Över organisationsgränser, utan människa i loopen.** Ett klientprogram i en organisation kan prata
  med en server i en annan ==utan mänsklig övervakning==. Det är hela poängen med kapitlet.
- **För att kombinera tjänster till nya tjänster.** Bokens exempel: om flyg-, hotell- och
  hyrbilssajter alla hade webbtjänstgränssnitt kunde en ==resebyråtjänst== väva ihop dem till ett
  erbjudande. En webbtjänst kan alltså vara klient till en annan webbtjänst.
- **När HTTP är enda vägen in.** De flesta organisationer har ==brandvägg==, och transportprotokollen
  som Java RMI och CORBA använder släpps **normalt inte** igenom. HTTP och SMTP släpps **normalt**
  igenom, så det är praktiskt att transportera meddelandena med dem.
- **Riktiga exempel:** Amazon, Yahoo, Google och eBay erbjuder alla webbtjänstgränssnitt. Amazons
  ==kan nås både med SOAP och med REST== — cirka ==80 procent av anropen går via REST== — och låter
  tredje part bygga vidare; över 50 000 utvecklare registrerade sig de två första åren. Ett annat
  exempel är ==*sniping* på eBay==: att lägga ett bud under sista sekunderna, vilket en människa inte
  hinner göra lika snabbt.

**Låg koppling — vad det betyder.** Boken varnar först: begreppet är ==ofta luddigt och oprecist
använt==. I webbtjänstsammanhang betyder låg koppling att ==hålla beroendena mellan tjänster så små som
möjligt==, så att ==en ändring i en tjänst inte välter de andra==.
Webbtjänster får det **delvis** gratis genom att de är tänkta att vara oberoende och kombinerbara.

**Tre saker som förstärker den.**

1. **Programmering mot gränssnitt.** Att ==skilja gränssnittet från implementationen== ger en nivå av
   låg koppling, och hanterar samtidigt heterogenitet i programspråk och plattform. Det gör de flesta
   paradigmen, även distribuerade objekt.
2. **Enkla, generella gränssnitt.** Trenden går mot minimala gränssnitt — webben själv och ==REST== är
   exemplen. Det minskar beroendet av ==specifika operationsnamn==. En följd: ==data blir viktigare än
   operation==, och betydelsen av samspelet ligger ofta i datat i stället (i webbtjänster: XML-schemat).
3. **Valet av kommunikationsparadigm.** Det påverkar kopplingsgraden direkt. I ==request-reply är de
   två parterna i grunden kopplade==; ==asynkrona meddelanden ger en viss frikoppling== — boken kallar
   det *synkroniseringsfrikoppling*, alltså att ==avsändaren inte behöver stå och vänta==; ==indirekt
   kommunikation ger dessutom frikoppling i tid och rum==, alltså att parterna varken behöver känna
   varandra eller finnas samtidigt (kapitel 6).

**Så kan du tänka:** låg koppling är inte en egenskap man har eller inte har, utan flera axlar
samtidigt. Boken avslutar just så — det finns flera dimensioner, och man bör ha det i huvudet när man
använder ordet.

**Protokoll och arkitekturer att nämna.**

- **XML** — textformatet för extern datarepresentation och ==marshalling==, alltså att packa ihop data
  till något som kan skickas över nätet och plockas isär i andra änden. Skrymmande och långsammare att
  parsa än binära format, men valt för ==läsbarheten och därmed enklare felsökning==.
- **SOAP** — reglerna för hur XML används för att ==packa meddelanden==, hur ett par enkelriktade
  meddelanden bildar ==request-reply==, och hur HTTP och SMTP ska användas för att skicka dem.
  Meddelandet ligger i en ==envelope== med en valfri ==header== och en ==body==. Kuvertet innehåller
  ingen destinationsadress — det är transportprotokollets sak.
- **REST** — alternativet till SOAP, se fråga 2.
- **WSDL** — språket tjänstebeskrivningar normalt skrivs i. Det ==skiljer den abstrakta delen från den
  konkreta==.
- **WS-Addressing** och **WS-ReliableMessaging** — påbyggnader som lägger routingdata i SOAP-headers
  respektive ger garanterad leverans av ==enskilda meddelanden==. Obs: det senare är **inte** samma sak
  som anropssemantiken i §5.3.1, som handlar om hur många gånger servern kör proceduren.

### Muntligt svar

1. En webbtjänst är en samling operationer som nås över internet, identifierad av en URI, med
   meddelanden i XML. Den kan inte nås direkt av en webbläsare.
2. Poängen är att gå tillbaka till specialiserade klienter: en webbläsare är för allmän för att bygga
   riktiga tillämpningar på.
3. Den används mellan organisationer utan människa i loopen, och för att kombinera flera tjänster till
   en ny — resebyråexemplet. Amazon, Google och eBay har alla sådana gränssnitt.
4. Praktiskt skäl: brandväggar släpper igenom HTTP och SMTP men normalt inte RMI:s eller CORBA:s
   transport.
5. Låg koppling betyder att minimera beroendena mellan tjänster så att en ändring inte fortplantar
   sig. Boken påpekar att ordet ofta används luddigt.
6. Tre saker förstärker den: programmering mot gränssnitt, enkla generella gränssnitt som REST, och
   valet av kommunikationsparadigm — request-reply kopplar, asynkront frikopplar.

## 2. Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia

Bokens avsnitt: rutan i §9.2. **Övrig källa:** restfulapi.net "What is REST?", som KursPM kräver.
**Läs varningen sist i frågan** — de två källorna säger delvis olika saker, och det är avsiktligt
återgivet.

**Bokens beskrivning.** REST (Representational State Transfer, Fielding 2000) är enligt boken ett
==mycket hårt begränsat sätt att arbeta==: klienten använder ==URL:er och HTTP-operationerna GET, PUT,
DELETE och POST== för att hantera resurser som representeras i ==XML==. Tyngdpunkten ligger på
==hanteringen av dataresurser, inte på gränssnitt==. Skapas en ny resurs får den en ==ny URL== att nås
och uppdateras genom. Klienten får ==hela resursens tillstånd== i stället för att anropa en operation
för att hämta en del av det. Fieldings argument, som boken återger: på internet är ==en enkel minimal
och likformig uppsättning operationer== mer användbar än en flodvåg av olika tjänstegränssnitt.

**De sex principerna — källa: restfulapi.net, inte kursboken.** Boken listar inga namngivna principer
alls. Sidan är tydlig med att principerna ==måste uppfyllas== för att ett tjänstegränssnitt ska få
kallas **RESTful**. REST är ==varken ett protokoll eller en standard== — det är en arkitekturstil.

1. **Likformigt gränssnitt** (*uniform interface*) — uppnås av fyra villkor: att varje resurs
   ==identifieras unikt==; att resurser ==hanteras genom representationer==; att meddelanden är
   ==självbeskrivande==, alltså bär nog information för att beskriva hur de ska behandlas; och
   ==HATEOAS==, se nedan.
2. **Klient-server** — ==separation of concerns==, så att gränssnitt och datalagring kan utvecklas
   oberoende. Kontraktet mellan dem får däremot inte gå sönder.
3. **Tillståndslöshet** — ==varje anrop måste bära all information== som behövs för att förstå och
   utföra det. Servern får ==inte== använda tidigare sparad kontext, så ==klienten håller hela
   sessionstillståndet==.
4. **Cachebarhet** — svaret ska ==märka sig självt== som cachebart eller inte. Är det cachebart får
   klienten återanvända det för likvärdiga anrop under en angiven tid.
5. **Skiktat system** — arkitekturen får byggas av hierarkiska lager, där varje komponent ==bara ser
   närmaste lager==.
6. **Kod på begäran** — **valfri**. Klienten kan utökas genom att ==ladda ner och köra kod==, som
   skript eller applets.

**Hur resurser accessas.** Resursen är ==REST:s centrala abstraktion==: allt som kan namnges kan vara
en resurs. Den nås via en ==resursidentifierare (URI)==, och det man faktiskt skickar är en
==representation== av resursens tillstånd vid ett givet tillfälle. En representation består av tre
delar: ==datat==, ==metadata som beskriver datat==, och ==hypermedialänkarna== som tar klienten till
nästa önskade tillstånd. Ett REST-API är därmed ==en samling sammanlänkade resurser==.

- **Resurs och representation är skilda saker.** Därför kan samma resurs levereras i olika format —
  HTML, XML, ren text, PDF, JPEG, JSON. Representationens format kallas dess ==media type==, och
  media-typen pekar på specifikationen för hur representationen ska behandlas.
- **Metadata styr det praktiska:** cachning, upptäckt av överföringsfel, förhandling om format, samt
  autentisering och åtkomstkontroll.
- **Resource methods** utför ==övergången mellan två tillstånd== hos resursen. Idealt ska allt som
  behövs för övergången finnas i representationen, inklusive vilka metoder som stöds.

**Hypermedias roll — det som gör REST till REST.** Principen heter ==HATEOAS==, *Hypermedia as the
engine of application state*: klienten ska ==bara ha resursens första URI== och sedan ==driva alla
andra resurser och samspel via hyperlänkar== som servern lämnar i svaren. Ett RESTful API ska ==se ut
som hypertext==: allt som går att peka ut har ==en egen adress==, antingen uttalat med `link`- och
`id`-attribut eller underförstått ur media-typen. Fielding poängterar att ==hypertext inte behöver
vara HTML i en webbläsare== — maskiner kan följa länkar när de förstår dataformatet och
relationstyperna. Går klienten vidare på något den **inte** fick i svaren, är
det ==inte hypertexten som styr==, och då är kravet inte uppfyllt.

**Varningen: de två källorna säger olika saker.** Boken beskriver REST **som** HTTP med de fyra
metoderna. restfulapi.net säger rakt ut att ==REST inte är HTTP==: Fieldings avhandling nämner ==ingen
implementationsriktning==, inte ens HTTP, och så länge de sex principerna hedras får gränssnittet kallas
RESTful. Sidan går längre — ==många likställer felaktigt resource methods med HTTP-metoderna==. Fielding
har aldrig rekommenderat vilken metod som ska användas när, bara att gränssnittet ska vara likformigt.
Använder ett API POST för att uppdatera i stället för det vanligare PUT är gränssnittet ==ändå RESTful==.

**Så kan du tänka.** Hantera det som en nivåskillnad, inte en motsägelse. Boken beskriver REST **som
det faktiskt byggs** på webben: över HTTP, med fyra metoder. restfulapi.net beskriver REST **som
Fielding definierade det**: en arkitekturstil utan protokollkrav, där HTTP bara är den vanligaste
implementationen. Säger du båda, i den ordningen, har du täckt vad examinatorn än utgår från.

### Muntligt svar

1. REST är en arkitekturstil från Fieldings avhandling 2000 — varken ett protokoll eller en standard.
2. Boken beskriver den som ett hårt begränsat sätt att arbeta: URL:er plus GET, PUT, DELETE och POST
   mot resurser i XML, med tyngdpunkt på data i stället för gränssnitt.
3. Sex principer ska uppfyllas: likformigt gränssnitt, klient-server, tillståndslöshet, cachebarhet,
   skiktat system, och kod på begäran som är valfri.
4. Resurser nås via URI, och det som skickas är en representation — data, metadata och
   hypermedialänkar. Resurs och representation är skilda, så samma resurs kan levereras som JSON, XML
   eller HTML.
5. Hypermedia är motorn: klienten får bara första URI:n och tar sig vidare genom länkar som servern
   skickar med. Det är HATEOAS, och det är den princip som oftast hoppas över i praktiken.
6. Notera att källorna skiljer sig: boken beskriver REST som HTTP, medan restfulapi.net säger att REST
   inte är HTTP och att Fielding aldrig band stilen till något protokoll.

## 3. Jämför distribuerade objekt (t.ex. RMI) med webbtjänster (t.ex. REST) för kommunikation mellan (del-)system

Bokens avsnitt: §9.2.2, som gör precis den jämförelsen. §9.2.4 jämför med CORBA.

**Likheten är ytlig — och boken säger det själv.** ==*At a superficial level*== är samspelet mellan
klient och server mycket likt RMI: i RMI använder klienten en ==fjärrobjektreferens== för att anropa
en operation i ett fjärrobjekt, i en webbtjänst använder den en ==URI== för att anropa en operation i
resursen som URI:n namnger. Boken sätter sedan gränserna för liknelsen.

**Skillnad 1: inga nya fjärrobjekt.** I objektmodellen kan objekt ==skapa fjärrobjekt dynamiskt== och
returnera referenser till dem, som mottagaren kan anropa. En ==fabriksmetod== som `newShape` skapar en
ny instans och returnerar en referens. ==Ingenting sådant går med webbtjänster.== En webbtjänst är i
praktiken ==ett enda fjärrobjekt==, och därför blir både ==skräpsamling och fjärrobjektreferenser
irrelevanta==.

**Skillnad 2: inga servanter.** En ==servant== är det objekt i servern som faktiskt håller en resurs och
utför anropen mot den. I objektmodellen modelleras servern **normalt** som en ==samling servanter==;
whiteboard-exemplet hade en servant för listan och en per grafiskt objekt. Webbtjänster ==stöder inte
servanter==, så en tillämpning kan inte skapa dem efter behov för olika serverresurser. För att tvinga
fram det får implementationen av ett webbtjänstgränssnitt ==varken ha konstruktorer eller main-metod==.
Följden i Java: `newShape` returnerar i stället ett ==heltal==, platsen i en vektor, och slutar därmed
vara en fabriksmetod.

**Skillnad 3: paradigmoberoende mot ett bestämt paradigm.** Webbtjänster är gjorda för distribuerad
beräkning på internet, där ==många programspråk och paradigm samexisterar==, och är därför medvetet
==oberoende av något särskilt programmeringsparadigm==. Distribuerade objekt gör motsatsen: de
==förespråkar ett ganska bestämt paradigm== för utvecklaren.

**Skillnad 4: ingen transparens på köpet.** En stor uppgift för mellanprogram är annars att ==dölja
datarepresentation och marshalling== och att ==få fjärranrop att se ut som lokala==. **Inget av det
ingår** i infrastrukturen för webbtjänster — klient och server får läsa och skriva SOAP i XML direkt.
I praktiken döljs det av ett lokalt API, och skillnaden mot lokala anrop kan döljas med en ==proxy==,
alltså ett lokalt objekt med samma gränssnitt som skickar anropet vidare, alternativt med ==dynamisk
invokering== där operationsnamnet sätts först vid körning. Skillnaden är att det är ett
==bekvämlighetslager du väljer==, inte något plattformen ger.

**Effektivitet.** I §9.2.4 jämförs en studie av Olson och Ogbuji: ett ==SOAP-anrop är 14 gånger så
stort== som motsvarande i CORBA och tog i genomsnitt ==882 gånger så lång tid==. Orsaken är formatet:
==CORBA CDR är binärt, XML är text==. **Siffrorna gäller SOAP mot CORBA**, inte REST mot RMI, och boken
garderar att resultatet ==beror på språk och implementation== och bara ger ==en indikation==.

**Räckvidd.** En CORBA-referens (IOR) bär en typidentifierare som ==bara förstås av det
gränssnittsregister== som lagrar typdefinitionen, vilket kräver att klient och server delar register —
inte praktiskt globalt. En webbtjänst identifieras av en URL, så ==DNS är den enda tjänst som behövs==.

**Så kan du tänka:** välj efter var gränsen går. Inom en organisation, med komplexa samspel och behov
av transaktioner och säkerhetstjänster, är den distribuerade objektmodellen stark — det är också
bokens slutsats om CORBA. Ska två organisationer som inte kommit överens om något prata med varandra
genom en brandvägg vinner webbtjänster, och priset är prestanda och att du får bygga transparensen
själv.

### Muntligt svar

1. Ytligt är de lika: klienten anropar en operation, med en fjärrobjektreferens i RMI och med en URI i
   en webbtjänst. Boken säger uttryckligen att likheten är ytlig.
2. Största skillnaden: webbtjänster kan inte skapa fjärrobjekt. En webbtjänst är i praktiken ett enda
   objekt, så skräpsamling och fjärrreferenser blir irrelevanta.
3. Inga servanter heller — implementationen får varken konstruktor eller main. I RMI modelleras
   servern normalt som en samling servanter.
4. Webbtjänster är medvetet paradigmoberoende, medan distribuerade objekt förespråkar ett bestämt
   paradigm.
5. Ingen transparens på köpet: marshalling och "ser ut som lokalt anrop" ingår inte, utan får läggas
   till med proxy eller dynamisk invokering.
6. Priset är prestanda — SOAP mot CORBA var 14 gånger större och 882 gånger långsammare i en studie,
   för XML är text och CDR binärt. Vinsten är global räckvidd: bara DNS behövs, och HTTP går genom
   brandväggar.

## 4. Vad innebär SOA (Service-Oriented Architecture)

Bokens avsnitt: §9.7.1.

**Definitionen.** SOA är en ==uppsättning designprinciper== där distribuerade system byggs av
==mängder av löst kopplade tjänster== som kan ==upptäckas dynamiskt== och sedan antingen
==kommunicerar med varandra== eller ==koordineras genom koreografi== för att ge utökade tjänster.
*Koreografi* är att en webbtjänst använder ==förutbestämda mönster== för hur den anropar en uppsättning
andra tjänster — webbtjänster ger nämligen åtkomst till resurser men ==inget sätt att samordna== dem med
varandra (§9.6).

**Det är ett abstrakt begrepp.** SOA kan implementeras med ==flera olika tekniker==, bland annat
distribuerade objekt och komponenter. Men det ==huvudsakliga sättet== att förverkliga
SOA är med ==webbtjänster==, till stor del just på grund av den ==låga koppling== som ligger i dem.

**Var det används.** Inne i en verksamhet ger det en ==flexibel mjukvaruarkitektur== och
==interoperabilitet== mellan tjänsterna. Men dess ==främsta användning är på det bredare internet==:
en gemensam bild av tjänsterna så att ==alla kommer åt dem och kan sätta ihop dem==.

**B2B-integration är resultatet.** Det gör att man kan ==ta sig över heterogeniteten på internet== och
hantera att olika organisationer valt olika mellanprogram internt: ==en organisation kan använda CORBA
internt och en annan .NET==, medan båda exponerar gränssnitt som webbtjänster. Egenskapen kallas
==business-to-business-integration==. Resebyråexemplet är just det.

**Mashup.** SOA möjliggör och uppmuntrar också en ==mashup-kultur==: en mashup är en ==ny tjänst som en
tredjepartsutvecklare skapar genom att kombinera två eller flera== befintliga tjänster. Det kräver två
saker samtidigt — ==lättillgängliga tjänster med väldefinierade gränssnitt== och en ==öppen
innovationsgemenskap==. Båda villkoren är uppfyllda på internet i dag, särskilt med molntjänster.
Bokens exempel är ==JBidwatcher==, som kopplar upp mot eBay och lägger bud i sista stund.

### Muntligt svar

1. SOA är en uppsättning designprinciper: bygg systemet av löst kopplade tjänster som kan upptäckas
   dynamiskt och antingen prata direkt med varandra eller koordineras genom koreografi.
2. Det är abstrakt och går att implementera med distribuerade objekt eller komponenter, men det
   huvudsakliga sättet är webbtjänster — just för den låga kopplingen.
3. Inom en verksamhet ger det flexibilitet och interoperabilitet, men den främsta användningen är på
   internet i stort.
4. Resultatet är B2B-integration: en organisation kan köra CORBA internt och en annan .NET, och båda
   exponerar webbtjänstgränssnitt utåt.
5. Det öppnar också för mashups — en tredje part kombinerar två eller fler tjänster till en ny, som
   JBidwatcher mot eBay.
6. Kopplingen till fråga 1 är direkt: låg koppling är förutsättningen som gör SOA möjligt.

## 5. Förklara relationen mellan Ajax och webbtjänster

Bokens avsnitt: **§2.3.2**, inte kapitel 9 — se `## Luckor och källor`. Ajax nämns också i §1.6.

**Vad Ajax är.** Ajax (*Asynchronous Javascript And XML*) är en ==utbyggnad av webbens vanliga
klient-serversamspel==. Det behövs för att skicka ==små databitar== mellan ett
==Javascript-frontend i webbläsaren== och ett ==backend-program på servern== som håller data om
tillämpningens tillstånd.

**Problemet det löser: tre begränsningar i det vanliga samspelet.** Normalt ber webbläsaren om en sida
och får ==en hel sida== tillbaka. Det ger tre problem:

1. När webbläsaren skickat sin förfrågan ==kan användaren inte interagera== med sidan förrän det nya
   innehållet kommit och visats — och den tiden är ==obestämd==, för den beror på nät och server.
2. För att uppdatera ==även en liten del== av sidan måste en ==hel ny sida== hämtas och visas. Det ger
   fördröjt svar, extra arbete i både klient och server och ==onödig nättrafik==.
3. Innehållet i en visad sida ==kan inte uppdateras== när applikationsdatat på servern ändras.

**Hur det görs.** Javascript var första steget. Ajax är det andra: det låter frontend ==begära ny data
direkt från serverprogram==, och ==uppdatera bara de delar av sidan== som berörs. Klienten skickar
anropet genom Javascript-objektet ==`XmlHttpRequest`==, som sköter ett HTTP-utbyte med en serverprocess.
API:t är komplicerat och delvis webbläsarberoende, så man använder **normalt** ett ==Javascript-bibliotek==
i stället. Både synkron och asynkron kommunikation finns, men den ==asynkrona används nästan alltid==,
eftersom fördröjda serversvar annars blir oacceptabla i gränssnittet. Google Maps är bokens
paradexempel: rutorna flyttas av Javascript i webbläsaren och nya hämtas med Ajax-anrop, medan
webbläsaren hela tiden fortsätter svara på användaren.

**Så kan du tänka — bryggan till webbtjänster (egen slutsats, boken drar den aldrig).** Det som
förenar dem är att båda ==tar sig runt begränsningen i webbläsarens vanliga samspel==, och båda gör det
==över HTTP med XML==:

- **Samma grundproblem, olika ände av det.** Ajax fixar att en ==webbläsare== är för klumpig som
  klient: den vill hämta små databitar i stället för hela sidor. Webbtjänster fixar att en webbläsare
  är för ==allmän== som klient: de ger ett funktionellt specialiserat gränssnitt för
  ==program-till-program==. Boken säger själv att webbtjänster ==inte kan nås direkt av en webbläsare==
  — och det är precis där de två skiljer sig.
- **De sitter i olika skikt.** Ett ==skikt== (*tier*) är här en del av tillämpningen som lagts på en egen
  server: skikt 1 användargränssnittet, skikt 2 applikationslogiken, skikt 3 databasen. Ajax är bokens
  exempel på kommunikation mellan ==skikt 1 och skikt 2==, alltså mellan webbläsare och server. I en
  treskiktslösning skickar serverkomponenten vidare till en datahanterare, och **det** anropet är
  synkront.
- **De kan användas tillsammans.** Backend som Ajax-anropet träffar kan i sin tur vara en webbtjänst.
  Boken behandlar båda i §2.3.2 — webbtjänster som ett eget ==arkitekturmönster==, Ajax som exempel
  under flerskiktsarkitektur — men kopplar dem aldrig till varandra.
- **Båda är asynkrona request-reply.** Ajax använder asynkront nästan alltid; webbtjänster använder
  **antingen** synkron request-reply **eller** asynkrona meddelanden, där svaret kan komma senare.

### Muntligt svar

1. Ajax står för Asynchronous Javascript And XML och är en utbyggnad av webbens vanliga
   klient-serversamspel, för finkornig kommunikation mellan Javascript i webbläsaren och ett
   serverprogram.
2. Det löser tre begränsningar: användaren blockeras under okänd tid, en hel sida måste hämtas för att
   uppdatera en liten del, och sidan kan inte följa ändringar i serverns data.
3. Mekanismen är `XmlHttpRequest`, nästan alltid asynkront, och bara de berörda delarna av sidan
   uppdateras. Google Maps är exemplet.
4. Relationen: båda tar sig runt webbläsarens begränsningar över HTTP med XML — Ajax för att
   webbläsaren är för klumpig, webbtjänster för att den är för allmän.
5. De kompletterar varandra i skikt: Ajax går mellan skikt 1 och 2, och backend som svarar kan själv
   vara en webbtjänst.
6. Viktig markering: boken drar aldrig den här kopplingen själv, och Ajax står i kapitel 2, inte i
   kapitel 9. Säg det om examinatorn frågar var det står.

## Luckor och källor

**Fråga 2 kan inte besvaras ur kursboken.** Boken listar ==inga namngivna REST-principer== alls, och
ordet ==hypermedia förekommer inte någonstans i hela boken== — inte bara i dess REST-beskrivning. De sex
principerna och hela hypermedia-avsnittet kommer därför från **restfulapi.net "What is REST?"**, som
KursPM kräver. Sidan är sparad i vaultet som `Filer/Webbsidor/REST - restfulapi.net.md`, en städad kopia
med källhänvisning.

**Konflikten mellan källorna är verklig, inte ett fel i noten.** Boken beskriver REST **som** HTTP med
fyra metoder; restfulapi.net säger rakt ut **REST != HTTP** och att Fielding aldrig rekommenderade
vilken HTTP-metod som ska användas när. Noten ger **båda**, och avsnittet "Varningen" i fråga 2 säger
vilken källa som säger vad.

**Fråga 5 kräver egen syntes.** Ordet **Ajax finns inte i kapitel 9**. Ajax beskrivs i **§2.3.2**, som
exempel på kommunikation mellan skikt 1 och 2, och nämns i §1.6. Boken kopplar **aldrig** Ajax till
webbtjänster. Faktan om båda är bokens; själva bryggan mellan dem är min och är märkt **Så kan du
tänka**.

**Siffrorna 14× och 882× mäter SOAP mot CORBA**, inte REST mot RMI, och boken garderar dem själv med
att resultatet beror på språk och implementation. Använd dem som en indikation på kostnaden för
textformat, inget mer.

**Det som inte är utskrivet här** frågas inte av någon tentafråga: SOAP:s XML-syntax i detalj, WSDL:s
elementstruktur, UDDI, XML-säkerhet, koordination och koreografi, samt Griden och molnet.
