---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-09
updated: 2026-09-09
description: "Svar på tentafrågorna för HI1031 kapitel 11 – säkerhet: hot och attacker, kryptografins roller, symmetrisk, asymmetrisk och hybridkryptering, samt hur nyckelpar ger autenticitet."
---
# HI1031 Tentafrågor och Svar - Kap 11 Säkerhet

## 1. Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot?

Bokens avsnitt: §11.1 och §11.1.1

**Börja med varför hotet finns.** Behovet av säkerhetsmekanismer kommer ur ==önskan att dela
resurser==. Boken säger det rakt ut i en parentes: resurser som *inte* delas kan i regel skyddas
genom att ==stängas av från nätet==. Det är delningen som skapar problemet.

**Två saker måste skyddas.** Processer kapslar in resurser och släpper in klienter genom gränssnitt,
så resurserna måste skyddas mot ==obehörig åtkomst==. Och processerna pratar över ett nät som ==många
användare delar==, där en angripare kan ==kopiera eller läsa varje meddelande== och ==injicera egna
meddelanden== som utger sig för att komma från vem som helst.

**Två hot utanför kanalen.** Boken säger att kanalhoten är de enda som behöver övervägas för många
system, men att det finns fler för system som ==kör inlästa program== eller är ==särskilt känsliga för
informationsläckage==. **Hot från mobil kod:** laddas kod in i en process kan ==processens inre
gränssnitt och objekt utsättas för angrepp==. Javas svar är ==sandlådemodellen== — varje tillämpning får
en egen miljö med en ==säkerhetshanterare som bestämmer vilka resurser den får==, och när den satts
==kan den inte bytas ut==.

**De tre hotklasserna.** Boken delar säkerhetshoten i tre breda klasser:

- **Läckage** (*leakage*) — att ==obehöriga får tag på information==.
- **Manipulation** (*tampering*) — ==obehörig ändring av information==.
- **Vandalisering** (*vandalism*) — att ==störa systemets funktion utan vinst för angriparen==. Det är
  den enda av de tre där angriparen inte tjänar något själv.

**De fem attackmetoderna.** Attacker mot distribuerade system bygger på att komma åt en befintlig
kommunikationskanal eller att sätta upp en ny som ==utger sig för att vara en behörig anslutning==.
Boken klassar dem efter *hur kanalen missbrukas*:

- **Avlyssning** (*eavesdropping*) — skaffa kopior av meddelanden utan behörighet.
- **Maskering** (*masquerading*) — skicka eller ta emot meddelanden ==under någon annans identitet==.
- **Meddelandemanipulation** (*message tampering*) — fånga upp meddelanden och ==ändra innehållet==
  innan de skickas vidare.
- **Uppspelning** (*replaying*) — lagra uppfångade meddelanden och ==skicka dem vid ett senare
  tillfälle==.
- **Överbelastning** (*denial of service*) — ==dränka en kanal eller resurs== med meddelanden så att
  andra inte kommer åt den.

**Två av dem har detaljer som är värda att kunna.** *Man-in-the-middle* är en form av
meddelandemanipulation där angriparen fångar ==allra första meddelandet i ett nyckelutbyte== och byter
ut nycklarna mot sina egna. Sedan kan han dekryptera allt som följer, kryptera om det med rätt nyckel
och skicka vidare — utan att någon märker något. Och uppspelning kan vara ==effektivt även mot
autentiserade och krypterade meddelanden==, eftersom angriparen inte behöver nyckeln: det räcker att
kopiera bitmönstret. Bokens exempel är en betalningsbegäran som spelas upp igen så att offret betalar
två gånger.

**Så kan du tänka.** De tre hotklasserna svarar på *vad* som går fel, de fem attackmetoderna på *hur*
det görs. Får du frågan är det den uppdelningen som gör svaret ordnat — och de fem metoderna är den
lista examinatorn troligen letar efter. (egen strukturering, båda listorna är bokens)

### Muntligt svar

1. Behovet av säkerhet kommer ur att vi vill dela resurser. Det som inte delas kan skyddas genom att
   isoleras, så det är delningen som skapar problemet.
2. Boken delar hoten i tre klasser: läckage, manipulation och vandalisering. Vandalisering är den där
   angriparen stör systemet utan att själv vinna något.
3. Attackerna klassas efter hur en kommunikationskanal missbrukas, och de är fem: avlyssning,
   maskering, meddelandemanipulation, uppspelning och överbelastning.
4. Man-in-the-middle är en särskild form av manipulation — angriparen tar första meddelandet i
   nyckelutbytet och byter ut nycklarna, och kan sedan läsa allt.
5. Uppspelning fungerar även mot krypterade och autentiserade meddelanden, eftersom angriparen inte
   behöver nyckeln utan bara kopierar bitmönstret.
6. Utöver kanalhoten finns mobil kod, där Javas sandlåda är svaret, och informationsläckage, där själva
   existensen av trafik avslöjar något.

Vilka är de viktigaste hoten och attackerna som ett distribuerat system måste skyddas mot? (3)
||
- **Varför** – det är delningen av resurser som skapar problemet; det som inte delas kan skyddas genom att stängas av från nätet
- **Tre hotklasser** – läckage, att obehöriga får information, manipulation, obehörig ändring, och vandalisering, att störa systemet utan egen vinst
- **Fem attackmetoder** – avlyssning, maskering, meddelandemanipulation, uppspelning och överbelastning

## 2. Beskriv vilken roll kryptering har för säkerhet, förutom att dölja innehållet i ett meddelande (konfidentialitet, autentisering, integritet, oförnekbarhet)

Bokens avsnitt: §11.2.1 och §11.2.2, plus §11.1.1 och §11.1.2 för oförnekbarhet

**Vad kryptering är, kort.** Att ==koda ett meddelande så att innehållet döljs==. Alla moderna
algoritmer bygger på hemligheter som kallas ==nycklar==. En nyckel är en parameter till
krypteringsalgoritmen, vald så att ==krypteringen inte kan vändas utan att man känner nyckeln==.

**Bokens ram: kryptografi har tre huvudroller.** Det är så boken själv delar upp det, och det är den
uppdelningen du ska svara med:

- **Sekretess och integritet.**
- **Autentisering.**
- **Digitala signaturer.**

Tentafrågan räknar upp fyra saker, men de faller inom de tre: *konfidentialitet* och *integritet* är
den första rollen, *autentisering* den andra, och *oförnekbarhet* får man ur den tredje.

**Sekretess (konfidentialitet).** Bygger på att ett meddelande som krypterats med en viss nyckel
==bara kan dekrypteras av den som har motsvarande dekrypteringsnyckel==. Sekretessen håller så länge
nyckeln inte är ==röjd== (*compromised*, alltså känd av någon utanför kommunikationen) och algoritmen
är stark nog.

**Integritet, och det viktiga villkoret.** Kryptering bevarar också informationens integritet — men
boken sätter ett villkor: ==bara förutsatt att någon redundant information, till exempel en
checksumma, läggs in och kontrolleras==. En *checksumma* är ett kort värde som räknas fram ur
meddelandets innehåll; ändras innehållet stämmer summan inte längre, så mottagaren märker det.
Integritet är alltså inte något man får gratis av att kryptera. Samma sak sägs om ==blockchiffer== —
chiffer som krypterar datan i block av fast storlek, till skillnad från ==strömchiffer== som krypterar
en löpande ström bit för bit: integriteten är ==inte garanterad== om inte en checksumma eller en säker
sammanfattning används.

**Autentisering — hur kryptering ger det.** Lyckas en part dekryptera ett meddelande med en viss nyckel
kan han anta att meddelandet är ==autentiskt==, förutsatt att det innehåller en riktig checksumma eller
något annat förväntat värde. Han kan då dra slutsatsen att avsändaren ==hade motsvarande
krypteringsnyckel==, och ==om nyckeln bara är känd av två parter== följer avsändarens identitet. Alltså:
hålls nycklarna privat ==autentiserar en lyckad dekryptering meddelandet== som kommande från en
bestämd avsändare.

**Oförnekbarhet.** Boken definierar det i banksammanhang: banken måste kunna se till att kontohavaren
==inte kan förneka att han deltog i en transaktion==. ==*Non-repudiation* är namnet på det kravet.==
Mekanismen är den digitala signaturen, som ==intygar för en tredje part== att ett meddelande är en
oförändrad kopia av något som signeraren producerat. Bokens konkreta fall är
"fantomuttagsproblemet" i en bankomat: det bästa svaret en bank kan ge på en sådan anklagelse är
==en transaktion som är digitalt signerad av kontohavaren på ett sätt som en tredje part inte kan
förfalska==.

**Så kan du tänka.** Den enklaste sammanfattningen av frågan: kryptering döljer innehållet, men det är
==vem som kan dekryptera== som ger allt det andra. Kan bara du kryptera något blir det ett bevis på att
du gjort det — och det är hela grunden för autentisering, signaturer och oförnekbarhet. (egen slutsats)

### Muntligt svar

1. Boken delar kryptografins roller i tre: sekretess och integritet, autentisering, och digitala
   signaturer. Tentafrågans fyra begrepp faller inom de tre.
2. Sekretess bygger på att bara den med rätt dekrypteringsnyckel kan läsa, och håller så länge nyckeln
   inte är röjd.
3. Integritet får man inte gratis — boken kräver att redundans som en checksumma läggs in och
   kontrolleras.
4. Autentisering: lyckas dekrypteringen med en nyckel som bara två parter känner, så vet man vem
   avsändaren är. Det är själva mekanismen.
5. Oförnekbarhet betyder att avsändaren inte kan förneka att han deltog. Mekanismen är den digitala
   signaturen, och bokens exempel är fantomuttag i en bankomat.
6. Sammanfattningsvis: kryptering döljer innehållet, men det är vem som *kan* dekryptera som ger allt
   det andra — kan bara du kryptera något blir det ett bevis på att du gjort det.

Vilken roll har kryptering för säkerhet, utöver att dölja innehållet? (4)
||
- **Konfidentialitet** – bara den som har motsvarande dekrypteringsnyckel kan läsa, och det håller så länge nyckeln inte är röjd
- **Integritet** – fås inte gratis: det krävs att redundant information som en checksumma läggs in och kontrolleras, annars märks inte en ändring
- **Autentisering** – lyckas man dekryptera med en nyckel som bara två parter känner, så vet man vem avsändaren är
- **Oförnekbarhet** – avsändaren kan inte förneka att han deltog; det uppnås med en digital signatur som intygar meddelandet för tredje part

## 3. Förklara hur symmetrisk, asymmetrisk respektive hybridkryptering fungerar. I vilka situationer används respektive typ? Prestanda?

Bokens avsnitt: §11.3, §11.3.1, §11.3.2, §11.3.3 och §11.5.1

**Grunduppställningen.** Avsändaren omvandlar ==klartext== till ==chiffertext==. Krypteringen
definieras av två delar: en ==funktion E== och en ==nyckel K==. Mottagaren måste känna den omvända
regeln. Man kan se algoritmen som ==en stor familj av funktioner, där nyckeln väljer ut en medlem==.

**Varför de heter symmetrisk och asymmetrisk.** Vid hemlig nyckel är ==nyckeln för dekryptering samma
som för kryptering== — därför *symmetrisk*. Publik nyckel kallas *asymmetrisk* eftersom ==nycklarna för
kryptering och dekryptering är olika==.

### Symmetrisk kryptering

**Mekanismen är envägsfunktioner.** Tar man bort nyckelparametern är det en egenskap hos starka
krypteringsfunktioner att funktionen är ==lätt att beräkna framåt== medan inversen är ==så svår att den
inte är genomförbar==. Sådana kallas ==envägsfunktioner==, och det är just det som skyddar mot försök
att hitta klartexten.

**Styrkan sitter i nyckellängden.** Mot försök att hitta nyckeln, givet både klartext och chiffertext,
beror styrkan på ==storleken på K==. Skälet är att den effektivaste allmänna attacken är den grövsta:
en ==uttömmande sökning== (*brute force*) genom alla möjliga nyckelvärden. Har nyckeln *N* bitar krävs
i snitt hälften av alla värden och som mest alla, så ==tiden att knäcka nyckeln växer exponentiellt
med antalet bitar==.

### Asymmetrisk kryptering

**Mekanismen är fälldörrsfunktioner.** Diffie och Hellman föreslog 1976 en metod som ==tar bort behovet
av tillit mellan de kommunicerande parterna==. Grunden för alla publik-nyckelsystem är
==fälldörrsfunktioner== (*trap-door functions*): en envägsfunktion ==med en hemlig utgång== — lätt att
beräkna i en riktning, men ==omöjlig att vända om man inte känner hemligheten==.

**Hur nyckelparet uppstår.** Paret härleds ur en ==gemensam rot==, och själva härledningen är en
envägsfunktion. För RSA är roten ==ett godtyckligt valt par av mycket stora primtal==. Att multiplicera
dem tar ==bara några sekunder==, men att ==faktorisera produkten *N*== tillbaka till primtalen är
==praktiskt taget omöjligt==. En av nycklarna görs publik, den andra hålls hemlig; ==vem som helst
kan kryptera, bara den med den hemliga nyckeln kan öppna fälldörren==.

**Därför är nycklarna så mycket längre.** *N* och minst en av nycklarna är ==mycket större än en säker
symmetrisk nyckel==, för att *N* inte ska gå att faktorisera. Följden är att ==risken för att någon
provar alla nycklar mot RSA är liten== — styrkan bygger i stället på att faktoriseringen inte går att
göra. RSA-innehavarna rekommenderar ==minst 768 bitar== för säkerhet på lång sikt, cirka 20 år, och
==2048-bitarsnycklar== används i vissa tillämpningar. ==512 bitar är klart otillräckligt för många
syften==.

**En gardering boken själv gör.** RSA och andra asymmetriska former som använder primtalsmultiplikation
som envägsfunktion ==blir sårbara om en snabbare faktoriseringsalgoritm upptäcks==.

### Hybridkryptering

**Varför den finns.** Publik nyckel är bekvämt för e-handel eftersom det ==inte behövs någon säker
mekanism för nyckeldistribution==. Boken lägger genast till ett förbehåll: de publika nycklarna måste
==autentiseras==, men det är ==mycket mindre betungande== — det räcker att skicka ett certifikat med
nyckeln. Problemet är kostnaden: ==publik nyckel kräver för mycket datorkraft== även för medelstora
meddelanden av det slag e-handel normalt innebär.

**Vad lösningen är.** Den lösning som ==de flesta storskaliga distribuerade system== väljer är ett
hybridschema:

1. ==Asymmetrisk== kryptering används för att ==autentisera parterna== och för att ==kryptera ett
   utbyte av hemliga nycklar==.
2. De hemliga nycklarna används sedan för ==all vidare kommunikation==, alltså symmetriskt.

Boken pekar ut ==TLS== som sitt exempel på en hybridimplementation.

### Vilken typ används var, och vad kostar de

**Situationerna.** Symmetriskt används för ==bulkkryptering== av själva datan; boken kallar IDEA
"ett gott allroundval för bulkkryptering". Asymmetriskt används för ==nyckelutbyte och signering==, och
boken säger rakt ut att asymmetriska algoritmer som RSA ==sällan används för att kryptera data==.
Anledningen står i §11.3.2: funktioner av stora tal ger ==stora bearbetningskostnader==, vilket
hanteras genom att använda publika nycklar ==bara i de inledande stegen== av en säker session.

**Prestandaförhållandet, den siffra som svarar på frågan.** Publik-nyckelalgoritmer kräver ==typiskt
100 till 1000 gånger så mycket processorkraft== som hemlig-nyckelalgoritmer. Boken lägger till att det
finns lägen där ==bekvämligheten väger över den nackdelen==. Av de symmetriska är ==AES snabbast och
Triple-DES långsammast==.

**Och vad det betyder i praktiken.** Webbsidor är ==sällan större än 100 kilobyte==, så en sida kan
krypteras med ==vilken som helst== av de symmetriska algoritmerna på ==några millisekunder==, till och
med med en processor som är långsam med dagens mått. RSA används främst för signaturer, och även det
steget tar några millisekunder. Slutsatsen boken drar: ==algoritmernas prestanda påverkar knappt hur
snabb https känns==. Konkret för RSA med 1024-bitars nyckel: ==cirka 4,75 ms att signera==
en säker sammanfattning och ==cirka 0,18 ms att verifiera== signaturen.

**En gardering värd att ta med.** Nyckellängderna ger bara ==en indikation== på kostnaden för att prova
alla nycklar. Boken skriver att ==den verkliga styrkan är mycket svårare att bedöma== och bygger
på resonemang om hur väl algoritmen döljer klartexten.

### Muntligt svar

1. Symmetrisk kryptering använder samma nyckel båda vägarna. Den bygger på envägsfunktioner, och
   styrkan sitter i nyckellängden eftersom den bästa attacken är uttömmande sökning.
2. Asymmetrisk använder ett nyckelpar härlett ur en gemensam rot, och bygger på fälldörrsfunktioner.
   För RSA är roten två stora primtal, och säkerheten bygger på att produkten inte går att faktorisera.
3. Därför är asymmetriska nycklar mycket längre, och därför kostar de typiskt 100 till 1000 gånger mer
   processorkraft.
4. Hybridkryptering löser det: asymmetrisk kryptering autentiserar parterna och utbyter en hemlig
   nyckel, sedan sköter symmetrisk kryptering all vidare trafik. TLS är bokens exempel.
5. Situationerna följer av kostnaden — symmetriskt för bulkdata, asymmetriskt för nyckelutbyte och
   signering. Asymmetriskt används sällan för att kryptera data alls.
6. Prestanda i praktiken: en webbsida under 100 kB krypteras på några millisekunder, så https påverkas
   minimalt. RSA med 1024 bitar tar cirka 4,75 ms att signera och 0,18 ms att verifiera.

Hur fungerar symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – samma nyckel krypterar och dekrypterar; bygger på envägsfunktioner, och styrkan sitter i nyckellängden eftersom bästa attacken är att prova alla nycklar
- **Asymmetrisk** – olika nycklar för kryptering och dekryptering; bygger på fälldörrsfunktioner, för RSA två stora primtal vars produkt inte går att faktorisera tillbaka
- **Hybrid** – asymmetrisk kryptering autentiserar parterna och byter en hemlig nyckel, sedan sköter den symmetriska nyckeln all vidare trafik, som i TLS

I vilka situationer används symmetrisk, asymmetrisk och hybridkryptering? (3)
||
- **Symmetrisk** – bulkkryptering av själva datan, alltså den stora mängden innehåll
- **Asymmetrisk** – nyckelutbyte och signering i de inledande stegen; används sällan för att kryptera data alls, eftersom det kostar för mycket
- **Hybrid** – storskaliga distribuerade system och e-handel, där TLS är exemplet

Prestanda: hur skiljer sig symmetrisk och asymmetrisk kryptering? (2)
||
- **Förhållandet** – asymmetrisk kryptering kräver typiskt 100 till 1000 gånger mer processorkraft än symmetrisk, och av de symmetriska är AES snabbast och Triple-DES långsammast
- **I praktiken** – en webbsida är sällan större än 100 kB och krypteras på några millisekunder, så algoritmernas prestanda påverkar knappt hur snabb https känns

## 3.1 Förklara hur asymmetriska nycklar (public/private) kan användas för att ge autenticitet

Bokens avsnitt: §11.3.2 och §11.2.2

**Egenskapen som gör det möjligt.** De två funktionerna i ett nyckelpar är ==varandras inverser==. För
RSA bevisade Rivest, Shamir och Adelman att krypterings- och dekrypteringsfunktionen är ==ömsesidiga
inverser==, alltså att det ==går att köra dem i vilken ordning som helst== och få tillbaka
originalvärdet. Det är den egenskapen hela svaret hänger på.

**Vändningen som ger autenticitet.** Normalt krypterar man med den ==publika== nyckeln så att bara
innehavaren av den privata kan läsa — det ger sekretess. Vänder man på det och krypterar med den
==privata== nyckeln kan ==vem som helst dekryptera med den publika==. Det ger ingen sekretess alls, men
det bevisar något annat: ==bara den som har den privata nyckeln kunde ha producerat det==. Alltså är
avsändaren autentiserad.

**Så används det.** Boken beskriver mekanismen så: upphovsmannen ==genererar en signatur med sin
privata nyckel==, och signaturen kan ==dekrypteras av vilken mottagare som helst med den motsvarande
publika nyckeln==. I praktiken krypterar man inte hela meddelandet utan ==en komprimerad form av det==,
som boken kallar en ==sammanfattning== (*digest*). Boken tillägger att ==publik-nyckelkryptografi i
allmänhet används för detta==.

**Det avgörande förbehållet.** Boken ställer ett extra krav: ==verifieraren måste vara säker på att den
publika nyckeln verkligen tillhör den som påstås ha signerat==. Utan det faller allt — och det är
precis vad ett ==publik-nyckelcertifikat== finns för. Boken visar hotet konkret: vid nyckelutbyte kan
Mallory fånga upp begäran om Bobs certifikat och ==svara med sin egen publika nyckel==, och därefter
läsa allt. Skyddet är att certifikatet ska vara ==signerat av en välkänd myndighet== vars publika
nyckel mottagaren fått ==på ett fullständigt säkert sätt==.

**Så kan du tänka.** Symmetrin är hela poängen, och den är lätt att komma ihåg som två riktningar av
samma sak: krypterar du **till** någon använder du hans publika nyckel, och krypterar du **som** dig
själv använder du din egen privata. Den första ger sekretess, den andra autenticitet. (egen slutsats)

### Muntligt svar

1. Grunden är att nyckelparets två funktioner är varandras inverser — för RSA är det bevisat att de
   kan köras i vilken ordning som helst.
2. Krypterar man med den publika nyckeln får man sekretess, eftersom bara innehavaren av den privata
   kan läsa.
3. Vänder man på det och krypterar med den privata nyckeln kan alla dekryptera med den publika. Det
   ger ingen sekretess, men det bevisar att avsändaren hade den privata nyckeln.
4. Det är precis vad en digital signatur är: upphovsmannen signerar med sin privata nyckel, och vem som
   helst verifierar med den publika. I praktiken signeras en sammanfattning, inte hela meddelandet.
5. Ett förbehåll avgör om det håller: verifieraren måste veta att den publika nyckeln verkligen
   tillhör den påstådda avsändaren. Därför certifikat, signerade av en välkänd myndighet.
6. Utan det förbehållet är nyckelutbytet öppet för man-in-the-middle — Mallory svarar med sin egen
   publika nyckel och läser allt som följer.

Hur kan asymmetriska nycklar (public/private) användas för att ge autenticitet? (3)
||
- **Grunden** – nyckelparets två funktioner är varandras inverser; för RSA är det bevisat att de kan köras i vilken ordning som helst
- **Vändningen** – krypterar man med den privata nyckeln kan alla dekryptera med den publika; det ger ingen sekretess, men bevisar att bara innehavaren av den privata nyckeln kunde ha skapat det
- **Förbehållet** – verifieraren måste veta att den publika nyckeln verkligen är avsändarens, annars kan en man-in-the-middle svara med sin egen nyckel; därför certifikat

## 4. Vad är en digital signatur och vad bidrar den med gällande säkerhet? Hur genereras respektive kontrolleras en digital signatur?

Bokens avsnitt: §11.4, §11.4.1 och §11.4.2

**Varför de behövs.** Boken slår fast att starka digitala signaturer är ett ==nödvändigt krav för säkra
system==. De behövs för att ==intyga information== — till exempel pålitliga påståenden som binder
==användares identiteter till deras publika nycklar==, eller som binder ==åtkomsträttigheter eller
roller till identiteter==.

**Vad en signatur ska ge — de tre egenskaperna.** Boken utgår från vad mottagaren av ett handskrivet
dokument vill kunna kontrollera, och samma tre krav gäller digitalt:

- **Autentisk** (*authentic*) — övertygar mottagaren om att signeraren ==medvetet signerade== dokumentet
  och att det ==inte ändrats av någon annan==.
- **Oförfalskbar** (*unforgeable*) — bevisar att signeraren ==och ingen annan== medvetet signerade. Och
  signaturen ==kan inte kopieras och sättas på ett annat dokument==.
- **Oförnekbar** (*non-repudiable*) — signeraren kan ==inte trovärdigt förneka== att han signerade.

**En gardering boken själv gör direkt.** ==Ingen== av dessa egenskaper uppnås helt av vanliga
signaturer: förfalskningar och kopior är svåra att upptäcka, dokument kan ändras efter signeringen, och
signerare luras ibland att signera ofrivilligt. Vi lever med bristerna för att ==det är svårt att fuska
och risken att bli upptäckt är stor==. Boken skriver också att ett digitalt signerat dokument ==kan
vara== betydligt mer motståndskraftigt mot förfalskning än ett handskrivet — inte att det är det.

**Vad mekanismen bygger på.** Precis som handskrivna signaturer bygger digitala på att ==binda ett
unikt och hemligt attribut hos signeraren till ett dokument==. Digitala dokument är ==triviala att skapa,
kopiera och ändra==, så att bara lägga till upphovsmannens namn eller en inskannad namnteckning har
==inget värde för verifiering==. Det som behövs är ett sätt att ==oåterkalleligt binda signerarens
identitet till hela bitföljden== som utgör dokumentet.

**Varför publik nyckel passar så bra.** Ett dokument *M* signeras av *A* genom att ==en kopia av M
krypteras med A:s privata nyckel== och fästs vid en klartextkopia av *M*. Då kan ==vem som helst med den
publika nyckeln verifiera==. Metoden är ==relativt enkel== och kräver ==ingen kommunikation alls mellan
mottagaren och signeraren eller någon tredje part==. Det är själva skälet att den dominerar.

### Hur en signatur genereras och kontrolleras

Bokens fyra steg (figur 11.10), och detta är svaret frågan ber om:

1. *A* skapar ett nyckelpar och ==publicerar den publika nyckeln== på en välkänd plats.
2. *A* räknar ut ==sammanfattningen H(M)== med en överenskommen säker hashfunktion och ==krypterar den
   med sin privata nyckel==. Resultatet är signaturen ==S = {H(M)}Kpriv==.
3. *A* skickar det signerade meddelandet ==M, S== till *B*.
4. *B* ==dekrypterar S med den publika nyckeln== och räknar ==själv ut H(M)== ur det mottagna
   meddelandet. ==Stämmer de två värdena överens är signaturen giltig.==

**Nyckelvändningen är hela poängen.** Boken påpekar det uttryckligen: ==signerarens privata nyckel
används för att kryptera signaturen==, i kontrast till att man använder ==mottagarens publika nyckel==
när syftet är sekretess. Förklaringen är enkel: en signatur måste ==skapas med en hemlighet bara
signeraren känner==, men vara ==åtkomlig för alla att verifiera==. RSA passar bra för detta.

### Varianten med hemlig nyckel — MAC

**Varför signaturer använder publik nyckel.** Man *kan* signera med en symmetrisk algoritm, men då
==måste nyckeln avslöjas för att signaturen ska kunna verifieras== — och den som har nyckeln kan också
förfalska. Därför är publik-nyckelmetoden ==den bekvämaste lösningen i de flesta situationer==.

**Så kan du tänka.** Signaturen krypterar aldrig meddelandet, bara dess sammanfattning. Det är därför
den är billig och därför den inte ger någon sekretess — ==M skickas i klartext==. Signatur och kryptering
är två skilda tjänster som råkar använda samma verktygslåda. (egen slutsats)

### Muntligt svar

1. En digital signatur binder oåterkalleligt signerarens identitet till hela bitföljden i ett dokument.
   Handskrivna signaturer bygger på handstilsmönstret, digitala på en hemlighet bara signeraren har.
2. Tre egenskaper krävs, samma som av handskrivna: autentisk, oförfalskbar och oförnekbar. Boken
   garderar direkt att ingen av dem uppnås helt ens av vanliga signaturer.
3. Vad den bidrar med är alltså äkthet, att den inte kan förfalskas eller flyttas till ett annat
   dokument, och oförnekbarhet. Dessutom kan den intyga saker för tredje part, som att binda en identitet
   till en publik nyckel.
4. Generering: avsändaren räknar ut en sammanfattning av meddelandet och krypterar den med sin privata
   nyckel. Det är signaturen, och den skickas med meddelandet i klartext.
5. Kontroll: mottagaren dekrypterar signaturen med avsändarens publika nyckel, räknar själv ut
   sammanfattningen av meddelandet, och jämför. Stämmer de överens är signaturen giltig.
6. Nyckelvändningen är poängen — här används signerarens privata nyckel, medan sekretess använder
   mottagarens publika. Skälet är att signaturen måste skapas med en hemlighet bara en person har, men
   kunna verifieras av alla.

Vad är en digital signatur, vad bidrar den med, och hur skapas och kontrolleras den? (4)
||
- **Vad det är** – den binder oåterkalleligt signerarens identitet till hela bitföljden i dokumentet, med en hemlighet bara signeraren har
- **Vad den ger** – tre egenskaper: autentisk, den signerades medvetet och är oändrad, oförfalskbar, ingen annan kunde ha gjort den och den kan inte flyttas till ett annat dokument, och oförnekbar
- **Skapas** – avsändaren räknar ut en sammanfattning av meddelandet och krypterar den med sin privata nyckel; meddelandet självt skickas i klartext
- **Kontrolleras** – mottagaren dekrypterar signaturen med avsändarens publika nyckel, räknar själv ut sammanfattningen, och jämför; stämmer de är signaturen giltig

## 4.1 Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har en sådan funktion?

Bokens avsnitt: §11.4.3

**Vad den är.** En digest-funktion skrivs ==H(M)== och kallas också ==säker hashfunktion==. Den gör ett
meddelande av ==godtycklig längd== till ett ==bitmönster av fast längd== som karakteriserar det. Kravet
boken ställer i §11.4 är att ==H(M) ska skilja sig från H(M') för alla troliga par== av meddelanden.

**De tre egenskaperna — detta är svaret frågan ber om.** En säker digest-funktion ska ha följande:

1. Givet *M* är det ==lätt att räkna ut h==.
2. Givet *h* är det ==svårt att räkna ut M==.
3. Givet *M* är det ==svårt att hitta ett annat meddelande M'== så att ==H(M) = H(M')==.

De två första är skälet till namnet ==envägshashfunktion==. Den tredje kräver en extra sak, och boken är
noga med formuleringen: vi ==vet att resultatet inte kan vara unikt==, eftersom en sammanfattning är en
==informationsminskande transformation==. Kravet är alltså inte att kollisioner inte finns, utan att en
angripare ==inte ska kunna hitta dem==.

**Varför egenskap 3 är den som avgör.** Kunde en angripare hitta ett *M'* med samma hash som *M*, kunde
han ==förfalska ett signerat dokument utan att känna signeringsnyckeln== — han kopierar bara signaturen
från *M* och fäster den på *M'*. Boken garderar att mängden meddelanden som hashar till samma värde är
begränsad och att angriparen ==skulle ha svårt att få fram en meningsfull förfalskning==, men ==med
tålamod går det==, så det måste skyddas mot.

**Vad det betyder för hashlängden.** Eftersom en angripare kan leta kollisioner genom att jämföra många
små varianter av två dokument mot varandra — en ==födelsedagsattack== — måste hashvärden vara ==minst 128
bitar==. Med 64 bitar räcker det i snitt med ==2^32 versioner== av vardera dokumentet, vilket boken
kallar ==för litet för att vara bekvämt==.

**De två som används i praktiken.** ==MD5== ger ==128 bitar==, ==SHA-1== ger ==160==. Boken garderar att
båda ==kan betraktas som tillräckligt säkra== för överskådlig tid, men att publicerade attacker
==antyder att SHA-1 är sårbar==.

### Muntligt svar

1. En digest-funktion, eller säker hashfunktion, gör ett meddelande av godtycklig längd till ett kort
   värde av fast längd som beskriver det, ett slags fingeravtryck.
2. Tre egenskaper krävs: lätt att räkna fram hashen ur meddelandet, svårt att räkna fram meddelandet ur
   hashen, och svårt att hitta ett annat meddelande med samma hash. De två första ger namnet
   envägshashfunktion.
3. Den tredje är den som avgör, och boken är noga: kollisioner måste finnas, eftersom en sammanfattning
   minskar informationen. Kravet är att en angripare inte ska kunna hitta dem.
4. Varför det spelar roll: hittar angriparen ett annat meddelande med samma hash kan han flytta
   signaturen dit och förfalska utan att känna nyckeln.
5. Födelsedagsattacken gör det lättare än man tror — man jämför många varianter av två dokument mot
   varandra i stället för att jaga en given hash. Vid 64 bitar räcker ungefär 2^32 varianter, så
   hashvärden måste vara minst 128 bitar.
6. I praktiken används MD5 med 128 bitar och SHA-1 med 160. Boken garderar att båda kan betraktas som
   tillräckligt säkra för överskådlig tid, men att publicerade attacker antyder att SHA-1 är sårbar.

Vad är en digest-funktion (säker hashfunktion) och vilka egenskaper har den? (2)
||
- **Vad det är** – den gör ett meddelande av godtycklig längd till ett kort värde av fast längd som beskriver det, ett slags fingeravtryck
- **Egenskaperna** – tre: lätt att räkna fram hashen ur meddelandet, svårt att gå från hashen tillbaka till meddelandet, och svårt att hitta ett annat meddelande med samma hash

## 5.1 Vad är TLS/SSL respektive HTTPS? Förklara hur handskakningen i TLS går till

Bokens avsnitt: §11.6.3

**Vad de tre namnen är.** ==SSL== (Secure Sockets Layer) utvecklades av Netscape. En ==utökad version av
SSL== antogs som internetstandard under namnet ==TLS== (Transport Layer Security). TLS stöds av de
flesta webbläsare och används brett i internethandel. ==HTTPS är inget eget protokoll==: att använda
protokollprefixet ==`https:` i en URL startar upprättandet av en TLS-säker kanal== mellan webbläsaren
och webbservern. Boken garderar att TLS ==antagligen== används mest för att säkra just HTTP, men det
används också för Telnet, FTP och många andra protokoll. Det är ==*de facto*-standarden== för
tillämpningar som behöver säkra kanaler.

**TLS:s två lager.** Protokollet består av:

- **Record-protokollet** — själva ==säkra kanalen==. Det krypterar och autentiserar meddelanden genom
  ==vilket förbindelseorienterat protokoll som helst==, och garanterar ==sekretess, integritet och
  autenticitet== för applikationsdata. Parterna kan välja ==per riktning== om kryptering och
  autentisering ska användas, så resurser inte går åt i onödan.
- **Handskakningslagret** — handskakningsprotokollet plus två relaterade protokoll som ==etablerar och
  underhåller en TLS-session==.

Båda ligger normalt i ==programbibliotek på applikationsnivå== i klienten och servern. Varje session
får ==ett eget id==, och båda parter kan ==spara id:t i en cache för återanvändning==, vilket slipper
kostnaden att sätta upp en ny session mot samma part.

**Två egenskaper värda att kunna.** Krypterings- och autentiseringsalgoritmerna ==förhandlas mellan de
två ändarna== under handskakningen, eftersom man i ett öppet nät inte kan anta att alla har samma
programvara — vissa länders lagar begränsar dessutom vilka algoritmer som får användas. ==Har de inte
tillräckligt många algoritmer gemensamt misslyckas anslutningsförsöket.== Och kanalen är
==självstartande==: den byggs med ett hybridschema — ==okrypterat först, sedan publik nyckel, och till
sist hemlig nyckel== när en delad nyckel etablerats. ==Varje övergång är valfri och föregås av en
förhandling.==

### Så går handskakningen till

Handskakningen ==utförs över en redan befintlig anslutning==, ==börjar i klartext==, och etablerar en
session genom att utbyta de överenskomna valen och parametrarna. ==Sekvensen varierar beroende på om
klient- och serverautentisering krävs.== Stegen:

1. **ClientHello och ServerHello.** Etablerar ==protokollversion, sessions-id, cipher suite och
   komprimeringsmetod==, och parterna ==utbyter slumpvärden==. Servern erbjuder ==en lista av de cipher
   suites den har==, och klienten ==väljer en== — eller svarar med ett fel om ingen passar. Här kommer
   man också överens om ett ==slumpmässigt startvärde för CBC==.
2. **Certifikat, valfritt.** Parterna ==autentiserar varandra genom att utbyta signerade
   publik-nyckelcertifikat i X.509-format==. Certifikaten kan komma från en certifikatutfärdare eller
   ==skapas tillfälligt för ändamålet==. ==Minst en publik nyckel måste finnas== för nästa steg.
3. **Pre-master secret.** En part ==genererar en pre-master secret== och skickar den ==krypterad med den
   publika nyckeln==. Det är ==ett stort slumpvärde==, och båda parter använder det för att generera
   ==de två sessionsnycklarna==, en per riktning, plus ==MAC-hemligheterna==.
4. **ChangeCipherSpec och Finished.** Sessionen ==triggas av ChangeCipherSpec-meddelanden==, följda av
   ==Finished-meddelanden==. När Finished utbytts är ==all vidare kommunikation krypterad och signerad==
   enligt den valda cipher suiten med de överenskomna nycklarna.

**Vad en cipher suite är.** Alla kryptografiska val samlas i en ==cipher suite==, som innehåller ==ett
val för var och en av tre delar==: ==nyckelutbytesmetod==, ==chiffer för dataöverföringen== och
==digest-funktion== för MAC:arna.

**Sårbarheten, med bokens gardering.** Den inledande handskakningen är ==*potentiellt* sårbar för
man-in-the-middle==. Skyddet är att den publika nyckel som verifierar ==det första certifikatet== kommer
==via en separat kanal== — webbläsare levereras med en uppsättning nycklar för välkända
certifikatutfärdare.

### Muntligt svar

1. SSL kom från Netscape, och en utökad version blev internetstandard under namnet TLS. HTTPS är inget
   eget protokoll — prefixet `https:` i en URL startar upprättandet av en TLS-kanal mellan webbläsare
   och webbserver.
2. TLS har två lager: record-protokollet, som är den säkra kanalen och ger sekretess, integritet och
   autenticitet, och handskakningslagret som sätter upp sessionen.
3. TLS är i grunden en praktisk hybridkryptering: okrypterat först, sedan publik nyckel, sedan hemlig
   nyckel. Varje övergång är valfri och förhandlas.
4. Handskakningen körs över en befintlig anslutning och börjar i klartext. ClientHello och ServerHello
   etablerar version, sessions-id, cipher suite och komprimering, och utbyter slumpvärden — servern
   erbjuder en lista, klienten väljer.
5. Sedan autentiserar parterna varandra valfritt med signerade X.509-certifikat. Minst en publik nyckel
   måste finnas för nästa steg.
6. Till sist genererar en part en pre-master secret och skickar den krypterad med den publika nyckeln.
   Ur den räknar båda fram sessionsnycklarna och MAC-hemligheterna. ChangeCipherSpec och Finished
   avslutar, och därefter är allt krypterat och signerat.

Vad är TLS/SSL respektive HTTPS? (2)
||
- **TLS/SSL** – SSL kom från Netscape, och en utökad version blev internetstandard under namnet TLS; det bygger en säker kanal med sekretess, integritet och autenticitet
- **HTTPS** – inget eget protokoll: prefixet https i en URL startar upprättandet av en TLS-kanal mellan webbläsare och webbserver

Hur går TLS-handskakningen till, steg för steg? (4)
||
- **ClientHello och ServerHello** – parterna enas om protokollversion, sessions-id, cipher suite och komprimering och utbyter slumpvärden; servern erbjuder en lista av cipher suites och klienten väljer en
- **Certifikat, valfritt** – parterna autentiserar varandra genom att utbyta signerade publik-nyckelcertifikat i X.509-format, och minst en publik nyckel måste finnas för nästa steg
- **Pre-master secret** – en part skapar ett stort slumpvärde och skickar det krypterat med den publika nyckeln; ur det räknar båda fram sessionsnycklarna, en per riktning, plus MAC-hemligheterna
- **ChangeCipherSpec och Finished** – dessa meddelanden avslutar handskakningen, och därefter är all vidare trafik krypterad och signerad enligt den valda cipher suiten

## 5.2 Vad är ett certifikat? Vad innehåller det, vad ska det säkerställa och vad är en Certificate Authority (CA)?

Bokens avsnitt: §11.2.3 och §11.4.4

**Vad ett certifikat är.** Bokens definition är kort: ==ett dokument som innehåller ett påstående,
oftast kort, signerat av en principal==. En *principal* är bokens ord för en part som kan agera i
systemet och hållas ansvarig — en användare, en organisation eller en process med en egen identitet och
egna nycklar. Ett certifikat är alltså inte i sig något som har med nycklar att göra — ==certifikat kan
intyga äktheten hos många typer av påståenden==.

**Vad det ska säkerställa.** Bokens scenario är en bank: när kunderna kontaktar Bob banken måste de
kunna vara säkra på att de ==pratar med Bob banken, även om de aldrig kontaktat honom förut==. Alice kan
skaffa ett certifikat från sin bank som intygar hennes ==kontonummer==, och använda det när hon handlar
för att visa att hon ==har ett konto hos Bobs bank==. Säljaren Carol kan då debitera kontot,
==förutsatt att hon kan validera signaturen==.

**Varför det inte räcker med certifikatet självt.** För att validera signaturen behöver Carol ==Bobs
publika nyckel==, och hon måste vara säker på att den är ==autentisk==. Annars kan Alice bara
==generera ett nytt nyckelpar== och med det ==tillverka ett falskt certifikat som utger sig för att
komma från Bobs bank==, med någon annans konto. Det Carol behöver är alltså ==ett certifikat som anger
Bobs publika nyckel, signerat av en välkänd och betrodd myndighet==.

**Rekursionsproblemet och certifieringskedjan.** Det certifikatet beror i sin tur på att myndighetens
egen publika nyckel är autentisk, så ==äkthetsproblemet är rekursivt==. Rekursionen bryts genom att
mottagaren skaffar den nyckeln ==på ett sätt hon kan ha förtroende för== — den överlämnas personligen,
eller kommer signerad från någon hon känner och litar på som fått den direkt. Det är en
==certifieringskedja==, i bokens exempel med ==två länkar==.

**Vad ett X.509-certifikat innehåller.** ==X.509 är det mest använda standardformatet.== Det binder en
publik nyckel till en namngiven enhet, och ==bindningen ligger i signaturen==. Fyra fält (figur 11.12):

- **Subject** — ==Distinguished Name och publik nyckel==. Det är den enhet certifikatet handlar om.
- **Issuer** — ==Distinguished Name och signatur==. Det är den som utfärdat och signerat.
- **Period of validity** — ==två datum==, "not before" och "not after".
- **Administrative information** — ==version och serienummer==.

Ett *Distinguished Name* ska vara namnet på en person eller organisation ==plus tillräcklig
sammanhangsinformation för att göra det unikt==.

**Vad en certifikatutfärdare är.** Vissa välkända företag och organisationer har etablerat sig för att
agera ==certifikatutfärdare== (*certificate authorities*) — bokens exempel är ==Verisign och CREN==.
Andra företag och privatpersoner kan ==få X.509-certifikat från dem genom att lämna in godtagbara bevis
på sin identitet==. Formatet ingår i TLS och används brett för att ==autentisera tjänsters och klienters
publika nycklar==.

**Verifieringen i två steg.** Boken ger den som en tvåstegsprocedur för vilket X.509-certifikat som
helst:

1. ==Hämta utfärdarens publik-nyckelcertifikat== från en ==pålitlig källa==.
2. ==Validera signaturen.==

**Tre problem, kort.** Att ==välja var kedjan börjar==, eftersom tillit sällan är absolut. Risken att
==privata nycklar röjs==. Och ==kedjans längd==: desto längre kedja, desto större risk för en svag länk.
Ett certifikat kan också behöva ==dras tillbaka==, men kopior finns kvar hos alla som fått det — därför
läggs ett ==utgångsdatum== in i stället.

**Så kan du tänka.** Ett certifikat flyttar inte tilliten någonstans, det ==kedjar== den. Du måste
fortfarande lita på någon till slut, och den enda riktiga frågan är ==var kedjan börjar== och hur du
fick den första nyckeln. Allt annat är signaturkontroller. (egen slutsats)

### Muntligt svar

1. Ett certifikat är enligt boken ett dokument som innehåller ett påstående, oftast kort, signerat av en
   principal. Det behöver inte handla om nycklar — det kan intyga vad som helst.
2. Vad det ska säkerställa: att man kan lita på ett påstående utan att känna motparten. Bokens exempel
   är Alice som får ett certifikat från sin bank som intygar hennes kontonummer, och använder det när hon
   handlar.
3. Men det räcker inte — den som ska validera signaturen behöver utfärdarens publika nyckel och måste
   veta att den är autentisk, annars kan vem som helst tillverka ett falskt certifikat med ett nytt
   nyckelpar.
4. Ett X.509-certifikat innehåller fyra saker: subject med namn och publik nyckel, issuer med namn och
   signatur, en giltighetsperiod med två datum, och administrativ info med version och serienummer.
   Bindningen ligger i signaturen.
5. En CA är en välkänd organisation som utfärdar publik-nyckelcertifikat mot bevis på identitet —
   Verisign och CREN är bokens exempel. Verifieringen sker i två steg: hämta utfärdarens certifikat från
   en pålitlig källa, och validera signaturen.
6. Problemen är att välja var kedjan börjar eftersom tillit sällan är absolut, risken att privata nycklar
   röjs, och att en längre kedja ger större risk för en svag länk. Återkallning löser man normalt med ett
   utgångsdatum.

Vad är ett certifikat, vad innehåller det, vad ska det säkerställa, och vad är en CA? (4)
||
- **Vad det är** – ett dokument med ett påstående, oftast kort, signerat av en principal; det kan intyga vad som helst, inte bara nycklar
- **Innehåll** – ett X.509-certifikat har subject med namn och publik nyckel, issuer med namn och signatur, en giltighetsperiod med två datum, och administrativ information; bindningen ligger i signaturen
- **Säkerställer** – att man kan lita på ett påstående utan att känna motparten; men man måste ha utfärdarens äkta publika nyckel, annars kan vem som helst tillverka ett falskt certifikat
- **CA** – en välkänd organisation som utfärdar certifikat mot bevis på identitet; verifieringen sker i två steg, hämta utfärdarens certifikat från en pålitlig källa och validera signaturen

## Luckor och källor

**Allt i denna fil kommer ur kursboken**, Coulouris m.fl., *Distributed Systems: Concepts and Design*,
5:e upplagan, kapitel 11. Inga andra källor har använts.

**Inga luckor mot tentafrågorna.** Alla åtta delfrågor har svar i boken. Tentan numrerar fem frågor, men
fråga 5 är bara en rubrik över 5.1 och 5.2, så det blir åtta delfrågor att svara på.

**Två ställen där boken säger mindre än man kunde vilja.** Den anger ==inte== hur lång en
certifieringskedja får vara, och den ==namnger ingen konkret tidsgräns== för hur länge MD5 eller SHA-1
kan anses säkra — formuleringen är "för överskådlig tid".

**Egna tillägg, tydligt märkta.** Fem stycken är märkta "Så kan du tänka" — ett vardera i fråga 1, 2,
3.1, 4 och 5.2. Fråga 3, 4.1 och 5.1 har inga.

**Medvetet utanför noten**, eftersom ingen av de åtta delfrågorna rör det: chiffrens inre konstruktion
och bitlängder, Needham–Schroeder och Kerberos, nyckeldistributionsprotokollen, *undeniable signatures*,
samt fallstudierna Millicent och NetBill. Några saker står kvar i **kort form** därför att en muntlig
följdfråga är trolig: MAC, födelsedagsattacken, certifikatåterkallning och cipher suitens tre delar.
