---
tags: [begrepp, HI1027, KTH, labb, programmering, year2025]
---
# Lab1 Begrepp HI1027

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`



---

Klass(Definition):: En mall eller ritning för att skapa *objekt*. Den definierar de egenskaper (*fields*) och beteenden (*methods*) som objekt av dess typ delar.

Objekt(Definition):: En *instans* av en klass. Det är en självständig enhet som består av både data (*state*) och procedurer för att manipulera datan (*behavior*).
<!--SR:!2025-10-15,1,228-->

Instans(Definition):: En konkret realisering av ett objekt. När ett objekt skapas från en klass kallas det resulterande objektet för en **instans** av den klassen.

Metod(Definition):: Ett block med kod som endast körs när det anropas. Det används för att utföra specifika åtgärder och är även känt som en funktion.
<!--SR:!2025-10-17,3,250-->

Primitiva datatyper(Definition) (8):: De mest grundläggande datatyperna i Java. Det finns åtta: `byte`, `short`, `int`, `long`, `float`, `double`, `boolean` och `char`. De är *inte* objekt och lagrar de faktiska värdena.

Referensdatatyper(Definition):: En variabel som innehåller en referens (minnesadress) till ett *objekt*, snarare än objektet självt. Exempel inkluderar klasser, gränssnitt och arrayer.

Variabel(Definition):: En platshållare för ett värde som kan ändras. Det är en plats i minnet för att lagra data.
<!--SR:!2025-10-22,5,228-->

Konstruktor(Definition):: En speciell typ av metod som används för att *initialisera* ett objekt. Den anropas när objektet skapas.

Paket(Package)(Definition):: En mekanism för att organisera Java-klasser i namnrymder. Det är ett sätt att gruppera relaterade klasser och gränssnitt.

Arv(Inheritance)(Definition):: En grundläggande princip inom objektorienterad programmering där en ny klass (*subclass*) ärver egenskaper och beteenden från en befintlig klass (*superclass*).
<!--SR:!2025-10-16,2,248-->

Polymorfism(Definition):: Förmågan hos ett objekt att anta många former. Oftast sker detta när en referensvariabel av en superklass refererar till ett objekt av en subklass.

Inkapsling(Encapsulation)(Definition):: Tekniken att göra fälten i en klass *privata* och ge tillgång till dem via *publika* metoder. Detta skyddar ett objekts data från oönskad direktåtkomst.

Abstraktion(Definition):: Konceptet att dölja de komplexa implementationsdetaljerna och endast visa den nödvändiga funktionaliteten för användaren. Uppnås med *abstrakta klasser* och *gränssnitt*.

Interface(Definition):: Ett helt abstrakt "kontrakt" som används för att gruppera relaterade metoder med tomma kroppar. En klass kan *implementera* flera gränssnitt.

Undantagshantering(Exception Handling)(Definition):: En mekanism för att hantera körtidsfel (*runtime errors*) som stör det normala flödet av ett program.

try(Definition):: Ett kodblock där man placerar kod som kan orsaka ett undantag (*exception*). Måste följas av en `catch`- eller `finally`-block.
<!--SR:!2025-10-18,2,228-->

catch(Definition):: Ett kodblock som används för att *fånga* och hantera ett undantag som kastats från ett `try`-block.
<!--SR:!2025-10-21,5,248-->

finally(Definition):: Ett kodblock som *alltid* exekveras efter `try`- och eventuella `catch`-block, oavsett om ett undantag har inträffat eller inte. Används ofta för att städa upp resurser.

throw(Definition):: Ett nyckelord som används för att *explicit* kasta ett undantag inuti en metod eller ett kodblock.

throws(Definition):: Ett nyckelord som används i en metods signatur för att deklarera de undantag som metoden kan kasta.

Tråd(Thread)(Definition):: En enskild exekveringsväg i ett program. Java stödjer *multithreading*, vilket möjliggör samtidig körning av flera delar av ett program.

Main-metod(Definition):: Ingångspunkten för varje Java-applikation. Den har signaturen: `public static void main(String[] args)`.

Statisk(Static)(Definition):: Ett nyckelord som indikerar att en medlem (variabel eller metod) tillhör *klassen* själv, snarare än en specifik *instans* av klassen.

Final(Definition):: Ett nyckelord som, när det appliceras på en variabel, gör den till en konstant. När det appliceras på en metod, kan den inte skrivas över (*override*). När det appliceras på en klass, kan den inte ärvas.

Public(Definition):: En åtkomstmodifierare som gör en klass, metod eller ett fält tillgängligt från *alla* andra klasser.
<!--SR:!2025-10-18,2,228-->

Private(Definition):: En åtkomstmodifierare som begränsar synligheten för en metod eller ett fält till att endast vara tillgänglig *inuti* den klass där den är deklarerad.
<!--SR:!2025-10-18,2,230-->

Protected(Definition):: En åtkomstmodifierare som gör en medlem tillgänglig inom sitt eget *paket* och för *subklasser* i andra paket.
<!--SR:!2025-10-21,5,248-->

Return(Definition):: Ett nyckelord som används för att avsluta exekveringen av en metod. Det kan användas för att returnera ett värde till anroparen.
