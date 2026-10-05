---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-10
updated: 2026-09-10
description: "Svar på tentafrågorna för HI1031 kapitel 17 – extra problem med distribuerade transaktioner, tvåfas-commit, hierarkisk kontra flat 2PC och recovery efter nod- eller nätverksfel."
---
# HI1031 Tentafrågor och Svar - Kap 17 Distribuerade transaktioner

## 1. Vilka extra problem medför distribuerade transaktioner jämfört med lokala?

Bokens avsnitt: §17.1, §17.2 och §17.2.1 för grunden, §17.4 för samtidighetskontrollen och §17.5 för
distribuerade deadlocks

**Vad en distribuerad transaktion är.** En transaktion — platt eller nästlad — som kommer åt ==objekt som
hanteras av flera olika servrar==. Att ==commit:a== betyder att avsluta så att ==alla ändringar sparas
permanent==, att ==abort:a== att avsluta så att ==ingen effekt syns==, och ==serialiserbarhet== att köra
transaktionerna om varandra ==ger samma resultat som att köra dem en i taget==. Två operationer
==krockar== om resultatet beror på ==vilken ordning de utförs i==. När en distribuerad transaktion tar slut
kräver atomiciteten att ==antingen commit:ar alla inblandade servrar, eller abort:ar alla==. För att lyckas
med det tar ==en av servrarna rollen som koordinator==, och hur den lyckas beror på vilket protokoll som
valts. Boken säger att ==tvåfas-commit är det som används mest==.

**Platt eller nästlad.** En klienttransaktion blir distribuerad så snart den ==anropar operationer på
flera servrar==, och den kan struktureras på två sätt:

- **Platt:** klienten ==avslutar varje förfrågan innan nästa påbörjas==, så servrarnas objekt nås
  ==sekventiellt==. Används låsning kan en sådan transaktion ==bara vänta på ett objekt i taget==.
- **Nästlad:** toppnivåtransaktionen öppnar ==subtransaktioner==, som i sin tur kan öppna fler, ==hur
  djupt som helst==. Subtransaktioner på samma nivå ==kan köra samtidigt==, och ligger deras objekt på
  olika servrar kan de köra ==parallellt==. Boken exempel: fyra överföringar som nästlade
  subtransaktioner ger ==bättre prestanda== än fyra sekventiella operationer.

**Koordinator och deltagare.** Klienten startar med `openTransaction` mot en koordinator i ==vilken
server som helst==, och får tillbaka ett ==transaktions-id (TID)==. Varje server som hanterar ett objekt
transaktionen rör blir en ==deltagare==. Deltagaren ansluter sig genom att anropa ==`join`== hos
koordinatorn, och koordinatorn ==för en lista över deltagarna== medan varje deltagare ==håller en
referens till koordinatorn==. När klienten anropar `closeTransaction` har koordinatorn därför
==referenser till alla deltagare==. En deltagare kan också själv anropa `abortTransaction` om den inte
kan fortsätta.

**Problem: identifierare måste vara globalt unika.** Ett TID för en distribuerad transaktion måste vara
unikt ==i hela det distribuerade systemet==. Bokens enkla lösning är att låta det bestå av ==två delar==:
en identifierare för servern som skapade det, till exempel en ==IP-adress==, och ett ==nummer som är
unikt inom den servern==. Samma sak gäller tidsstämplar, som är par av ==tidsstämpel plus server-id== och
delas ut av ==den första koordinatorn transaktionen når==.

**Problem: global serialiserbarhet.** Varje server sköter samtidighetskontrollen för ==sina egna
objekt==, vilket ger lokal serialisering. Men det räcker inte: ligger T före U i en konflikt på ==en==
server måste de ligga i ==samma ordning på alla servrar== som båda kommer åt i konflikt. Servrarna är
==gemensamt ansvariga== för det.

**Problem: distribuerad deadlock.** Med låsning kan deadlocks uppstå redan inom en server. En ==väntegraf==
är en riktad graf där ==noderna är transaktioner== och ==en kant från T till U betyder att T väntar på att U
ska släppa ett lås==; finns en ==cykel== väntar alla på varandra och ingen kan komma vidare. I ett
distribuerat system kan man ==i teorin bygga en global väntegraf av de lokala==, och då finns ett nytt
fall: ==en cykel i den globala grafen som inte finns i någon enda lokal graf==. Det är en ==distribuerad
deadlock==. Skälet är att låshanterarna ==sätter sina lås oberoende av varandra== och därför kan påtvinga
==olika ordningar==: T före U på en server och U före T på en annan. Eftersom den globala grafen ==bara
finns delvis hos varje server== krävs ==kommunikation mellan servrarna== för att hitta cyklerna.

**Så kan du tänka.** De extra problemen har alla samma rot: ==varje server ser bara sin egen del==.
Atomiciteten kräver ett gemensamt beslut fast ingen har hela bilden, serialiserbarheten kräver samma
ordning fast var och en bestämmer sin egen, deadlocken finns i en graf ingen ser hel, och recovery kräver
att var och en minns sin del av ett protokoll den inte äger. ==Lägger man till en server läggs det till
en part som kan krascha, svara sent eller besluta annorlunda.== (egen slutsats)

### Muntligt svar

1. En distribuerad transaktion är en transaktion som rör ==objekt på flera olika servrar==. Kravet på
   atomicitet gäller ändå: ==antingen commit:ar alla servrar, eller abort:ar alla==.
2. **Första problemet: ingen server kan bestämma själv.** En av dem måste ta rollen som ==koordinator==,
   och det krävs ett ==atomiskt commit-protokoll== för att nå ett gemensamt beslut. Det protokollet är
   fråga 2.
3. **Andra problemet: global serialiserbarhet.** Varje server serialiserar sina egna objekt lokalt, men
   det räcker inte — ordningen måste bli ==densamma på alla servrar==, och lokala beslut kan ge olika
   ordning på olika servrar.
4. **Tredje problemet: distribuerad deadlock.** Det kan finnas en cykel i den ==globala väntegrafen som
   inte finns i någon enda lokal graf==, så ingen server kan upptäcka den på egen hand.
5. **Fjärde problemet: identifierare måste vara globalt unika.** Både transaktions-id och tidsstämplar
   måste fungera över servergränser, och servrarna måste vara ==överens om ordningen==.
6. **Femte problemet: recovery blir svårare.** Varje server har ==sin egen recovery-fil==, och
   protokollets tillstånd måste överleva en krasch mitt i. Det är fråga 4.

Vilka extra problem medför distribuerade transaktioner jämfört med lokala? Roten och de två första. (3)
||
- **Roten** – varje server ser bara sin egen del, så ingen har hela bilden av en transaktion som rör objekt på flera servrar
- **Atomicitet** – antingen bekräftar alla servrar eller avbryter alla; ingen kan bestämma själv, så en server blir koordinator och det krävs ett atomiskt commit-protokoll för ett gemensamt beslut
- **Global serialiserbarhet** – varje server serialiserar sina egna objekt lokalt, men ordningen måste bli densamma på alla servrar, och lokala beslut kan ge olika ordning på olika servrar
<!--SR:!fsrs,2026-10-04T02:50:03.172Z,0,0.212,6.4133,1,1,0,0,2026-10-04T02:49:03.172Z-->

Vilka extra problem medför distribuerade transaktioner jämfört med lokala? De tre sista. (3)
||
- **Distribuerad deadlock** – det kan finnas en cykel i den globala väntegrafen som inte finns i någon enda lokal graf, så ingen server kan upptäcka den på egen hand
- **Globalt unika identifierare** – både transaktions-id och tidsstämplar måste fungera över servergränser, och servrarna måste vara överens om ordningen
- **Recovery blir svårare** – varje server har sin egen recovery-fil, och protokollets tillstånd måste överleva en krasch mitt i
<!--SR:!fsrs,2026-10-04T02:46:31.864Z,0,0.212,6.4133,1,1,0,0,2026-10-04T02:45:31.864Z-->

## 2. Beskriv Two-Phase Commit (2PC)

Bokens avsnitt: §17.3 och §17.3.1

**Två ord som återkommer.** ==Permanent lagring== är sådant som ==överlever en krasch==, alltså disk.
==Flyktigt minne== är serverns arbetsminne, som ==töms vid en krasch==. Hela protokollet handlar om vad som
måste ligga i det förra innan man lovar något.

**Varför ett enfasprotokoll inte duger.** Det enkla sättet vore att koordinatorn ==skickar commit eller
abort till alla deltagare och upprepar tills alla bekräftat== — ett ==enfas atomiskt commit-protokoll==.
Boken kallar det otillräckligt, och skälet är precist: det ==låter inte en server fatta ett eget beslut
att abort:a== när klienten ber om commit. Att en server inte kan commit:a beror ==oftast på
samtidighetskontrollen==. Bokens exempel:

- Används **låsning** kan upplösningen av en deadlock ha ==abort:at transaktionen== utan att klienten vet.
- Används **optimistisk kontroll** gör en ==misslyckad validering== att servern beslutar att abort:a.
- Koordinatorn kan ==inte veta== om en server ==kraschat och ersatts== under transaktionens gång — en
  sådan server ==måste abort:a==.

**Vad 2PC är byggt för.** Att låta ==vilken deltagare som helst abort:a sin del==. Och eftersom
atomiciteten kräver det: ==abort:as en del måste hela transaktionen abort:as==.

**Fas 1, röstningsfasen.**

1. Koordinatorn skickar ==`canCommit?`== till varje deltagare.
2. Deltagaren svarar med sin röst, ==Yes eller No==. Innan den röstar Yes ==förbereder den sig för commit
   genom att spara objekten i permanent lagring==. Röstar den No ==abort:ar den omedelbart==.

**Prepared-tillståndet är kärnan.** Har en deltagare ==röstat Yes får den inte abort:a==. Därför måste den
innan dess ==säkerställa att den så småningom kan genomföra sin del, även om den kraschar och ersätts
under tiden==. En deltagare sägs vara ==prepared== om den kommer att kunna commit:a. För att vara säker
sparar den ==alla objekt den ändrat, tillsammans med statusen `prepared`, i permanent lagring==.

**Fas 2, genomförandefasen.**

1. Koordinatorn samlar rösterna, ==sin egen inräknad==. Finns inga fel och alla röster är Yes beslutar den
   ==commit== och skickar ==`doCommit`== till alla. Annars beslutar den ==abort== och skickar
   ==`doAbort`== till ==alla som röstade Yes==.
2. Deltagare som röstat Yes väntar på `doCommit` eller `doAbort`, gör som de blir tillsagda och skickar
   vid commit ==`haveCommitted`== som bekräftelse.

Efter steg 2 är koordinatorn och alla som röstat Yes ==prepared==. Efter steg 3 är transaktionen ==i
praktiken avslutad==, och koordinatorn kan rapportera beslutet till klienten. Steg 4 finns för att
koordinatorn ska ==veta när dess sparade information inte längre behövs==.

**De fem operationerna.**

| Operation | Vad den gör |
|---|---|
| `canCommit?(trans)` → Yes / No | Koordinator till deltagare: kan du commit:a? Deltagaren svarar med sin röst |
| `doCommit(trans)` | Koordinator till deltagare: commit:a din del |
| `doAbort(trans)` | Koordinator till deltagare: abort:a din del |
| `haveCommitted(trans, participant)` | Deltagare till koordinator: jag har commit:at |
| `getDecision(trans)` → Yes / No | Deltagare till koordinator: vad blev beslutet? Används när den röstat Yes men inte fått svar, alltså vid krasch eller fördröjda meddelanden |

**Vad protokollet antar.** Att ==servrar kan krascha och meddelanden försvinna==, men att ingen server
beter sig illasinnat — den ==kraschar eller lyder==. Det är därför timeouts behövs.

**Timeout-åtgärder.** Protokollet innehåller en timeout-åtgärd för ==varje steg där en process kan
blockera==, och de är gjorda med tanke på att ==en timeout inte måste betyda att servern gått sönder==.
Tre lägen:

- **Deltagaren har röstat Yes och väntar på utfallet.** Den är ==uncertain== och kan ==inte gå vidare==
  eller ==bestämma något ensidigt==, medan ==objekten inte kan släppas till andra transaktioner==. Den
  frågar med ==`getDecision`==. Har koordinatorn kraschat får den ==inget svar förrän koordinatorn
  ersatts==, vilket kan ge ==långa fördröjningar==.
- **Deltagaren är klar med klientens förfrågningar men har inte fått något `canCommit?`.** Den kan bara
  märka det genom att ==den inte fått någon förfrågan på länge==, till exempel när en låstimeout går ut.
  Eftersom ==inget beslut är fattat än får den abort:a ensidigt==.
- **Koordinatorn väntar på röster.** Den kan ==besluta abort efter en tid==, och måste då skicka
  `doAbort` till dem som redan röstat. ==Sena Yes-röster ignoreras==, och de deltagarna hamnar i
  uncertain-läget.

**Prestanda.** Går allt bra kan protokollet med ==N deltagare== genomföras med ==N `canCommit?` med svar,
följt av N `doCommit`==. Kostnaden i meddelanden är alltså ==proportionell mot 3N== och kostnaden i tid
==tre rundor==. ==`haveCommitted` räknas inte in==, eftersom protokollet fungerar korrekt utan det — dess
roll är bara att låta servrar ==radera gammal koordinatorinformation==.

**I värsta fallet** kan det ske ==hur många server- och kommunikationsfel som helst== under protokollet.
Det är byggt för att tåla ==en följd av fel== och är ==garanterat att bli klart så småningom== — men det
är ==inte möjligt att ange någon tidsgräns== för när.

### Muntligt svar

1. **Varför inte ett enfasprotokoll.** Att koordinatorn bara skickar "commit" och upprepar till alla
   svarat räcker inte, för det ==låter ingen server abort:a på eget initiativ==. En server kan behöva
   det: deadlock, misslyckad validering, eller att den kraschat och bytts ut.
2. **Fas 1, röstningsfasen.** Koordinatorn skickar `canCommit?` till varje deltagare. Deltagaren svarar
   ==Yes eller No==. Innan den svarar Yes ==sparar den sina ändrade objekt och sin status i permanent
   lagring== och är då ==prepared==.
3. **Poängen med prepared.** Har man röstat Yes ==får man inte abort:a längre==. Därför måste man först
   se till att man kan hålla ordet ==även om man kraschar och ersätts== under tiden.
4. **Fas 2, genomförandefasen.** Koordinatorn samlar rösterna, sin egen medräknad. Är alla Yes skickar
   den ==`doCommit` till alla==. Är minst en röst No skickar den ==`doAbort` till dem som röstade Yes==.
   ==En enda No räcker för att hela transaktionen abort:as.==
5. **Det svaga stället.** En deltagare som röstat Yes men inte fått svar är ==uncertain== och kan ==inte
   avgöra själv== vad som ska hända, medan dess objekt förblir låsta. Den frågar med `getDecision`. Har
   koordinatorn kraschat kan väntan bli lång.
6. **Kostnad och robusthet.** Går allt bra kostar protokollet ==3N meddelanden och tre rundor==.
   ==Timeouts finns vid varje steg där någon kan blockera==, och protokollet är byggt för att klara en
   följd av kraschar och tappade meddelanden — men ==utan någon tidsgräns för när det blir klart==.

Beskriv 2PC, del 1: varför enfas inte duger, och fas 1. (3)
||
- **Varför** – att koordinatorn bara skickar commit och upprepar räcker inte, för då får ingen server avbryta på eget initiativ; en server kan behöva det vid deadlock, misslyckad validering, eller om den kraschat och bytts ut
- **Fas 1, röstning** – koordinatorn skickar canCommit till varje deltagare, som svarar Yes eller No; innan en deltagare röstar Yes sparar den sina ändrade objekt och sin status i permanent lagring
- **Prepared** – har man röstat Yes får man inte avbryta längre, därför måste man först säkra att man kan hålla ordet även om man kraschar och ersätts under tiden

Beskriv 2PC, del 2: fas 2, det svaga stället och kostnaden. (3)
||
- **Fas 2, genomförande** – koordinatorn samlar rösterna, sin egen medräknad; är alla Yes skickar den doCommit till alla, är minst en röst No skickar den doAbort till dem som röstade Yes, och en enda No räcker för att allt avbryts
- **Det svaga stället** – en deltagare som röstat Yes men inte fått svar är uncertain, kan inte avgöra själv, och håller kvar sina lås; den frågar koordinatorn med getDecision, och har koordinatorn kraschat kan väntan bli lång
- **Kostnad** – går allt bra kostar protokollet 3N meddelanden och tre rundor; timeouts finns vid varje steg där någon kan blockera, men ingen tidsgräns finns för när protokollet blir klart

## 3. Hierarkisk kontra flat Two-Phase Commit — beskriv och förklara

Bokens avsnitt: §17.3.2

**Vad frågan handlar om.** Båda är varianter av tvåfas-commit för ==nästlade== transaktioner. Den
yttersta kallas ==toppnivåtransaktion==; alla andra är ==subtransaktioner==. Varje subtransaktion
==startar efter sin förälder och blir klar före den==.

**Provisorisk commit — begreppet hela frågan hänger på.** När en subtransaktion blir klar fattar den ett
==eget beslut== att antingen ==commit:a provisoriskt eller abort:a==. Boken är noga med skillnaden:

- ==Prepared to commit garanterar att subtransaktionen kommer att kunna commit:a==, eftersom objekten är
  sparade i permanent lagring.
- ==Provisorisk commit betyder bara att den blev klar korrekt== — ==ingenting säkerhetskopieras till
  permanent lagring==. Kraschar servern efteråt kan ==ersättaren inte commit:a==. Boken skriver att en
  provisoriskt commit:ad subtransaktion ==sannolikt== kommer att gå med på commit när den blir tillfrågad.

**Två operationer tillkommer** hos koordinatorn för nästlade transaktioner: ==`openSubTransaction(trans)`==
som öppnar en subtransaktion till angiven förälder, och ==`getStatus(trans)`== som svarar ==committed,
aborted eller provisional==. Ett TID för en subtransaktion måste vara ==en utvidgning av förälderns==, så
att man kan ==räkna ut föräldern och toppnivån ur id:t självt==, och alla måste vara ==globalt unika==.

**Vem som blir deltagare.** Abort:ar en förälder ==tvingas subtransaktionen abort:a också==. Men en
förälder — även toppnivån — ==kan commit:a fast ett av dess barn abort:at==; ett bankkontors stående
överföringar ska inte alla stoppas för att en misslyckas. Deltagarlistan är därför ==koordinatorerna för
alla subtransaktioner i trädet som commit:at provisoriskt och inte har någon abort:ad förfader==. Röstar de
för commit måste de ==spara objektens tillstånd i permanent lagring==.

**Hur informationen kommer uppåt.** Commit:ar en nästlad transaktion provisoriskt rapporterar den ==sin
egen och sina efterkommandes status till föräldern==. Abort:ar den rapporterar den ==bara "abort", utan
någon information om sina efterkommande==. Toppnivån får därför till slut ==en lista över alla
subtransaktioner i trädet med status== — men ==efterkommande till abort:ade subtransaktioner saknas i
listan==. En subtransaktion vars förfader abort:at kallas en ==orphan==, och det är precis så de blir till.

**Fas 2 är identisk med det icke-nästlade fallet:** koordinatorn samlar rösterna och meddelar utfallet.
Det är ==bara fas 1 som skiljer sig== mellan de två varianterna.

### Hierarkiskt 2PC

Protokollet blir ==flernivåigt och nästlat==. Koordinatorn för toppnivån pratar ==bara med koordinatorerna
för de subtransaktioner den är direkt förälder till==, skickar ==`canCommit?`== till dem, och de ==skickar
i sin tur vidare nedåt i trädet==. Varje deltagare ==samlar in svaren från sina efterkommande innan den
svarar sin egen förälder==. Koordinatorer för abort:ade transaktioner ==ingår inte i protokollet==.

Anropet är ==`canCommit?(trans, subTrans)`==, och de två argumenten är:

1. ==Toppnivåtransaktionens TID==, som används ==när datat förbereds==.
2. ==TID för den deltagare som gör anropet== — alltså föräldern.

Deltagaren som får anropet ==letar i sin transaktionslista efter provisoriskt commit:ade transaktioner som
matchar det andra argumentet==. Hittar den några ==förbereder den objekten och röstar Yes==. Hittar den
inga ==måste den ha kraschat== sedan den utförde subtransaktionen, och ==röstar No==.

### Flat 2PC

Koordinatorn för toppnivån skickar ==`canCommit?` direkt till koordinatorerna för alla subtransaktioner i
listan över provisoriskt commit:ade==. Under protokollet refererar deltagarna till transaktionen med
==toppnivåns TID==, och var och en letar i sin lista efter ==transaktioner eller subtransaktioner som
matchar det==.

**Och där uppstår problemet.** Det ger ==inte tillräckligt med information== för en server som har ==en
blandning av provisoriskt commit:ade och abort:ade subtransaktioner==. Bokens exempel: en server är
koordinator för både T12 och T21, eftersom de körs där. Ombeds den bara att commit:a toppnivån ==commit:ar
den båda==, för lokalt ser båda provisoriskt commit:ade ut — men ==det är fel för T21, vars förälder T2 har
abort:at==.

Lösningen är att anropet blir ==`canCommit?(trans, abortList)`==, där andra argumentet är ==en lista över
abort:ade subtransaktioner==. Regeln blir: ==en deltagare får commit:a efterkommande till
toppnivåtransaktionen om de inte har abort:ade förfäder==. Konkret gör deltagaren så:

- Har den provisoriskt commit:ade transaktioner som är efterkommande till toppnivån: den
  ==kontrollerar att de inte har någon förfader i abortList==, ==förbereder sig för commit== genom att
  spara transaktionen och objekten i permanent lagring, ==abort:ar dem som har abort:ade förfäder==, och
  skickar ==Yes==.
- Har den ingen sådan efterkommande ==måste den ha kraschat== sedan den utförde subtransaktionen, och
  skickar ==No==.

### Jämförelsen

| Vad man jämför | Hierarkiskt | Flat |
|---|---|---|
| Vem koordinatorn pratar med | bara sina närmaste barn | alla deltagare direkt |
| Meddelandeväg | ner och upp genom trädet i steg | ett steg fram och tillbaka |
| Andra argumentet i `canCommit?` | den anropande deltagarens TID | en abortList |
| Vad deltagaren behöver leta efter | bara subtransaktioner till sin närmaste förälder | alla efterkommande till toppnivån, minus abortList |
| Bokens fördel | behöver ingen abortList | koordinatorn når alla direkt |

Boken ger ==en fördel till var== och ==utser ingen vinnare själv==, men refererar att ==Moss [1985]
föredrog den flata== algoritmen, just för att koordinatorn då ==kan kommunicera direkt med alla
deltagare==.

**Ett fjärde ställe där man kan bli fördröjd.** Utöver de tre lägen som finns i det icke-nästlade fallet
(fråga 2) tillkommer ett: ==provisoriskt commit:ade barn till abort:ade subtransaktioner==. De blir ==inte
deltagare==, så de ==får inte nödvändigtvis veta utfallet==. En subtransaktion som ==inte fått något
`canCommit?`== frågar därför efter en ==timeout== med ==`getStatus`== om föräldern commit:at eller
abort:at. För att det ska gå måste ==koordinatorerna för abort:ade subtransaktioner leva vidare en tid==.
Kan en orphan ==inte nå sin förälder abort:ar den så småningom==.

**Så kan du tänka.** Skillnaden går att sammanfatta i en fråga: ==vem bär kunskapen om trädets form?== I
den hierarkiska varianten bär ==trädet självt== den, genom att varje nivå frågar sina barn — priset är
==många rundor==. I den flata bär ==koordinatorn== den, genom abortList — priset är att listan ==måste
skickas med==. (egen slutsats)

### Muntligt svar

1. **Vad frågan gäller.** Båda är varianter av 2PC för ==nästlade transaktioner==. Toppnivåtransaktionen
   är koordinator, och deltagarna är de subtransaktioner som ==provisoriskt commit:at och inte har någon
   abort:ad förfader==.
2. **Provisorisk commit är inte prepared.** Vid en provisorisk commit ==sparas ingenting i permanent
   lagring==; den betyder bara att subtransaktionen ==blev klar utan fel==. Kraschar servern efteråt kan
   ersättaren ==inte commit:a==.
3. **Hierarkiskt.** Protokollet blir ==flernivåigt==: koordinatorn frågar bara sina ==närmaste barn==,
   som skickar `canCommit?` vidare ner i trädet. Varje deltagare ==samlar in sina efterkommandes svar
   innan den svarar sin förälder==. Argumenten är toppnivåns TID och ==den anropande deltagarens TID==.
4. **Flat.** Koordinatorn skickar `canCommit?` ==direkt till alla== deltagare i listan. Andra argumentet
   är i stället en ==abortList==, alltså en lista över abort:ade subtransaktioner.
5. **Varför flat behöver abortList.** En server kan ha ==både provisoriskt commit:ade och abort:ade==
   subtransaktioner. Boken exempel: en server är koordinator för både T12 och T21, och T21:s förälder
   har abort:at — men lokalt ser båda provisoriskt commit:ade ut, så utan listan skulle servern
   ==commit:a T21 felaktigt==.
6. **Avvägningen.** Hierarkiskt behöver ==bara titta på sin närmaste förälders subtransaktioner==. Flat
   behöver abortList, men koordinatorn ==pratar direkt med alla deltagare== i stället för att skicka
   meddelanden ner och upp genom trädet i steg. ==Moss föredrog flat== av just det skälet.

Beskriv hierarkiskt kontra flat 2PC. (2)
||
- **Hierarkiskt** – protokollet blir flernivåigt: koordinatorn frågar bara sina närmaste barn, som skickar canCommit vidare ner i trädet, och varje deltagare samlar in sina efterkommandes svar innan den svarar sin egen förälder
- **Flat** – koordinatorn skickar canCommit direkt till alla deltagare i listan över provisoriskt bekräftade subtransaktioner, utan att gå via trädet

Varför behöver flat 2PC en abortList, och vad är avvägningen mot hierarkiskt? (2)
||
- **Varför abortList** – en och samma server kan vara koordinator för både provisoriskt bekräftade och avbrutna subtransaktioner, och lokalt ser de likadana ut, så utan en lista över de avbrutna skulle servern bekräfta en subtransaktion vars förälder har avbrutit
- **Avvägningen** – i hierarkiskt bär trädet kunskapen om formen och var och en frågar sina barn, men det kostar många rundor; i flat bär koordinatorn kunskapen via abortList och når alla direkt, och Moss föredrog flat av det skälet

## 4. Hur gör man recovery från Two-Phase Commit vid nod- eller nätverksfel?

Bokens avsnitt: §17.6, §17.6.1 och §17.6.4

**Vad recovery ska garantera.** Atomiciteten kräver att ==alla effekter av commit:ade transaktioner, och
inga av ofullständiga eller abort:ade, syns i objekten==. Det delas i två:

- ==Durability==: objekten ==sparas i permanent lagring och finns kvar därefter==. Får klienten en
  bekräftelse på sin commit betyder det att ==allt redan är sparat på disk==, inte bara i serverns minne.
- ==Failure atomicity==: effekterna är atomära ==även när servern kraschar==.

**Modellen boken använder.** Medan servern kör håller den ==alla sina objekt i flyktigt minne== och
bokför de commit:ade i en ==recovery-fil==. Recovery består då av att ==återställa servern med de senaste
commit:ade versionerna ur permanent lagring==. Databaser gör det annorlunda — de håller ==oftast==
objekten på disk med en ==cache i minnet==.

**Recovery managern** sköter både durability och failure atomicity, och har fyra uppgifter: ==spara objekt
i permanent lagring för commit:ade transaktioner==, ==återställa serverns objekt efter en krasch==,
==omorganisera recovery-filen för att göra recovery snabbare==, och ==återvinna lagringsutrymme==. Ska den
tåla ==mediafel== behövs ==stabil lagring==, alltså speglade diskar eller kopior på annan plats.

**Intentions list.** För varje aktiv transaktion bokförs en lista över ==referenserna till och värdena på
alla objekt transaktionen ändrar==. En ==tentativ version== är transaktionens ==egen privata kopia== av ett
objekt, som andra inte ser. Vid commit används listan för att ==identifiera vilka objekt som berördes==:
den commit:ade versionen ==ersätts av den tentativa==, och det nya värdet ==skrivs till recovery-filen==.
Vid abort används den för att ==radera alla tentativa versioner==. Det avgörande för
2PC: ==när en deltagare säger att den är prepared måste dess recovery manager redan ha sparat både
intentions list och objekten i den listan i recovery-filen==, så att den kan genomföra commit:en senare
även om den kraschar under tiden.

**Posterna i recovery-filen.**

| Typ av post | Innehåll |
|---|---|
| Object | Ett värde på ett objekt |
| Transaction status | TID, transaktionens status (prepared, committed, aborted) och övriga statusvärden som används av tvåfas-commit |
| Intentions list | TID och en följd av intentions, var och en objekt-id plus positionen i recovery-filen där objektets värde ligger |
| Coordinator | TID och listan över deltagare (tillkommer för 2PC) |
| Participant | TID och vem koordinatorn är (tillkommer för 2PC) |

**Loggning.** I loggningstekniken är recovery-filen ==en logg med historiken över alla transaktioner
servern utfört==, och ordningen i loggen ==speglar ordningen de förberett, commit:at och abort:at i==.
Recovery managern anropas ==varje gång en transaktion förbereder sig, commit:ar eller abort:ar==. Vid
förberedelse ==läggs objekten i intentions list till==, följt av statusen ==prepared== plus listan. Vid
commit eller abort läggs ==motsvarande status till==.

**Tvingad skrivning — och varför den behövs.** Efter en krasch ==abort:as varje transaktion som inte har
statusen committed i loggen==. Därför måste en commit:ad transaktions ==committed-post tvingas ut till
loggen==, alltså skrivas direkt tillsammans med det som ligger buffrat. ==Append antas vara atomärt==, så
==bara den sista skrivningen kan vara ofullständig== om servern kraschar.

**Två nya statusvärden för 2PC.** ==done== och ==uncertain==:

- Koordinatorn använder ==committed== för att visa att ==utfallet av röstningen blev Yes==, och ==done==
  för att visa att ==hela protokollet är klart==.
- En deltagare använder ==uncertain== för att visa att den ==röstat Yes men ännu inte vet utfallet==.

**Vad som skrivs medan protokollet körs.**

- **Fas 1:** när koordinatorn är prepared — och redan skrivit sin prepared-post — lägger den till en
  ==coordinator-post==. En deltagare måste ha ==skrivit prepared innan den får rösta Yes==, och när den
  röstar Yes skriver den ==participant-posten och statusen uncertain som en tvingad skrivning==. Röstar den
  No skriver den ==abort==.
- **Fas 2:** koordinatorn lägger till ==committed eller aborted, som en tvingad skrivning==. Deltagarna
  lägger till ==commit eller abort efter meddelandet från koordinatorn==. När koordinatorn fått bekräftelse
  från alla deltagare lägger den till ==done==, och ==den behöver inte tvingas==. ==done ingår inte i
  protokollet== utan används ==när recovery-filen omorganiseras==.

**Så gör man recovery.** Servern ersätts av en ny process, som ==först sätter standardvärden på objekten==
och sedan lämnar över till recovery managern. För varje transaktion letar den upp ==en coordinator-post
eller en participant-post plus statusposterna==, och ==den senaste statusposten — den närmast slutet av
loggen — avgör vilken status som gällde när felet inträffade==. Sedan beror åtgärden på ==rollen och
statusen==:

| Roll | Status | Vad recovery managern gör |
|---|---|---|
| Koordinator | prepared | Inget beslut hade nåtts. Skickar `abortTransaction` till alla servrar i deltagarlistan och skriver statusen aborted. Samma sak vid status aborted. Finns ingen deltagarlista kommer deltagarna ==till slut att få timeout och abort:a== själva |
| Koordinator | committed | Beslutet att commit:a hade nåtts. Skickar `doCommit` till alla i deltagarlistan, ==i fall den inte gjort det förut==, och ==återupptar protokollet vid steg 4== |
| Koordinator | done | ==Ingen åtgärd behövs== |
| Deltagare | committed | Skickar `haveCommitted` till koordinatorn, i fall det inte gjordes före felet. Det låter koordinatorn ==kasta informationen om transaktionen vid nästa checkpoint== |
| Deltagare | uncertain | Deltagaren kraschade ==innan den visste utfallet==, och kan ==inte avgöra statusen förrän koordinatorn berättar==. Skickar `getDecision` till koordinatorn och ==commit:ar eller abort:ar när svaret kommer== |
| Deltagare | prepared | Deltagaren ==har inte röstat än== och ==får abort:a== transaktionen |

**Recovery måste vara idempotent**, alltså gå att göra ==hur många gånger som helst med samma resultat==,
eftersom servern kan ==krascha igen under själva recoveryn==. Det är enkelt under antagandet att objekten
återställs till flyktigt minne, men ==svårare för en databas== som håller objekten i permanent lagring.

**Så kan du tänka.** Hela svaret bygger på en enda idé: ==en röst är ett löfte, och ett löfte måste
överleva en krasch==. Därför skrivs prepared och uncertain till permanent lagring ==innan== rösten skickas,
och därför är den sista statusposten i loggen tillräcklig för att veta vad man lovat. ==Recovery blir då
inte att gissa vad som hände, utan att läsa vad man redan skrivit ner och fortsätta protokollet därifrån.==
(egen slutsats)

### Muntligt svar

1. **Utgångspunkten.** Varje server har ==sin egen recovery-fil== och en ==recovery manager==. Under
   drift ligger objekten i ==flyktigt minne==; recovery-filen är det som ==överlever en krasch==.
2. **Vad som ligger i filen.** Tre sorters poster: ==objektvärden==, ==transaktionsstatus== och
   ==intentions list== (vilka objekt transaktionen ändrat och var värdena ligger). För 2PC tillkommer
   två: en ==coordinator-post== med listan över deltagare, och en ==participant-post== med vem
   koordinatorn är.
3. **Två nya statusvärden för 2PC:** ==done==, som koordinatorn sätter när protokollet är helt klart, och
   ==uncertain==, som en deltagare sätter när den ==röstat Yes men inte vet utfallet==.
4. **Vad som skrivs medan protokollet körs.** Innan en deltagare röstar Yes måste den redan ha skrivit
   ==prepared==, och när den röstar Yes skrivs participant-posten plus ==uncertain som en tvingad
   skrivning==. I fas 2 skriver båda ==committed eller aborted==, också tvingat.
5. **Efter kraschen.** Den ==senaste statusposten i loggen== avgör vad som gällde vid felet. Sedan beror
   åtgärden på ==rollen och statusen== — boken listar sex fall i figur 17.22.
6. **De fall som betyder mest.** ==Koordinator prepared==: inget beslut hade fattats, så abort:a och
   meddela alla. ==Koordinator committed==: beslutet var taget, så skicka `doCommit` igen och återupta
   vid steg 4. ==Deltagare uncertain==: fråga koordinatorn med `getDecision`. ==Deltagare prepared==: har
   inte röstat än, så den får abort:a.

Hur gör man recovery från 2PC vid nod- eller nätverksfel? (3)
||
- **Grunden** – objekten ligger i flyktigt minne, men varje server skriver status till en recovery-fil på disk; innan en deltagare röstar Yes måste prepared redan vara skrivet, rösten skrivs som uncertain med en tvingad skrivning, och i fas 2 skrivs committed eller aborted
- **Avgörandet** – efter kraschen avgör den senaste statusposten i loggen vad som gällde när felet inträffade, och sedan beror åtgärden på serverns roll och den statusen
- **Åtgärden** – koordinator med prepared har inget beslut fattat och avbryter och meddelar alla; koordinator med committed skickar doCommit igen; deltagare med uncertain frågar koordinatorn med getDecision; deltagare med prepared har inte röstat och får avbryta

## Luckor och källor

**Inga luckor mot tentafrågorna.** Alla fyra besvaras ur boken själv, kapitel 17. Ingen del av svaren
kommer från någon annan källa, och ingenting är påhittat.

**Om upplägget mellan fråga 2, 3 och 4.** Alla tre handlar om tvåfas-commit, så materialet är medvetet
fördelat i stället för upprepat: fråga 2 äger ==protokollet självt==, fråga 3 äger ==de två topologierna
för nästlade transaktioner==, och fråga 4 äger ==felhanteringen och recovery-filen==. Fråga 1 äger ==de
problem som gör protokollet nödvändigt==, men inte protokollet. Saknar du en mekanism under en fråga står
den alltså under en annan. Två begrepp återkommer med avsikt i två roller: `getDecision` är i fråga 2 en
==timeout-åtgärd under drift== och i fråga 4 en ==recovery-åtgärd efter en krasch==, och ==uncertain== är
i fråga 2 ett ==läge i protokollet== och i fråga 4 ett ==statusvärde i recovery-filen==.

**Tre stycken är märkta "Så kan du tänka"** — fråga 1, 3 och 4. Fråga 2 har inget, eftersom den ber om en
beskrivning av ett protokoll och inte om en bedömning. Allt annat i noten är bokens.

**Där bokens figurer var trasiga.** Tabellen med de sex roll- och statusfallen i fråga 4 är hämtad ur
PDF:en, eftersom figur 17.22:s förklaringskolumn var kapad i textversionen. Samma gäller posttyperna i
recovery-filen. Övriga figurer är kontrollerade och löptexten täcker dem. Detaljerna står i
`.kiro/reports/hi1031-genomgang-2026-09-10.md` — de rör kontrollen av noten, inte plugget.

**En rättelse mot det gamla decket.** Decket som fanns innan hade ett kort om skillnaden mellan ==platta
och nästlade transaktioner==, vilket hör till fråga 1. Tentans fråga 3 handlar om något annat: skillnaden
mellan ==hierarkiskt och flat tvåfas-commit==, alltså två sätt att köra *protokollet* för en nästlad
transaktion. Båda skillnaderna finns nu i noten, under rätt fråga.
