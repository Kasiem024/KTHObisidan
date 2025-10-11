# HI1027 Begrepp inför TEN1

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HI1027 #begrepp

---

Hög kohesion(Definition);; Innebär att en klass eller modul har ett **enda, väldefinierat ansvar**. All funktionalitet i klassen bidrar direkt till detta ansvar, vilket gör koden lättare att förstå, underhålla och återanvända.

Låg koppling(Definition);; Innebär att klasser är så **oberoende av varandra som möjligt**. Detta uppnås för att ändringar i en klass ska ha minimal påverkan på andra klasser, vilket ökar systemets underhållbarhet och flexibilitet.

Polymorfism(Definition);; Från grekiskan för "många former", är principen att en referensvariabel av en superklasstyp kan referera till objekt av dess subklasser. Samma metodanrop kan därmed resultera i olika beteenden beroende på objektets faktiska typ vid körtid. Kräver **arv** och **omdefinierade metoder (override)**.

Abstrakt klass(Definition);; En klass som **inte kan instansieras** (man kan inte skapa objekt av den) och som är avsedd att fungera som en bas för subklasser. Den kan innehålla både abstrakta metoder (utan implementation) och konkreta metoder (med implementation).

Interface(Definition);; Ett "kontrakt" som definierar en uppsättning metoder en klass måste implementera. Det specificerar *vad* en klass kan göra, men inte *hur*.

Override (Omdefiniering)(Definition);; När en subklass ger en **egen implementation** av en metod som redan finns i superklassen. Metodsignaturen måste vara identisk. Syftet är att anpassa beteendet för subklassen och är en förutsättning för polymorfism.

Exception (Undantag)(Definition);; Ett fel eller en oväntad händelse som inträffar under exekvering och stör det normala programflödet. Undantag används för att hantera fel på ett strukturerat sätt utan att programmet kraschar.

Vad är syftet med de tre delarna i ett try-catch-finally block?(3)
||
- `try`: Innehåller kod som *kan* kasta ett undantag.
- `catch`: Fångar och hanterar ett *specifikt* undantag som kastats i try-blocket.
- `finally`: Exekveras *alltid* efter try (och eventuell catch), oavsett om ett undantag inträffade eller ej. Används ofta för att städa upp resurser, t.ex. stänga filer.

throw(Definition):: Nyckelordet som används för att **manuellt kasta** ett undantagsobjekt. Exempel: `throw new IllegalArgumentException("Felaktigt argument");`.

throws(Definition):: Nyckelordet som används i en metods signatur för att **deklarera** att metoden kan kasta ett visst typ av undantag som den inte hanterar själv. Exempel: `public void readFile() throws IOException { ... }`.

Inkapsling (Encapsulation)(Definition);; Principen att **dölja ett objekts interna data** och implementation, och endast exponera nödvändig funktionalitet via publika metoder. Detta skyddar data från ogiltiga tillstånd och minskar beroenden.

På vilka tre sätt kan nyckelordet `final` användas?(3)
||
- **Variabel**: Värdet kan bara tilldelas en gång (blir en konstant).
- **Metod**: Kan inte omdefinieras (override) i en subklass.
- **Klass**: Kan inte ärvas från (inga subklasser kan skapas).

static(Definition):: Nyckelordet som indikerar att en medlem **tillhör klassen**, inte ett specifikt objekt. Alla objekt av klassen delar på samma `static`-variabel eller -metod. Kan anropas direkt via klassnamnet, t.ex. `Math.sqrt()`.

synchronized(Definition):: Nyckelordet som används för att hantera **trådsäkerhet**. Endast en tråd i taget kan exekvera kod inom ett `synchronized` block eller en `synchronized` metod på samma objekt, för att förhindra "race conditions".

this(Definition);; En referens till det **nuvarande objektet**. Används bl.a. för att anropa andra konstruktorer, skicka med det egna objektet som argument, eller skilja på instansvariabler och lokala variabler.

super(Definition):: En referens till **superklassen**. Används för att anropa superklassens konstruktor (`super(...)`) eller en omdefinierad metod i superklassen (`super.metodNamn()`).

Vad är skillnaden mellan "== " och ".equals()"?
||
- "== " : Jämför om två referensvariabler pekar på *exakt samma objekt* i minnet (identitet).
- ".equals()" : Jämför om två objekt är *innehållsmässigt* lika. Denna metod måste ofta omdefinieras för att fungera som avsett.

protected(Definition);; En synlighetsmodifierare som gör en medlem synlig inom **samma klass**, alla **subklasser**, och alla klasser i **samma paket**.

Designmönster: Composite(Definition);; Ett designmönster som låter en klient behandla **enskilda objekt** och **sammansättningar av objekt** på ett enhetligt sätt, ofta genom att skapa trädstrukturer.

Designmönster: Facade(Definition);; Ett designmönster som tillhandahåller ett **förenklat, enhetligt gränssnitt** till ett komplext delsystem av klasser. Syftet är att förenkla användningen och minska koppling.

Designmönster: Proxy(Definition);; Ett designmönster där ett objekt agerar som en **representant eller "mellanhand"** för ett annat objekt. Används för att t.ex. kontrollera åtkomst, fördröja laddning (*lazy loading*) eller loggning.

Designmönster: Singleton(Definition);; Ett designmönster som säkerställer att en klass endast har **en enda instans** och tillhandahåller en global åtkomstpunkt till den.

Vilka är de tre delarna i designmönstret MVC?(3)
||
- **Model**: Hanterar data och affärslogik.
- **View**: Presenterar data för användaren (UI).
- **Controller**: Hanterar användarinput och interagerar med Model och View.

Vad är skillnaden mellan Arv och Komposition?
||
- **Arv (is-a)**: En subklass *är* en specialiserad version av en superklass (t.ex. `Car is a Vehicle`).
- **Komposition (has-a)**: Ett objekt *har* eller består av ett annat objekt (t.ex. `Car has an Engine`). Komposition är ofta att föredra för flexibilitet.

Klass(Definition);; En **mall eller ritning** för att skapa objekt. Den definierar egenskaper (datamedlemmar) och beteenden (metoder).

Objekt(Definition);; En **instans av en klass**. Ett konkret "ting" skapat från klassens mall.

Konstruktor(Definition);; En speciell metod som anropas när ett nytt objekt skapas. Den används för att **initiera objektets tillstånd** och har alltid samma namn som klassen.

Overloading (Överlagring)(Definition);; Att ha flera metoder med **samma namn men olika parameterlistor** (olika antal eller typ av parametrar) inom samma klass.

Immutable (Oföränderlig)(Definition);; Ett objekt vars tillstånd **inte kan ändras** efter att det har skapats. Ett klassiskt exempel är `String`-klassen i Java.

Garbage Collector(Definition);; En automatisk process i Java (JVM) som **frigör minne** som används av objekt som inte längre kan nås eller refereras i programmet.

Generics (Generisk programmering)(Definition);; En teknik som tillåter att man skriver klasser och metoder som kan arbeta med **vilken objekttyp som helst**, med bibehållen typsäkerhet vid kompilering. Exempel: `ArrayList<String>`.

enum (Enumeration)(Definition):: En speciell datatyp som representerar en **fast uppsättning konstanter**. Exempel: `enum Day { MONDAY, TUESDAY, ... }`.

Vad är skillnaden mellan Primitiv datatyp och Referenstyp?
||
- **Primitiv typ**: Lagrar ett *faktiskt värde* direkt (t.ex. `int`, `double`, `boolean`).
- **Referenstyp**: Lagrar en *minnesadress* till var ett objekt finns (t.ex. `String`, `ArrayList`, alla klassinstanser).

Association (UML)(Definition);; En generell relation mellan två klasser som visar att objekt av dessa klasser kan vara **kopplade till varandra** på något sätt. T.ex. en `Student` är associerad med en `Course`.

Aggregation (UML)(Definition);; En svagare form av "hel-del"-relation (*has-a*) där delarna **kan existera oberoende** av helheten. Om helheten förstörs, finns delarna kvar. Symboliseras med en ofylld diamant.

Komposition (UML)(Definition);; En starkare form av "hel-del"-relation där delarna **inte kan existera utan helheten**. Om helheten förstörs, förstörs även delarna. Symboliseras med en fylld diamant.

Thread (Tråd)(Definition);; En **enskild exekveringsväg** i ett program. Flera trådar kan köras parallellt för att utföra olika uppgifter samtidigt (concurrency).

Race Condition(Definition);; Ett fel som uppstår när flera trådar försöker komma åt och manipulera **samma delade data samtidigt**, och det slutgiltiga resultatet beror på den oförutsägbara ordningen de körs i.

Runnable(Definition);; Ett interface i Java som kan implementeras av en klass vars instanser är avsedda att exekveras av en tråd. Det har en enda metod: `run()`.
