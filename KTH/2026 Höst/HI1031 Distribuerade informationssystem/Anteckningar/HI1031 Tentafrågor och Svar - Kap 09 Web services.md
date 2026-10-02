---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-09
updated: 2026-09-15
description: "Svar på tentafrågorna för kapitel 9 om web services: vad en webbtjänst är och när den används, låg koppling, REST med sina sex principer och hypermedias roll, jämförelsen mot distribuerade objekt, SOA, samt relationen mellan Ajax och webbtjänster."
---

# HI1031 Tentafrågor och Svar - Kap 09 Web services

Fem tentafrågor. Fråga 2 om REST har **två källor** som delvis säger olika saker, och fråga 5 om Ajax
kräver att du själv bygger bryggan — boken gör det aldrig. Båda står förklarade i `## Luckor och källor`.

## 1. Vad är en webbtjänst och i vilka situationer används sådana? Vad innebär begreppet låg koppling i kontexten webbtjänst? Ge exempel på protokoll eller arkitekturer för webbtjänster

Bokens avsnitt: §9.1 och §9.2.

**Vad det är.** Ett webbtjänstgränssnitt består **normalt** av en ==samling operationer som en klient kan
använda över internet==. Tjänsten identifieras av en ==URI==, och klienten skickar meddelanden formaterade
i ==XML==. Operationerna kan bakom kulisserna utföras av vad som helst — program, objekt eller databaser.

**Varför de finns: webbläsaren är för allmän.** I den ursprungliga klient-servermodellen var **båda**
sidor funktionellt specialiserade. Webbläsaren är tvärtom en ==generell klient==, och det begränsar vilka
tillämpningar man kan bygga. Webbtjänster ==går tillbaka till den gamla modellen==: en
tillämpningsspecifik klient pratar med en tjänst som har ett funktionellt specialiserat gränssnitt.
Följden är att **webbtjänster inte kan nås direkt av en webbläsare** — och det är också skillnaden mot en
vanlig webbserver, som bara ger en grundläggande HTTP-tjänst.

**När de används.**

- **Över organisationsgränser, utan människa i loopen.** Ett klientprogram i en organisation kan prata
  med en server i en annan ==utan mänsklig övervakning==. Det är hela poängen med kapitlet.
- **För att kombinera tjänster till nya tjänster.** Bokens exempel: om flyg-, hotell- och
  hyrbilssajter alla hade webbtjänstgränssnitt kunde en ==resebyråtjänst== väva ihop dem till ett
  erbjudande. En webbtjänst kan alltså vara klient till en annan webbtjänst.
- **När HTTP är enda vägen in.** De flesta organisationer har ==brandvägg==, och transportprotokollen
  som Java RMI och CORBA använder släpps **normalt inte** igenom, medan HTTP och SMTP släpps **normalt**
  igenom.

**Låg koppling — vad det betyder.** Boken varnar först: begreppet är ==ofta luddigt och oprecist
använt==. I webbtjänstsammanhang betyder det att ==hålla beroendena mellan tjänster så små som möjligt==,
så att ==en ändring i en tjänst inte välter de andra==. Webbtjänster får det **delvis** gratis genom att
de är tänkta att vara oberoende och kombinerbara.

**Tre saker som förstärker den.** **Programmering mot gränssnitt** — att ==skilja gränssnittet från
implementationen== ger en nivå av låg koppling och hanterar heterogenitet i språk och plattform. **Enkla,
generella gränssnitt** — trenden går mot minimala gränssnitt, där webben själv och REST är exemplen, och
det minskar beroendet av ==specifika operationsnamn== så att data blir viktigare än operation. **Valet av
kommunikationsparadigm** — i request-reply är parterna i grunden kopplade, medan asynkrona meddelanden ger
==synkroniseringsfrikoppling== så avsändaren inte behöver vänta.

**Så kan du tänka:** låg koppling är inte en egenskap man har eller inte har, utan flera axlar samtidigt.

**Protokoll och arkitekturer att nämna.**

- **XML** — textformatet för extern datarepresentation och ==marshalling==. Skrymmande och långsammare
  att parsa än binära format, men valt för ==läsbarheten och därmed enklare felsökning==.
- **SOAP** — reglerna för hur XML används för att ==packa meddelanden==, hur ett par enkelriktade
  meddelanden bildar ==request-reply==, och hur HTTP och SMTP används för att skicka dem.
- **REST** — alternativet till SOAP, se fråga 2.
- **WSDL** — språket tjänstebeskrivningar normalt skrivs i. Beskrivningen bär gränssnittet, hur
  meddelanden ska skickas och tjänstens URI, vilket ==gör en separat binder eller namntjänst onödig==.

### Muntligt svar

1. En webbtjänst är en samling operationer som nås över internet, identifierad av en URI, med
   meddelanden i XML. Den kan inte nås direkt av en webbläsare.
2. Poängen är att gå tillbaka till specialiserade klienter: en webbläsare är för allmän för att bygga
   riktiga tillämpningar på.
3. Den används mellan organisationer utan människa i loopen, och för att kombinera flera tjänster till
   en ny — resebyråexemplet.
4. Praktiskt skäl: brandväggar släpper igenom HTTP och SMTP men normalt inte RMI:s eller CORBA:s
   transport.
5. Låg koppling betyder att minimera beroendena mellan tjänster så att en ändring inte fortplantar sig.
   Boken påpekar att ordet ofta används luddigt.
6. Tre saker förstärker den: programmering mot gränssnitt, enkla generella gränssnitt som REST, och
   valet av kommunikationsparadigm — request-reply kopplar, asynkront frikopplar.

Vad är en webbtjänst, när används den, och vilka protokoll finns? (3)
||
- **Vad och varför** – hur ett program når den, och varför inte via en webbläsare
- **När** – vilka två parter som pratar, och vad trafiken passerar
- **Protokoll** – XML, SOAP, REST, WSDL

Vad innebär låg koppling för en webbtjänst? (4)
||
- **Grundbetydelsen** – vad man håller så litet som möjligt
- **Programmering mot gränssnitt** – skilj gränssnittet från implementationen
- **Enkla, generella gränssnitt** – minimala gränssnitt som webben och REST
- **Valet av paradigm** – request-reply kopplar, asynkront frikopplar

## 2. Vad är REST och vilka principer ska en RESTful webbtjänst uppfylla? Hur accessas resurser i en REST-arkitektur? Vilken roll har hypermedia

Bokens avsnitt: rutan i §9.2. **Kurslitteratur jämte boken:** restfulapi.net "What is REST?", som
KursPM kräver. **Läs varningen sist i frågan** — de två källorna säger delvis olika saker, och det är
avsiktligt återgivet.

**Bokens beskrivning.** REST (Representational State Transfer, Fielding 2000) är enligt boken ett
==mycket hårt begränsat sätt att arbeta==: klienten använder ==URL:er och HTTP-operationerna GET, PUT,
DELETE och POST== för att hantera resurser som representeras i ==XML==. Tyngdpunkten ligger på
==hanteringen av dataresurser, inte på gränssnitt==. Skapas en ny resurs får den en ==ny URL==. Klienten
får ==hela resursens tillstånd== i stället för att anropa en operation för att hämta en del av det.
Fieldings argument, som boken återger: på internet är ==en enkel minimal och likformig uppsättning
operationer== mer användbar än en flodvåg av olika tjänstegränssnitt.

**De sex principerna — källa: restfulapi.net, kurslitteratur enligt KursPM.** Boken listar inga namngivna principer
alls. Sidan är tydlig med att principerna ==måste uppfyllas== för att ett gränssnitt ska få kallas
**RESTful**, och att REST är ==varken ett protokoll eller en standard== utan en arkitekturstil.

1. **Likformigt gränssnitt** — fyra villkor: varje resurs ==identifieras unikt==, resurser ==hanteras
   genom representationer==, meddelanden är ==självbeskrivande==, och ==HATEOAS==, se nedan.
2. **Klient-server** — ==separation of concerns==, så gränssnitt och datalagring utvecklas oberoende.
3. **Tillståndslöshet** — ==varje anrop måste bära all information== som behövs, så servern får inte
   använda sparad kontext och ==klienten håller hela sessionstillståndet==.
4. **Cachebarhet** — svaret ska ==märka sig självt== som cachebart eller inte.
5. **Skiktat system** — hierarkiska lager, där varje komponent ==bara ser närmaste lager==.
6. **Kod på begäran** — **valfri**. Klienten kan utökas genom att ==ladda ner och köra kod==.

**Hur resurser accessas.** Resursen är ==REST:s centrala abstraktion==: allt som kan namnges kan vara en
resurs. Den nås via en ==resursidentifierare (URI)==, och det man faktiskt skickar är en ==representation==
av resursens tillstånd vid ett givet tillfälle, bestående av tre delar: ==datat, metadata som beskriver
datat, och hypermedialänkarna== som tar klienten till nästa tillstånd. Ett REST-API är därmed en samling
sammanlänkade resurser.

**Resurs och representation är skilda saker**, och därför kan samma resurs levereras i olika format.
Representationens format kallas dess ==media type==, som pekar på specifikationen för hur den ska
behandlas. **Resource methods** utför ==övergången mellan två tillstånd== hos resursen.

**Hypermedias roll — det som gör REST till REST.** Principen heter ==HATEOAS==, *Hypermedia as the engine
of application state*: klienten ska ==bara ha resursens första URI== och sedan ==driva alla andra resurser
och samspel via hyperlänkar== som servern lämnar i svaren. Ett RESTful API ska ==se ut som hypertext==:
allt som går att peka ut har en egen adress. Fielding poängterar att ==hypertext inte behöver vara HTML i
en webbläsare== — maskiner kan följa länkar när de förstår dataformatet och relationstyperna. Går klienten
vidare på något den **inte** fick i svaren är det ==inte hypertexten som styr==, och kravet är inte
uppfyllt.

**Varningen: de två källorna säger olika saker.** Boken beskriver REST **som** HTTP med de fyra metoderna.
restfulapi.net säger rakt ut att ==REST inte är HTTP==: Fieldings avhandling nämner ==ingen
implementationsriktning==, inte ens HTTP, och så länge de sex principerna hedras får gränssnittet kallas
RESTful. Sidan går längre — Fielding har ==aldrig rekommenderat vilken HTTP-metod som ska användas när==,
bara att gränssnittet ska vara likformigt, så ett API som använder POST för att uppdatera i stället för
PUT är ==ändå RESTful==.

**Så kan du tänka.** Hantera det som en nivåskillnad, inte en motsägelse. Boken beskriver REST **som det
faktiskt byggs** på webben: över HTTP, med fyra metoder. restfulapi.net beskriver REST **som Fielding
definierade det**: en arkitekturstil utan protokollkrav, där HTTP bara är den vanligaste
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
   skickar med. Det är HATEOAS, och går klienten vidare på något den inte fick i svaren är kravet inte
   uppfyllt.
6. Notera att källorna skiljer sig: boken beskriver REST som HTTP, medan restfulapi.net säger att REST
   inte är HTTP och att Fielding aldrig band stilen till något protokoll.

Vad är REST och vilka principer ska en RESTful tjänst uppfylla? (3)
||
- **Vad REST är** – arkitekturstil från Fielding, inte ett protokoll eller en standard
- **De sex principerna** – likformigt gränssnitt, klient-server, tillståndslöshet, cache, lager, kod på begäran
- **Två källor** – boken ser REST som HTTP med fyra metoder, restfulapi.net säger att det inte är bundet till HTTP

Hur accessas resurser i REST och vilken roll har hypermedia? (3)
||
- **Hur resurser nås** – via en URI; man får en representation: data, metadata, länkar
- **Resurs mot representation** – skilda, så samma resurs kan ges som JSON, XML eller HTML
- **Hypermedia (HATEOAS)** – vad servern skickar med, och vad klienten då behöver

## 3. Jämför distribuerade objekt (t.ex. RMI) med webbtjänster (t.ex. REST) för kommunikation mellan (del-)system

Bokens avsnitt: §9.2.2, som gör precis den jämförelsen. §9.2.4 jämför med CORBA.

**Likheten är ytlig — och boken säger det själv.** ==*At a superficial level*== är samspelet mycket likt
RMI: i RMI använder klienten en ==fjärrobjektreferens== för att anropa en operation i ett fjärrobjekt, i
en webbtjänst en ==URI== för att anropa en operation i resursen som URI:n namnger. Boken sätter sedan
gränserna för liknelsen.

**Skillnad 1: inga nya fjärrobjekt.** I objektmodellen kan objekt ==skapa fjärrobjekt dynamiskt== och
returnera referenser till dem, som mottagaren kan anropa — en ==fabriksmetod== som `newShape` skapar en
ny instans och returnerar en referens. ==Ingenting sådant går med webbtjänster.== En webbtjänst är i
praktiken ==ett enda fjärrobjekt==, och därför blir både ==skräpsamling och fjärrobjektreferenser
irrelevanta==.

**Skillnad 2: inga servanter.** En ==servant== är objektet i servern som faktiskt håller en resurs och
utför anropen mot den. I objektmodellen modelleras servern **normalt** som en ==samling servanter==.
Webbtjänster ==stöder inte servanter==, och för att tvinga fram det får implementationen ==varken ha
konstruktorer eller main-metod==. Följden i Java: `newShape` returnerar i stället ett ==heltal==, platsen
i en vektor, och slutar därmed vara en fabriksmetod.

**Skillnad 3: paradigmoberoende mot ett bestämt paradigm.** Webbtjänster är gjorda för internet, där
==många programspråk och paradigm samexisterar==, och är därför medvetet ==oberoende av något särskilt
programmeringsparadigm==. Distribuerade objekt ==förespråkar ett ganska bestämt paradigm==.

**Skillnad 4: ingen transparens på köpet.** En stor uppgift för mellanprogram är annars att ==dölja
datarepresentation och marshalling== och att ==få fjärranrop att se ut som lokala==. **Inget av det
ingår** för webbtjänster — klient och server får läsa och skriva SOAP i XML direkt. I praktiken döljs det
av ett lokalt API, och skillnaden mot lokala anrop kan döljas med en ==proxy== eller med ==dynamisk
invokering==, där operationsnamnet sätts först vid körning. Skillnaden är att det är ett
==bekvämlighetslager du väljer==, inte något plattformen ger.

**Effektivitet.** I §9.2.4 refereras en studie av Olson och Ogbuji: ett ==SOAP-anrop är 14 gånger så
stort== som motsvarande i CORBA och tog i genomsnitt ==882 gånger så lång tid==. Orsaken är formatet:
==CORBA CDR är binärt, XML är text==. **Siffrorna gäller SOAP mot CORBA**, inte REST mot RMI, och boken
garderar att resultatet ==beror på språk och implementation== och bara ger ==en indikation==.

**Räckvidd.** En webbtjänst identifieras av en URL, så ==DNS är den enda tjänst som behövs==.

**Så kan du tänka:** välj efter var gränsen går. Inom en organisation, med komplexa samspel och behov av
transaktioner och säkerhetstjänster, är den distribuerade objektmodellen stark — det är också bokens
slutsats om CORBA. Ska två organisationer som inte kommit överens om något prata genom en brandvägg
vinner webbtjänster, och priset är prestanda och att du bygger transparensen själv.

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

Jämför distribuerade objekt (RMI) med webbtjänster (REST). (4)
||
- **Börja med** – ytligt lika: båda anropar en operation, med fjärrreferens eller URI
- **Kärnskillnaden** – webbtjänsten är ett enda objekt: inga nya fjärrobjekt, inga servanter
- **Två principskillnader** – paradigmoberoende, och ingen transparens på köpet
- **Avvägningen** – priset är prestanda, vinsten är global räckvidd genom brandväggar

## 4. Vad innebär SOA (Service-Oriented Architecture)

Bokens avsnitt: §9.7.1.

**Definitionen.** SOA är en ==uppsättning designprinciper== där distribuerade system byggs av ==mängder
av löst kopplade tjänster== som kan ==upptäckas dynamiskt== och sedan antingen ==kommunicerar med
varandra== eller ==koordineras genom koreografi== för att ge utökade tjänster. *Koreografi* är att en
webbtjänst använder ==förutbestämda mönster== för hur den anropar andra tjänster — webbtjänster ger
nämligen åtkomst till resurser men ==inget sätt att samordna== dem med varandra (§9.6).

**Det är ett abstrakt begrepp.** SOA kan implementeras med ==flera olika tekniker==, bland annat
distribuerade objekt och komponenter. Men det ==huvudsakliga sättet== är med ==webbtjänster==, till stor
del just på grund av den ==låga koppling== som ligger i dem.

**Var det används.** Inne i en verksamhet ger det en ==flexibel mjukvaruarkitektur== och
==interoperabilitet== mellan tjänsterna. Men dess ==främsta användning är på det bredare internet==: en
gemensam bild av tjänsterna så att ==alla kommer åt dem och kan sätta ihop dem==.

**B2B-integration är resultatet.** Man kan ==ta sig över heterogeniteten på internet== och hantera att
olika organisationer valt olika mellanprogram internt: ==en organisation kan använda CORBA internt och en
annan .NET==, medan båda exponerar gränssnitt som webbtjänster. Egenskapen kallas
==business-to-business-integration==, och resebyråexemplet är just det.

**Mashup.** SOA uppmuntrar också en ==mashup-kultur==: en mashup är en ==ny tjänst som en
tredjepartsutvecklare skapar genom att kombinera två eller flera== befintliga tjänster. Det kräver
==lättillgängliga tjänster med väldefinierade gränssnitt== och en ==öppen innovationsgemenskap==.

### Muntligt svar

1. SOA är en uppsättning designprinciper: bygg systemet av löst kopplade tjänster som kan upptäckas
   dynamiskt och antingen prata direkt med varandra eller koordineras genom koreografi.
2. Det är abstrakt och går att implementera med distribuerade objekt eller komponenter, men det
   huvudsakliga sättet är webbtjänster — just för den låga kopplingen.
3. Inom en verksamhet ger det flexibilitet och interoperabilitet, men den främsta användningen är på
   internet i stort.
4. Resultatet är B2B-integration: en organisation kan köra CORBA internt och en annan .NET, och båda
   exponerar webbtjänstgränssnitt utåt.
5. Det öppnar också för mashups — en tredje part kombinerar två eller fler tjänster till en ny.
6. Kopplingen till fråga 1 är direkt: låg koppling är förutsättningen som gör SOA möjligt.

Vad innebär SOA (Service-Oriented Architecture)? (4)
||
- **Definitionen** – vilken sorts princip, och tjänsternas två kännetecken
- **Hur det byggs** – med vad, och varför just det
- **Var det används** – främst på internet i stort, inte bara internt
- **Resultatet** – B2B-integration och mashups

## 5. Förklara relationen mellan Ajax och webbtjänster

Bokens avsnitt: **§2.3.2**, inte kapitel 9 — se `## Luckor och källor`.

**Vad Ajax är.** Ajax (*Asynchronous Javascript And XML*) är en ==utbyggnad av webbens vanliga
klient-serversamspel==, för att skicka ==små databitar== mellan ett ==Javascript-frontend i webbläsaren==
och ett ==backend-program på servern== som håller tillämpningens tillstånd.

**Problemet det löser: tre begränsningar i det vanliga samspelet.** Normalt ber webbläsaren om en sida och
får ==en hel sida== tillbaka. Det ger tre problem: användaren ==kan inte interagera== med sidan under en
==obestämd== väntetid; för att uppdatera ==även en liten del== måste en ==hel ny sida== hämtas, vilket ger
==onödig nättrafik==; och en visad sida ==kan inte uppdateras== när applikationsdatat på servern ändras.

**Hur det görs.** Ajax låter frontend ==begära ny data direkt från serverprogram== och ==uppdatera bara de
delar av sidan== som berörs. Den ==asynkrona varianten används nästan alltid==, eftersom fördröjda
serversvar annars blir oacceptabla i gränssnittet.

**Så kan du tänka — bryggan till webbtjänster (egen slutsats, boken drar den aldrig).** Det som förenar
dem är att båda ==tar sig runt begränsningen i webbläsarens vanliga samspel==, och båda gör det ==över
HTTP med XML==:

- **Samma grundproblem, olika ände av det.** Ajax fixar att en webbläsare är för ==klumpig== som klient:
  den vill hämta små databitar i stället för hela sidor. Webbtjänster fixar att den är för ==allmän==: de
  ger ett funktionellt specialiserat gränssnitt för ==program-till-program==. Boken säger själv att
  webbtjänster ==inte kan nås direkt av en webbläsare== — och där skiljer de sig.
- **De sitter i olika skikt.** Ett *skikt* (tier) är en del av tillämpningen på en egen server: skikt 1
  gränssnittet, skikt 2 logiken, skikt 3 databasen. Ajax är bokens exempel på kommunikation mellan
  ==skikt 1 och skikt 2==, alltså webbläsare mot server.
- **De kan användas tillsammans.** Backend som Ajax-anropet träffar kan i sin tur vara en webbtjänst.
  Boken behandlar båda i §2.3.2 men ==kopplar dem aldrig till varandra==.

### Muntligt svar

1. Ajax står för Asynchronous Javascript And XML och är en utbyggnad av webbens vanliga
   klient-serversamspel, för finkornig kommunikation mellan Javascript i webbläsaren och ett
   serverprogram.
2. Det löser tre begränsningar: användaren blockeras under okänd tid, en hel sida måste hämtas för att
   uppdatera en liten del, och sidan kan inte följa ändringar i serverns data.
3. Anropet görs nästan alltid asynkront, och bara de berörda delarna av sidan uppdateras.
4. Relationen: båda tar sig runt webbläsarens begränsningar över HTTP med XML — Ajax för att
   webbläsaren är för klumpig, webbtjänster för att den är för allmän.
5. De kompletterar varandra i skikt: Ajax går mellan skikt 1 och 2, och backend som svarar kan själv
   vara en webbtjänst.
6. Viktig markering: boken drar aldrig den här kopplingen själv, och Ajax står i kapitel 2, inte i
   kapitel 9. Säg det om examinatorn frågar var det står.

Förklara relationen mellan Ajax och webbtjänster. (4)
||
- **Vad Ajax är** – vad som pratar med servern, och vad man slipper
- **Bryggan** – båda går runt webbläsarens gräns, över HTTP med XML
- **Hur de kompletterar** – Ajax går mellan skikt 1 och 2; backend kan själv vara en webbtjänst
- **Markeringen** – boken kopplar dem aldrig själv, och Ajax står i kapitel 2

## Luckor och källor

**Fråga 2 besvaras ur två kurslitteraturkällor, inte boken ensam.** KursPM kräver ==restfulapi.net== som
kurslitteratur jämte kapitel 9. Boken listar ==inga namngivna REST-principer== alls, och ordet
==hypermedia förekommer inte någonstans i hela boken==; de sex principerna och hela hypermedia-avsnittet
kommer därför från **restfulapi.net "What is REST?"**. Det gör dem till fullt examinerbart material, inte
en lucka.

**Konflikten mellan källorna** är verklig, inte ett fel i noten — se "Varningen" i fråga 2 för vilken
källa som säger vad.

**Fråga 5 kräver egen syntes.** Ordet **Ajax finns inte i kapitel 9** — Ajax beskrivs i **§2.3.2** och
nämns i §1.6. Boken kopplar **aldrig** Ajax till webbtjänster. Faktan om båda är bokens; själva bryggan
är min och är märkt **Så kan du tänka**.

**Siffrorna 14× och 882× mäter SOAP mot CORBA**, inte REST mot RMI, och boken garderar dem själv med att
resultatet beror på språk och implementation. Använd dem som en indikation på kostnaden för textformat.

**Medvetet utanför noten**, eftersom ingen tentafråga rör det: SOAP:s XML-syntax i detalj, WSDL:s
elementstruktur, WS-Addressing och WS-ReliableMessaging, UDDI, XML-säkerhet, koordination och koreografi
i detalj, samt Griden och molnet.
