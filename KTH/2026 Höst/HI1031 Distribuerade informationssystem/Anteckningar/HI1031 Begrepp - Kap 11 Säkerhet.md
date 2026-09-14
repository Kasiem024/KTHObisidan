---
tags: [begrepp, HI1031, databaser, säkerhet, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 11 – säkerhet: hot och attacker, kryptografins roller, symmetrisk, asymmetrisk och hybridkryptering, digitala signaturer, certifikat och TLS."
---
# HI1031 Begrepp - Kap 11 Säkerhet

## 1. Hot och attacker

Varför behöver ett distribuerat system säkerhet alls?::Behovet kommer ur ==önskan att dela resurser==. Resurser som inte delas kan i regel skyddas genom att ==isoleras från extern åtkomst==.

Vad är skillnaden mellan en säkerhetspolicy och en säkerhetsmekanism?::==Policyn== säger vad som får delas och av vem; ==mekanismen== genomdriver den. Utan skillnaden går det ==inte att avgöra om ett system är säkert==.

Vilka tre breda klasser delar boken säkerhetshoten i? (3)
||
- **Läckage** – obehöriga får tag på information.
- **Manipulation** – obehörig ändring av information.
- **Vandalisering** – störa systemets funktion ==utan vinst för angriparen==.

Vilka fem attackmetoder räknar boken upp, klassade efter hur en kanal missbrukas? (5)
||
- **Avlyssning** – skaffa kopior av meddelanden utan behörighet.
- **Maskering** – skicka eller ta emot meddelanden under någon annans identitet.
- **Meddelandemanipulation** – fånga upp och ändra innehållet innan det skickas vidare.
- **Uppspelning** – lagra uppfångade meddelanden och skicka dem senare.
- **Överbelastning** – dränka en kanal eller resurs så andra inte kommer åt den.

Vad är en man-in-the-middle-attack?::En form av meddelandemanipulation där angriparen fångar ==allra första meddelandet i ett nyckelutbyte== och byter ut nycklarna mot sina egna. Sedan dekrypterar han allt, krypterar om det med rätt nyckel och skickar vidare.

Varför fungerar en uppspelningsattack även mot krypterade meddelanden?::Angriparen ==behöver ingen nyckel== – det räcker att ==kopiera bitmönstret== och skicka det igen. En betalningsbegäran kan då utföras två gånger.

## 2. Kryptografins roller

Vilka tre huvudroller har kryptografi enligt boken? (3)
||
- **Sekretess och integritet**
- **Autentisering**
- **Digitala signaturer**

Vad är en kryptografisk nyckel?::En ==parameter till krypteringsalgoritmen==, vald så att ==krypteringen inte kan vändas utan att man känner nyckeln==.

Vilket villkor sätter boken för att kryptering ska bevara integriteten?::Att ==redundant information, till exempel en checksumma, läggs in och kontrolleras==. Integritet får man alltså inte gratis av att kryptera.

Hur ger kryptering autentisering?::Lyckas dekrypteringen och innehållet har ett förväntat värde, hade avsändaren ==motsvarande krypteringsnyckel==. Är nyckeln ==bara känd av två parter== följer avsändarens identitet.

**Oförnekbarhet** (non-repudiation);;Kravet att en part ==inte kan förneka att han deltog i en transaktion==. Mekanismen är den digitala signaturen, som intygar för en ==tredje part== att något är en oförändrad kopia av det signeraren producerat.

Vilket konkret problem använder boken för att motivera oförnekbarhet?::==Fantomuttag== i en bankomat. Bästa svaret banken kan ge är en transaktion som är ==digitalt signerad av kontohavaren== på ett sätt en tredje part inte kan förfalska.

Vilka två problem löser en delad hemlig nyckel inte? (2)
||
- **Nyckeldistribution** – hur skickas den delade nyckeln säkert i första läget?
- **Uppspelning** – hur vet mottagaren att meddelandet inte är en kopia av ett tidigare?

Vad är en kryptografisk utmaning (challenge)?::Att servern skickar något ==krypterat med mottagarens egen hemliga nyckel==, så att mottagaren ==inte kan använda det utan att kunna dekryptera det==. Poängen är att lösenordet då ==inte behöver skickas över nätet==.

**Sessionsnyckel**;;En hemlig nyckel som delas ut för ==en följd av interaktioner== mellan två parter.

## 3. Symmetrisk, asymmetrisk och hybridkryptering

Vad skiljer symmetrisk från asymmetrisk kryptering?
||
- **Symmetrisk** (secret-key): ==samma nyckel== krypterar och dekrypterar.
- **Asymmetrisk** (public-key): ett ==nyckelpar==, där nycklarna för kryptering och dekryptering är ==olika==.

Vad är en envägsfunktion, och varför behövs den?::En funktion som är ==lätt att beräkna framåt== men vars invers är ==så svår att den inte är genomförbar==. Det är den egenskapen som skyddar klartexten.

Vad är en fälldörrsfunktion, och vad används den till?::En envägsfunktion ==med en hemlig utgång== – omöjlig att vända ==om man inte känner hemligheten==. Den är grunden för ==alla publik-nyckelsystem==.

Vad avgör styrkan hos en symmetrisk algoritm?::==Nyckellängden==, eftersom den effektivaste allmänna attacken är ==uttömmande sökning== genom alla nyckelvärden. Tiden att knäcka nyckeln växer ==exponentiellt med antalet bitar==.

Hur uppstår ett asymmetriskt nyckelpar?::Ur en ==gemensam rot==, med en härledning som själv är en envägsfunktion. För RSA är roten ==två mycket stora primtal==: att multiplicera dem tar sekunder, men att ==faktorisera produkten== är ogenomförbart.

Varför är asymmetriska nycklar så mycket längre än symmetriska?::För att produkten *N* ==inte ska gå att faktorisera==. Följden är att risken för uttömmande sökning är ==liten== – motståndskraften bygger på faktoriseringen i stället. Rekommendationen är ==minst 768 bitar==, och 512 är klart otillräckligt.

Hur mycket dyrare är asymmetrisk kryptering?::Den kräver ==typiskt 100 till 1000 gånger så mycket processorkraft== som symmetrisk. Boken tillägger att bekvämligheten ibland ==väger över nackdelen==.

Hur fungerar hybridkryptering, och när används respektive typ?::==Asymmetrisk== kryptering autentiserar parterna och ==krypterar ett utbyte av hemliga nycklar==; sedan sköter ==symmetrisk== kryptering all vidare kommunikation. Alltså ==symmetriskt för bulkdata== och ==asymmetriskt bara i de inledande stegen==, för nyckelutbyte och signering. Boken säger rakt ut att asymmetriska algoritmer ==sällan används för att kryptera data==. TLS är bokens exempel.

Vad betyder algoritmernas prestanda i praktiken för https?::==Minimalt.== Webbsidor är sällan större än ==100 kilobyte==, så en sida krypteras med vilken symmetrisk algoritm som helst på ==några millisekunder==. RSA med 1024 bitar tar ==cirka 4,75 ms att signera== och ==0,18 ms att verifiera==.

## 3.1 Hur nyckelpar ger autenticitet

Vilken egenskap hos ett nyckelpar gör att det kan ge autenticitet?::Att de två funktionerna är ==varandras inverser==. För RSA är det bevisat att de kan köras i ==vilken ordning som helst== och ge tillbaka originalvärdet.

Vad händer om man krypterar med den privata nyckeln i stället för den publika?::Då kan ==vem som helst dekryptera med den publika==. Det ger ==ingen sekretess==, men bevisar att ==bara innehavaren av den privata nyckeln kunde ha producerat det==. I praktiken signeras ==en sammanfattning==, inte hela meddelandet.

Vilket förbehåll måste uppfyllas för att en signatur ska bevisa något?::Verifieraren måste vara säker på att den publika nyckeln ==verkligen tillhör den som påstås ha signerat==. Därför certifikat, ==signerade av en välkänd myndighet==.

## 4. Digitala signaturer

Vad är en digital signatur, i grunden?::Ett sätt att ==oåterkalleligt binda signerarens identitet till hela bitföljden== i ett dokument. Den bygger på ==en hemlighet bara signeraren har== – för handskrivna signaturer är hemligheten handstilsmönstret.

Vilka tre egenskaper ska en signatur ge? (3)
||
- **Autentisk** – signeraren signerade medvetet, och ==ingen annan har ändrat== dokumentet.
- **Oförfalskbar** – bara signeraren kunde ha gjort den, och den ==kan inte kopieras till ett annat dokument==.
- **Oförnekbar** – signeraren kan ==inte trovärdigt förneka== att han signerat.

Hur genereras och kontrolleras en digital signatur? (4 steg)
||
1. Avsändaren ==publicerar sin publika nyckel==.
2. Han räknar ut ==sammanfattningen H(M)== och ==krypterar den med sin privata nyckel== – det är signaturen.
3. Han skickar ==meddelandet plus signaturen==.
4. Mottagaren ==dekrypterar signaturen med den publika nyckeln==, räknar ==själv ut H(M)==, och jämför. ==Lika = giltig.==

Varför används signerarens *privata* nyckel, när sekretess använder mottagarens publika?::För att en signatur måste ==skapas med en hemlighet bara signeraren känner==, men vara ==åtkomlig för alla att verifiera==. Sekretess är det omvända behovet.

**MAC** (message authentication code);;En ==billig signatur byggd på en delad hemlig nyckel==: man hashar meddelandet ihop med nyckeln, ==H(M + K)==. Den ==innehåller ingen kryptering alls==, och säker hashning är *typiskt* 3–10 gånger snabbare än symmetrisk kryptering.

Vad garanterar en digital signatur *inte*?::==Datumet.== Mottagaren vet bara att dokumentet ==signerades innan han fick det==. Och oförnekbarheten har ett hål: signeraren kan ==avsiktligt avslöja sin privata nyckel== och sedan påstå att någon annan kunde ha signerat.

## 4.1 Säkra sammanfattningsfunktioner

**Säker hashfunktion** (digest, H(M));;En funktion som gör ett meddelande av ==godtycklig längd== till ett ==bitmönster av fast längd== som karakteriserar det, och som ==inte går att vända==.

Vilka tre egenskaper ska en säker digest-funktion ha? (3)
||
1. Givet *M* är det ==lätt att räkna ut h==.
2. Givet *h* är det ==svårt att räkna ut M==.
3. Givet *M* är det ==svårt att hitta ett annat M'== med ==samma hash==.

Varför är den tredje egenskapen den som avgör?::Kan angriparen hitta ett annat meddelande med samma hash kan han ==flytta signaturen dit== och förfalska ==utan att känna signeringsnyckeln==. Kollisioner *måste* finnas, eftersom en sammanfattning ==minskar informationen== – kravet är att de inte ska gå att ==hitta==.

Vad är en födelsedagsattack?::Angriparen gör ==många visuellt oskiljaktiga varianter av två dokument== – ett gynnsamt och ett ogynnsamt – och jämför alla hashar ==mot varandra== till ett par matchar. Sedan låter han offret signera det gynnsamma och ==byter till det andra och behåller signaturen==.

Hur långt måste ett hashvärde vara, och varför?::==Minst 128 bitar.== Vid 64 bitar räcker i snitt ==2^32 varianter== för en födelsedagsattack, vilket boken kallar ==för litet för att vara bekvämt==.

## 5.1 TLS, SSL och HTTPS

Vad är skillnaden mellan SSL, TLS och HTTPS?::==SSL== kom från Netscape; en ==utökad version av SSL== blev internetstandard under namnet ==TLS==. ==HTTPS är inget eget protokoll== – prefixet `https:` i en URL ==startar upprättandet av en TLS-kanal== mellan webbläsare och webbserver.

Vilka två lager består TLS av? (2)
||
- **Record-protokollet** – själva ==säkra kanalen==, som ger ==sekretess, integritet och autenticitet== genom vilket förbindelseorienterat protokoll som helst.
- **Handskakningslagret** – ==etablerar och underhåller sessionen==.

Hur går TLS-handskakningen till? (4 steg)
||
1. **ClientHello / ServerHello** – etablerar version, sessions-id, ==cipher suite== och komprimering, och utbyter slumpvärden. Servern ==erbjuder en lista==, klienten ==väljer en==.
2. **Certifikat, valfritt** – parterna autentiserar varandra med ==signerade X.509-certifikat==.
3. **Pre-master secret** – en part skickar den ==krypterad med den publika nyckeln==; båda räknar fram ==sessionsnycklar och MAC-hemligheter==.
4. **ChangeCipherSpec och Finished** – därefter är ==all trafik krypterad och signerad==.

Var i handskakningen byter TLS från klartext till kryptering?::Handskakningen ==börjar i klartext==, går sedan över till ==publik nyckel==, och till sist till ==hemlig nyckel== när den delade nyckeln finns. ==Varje övergång är valfri och föregås av en förhandling.==

Vad innehåller en cipher suite? (3)
||
- **Nyckelutbytesmetod** – hur sessionsnyckeln utbyts. Exempel: ==RSA med publik-nyckelcertifikat==.
- **Chiffer för dataöverföring** – block- eller strömchiffer för datan. Exempel: ==IDEA==.
- **Digest-funktion** – för att skapa ==MAC:ar==. Exempel: ==SHA-1==.

Vad händer om klient och server inte har några algoritmer gemensamt?::==Anslutningsförsöket misslyckas.== Algoritmerna ==förhandlas== under handskakningen, eftersom man i ett öppet nät inte kan anta att alla har samma programvara.

## 5.2 Certifikat

**Certifikat** (digitalt);;Ett ==dokument som innehåller ett påstående, oftast kort, signerat av en principal==. Det behöver inte handla om nycklar – certifikat kan intyga ==många typer av påståenden==.

Vad innehåller ett X.509-certifikat? (4 fält)
||
- **Subject** – ==Distinguished Name och publik nyckel==.
- **Issuer** – ==Distinguished Name och signatur==.
- **Period of validity** – ==två datum==, "not before" och "not after".
- **Administrative information** – ==version och serienummer==.

==Bindningen ligger i signaturen.==

**Certifikatutfärdare** (Certificate Authority, CA);;En ==välkänd organisation som utfärdar publik-nyckelcertifikat== till den som lämnar in ==godtagbara bevis på sin identitet==. Bokens exempel: ==Verisign== och ==CREN==.

Hur verifieras ett X.509-certifikat? (2 steg)::1. ==Hämta utfärdarens publik-nyckelcertifikat från en pålitlig källa.== 2. ==Validera signaturen.== Kedjan måste till slut sluta i en nyckel man fått på ett sätt man har förtroende för.

Varför har certifikat ett utgångsdatum?::För att ==återkallning annars är i praktiken omöjlig== – kopior finns hos alla som fått certifikatet, och boken kallar det ==dyrt, om inte omöjligt== att spåra upp dem alla. Med utgångsdatum ==avvisas det automatiskt== och innehavaren får begära förnyelse.
