---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
description: "Svar på kursens tentafrågor för kapitel 1 med bokens avsnitt angivna: exempel på distribuerade system, resurser att dela, de åtta utmaningarna, arvet från IP, HTTP och HTML samt IP:s och RFC-seriens roll."
created: 2026-09-08
updated: 2026-09-08
---
# HI1031 Tentafrågor och Svar - Kap 01 Karakterisering av distribuerade system

Allt här är avgränsat till kursens fem tentafrågor för kapitel 1. Fakta kommer från
*Distributed Systems: Concepts and Design* (5th ed) och avsnittsnumret står under varje fråga.
Står något inte i boken sägs det uttryckligen, och hämtas något från ett annat kapitel står det
vilket.

Examinationen är **muntlig och enskild**. Därför har varje fråga två delar: faktapunkterna, och en
numrerad talordning att öva högt. Avsnitt märkta **Så kan du tänka** är min förklaring för att göra
mekanismen tydlig — inte något boken säger. Du behöver inte skriva av dem.

Flashcardsen för samma kapitel ligger i
[[HI1031 Begrepp - Kap 01 Karakterisering av distribuerade system]] och täcker samma fem frågor.

---

## 1. Ge några exempel på distribuerade system

Bokens avsnitt: **1.1** (definitionen), **1.2.1–1.2.3** (de tre fallstudierna), **1.3** (trenderna)

### Börja med definitionen, annars blir exemplen bara en lista

Boken definierar ett **distribuerat system** som ett system där hård- eller mjukvarukomponenter
placerade på ==nätverksanslutna datorer kommunicerar och samordnar sina handlingar enbart genom att
skicka meddelanden==. Se [[Distribuerat system]].

Ur den definitionen följer tre konsekvenser, och de är det som gör ett exempel *distribuerat*:

1. **Samtidighet.** Parallell programkörning är normalfallet. Jag arbetar på min dator medan du
   arbetar på din, och vi delar resurser som webbsidor eller filer när det behövs. Systemets
   kapacitet kan ökas genom att man lägger till fler resurser, till exempel datorer.
2. **Ingen global klocka.** När program samarbetar samordnar de sig genom att utbyta meddelanden.
   Nära samordning kräver ofta en delad uppfattning om *när* något hände, men det finns gränser för
   hur noga datorerna i ett nät kan synkronisera sina klockor. Det är en direkt följd av att den
   *enda* kommunikationen sker genom meddelanden.
3. **Oberoende fel.** Varje komponent kan fela för sig medan de övriga kör vidare. Nätfel isolerar
   datorerna utan att stoppa dem, och programmen kan inte nödvändigtvis avgöra om nätet har fallerat
   eller bara blivit ovanligt långsamt. En krasch meddelas inte omedelbart till de komponenter som
   kommunicerade med den.

**Drivkraften** bakom att bygga sådana system är enligt boken ==viljan att dela resurser==.

**Så kan du tänka:** examinatorn vill inte höra en uppräkning av appar. Han vill höra att du kan
peka på *varför* något är ett distribuerat system. Testet är: består det av delar på olika datorer
som bara pratar via meddelanden, och kan delarna fela oberoende av varandra? Kan du svara ja på
båda är det ett distribuerat system.

### De tre fallstudierna boken faktiskt använder

**1. Websökning (1.2.1).** Boken anger att antalet sökningar globalt har stigit till över
**10 miljarder per månad**, och att webben består av över **63 miljarder sidor** och en biljon unika
webbadresser. Uppgiften är att indexera hela webbens innehåll — webbsidor, multimediakällor och
inscannade böcker — och sedan göra avancerad bearbetning på den enorma databasen.

Google är marknadsledaren, och boken lyfter fem delar ur deras infrastruktur:

- en fysisk grund av **mycket stora mängder nätverksanslutna datorer** i datacenter över hela
  världen
- ett **distribuerat filsystem** byggt för mycket stora filer, hårt optimerat för att läsa i höga
  och uthålliga hastigheter
- ett **strukturerat distribuerat lagringssystem** som ger snabb åtkomst till mycket stora datamängder
- en **låstjänst** som erbjuder distribuerad låsning och överenskommelse (*agreement*)
- en **programmeringsmodell** för att hantera mycket stora parallella och distribuerade beräkningar

**2. Massiva flerspelarspel, MMOG (1.2.2).** Bokens exempel är **EVE Online** från finländska CCP
Games och **EverQuest II** från Sony. Skalan: EVE:s universum har över **5 000 stjärnsystem**, och
system klarar över **50 000 samtidigt inloggade spelare** (totala antalet spelare kanske tio gånger
så många). Utmaningen är kravet på **snabba svarstider** för att bevara spelupplevelsen, plus att
händelser ska spridas i realtid till många spelare och att alla ska se en konsistent delad värld.

Boken ger tre olika lösningar, och det är jämförelsen som gör detta till ett bra svar:

- **EVE Online använder, kanske överraskande, klient-server.** En *enda* kopia av världens tillstånd
  hålls på en centraliserad server. För att klara många klienter är servern i sig en
  klusterarkitektur med **hundratals datornoder**. Lasten fördelas genom att enskilda stjärnsystem
  tilldelas bestämda datorer i klustret — hårt belastade stjärnsystem får en **egen dedikerad
  dator**, andra delar dator. Inkommande händelser dirigeras till rätt dator genom att man håller
  reda på spelarnas förflyttning mellan stjärnsystem. Vinsten med det centraliserade valet är att
  förvaltningen av världen blir enklare och att den enda kopian gör konsistensfrågorna lättare.
- **EverQuest partitionerar universum över många servrar**, som också kan vara geografiskt spridda.
  Användare tilldelas dynamiskt en server utifrån aktuell belastning och nätfördröjning, till
  exempel geografisk närhet. Den arkitekturen är naturligt utbyggbar — man lägger till servrar.
- **Forskningen tittar på helt decentraliserade peer-to-peer-lösningar** där varje deltagare bidrar
  med lagring och beräkning till spelet. Se [[Peer-to-peer]].

**3. Finansiell handel (1.2.3).** Branschen har länge legat i framkant därför att den behöver
realtidsåtkomst till många informationskällor: aktiekurser, trender, ekonomiska och politiska
händelser. Tyngdpunkten ligger på att kommunicera och bearbeta **händelser** (*events*) — ett
kursfall, nya arbetslöshetssiffror — och att leverera dem tillförlitligt och i rätt tid till
potentiellt mycket många klienter som anmält intresse. Det kräver en annan arkitektur än
klient-server, nämligen **distribuerade händelsebaserade system**.

Tre detaljer värda att kunna:

- **Heterogenitet i källorna.** Händelseflödena kommer i olika format, till exempel Reuters
  marknadsdata och **FIX**-händelser (Financial Information eXchange), och från olika
  händelseteknologier. Lösningen är **adaptrar** som översätter de olika formaten till ett gemensamt
  internt format.
- **Complex Event Processing (CEP).** Flödena kommer i hög takt och kräver ofta realtidsbearbetning
  för att upptäcka mönster som visar en handelsmöjlighet. CEP sätter samman enskilda
  händelseförekomster till **logiska, tidsmässiga eller rumsliga mönster**. Det var tidigare en
  manuell process; konkurrensen har drivit fram automatisering.
- Detta används för **algoritmisk handel** som själv lägger och hanterar order. Bokens exempelskript
  bygger på **Apama**, en kommersiell produkt som växte ur forskning vid University of Cambridge.

### De övriga exemplen boken pekar ut

- **Internet självt är ett mycket stort distribuerat system** (1.3.1). Det låter användare var de än
  är använda tjänster som webben, e-post och filöverföring. Mängden tjänster är **öppen** — den kan
  utökas genom att man lägger till serverdatorer och nya typer av tjänst.
- **Intranät** — delnät som drivs av företag och organisationer, typiskt skyddade av en
  **brandvägg**, vars roll är att hindra obehöriga meddelanden från att lämna eller komma in.
- **Molntjänster och klusterdatorer** (1.3.4). *Cloud computing* är synen på databehandling som en
  **nyttotjänst** — resurser hyrs snarare än ägs, ofta betalt per användning. En *cluster computer*
  är en uppsättning sammankopplade datorer som samverkar tätt för att ge en enda integrerad
  högpresterande kapacitet, numera byggd av standardhårdvara.
- **Mobil och allestädes närvarande databehandling** (1.3.2) och **distribuerade multimediasystem**
  (1.3.3).

### Muntligt svar

1. Börja med definitionen: komponenter på nätverksanslutna datorer som samordnar sig enbart genom
   meddelanden.
2. Säg att tre saker följer ur det: samtidighet, ingen global klocka, oberoende fel — och att det är
   testet på om något är distribuerat.
3. Boken har tre fallstudier: websökning, massiva flerspelarspel och finansiell handel.
4. Websökning: hela webben ska indexeras, över 63 miljarder sidor; Google har datacenter världen
   över, ett distribuerat filsystem för stora filer, en låstjänst och en programmeringsmodell för
   stora parallella beräkningar.
5. MMOG: EVE Online, över 50 000 samtidiga spelare, och intressant nog klient-server — en enda kopia
   av världen på ett kluster med hundratals noder, där stjärnsystem tilldelas datorer.
6. Finansiell handel: händelsebaserat i stället för klient-server, olika format från Reuters och FIX
   som adaptrar översätter, och Complex Event Processing som hittar mönster i realtid.
7. Och till sist: Internet självt är ett mycket stort distribuerat system, liksom intranät och
   molntjänster.

---

## 2. Ange 5 hårdvaruresurser och 5 mjukvaruresurser som kan vara intressanta att dela

Bokens avsnitt: **1.1** (vad en resurs är), **1.3.4** (uthyrda resurser), **1.4** (tjänstebegreppet)

### Bokens syn på ordet resurs

Boken kallar *resurs* ett **medvetet abstrakt** ord, eftersom det bäst täcker hela spännvidden av
saker som är värda att dela i ett nät av datorer. Spännvidden går från hårdvarukomponenter som diskar
och skrivare till mjukvarudefinierade storheter som filer, databaser och dataobjekt av alla slag. Den
omfattar också strömmen av videobildrutor från en digital videokamera och den ljudförbindelse som ett
mobilsamtal utgör.

### Fem hårdvaruresurser

1. **Skrivare** — bokens eget första exempel, och det klassiska fallet där flera användare delar en
   dyr enhet.
2. **Diskar och lagringsutrymme.** Boken tar upp att man kan hyra en fjärrlagringsplats för filer,
   till exempel för foton, musik och video eller för säkerhetskopior.
3. **Processorer och beräkningsnoder.** Enligt 1.3.4 kan lagring och beräkning göras tillgängligt för
   nätverksanslutna datorer så att man slipper äga dem själv; man kan hyra en eller flera
   beräkningsnoder, antingen för sina vanliga behov eller för att utföra distribuerad beräkning.
4. **Digital videokamera** — boken nämner uttryckligen strömmen av bildrutor från en sådan som en
   resurs.
5. **Ljudförbindelsen i ett mobilsamtal** — bokens sista och minst uppenbara hårdvarunära exempel.

Ett sjätte, om du behöver ett till: **datacenter**, som boken beskriver som nätverksanslutna
anläggningar som ger åtkomst till ofta mycket stora datamängder.

### Fem mjukvaruresurser

1. **Filer** — delas via en filtjänst.
2. **Databaser**, och enskilda poster i dem.
3. **Dataobjekt av alla slag** — bokens egen formulering, alltså programmerade objekt som andra
   datorer kan anropa.
4. **Webbsidor och annat webbinnehåll.** I 1.6 är en resurs på webben en webbsida eller annan sorts
   innehåll som kan visas för användaren, till exempel mediafiler och PDF-dokument.
5. **Mjukvarutjänster som hyrs över internet** — boken nämner e-post och distribuerade kalendrar, och
   att Google buntar ihop sådana som Google Apps.

Ett sjätte: **en söktjänst**, som är det mest använda exemplet i hela kapitlet.

### Poängen bakom frågan, som examinatorn följer upp med

Det räcker inte att räkna upp tio saker. Boken har ett argument om *hur* delning måste ske, och det
är där följdfrågan landar:

- Boken använder ordet **tjänst** (*service*) för en avgränsad del av ett datorsystem som **förvaltar
  en samling relaterade resurser** och presenterar deras funktion för användare och program.
- **Den enda åtkomsten till en tjänst går via den uppsättning operationer som den exporterar.** En
  filtjänst erbjuder `read`, `write` och `delete` — inget annat.
- Att tjänster begränsar åtkomsten till en väldefinierad mängd operationer är dels vanlig god
  programvaruteknik, dels en följd av den fysiska verkligheten: resurser är **fysiskt inkapslade i
  datorer** och kan bara nås från andra datorer genom kommunikation.
- Därför måste varje resurs, för effektiv delning, **förvaltas av ett program som erbjuder ett
  kommunikationsgränssnitt** så att resursen kan nås och uppdateras ==tillförlitligt och konsistent==.

**Så kan du tänka:** du delar aldrig disken. Du delar en filtjänst som råkar ha en disk bakom sig.
Skillnaden är hela poängen — det är gränssnittet som gör resursen delbar, inte hårdvaran. Och det är
också svaret på varför man inte bara kan montera in andras hårddiskar och kalla det ett distribuerat
system.

Två ytterligheter av delningsmönster ställer boken mot varandra (1.4): en **söktjänst på webben**, som
betjänar användare över hela världen som aldrig behöver ha kontakt med varandra, och **datorstött
samarbete** (CSCW), där en liten sluten grupp delar till exempel dokument direkt med varandra.
Mönstret för delningen och användarnas geografiska spridning avgör vilka mekanismer systemet måste
erbjuda för att samordna deras handlingar.

### Muntligt svar

1. Boken kallar *resurs* ett medvetet abstrakt ord, som täcker allt värt att dela i ett nät.
2. Hårdvara: skrivare, diskar och lagring, processorer och beräkningsnoder, en digital videokamera,
   och ljudförbindelsen i ett mobilsamtal.
3. Mjukvara: filer, databaser, dataobjekt av alla slag, webbsidor, och hyrda tjänster som e-post och
   kalendrar.
4. Men det viktiga är hur delningen sker: man delar inte enheten, man delar en **tjänst**.
5. En tjänst förvaltar en samling relaterade resurser och exponerar dem bara genom de operationer den
   exporterar — filtjänsten har read, write, delete.
6. Skälet är att resurser är fysiskt inkapslade i datorer och bara kan nås genom kommunikation, så
   varje resurs måste förvaltas av ett program med ett kommunikationsgränssnitt.
7. Det är det som gör att den kan nås och uppdateras tillförlitligt och konsistent.

---

## 3. Vilka utmaningar finns enligt boken med att bygga ett distribuerat system?

Bokens avsnitt: **1.5**, med en underrubrik per utmaning i **1.5.1–1.5.8**

Boken listar **åtta** utmaningar, i denna ordning. Kan du namnen i ordning har du redan halva svaret:
**heterogenitet, öppenhet, säkerhet, skalbarhet, felhantering, samtidighet, transparens och
tjänstekvalitet.**

### 1. Heterogenitet (1.5.1)

Heterogenitet betyder variation och skillnad, och boken pekar ut **fem** saker som varierar:

- **nät**
- **datorhårdvara**
- **operativsystem**
- **programmeringsspråk**
- **implementationer gjorda av olika utvecklare**

Vad varje skillnad konkret orsakar:

- **Näten.** Internet består av många olika sorters nät, men skillnaderna maskeras av att alla datorer
  använder **internetprotokollen** för att kommunicera. En dator på ett Ethernet har en implementation
  av internetprotokollen över Ethernet; en dator på ett annat slags nät behöver en implementation för
  det nätet.
- **Hårdvaran.** Datatyper som heltal kan representeras olika — boken tar upp att det finns **två
  alternativ för byteordning** för heltal. Skillnaderna måste hanteras om meddelanden ska utbytas
  mellan program på olika hårdvara.
- **Operativsystemen.** Alla behöver en implementation av internetprotokollen, men de erbjuder inte
  nödvändigtvis samma **API** till dem: anropen för att utbyta meddelanden i UNIX skiljer sig från
  anropen i Windows.
- **Språken.** Olika språk representerar tecken och datastrukturer som fält och poster olika.
- **Olika utvecklare.** Program skrivna av olika utvecklare kan inte kommunicera alls om de inte
  använder **gemensamma standarder** — för nätkommunikation och för hur primitiva dataposter och
  datastrukturer representeras i meddelanden. Standarderna måste överenskommas och antas, som
  internetprotokollen blivit.

**Lösningen: [[Middleware]].** Termen betecknar ett mjukvarulager som ger en
**programmeringsabstraktion** och samtidigt **maskerar heterogeniteten** i underliggande nät,
hårdvara, operativsystem och programmeringsspråk. CORBA är bokens exempel. Vissa middleware, som
Java RMI, stöder bara ett enda språk. Merparten är byggd över internetprotokollen, som själva maskerar
skillnaderna mellan näten — men **all** middleware måste hantera skillnaderna i operativsystem och
hårdvara.

Utöver att lösa heterogeniteten ger middleware en **enhetlig beräkningsmodell** för programmeraren.
Möjliga modeller är fjärranrop av objekt, fjärrnotifiering av händelser, SQL-åtkomst på distans och
distribuerad transaktionshantering. CORBA ger fjärranrop av objekt, vilket låter ett objekt i ett
program på en dator anropa en metod hos ett objekt i ett program på en annan dator — implementationen
döljer att meddelanden skickas över ett nät. Se [[Heterogenitet]].

**Mobil kod och virtuella maskiner.** *Mobil kod* är programkod som kan överföras från en dator till
en annan och köras på destinationen; Java-appletar är exemplet. Problemet är att körbara program
normalt är specifika både för **instruktionsuppsättningen** och för **värdoperativsystemet**.
Lösningen är den **virtuella maskinen**: kompilatorn genererar kod för en virtuell maskin i stället
för för en bestämd hårdvaras instruktioner. Javakompilatorn producerar kod för en Java virtual
machine, som kör den genom tolkning; den virtuella maskinen behöver implementeras en gång per
datortyp. Den vanligaste formen av mobil kod idag är **JavaScript** i webbsidor som laddas in i
klientens webbläsare.

### 2. Öppenhet (1.5.2)

Öppenhet är ett mått på hur systemet kan **utökas och omimplementeras** på nya sätt.

- **Öppna system kännetecknas av att deras nyckelgränssnitt är publicerade.**
- De kan utökas **på hårdvarunivå** genom att datorer läggs till nätet, och **på mjukvarunivå** genom
  att nya tjänster införs och gamla omimplementeras, så att program kan dela resurser.
- En ofta nämnd fördel är **oberoende från enskilda leverantörer**.
- Mekanismen som gjorde detta möjligt för internet är **RFC-serien** — se fråga 5, där den hör hemma.
  RFC är inte det enda sättet att publicera: **W3C** utvecklar och publicerar standarder för webben.

### 3. Säkerhet (1.5.3)

Många av informationsresurserna i distribuerade system har ett högt egenvärde för sina användare.
Säkerhet har enligt boken **tre komponenter**:

- **Konfidentialitet** — skydd mot att avslöjas för obehöriga.
- **Integritet** — skydd mot ändring eller korruption.
- **Tillgänglighet** — skydd mot störning av *medlen att komma åt* resurserna.

**Brandväggen räcker inte.** En brandvägg kan bilda en barriär runt ett intranät och begränsa
trafiken in och ut, men den hanterar inte att resurser används olämpligt av användare *inne i*
intranätet, och inte heller resurser ute på internet som inte skyddas av brandväggar.

**Två utmaningar som är lösta**, båda med kryptering:

1. Att skicka **känslig information** i ett meddelande över ett nät på ett säkert sätt. Bokens exempel:
   en läkare som begär åtkomst till patientdata, och en användare som skickar sitt kortnummer.
2. Att **korrekt identifiera** en fjärranvändare eller annan agent. Servern måste veta att användaren
   verkligen är läkare; användaren måste vara säker på identiteten hos butiken eller banken.

**Två utmaningar som ännu inte är helt lösta:**

1. **Överbelastningsattacker** (*denial of service*). En användare kan störa en tjänst genom att
   bombardera den med så många meningslösa förfrågningar att de seriösa användarna inte kan använda
   den. Det har förekommit flera sådana attacker mot välkända webbtjänster. Idag möts de i praktiken
   genom att man försöker fånga och straffa förövarna i efterhand, vilket inte är en generell lösning.
2. **Säkerhet för mobil kod.** Boken tar exemplet att ta emot ett körbart program som e-postbilaga:
   effekterna av att köra det är oförutsägbara — det kan se ut att visa en intressant bild men i
   själva verket komma åt lokala resurser, eller vara en del av en överbelastningsattack.

### 4. Skalbarhet (1.5.4)

Ett system kallas **skalbart** om det förblir effektivt när antalet resurser och antalet användare
ökar betydligt. Se [[Skalbarhet]]. Boken delar utmaningen i **fyra** delar:

1. **Kontrollera kostnaden för de fysiska resurserna.** När efterfrågan växer ska systemet kunna
   utökas till rimlig kostnad. Regeln: för ett system med *n* användare ska mängden fysiska resurser
   som krävs vara ==högst O(*n*), alltså proportionell mot *n*==. Bokens eget exempel: om en filserver
   klarar 20 användare ska två sådana servrar klara 40. Det låter självklart men är inte enkelt i
   praktiken.
2. **Kontrollera prestandaförlusten.** Betrakta en datamängd vars storlek är proportionell mot antalet
   användare eller resurser — till exempel DNS:s tabell mellan datorers domännamn och deras
   internetadresser. **Algoritmer med hierarkiska strukturer skalar bättre än de med linjära.** Men
   även hierarkiska förlorar något: tiden att komma åt hierarkiskt strukturerad data är
   ==O(*log n*)==, där *n* är datamängdens storlek. För att ett system ska vara skalbart får den
   maximala prestandaförlusten inte vara sämre än så.
3. **Förhindra att mjukvaruresurser tar slut.** Bokens exempel på bristande skalbarhet är
   **IP-adresserna**: i slutet av 1970-talet bestämdes 32 bitar, och tillgången håller på att ta slut.
   Därför införs en ny version av protokollet med **128-bitars** adresser, vilket kräver ändringar i
   många mjukvarukomponenter. Boken är rättvis mot de tidiga designerna: det finns ingen korrekt
   lösning, eftersom det är svårt att förutse efterfrågan år framåt — och att överkompensera kan vara
   sämre än att anpassa sig när man tvingas, eftersom större adresser tar extra plats i meddelanden
   och i lagring.
4. **Undvika prestandaflaskhalsar.** Algoritmer bör vara **decentraliserade**. Bokens illustration är
   DNS:s föregångare, där namntabellen låg i en **enda masterfil** som kunde laddas ner av de datorer
   som behövde den. Det fungerade när det fanns några hundra datorer på internet, men blev snabbt en
   allvarlig prestanda- och administrationsflaskhals. DNS tog bort flaskhalsen genom att
   **partitionera** namntabellen mellan servrar spridda över internet, administrerade lokalt.

Vissa delade resurser används mycket ofta — många användare läser samma webbsida — vilket sänker
prestandan. **Cachning och replikering** används för att förbättra prestandan hos hårt belastade
resurser. Idealt borde system- och applikationsmjukvaran inte behöva ändras när skalan växer, men det
är svårt att uppnå.

### 5. Felhantering (1.5.5)

Datorsystem felar ibland, och när fel uppstår kan program ge felaktiga resultat eller stanna innan de
är klara. Det som gör distribuerade system svåra är att **felen är partiella** — vissa komponenter
felar medan andra fortsätter att fungera. Boken ger **fem** tekniker:

1. **Upptäcka fel.** Vissa fel kan upptäckas: **checksummor** avslöjar korrupt data i ett meddelande
   eller en fil. Andra är svåra eller till och med omöjliga att upptäcka, som en kraschad fjärrserver
   ute på internet. Utmaningen är att klara sig i närvaro av fel som inte kan upptäckas men som kan
   **misstänkas**.
2. **Maskera fel.** Vissa upptäckta fel kan döljas eller göras mindre allvarliga. Två exempel:
   meddelanden kan **sändas om** när de inte kommer fram, och data kan skrivas till **ett par diskar**
   så att om den ena blir korrupt kan den andra fortfarande vara riktig. Att bara kasta ett korrupt
   meddelande är att göra felet *mindre allvarligt* — det kan sändas om. Boken är tydlig med att
   teknikerna **inte är garanterade** i värsta fall: datan på den andra disken kan också vara korrupt,
   och meddelandet kanske aldrig kommer fram i rimlig tid hur många gånger det än sänds om.
3. **Tolerera fel.** De flesta internettjänster *uppvisar* fel — det vore opraktiskt för dem att
   försöka upptäcka och dölja allt som kan gå fel i ett så stort nät. Klienterna kan i stället byggas
   för att tolerera fel, vilket i allmänhet innebär att **användarna också får tolerera dem**. När en
   webbläsare inte får kontakt med en webbserver låter den inte användaren vänta för evigt — den
   informerar om problemet och lämnar användaren fri att försöka senare.
4. **Återhämtning från fel.** Mjukvaran designas så att permanent datas tillstånd kan återställas
   eller **rullas tillbaka** efter en serverkrasch. Beräkningar är i allmänhet ofärdiga när ett fel
   inträffar, och den permanenta data de uppdaterar kan därför vara i ett **inkonsistent** tillstånd.
5. **Redundans.** Tjänster kan göras feltoleranta med redundanta komponenter. Bokens tre exempel:
   det ska alltid finnas **minst två olika vägar** mellan två routrar på internet; i DNS är varje
   namntabell **replikerad i minst två** olika servrar; och en databas kan replikeras i flera servrar
   så att datan förblir åtkomlig efter att en enskild server fallerat — servrarna kan designas för att
   upptäcka fel hos sina jämlikar och dirigera om klienterna. Utmaningen är att hålla repliker av
   snabbt föränderlig data uppdaterade **utan orimlig prestandaförlust**.

**Tillgänglighet** (*availability*) definieras som ett mått på **hur stor andel av tiden systemet är
tillgängligt för användning**. Distribuerade system ger hög tillgänglighet vid hårdvarufel, eftersom
bara det arbete som använde den felande komponenten påverkas: en användare kan flytta till en annan
dator, och en serverprocess kan startas på en annan dator.

### 6. Samtidighet (1.5.6)

Flera klienter kan försöka komma åt en delad resurs samtidigt. Bokens exempel är en datastruktur som
registrerar bud i en auktion, vilken används mycket ofta när deadline närmar sig.

- Processen som förvaltar resursen **skulle kunna** ta en klientförfrågan i taget — men det begränsar
  genomströmningen. Därför tillåter tjänster och applikationer i allmänhet att flera förfrågningar
  bearbetas samtidigt.
- Om varje resurs är inkapslad som ett objekt och anrop körs i samtidiga trådar, kan flera trådar
  exekvera samtidigt inne i ett objekt, och då kan deras operationer **konflikta och ge inkonsistenta
  resultat**.
- **Bokens konkreta exempel, värt att kunna utantill:** två samtidiga bud är *Smith: $122* och
  *Jones: $111*. Om operationerna interfolieras utan kontroll kan de sparas som ==*Smith: $111* och
  *Jones: $122*== — alltså med buden förväxlade.

Slutsatsen: varje objekt som representerar en delad resurs måste **själv ansvara för** att det
fungerar korrekt i en samtidig miljö. Det gäller inte bara servrar utan också objekt inne i
applikationer. Tar en programmerare en implementation av ett objekt som inte var avsedd för
distribuerad användning, måste han göra det som krävs för att det blir säkert i en samtidig miljö. För
att vara säkert måste operationerna **synkroniseras** så att datan förblir konsistent, vilket kan
göras med standardtekniker som **semaforer**.

### 7. Transparens (1.5.7)

**Definitionen:** transparens är att **döljandet, för användaren och applikationsprogrammeraren, av
att komponenterna i ett distribuerat system är åtskilda**, så att systemet uppfattas som en helhet
snarare än som en samling oberoende komponenter. Se [[Transparens]].

**ANSA:s referensmanual** och **ISO:s RM-ODP** identifierar **åtta former**:

| Form | Innebörd |
| --- | --- |
| **Åtkomsttransparens** | Lokala och avlägsna resurser kan nås med *identiska operationer* |
| **Platstransparens** | Resurser kan nås utan kunskap om deras fysiska eller nätmässiga placering, till exempel vilken byggnad eller IP-adress |
| **Samtidighetstransparens** | Flera processer kan arbeta samtidigt med delade resurser utan att störa varandra |
| **Replikeringstransparens** | Flera instanser av en resurs kan användas för att öka tillförlitlighet och prestanda, utan att användare eller programmerare känner till replikerna |
| **Feltransparens** | Fel döljs, så att användare och program kan slutföra sina uppgifter trots att hård- eller mjukvarukomponenter fallerar |
| **Mobilitetstransparens** | Resurser och klienter kan flyttas inom systemet utan att det påverkar användares eller programs arbete |
| **Prestandatransparens** | Systemet kan konfigureras om för att förbättra prestandan när lasten varierar |
| **Skalningstransparens** | System och applikationer kan växa i skala utan ändring av systemets struktur eller applikationernas algoritmer |

**De två viktigaste är åtkomst- och platstransparens**, eftersom deras närvaro eller frånvaro starkast
påverkar hur distribuerade resurser kan användas. Tillsammans kallas de ==nätverkstransparens==.

Bokens egna exempel. Tre räcker, och det är dessa tre som examinatorn känner igen:

- **Åtkomsttransparens:** ett grafiskt gränssnitt med mappar ser likadant ut oavsett om filerna i
  mappen är lokala eller avlägsna. **Frånvaro** av åtkomsttransparens: ett system där du inte kan komma
  åt filer på en fjärrdator utan att använda `ftp`-programmet.
- **Nätverkstransparens:** en e-postadress som `Fred.Flintstone@stoneit.com` består av användarnamn och
  domännamn. Att skicka post dit kräver ingen kunskap om fysisk eller nätmässig placering, och
  proceduren beror inte på mottagarens plats — alltså både plats- och åtkomsttransparens.
- **Platstransparens men inte mobilitetstransparens:** en URL är platstransparent, eftersom den del som
  identifierar webbservern är ett **domännamn** snarare än en internetadress. Men någons personliga
  webbsida kan inte flytta till en annan domän, för då pekar alla länkar i andra sidor fortfarande på
  den gamla.

**Transparens är inte alltid önskvärt**, och det är en bra följdfråga att vara redo på. Transparens
gör de resurser som är irrelevanta för uppgiften anonyma — vilken processor som kör en process är
normalt dolt. Men: en resenär som kopplar in sin laptop i varje kontor han besöker **bör** använda
lokala tjänster som e-postutsändning, alltså olika servrar på varje plats. Och även inne i en byggnad
är det normalt att man vill skriva ut på en **särskild, namngiven** skrivare — oftast en som står nära.

### 8. Tjänstekvalitet, QoS (1.5.8)

När användarna fått den funktion de behöver kan man gå vidare och fråga om **kvaliteten** på tjänsten.

- De huvudsakliga **icke-funktionella** egenskaperna som påverkar upplevd kvalitet är
  **tillförlitlighet, säkerhet och prestanda**. **Anpassningsförmåga** till ändrade konfigurationer och
  resurstillgång har erkänts som en ytterligare viktig aspekt.
- **Prestandaaspekten har omdefinierats.** Den definierades ursprungligen i termer av *svarstider och
  beräkningsgenomströmning*, men har omdefinierats i termer av **förmågan att uppfylla
  tidsgarantier**.
- Vissa tillämpningar, bland annat multimedia, hanterar **tidskritisk data**: strömmar av data som
  måste bearbetas eller överföras från en process till en annan i en **fast takt**. En filmtjänst
  måste visa de successiva videobildrutorna för användaren inom bestämda tidsgränser.
- Förkortningen QoS har därför "lagts beslag på" för att beteckna just **förmågan att hålla sådana
  deadlines**. Det förutsätter att nödvändiga beräknings- och nätresurser finns tillgängliga vid rätt
  tidpunkter, vilket i sin tur kräver att systemet ger **garanterade** resurser.
- Dagens nät har hög prestanda, men **när de är hårt belastade försämras prestandan och inga garantier
  ges**. QoS gäller lika mycket operativsystem som nät: varje kritisk resurs måste **reserveras** av
  de applikationer som kräver QoS, och det måste finnas **resurshanterare** som lämnar garantier.
  ==Reservationsförfrågningar som inte kan uppfyllas avvisas.==

**Så kan du tänka:** QoS är det enda av de åtta som inte handlar om att få systemet att *fungera*, utan
om att få det att fungera *i tid*. Och den avgörande mekanismen är reservation med rätt att säga nej —
ett system som accepterar alla förfrågningar kan per definition inte lämna en garanti.

### Muntligt svar

1. Boken listar åtta: heterogenitet, öppenhet, säkerhet, skalbarhet, felhantering, samtidighet,
   transparens och tjänstekvalitet.
2. Heterogenitet är variation i nät, hårdvara, operativsystem, språk och olika utvecklares
   implementationer — lösningen är middleware, som maskerar skillnaderna och ger en enhetlig
   programmeringsmodell.
3. Öppenhet betyder att nyckelgränssnitten är publicerade, så systemet kan byggas ut med nya datorer
   och nya tjänster, oberoende av enskilda leverantörer.
4. Säkerhet har tre delar — konfidentialitet, integritet, tillgänglighet. Kryptering löser att skicka
   känslig data och att identifiera motparten, men överbelastningsattacker och säkerhet för mobil kod
   är ännu inte helt lösta.
5. Skalbarhet: fysiska resurser ska växa högst som O(n), prestandaförlusten högst som O(log n),
   mjukvaruresurser får inte ta slut — som 32-bitars IP-adresser gjorde — och algoritmer ska
   decentraliseras, som när DNS ersatte en enda masterfil.
6. Felhantering: felen är partiella. Man upptäcker med checksummor, maskerar med omsändning, tolererar
   genom att låta klienten ge upp snyggt, återhämtar genom att rulla tillbaka, och bygger redundans —
   som att DNS-tabeller ligger i minst två servrar.
7. Samtidighet: flera trådar i samma objekt kan förväxla data, som auktionsbuden Smith och Jones, så
   operationerna måste synkroniseras.
8. Transparens är att dölja att komponenterna är åtskilda; det finns åtta former, och de två viktigaste
   är åtkomst och plats, tillsammans nätverkstransparens.
9. Tjänstekvalitet handlar om tidsgarantier för tidskritisk data, och kräver att resurser reserveras
   och att förfrågningar som inte kan uppfyllas avvisas.

---

## 4. Vilka arv från IP, HTTP och HTML måste man ta hänsyn till vid utveckling av distribuerade system?

Bokens avsnitt: **1.6** (webbens tre komponenter och deras begränsningar), **1.5.4** (IP-adresserna),
**3.4.3** (IP:s leveranssemantik — annat kapitel, men det är där påståendet står)

### Utgångspunkten: webben vilar på tre standarder

Boken säger uttryckligen att webben bygger på **tre** huvudsakliga standardkomponenter:

- **HTML** — ett språk för att ange innehåll och layout på sidor som de visas av webbläsare.
- **URL** (även kallat URI) — identifierar dokument och andra resurser lagrade som del av webben.
- **En klient-server-arkitektur med HTTP** som standardregler för interaktionen, med vilken webbläsare
  och andra klienter hämtar dokument och resurser från webbservrar.

Webben är ett **öppet** system: den kan utökas och implementeras på nya sätt utan att den befintliga
funktionen störs. Den öppenheten vilar på två saker — att den bygger på kommunikations- och
innehållsstandarder som är **fritt publicerade och brett implementerade**, så att vilken
standardefterlevande webbläsare som helst kan hämta resurser från vilken standardefterlevande server
som helst; och att den är öppen med avseende på **vilka typer av resurser** som kan publiceras.

### Arvet från HTML

**Mekanismen:** HTML anger text och bilder som utgör innehållet i en webbsida, och hur de placeras och
formateras för visning. En sida innehåller strukturerade element som rubriker, stycken, tabeller och
bilder. HTML anger också länkar och vilka resurser de hör till. Direktiven kallas **taggar** och
omges av vinkelparenteser. Viktigt: **bara webbläsaren, inte servern, tolkar HTML-texten** — men
servern talar om vilken *innehållstyp* den returnerar, vilket den kan sluta sig till från filändelsen.

**Arvet du måste ta hänsyn till** — boken är rakt på sak:

- ==**HTML är otillräckligt för interoperation mellan program**== (*inadequate for programmatic
  interoperation*).
- Skälet: HTML har en **statisk uppsättning strukturer**, som stycken, och dessa är **sammanbundna med
  hur datan ska presenteras för användare**. Språket är inte utbyggbart till tillämpningar utöver att
  bläddra i information.
- Behovet växer ändå: allt fler typer av **strukturerad data** måste utbytas på webben.
- **Lösningen boken pekar på är XML** — utformat som ett sätt att representera data i standardiserade,
  strukturerade, **tillämpningsspecifika** former. XML-data är i princip **portabel mellan
  tillämpningar eftersom den är självbeskrivande**: den innehåller namnen, typerna och strukturen hos
  dataelementen i sig. XML kan beskriva produkter eller användarinformation för många olika tjänster,
  och kan i HTTP överföras med POST och GET.

**Så kan du tänka:** HTML blandar *data* och *presentation* i samma dokument. Det är utmärkt för en
människa som läser en sida och katastrofalt för ett program som ska plocka ut ett pris. Arvet är
alltså att så snart två *program* ska prata med varandra över webben måste du lägga ett dataformat
ovanpå — XML, och i praktiken idag JSON. Boken nämner bara XML; JSON förekommer knappt i den, så säg
XML på tentan.

### Arvet från HTTP

Boken beskriver fyra egenskaper hos HTTP, och tre av dem är arv som direkt påverkar hur du bygger:

1. **Anrop-svar-interaktion** (*request-reply*). Klienten skickar ett förfrågningsmeddelande med
   resursens URL; servern letar upp sökvägen och skickar tillbaka innehållet, annars ett felsvar som
   det välkända **404 Not Found**. HTTP definierar en **liten mängd operationer**, kallade metoder, som
   kan utföras på en resurs — de vanligaste är **GET** för att hämta data och **POST** för att lämna
   data till resursen.
2. **Innehållstyper.** Webbläsare klarar inte nödvändigtvis alla innehållstyper. När en webbläsare gör
   en förfrågan **bifogar den en lista över de typer den föredrar**, och servern kan ta hänsyn till
   det. Servern anger innehållstypen i svaret så att webbläsaren vet hur den ska bearbeta det.
   Typbeteckningarna kallas **MIME-typer** och är standardiserade i **RFC 1521**. `text/html` tolkas
   som HTML, `image/GIF` renderas som bild, `application/zip` startar ett externt hjälpprogram.
3. **En resurs per förfrågan.** Klienter anger ==*en* resurs per HTTP-förfrågan==. Bokens eget exempel:
   innehåller en webbsida nio bilder gör webbläsaren **totalt tio separata förfrågningar** för att få
   hela sidans innehåll. Webbläsare gör därför typiskt **flera förfrågningar samtidigt** för att minska
   den totala fördröjningen för användaren.
4. **Enkel åtkomstkontroll.** Som standard kan ==vilken användare som helst med nätförbindelse till en
   webbserver komma åt vilken som helst av dess publicerade resurser==. Vill man begränsa åtkomsten
   konfigurerar man servern att utfärda en **utmaning** (*challenge*) till klienten, och användaren
   måste sedan bevisa sin rätt, till exempel genom att skriva ett lösenord.

**Kompletterande, från kapitel 5:** att upprätta och stänga en förbindelse för varje anrop-svar-utbyte
är dyrt — det belastar servern och orsakar för många meddelanden över nätet. Eftersom webbläsare
generellt gör flera förfrågningar till samma server, till exempel för bilderna i en sida, införde
**HTTP 1.1** (RFC 2616) **beständiga förbindelser** som hålls öppna över en serie utbyten. Nämn det
bara om du blir tillfrågad — det ligger utanför kapitel 1.

**Så kan du tänka:** de två arven från HTTP som kostar dig mest i praktiken är *en resurs per
förfrågan* och *åtkomst för alla som standard*. Det första betyder att en sida med mycket innehåll
kostar många rundturer, och därför handlar en stor del av webbprestanda om att slippa dem — samtidiga
förfrågningar, beständiga förbindelser, cachning. Det andra betyder att åtkomstkontroll är något du
måste **lägga till**; ingenting skyddar en publicerad resurs som standard.

### Arvet från IP

I kapitel 1 beskrivs IP:s roll som positiv — det är protokollet som gör att program *kan* nå varandra
(se fråga 5). De två arven som är begränsningar finns på två andra ställen:

- **Adressrymden tog slut (1.5.4).** I slutet av 1970-talet bestämdes **32 bitar** för IP-adresser, och
  tillgången håller på att ta slut. Därför införs en version med **128-bitars** adresser, och det
  ==kräver ändringar i många mjukvarukomponenter==. Det är arvet i sin renaste form: ett designbeslut
  från 1970-talet som tvingar fram arbete i din kod idag. Boken påpekar också avvägningen — att
  överkompensera hade också kostat, eftersom större adresser tar extra plats i meddelanden och lagring.
- **Leveransen är inte garanterad (3.4.3, alltså kapitel 3).** IP erbjuder en leveranstjänst som
  beskrivs som ==*opålitlig* eller *best-effort*==, eftersom **ingen leverans garanteras**. Paket kan
  **förloras, dubbleras, fördröjas eller levereras i fel ordning**, men felen uppstår bara när de
  underliggande näten fallerar eller buffertarna hos mottagaren är fulla. Den enda checksumman i IP är
  en **huvudchecksumma**, som är billig att beräkna och säkerställer att korruption i adress- och
  pakethanteringsdata upptäcks — alltså **inte** i själva nyttolasten.

**Var noga här på tentan:** kapitel 1 säger inte att IP är best-effort och det använder inte ordet
*tillståndslös* om HTTP någonstans. Säger du "IP är best-effort" är det korrekt, men det kommer från
kapitel 3 — säg gärna det, det visar att du vet var saken står.

### Webbens egna designproblem, som hör till samma fråga

Boken har ett avsnitt som uttryckligen diskuterar att "webbens framgång döljer vissa designproblem":

- **Hypertextmodellen har brister.** Om en resurs tas bort eller flyttas kan **hängande länkar**
  (*dangling links*) kvarstå, vilket frustrerar användarna. Och det välkända problemet att användare
  blir **"lost in hyperspace"** — förvirrade när de följer många spretiga länkar till sidor från
  spridda källor, i vissa fall av tvivelaktig tillförlitlighet.
- **Som systemarkitektur möter webben skalproblem.** Populära webbservrar kan uppleva många träffar per
  sekund, vilket gör svaren till användarna långsamma. Motmedlen är **cachning** i webbläsare och
  proxyservrar, och att **dela serverns last över kluster** av datorer.

### Muntligt svar

1. Webben vilar på tre standarder: HTML, URL:er och en klient-server-arkitektur med HTTP.
2. HTML-arvet: HTML är otillräckligt för interoperation mellan program, eftersom det har en statisk
   uppsättning strukturer som är sammanbundna med presentationen.
3. Därför behövs XML, som är självbeskrivande och bär namn, typer och struktur för dataelementen.
4. HTTP-arvet, tre delar: anrop-svar med en liten mängd metoder, framför allt GET och POST; en resurs
   per förfrågan, så nio bilder ger tio förfrågningar; och åtkomst för alla som standard, där man måste
   konfigurera en utmaning för att begränsa.
5. Praktiskt betyder en-resurs-per-förfrågan många rundturer, vilket är därför man gör samtidiga
   förfrågningar och cachar.
6. IP-arvet är dels att 32-bitars adresser tog slut och att övergången till 128 bitar kräver ändringar
   i många mjukvarukomponenter, dels — och det står i kapitel 3 — att IP är best-effort: paket kan
   förloras, dubbleras, fördröjas eller komma i fel ordning.
7. Och webben har egna designproblem man ärver: hängande länkar, ofullkomlig sökning och skalproblem
   som möts med cachning och kluster.

---

## 5. Vilken roll har IP och RFC för utvecklingen av distribuerade system?

Bokens avsnitt: **1.3.1** (internetprotokollen), **1.5.1** (att de maskerar näten), **1.5.2** (RFC och
öppenhet)

### IP:s roll: den gemensamma nämnaren som gör allt annat möjligt

- **Ett gemensamt kommunikationsmedel.** Program som körs på datorer anslutna till internet interagerar
  genom att skicka meddelanden och använder ett **gemensamt kommunikationsmedel**.
- **Boken kallar det ett stort tekniskt genombrott.** Utformningen och konstruktionen av
  internetprotokollen är "en betydande teknisk prestation" som gör att ==ett program som körs var som
  helst kan adressera meddelanden till program var som helst annars==, och som **abstraherar bort**
  mängden av underliggande teknologier — WiFi, WiMAX, Bluetooth, tredje generationens mobilnät och alla
  de andra.
- **Den maskerar heterogeniteten i näten (1.5.1).** Internet består av många olika sorters nät, men
  skillnaderna maskeras av att alla anslutna datorer använder internetprotokollen. Varje nättyp behöver
  sin egen implementation av protokollen — Ethernet har en, ett annat nät har en annan — men *ovanför*
  dem ser allt likadant ut.
- **Middleware bygger på den.** Merparten av all middleware är implementerad **över**
  internetprotokollen, just därför att dessa redan maskerar skillnaderna mellan näten. Middleware
  behöver då bara ta hand om skillnaderna i operativsystem och hårdvara.
- **Följden är att nätverk blivit en genomgripande resurs** — enheter kan anslutas när som helst och var
  som helst.
- **Internet är därmed självt ett mycket stort distribuerat system**, vars tjänsteutbud är **öppet i
  ändarna**: det kan utökas genom att man lägger till serverdatorer och nya typer av tjänst.

**Så kan du tänka:** IP:s roll är att vara den enda punkt där alla är tvungna att komma överens. Under
IP får vem som helst hitta på vilken nätteknik som helst, och ovanför IP får vem som helst hitta på
vilken tjänst som helst — men alla måste passera genom samma smala midja. Det är därför ett protokoll
som inte garanterar någonting ändå blev det viktigaste i sammanhanget: ju mindre det lovar, desto
fler slags nät kan uppfylla det.

### RFC:ernas roll: den öppna publiceringen

- **Vad de är.** Internetprotokollens designer införde en serie dokument kallade **"Requests For
  Comments"**, eller RFC:er, ==där varje dokument är känt genom ett nummer==.
- **Vad som publicerades och när.** Specifikationerna av internets kommunikationsprotokoll publicerades
  i serien i **början av 1980-talet**, följt av specifikationer för tillämpningar som körs över dem —
  **filöverföring, e-post och telnet** — i **mitten av 1980-talet**.
- **Praxisen har fortsatt** och utgör **grunden för internets tekniska dokumentation**. Serien innehåller
  **diskussioner** såväl som specifikationer av protokoll. Kopior kan hämtas från `ietf.org`.
- **Effekten, med bokens egna ord:** ==publiceringen av de ursprungliga internetprotokollen har gjort det
  möjligt att bygga en mängd olika internetsystem och tillämpningar, inklusive webben==.
- **RFC är inte det enda sättet.** Boken påpekar att **W3C** utvecklar och publicerar standarder som rör
  webbens funktion.

### Kopplingen till öppenhet, som är varför frågan ställs

RFC:erna är mekanismen bakom utmaningen **öppenhet** (1.5.2), och det är den kopplingen som gör svaret
till mer än en historielektion:

- **Öppna system kännetecknas av att deras nyckelgränssnitt är publicerade.** RFC-serien *är* den
  publiceringen för internet.
- System som stöder resursdelning på detta sätt kallas **öppna distribuerade system**, för att betona att
  de är **utbyggbara** — på hårdvarunivå genom att datorer läggs till nätet, på mjukvarunivå genom att
  nya tjänster införs och gamla omimplementeras.
- **En ofta nämnd fördel med öppna system är oberoende från enskilda leverantörer.**
- Webben är bokens exempel på att detta fungerar: eftersom standarderna är **fritt publicerade och brett
  implementerade** finns det många webbläsare, ofta på flera plattformar, och många implementationer av
  webbservrar — och **vilken standardefterlevande webbläsare som helst kan hämta resurser från vilken
  standardefterlevande server som helst**.

Ett konkret exempel på en RFC du redan har mött i fråga 4: **MIME-typerna är standardiserade i RFC
1521**. Det är precis mekanismen i praktiken — en publicerad, numrerad överenskommelse som gör att
servern och webbläsaren kan vara skrivna av olika personer och ändå förstå varandra.

### Muntligt svar

1. IP:s roll är att vara det gemensamma kommunikationsmedlet — boken kallar internetprotokollen en
   betydande teknisk prestation.
2. De gör att ett program var som helst kan adressera meddelanden till ett program var som helst annars,
   och abstraherar bort alla underliggande nätteknologier.
3. Det är också hur heterogeniteten i näten maskeras: varje nättyp implementerar protokollen, och ovanför
   dem ser allt likadant ut.
4. Därför är nästan all middleware byggd ovanpå internetprotokollen och behöver bara hantera skillnader i
   operativsystem och hårdvara.
5. RFC:erna är serien numrerade dokument som internetprotokollens designer införde; protokollen kom i
   början av 80-talet, tillämpningarna som filöverföring, e-post och telnet i mitten.
6. De innehåller diskussioner såväl som specifikationer och utgör grunden för internets tekniska
   dokumentation.
7. Effekten är att publiceringen gjorde det möjligt att bygga en mängd system och tillämpningar,
   inklusive webben — och det är exakt vad boken menar med öppenhet: nyckelgränssnitten är publicerade,
   vilket ger utbyggbarhet och oberoende från enskilda leverantörer.
8. W3C spelar samma roll för webbens standarder, och MIME-typerna i RFC 1521 är ett konkret exempel.

---

## Luckor och källor

- **Inga luckor i det här kapitlet.** Alla fem frågor besvaras av boken, till skillnad från kapitel 2
  där MVC inte finns i den.
- Allt ovan är hämtat ur boken, avsnitt 1.1, 1.2.1–1.2.3, 1.3.1, 1.3.4, 1.4, 1.5.1–1.5.8 och 1.6.
- **Två påståenden kommer från andra kapitel och är märkta i texten:** att IP är *best-effort* och att
  paket kan förloras, dubbleras, fördröjas eller komma i fel ordning står i **3.4.3**, och HTTP 1.1:s
  beständiga förbindelser i **kapitel 5**. Kapitel 1 innehåller inget av det.
- **Boken använder aldrig ordet *tillståndslös* (*stateless*) om HTTP.** Ordet förekommer i boken, men
  bara om EJB-sessionsbönor och om filservrar i NFS och AFS. Påståendet "HTTP är tillståndslöst" är
  sant i allmänhet men går inte att stödja på den här boken, så bygg inte ett tentasvar på det.
- Avsnitten märkta **Så kan du tänka** är mina förklaringar, inte bokens formuleringar.
- Siffrorna i texten står i boken: 10 miljarder sökningar per månad, 63 miljarder webbsidor, 5 000
  stjärnsystem, 50 000 samtidiga spelare, hundratals datornoder, 32 respektive 128 bitars IP-adresser,
  20 och 40 användare i skalbarhetsexemplet, samt RFC 1521 och RFC 2616. Boken ger inga formler i det
  här kapitlet utöver O(*n*) och O(*log n*).
- Utanför tentafrågorna, och därför medvetet kortfattat: mobil och allestädes närvarande databehandling
  (1.3.2), distribuerade multimediasystem (1.3.3), URL:ernas uppbyggnad i detalj samt dynamiska sidor,
  CGI, JavaScript, AJAX och appletar (1.6). Dessa nämns bara där de behövs för ett svar.
