# HI1029 Begrepp Tenta

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HI1029 #begrepp

---

Varför analyserar man algoritmers effektivitet teoretiskt?(Definition)::För att kunna jämföra algoritmer oberoende av hårdvara, operativsystem, programmeringsspråk och specifika indatastorlekar.

Vad representerar komplexitetsfunktionen $T(n)$?(Definition)::Algoritmens tidsåtgång (antalet operationer) uttryckt som en matematisk funktion av indatans storlek $n$.

Vad innebär det att en algoritm är $O(n^2)$?(Definition)::Att algoritmens exekveringstid i värsta fall växer kvadratiskt i förhållande till indatans storlek $n$.

Vad är tidskomplexiteten för get(index) och set(index) i en array-lista?(Definition)::$O(1)$.

Vad är tidskomplexiteten för add(index, element) i en array-lista?(Definition)::$O(n)$, eftersom efterföljande element måste skiftas.

Vad är tidskomplexiteten för get(index) i en enkellänkad lista?(Definition)::$O(n)$, då listan måste traverseras från början.

Vad är ordo för metoderna get och put i en bra Hashtabell?(Definition)::$O(1)$ (förväntad/amortiserad tid).

Hur uppkommer worst-case $O(n^2)$ för Quicksort?(Definition)::När pivot-elementet systematiskt blir det största eller minsta elementet (t.ex. vid redan sorterad data).

Vad är ordo för antal platsbyten i Urvalssortering (Selection sort)?(Definition)::$O(n)$.

Vad är ordo för antal jämförelser i Instickssortering (Insertion sort) i värsta fallet?(Definition)::$O(n^2)$.

Vad är en Abstrakt Datatyp (ADT)?(Definition)::En teoretisk specifikation som definierar data och operationer utan att ange teknisk implementation.

Hur förhåller sig en datastruktur till en ADT?(Definition)::En datastruktur är den konkreta tekniska implementationen av en ADT.

Fördel och nackdel med array-lista jämfört med länkad lista?(Definition)::Fördel: Snabb indexering $O(1)$. Nackdel: Dyr insättning i mitten $O(n)$.

Vad är en Iterator och varför behövs den?(Definition)::Ett objekt för sekventiell genomgång av element. Behövs för att t.ex. iterera effektivt genom en länkad lista ($O(n)$ istället för $O(n^2)$).

Vad skiljer en dubbellänkad lista från en enkellänkad?(Definition)::Varje nod har pekare till både föregående och nästa nod, vilket tillåter traversering bakåt.

Definiera ett Binärt Sökträd.(Definition)::Ett binärt träd där vänster subträd endast innehåller mindre värden och höger subträd endast innehåller större värden än noden själv.

Vad är ett fullt (full) binärt träd?(Definition)::Ett träd där varje nod har antingen noll eller två barn.

Vad är ett komplett (complete) binärt träd?(Definition)::Ett träd där alla nivåer utom den sista är helt fyllda, och den sista nivån är fylld från vänster.

Vad är ett balanserat binärt träd?(Definition)::Ett träd där höjdskillnaden mellan vänster och höger subträd för varje nod är max 1.

Definiera en Heap.(Definition)::Ett komplett binärt träd som följer heap-egenskapen (föräldern är alltid större än/lika med barnen i en max-heap).

Vad är ordo för att sätta in ett element i en Heap?(Definition)::$O(\log n)$.

Vad är ordo för att ta bort roten i en Heap?(Definition)::$O(\log n)$.

Hur hanteras krockar med öppen adressering?(Definition)::Vid kollision letas nästa lediga plats upp i tabellen (t.ex. linjär probering).

Hur hanteras krockar med länkning?(Definition)::Varje index i tabellen pekar på en lista där alla krockande element lagras.

Vad krävs av equals() och hashCode() i Java?(Definition)::Om a.equals(b) är sant, måste a.hashCode() == b.hashCode() vara sant.

Vad innebär det att en sorteringsalgoritm är stabil?(Definition)::Att element med samma värde behåller sin inbördes ordning från ursprungslistan.

Hur mycket extra minne kräver standard-Mergesort?(Definition)::$O(n)$, på grund av den temporära arrayen vid sammanslagning.

Hur representeras en grannlista för en viktad graf?(Definition)::Som en array av listor där varje listelement innehåller både destinationsnod och bågvikt.

Vad betyder värdet på rad 3, kolumn 5 i en grannmatris?(Definition)::Vikten på bågen från nod 3 till nod 5.

Skillnad mellan rekursion och iteration gällande minne?(Definition)::Rekursion tar $O(\text{djup})$ på call-stacken; iteration tar normalt $O(1)$ extra minne.

Vad betyder det att en algoritm är $O(n^2)$?(Definition)::Att exekveringstiden i värsta fallet växer proportionellt mot kvadraten av indatans storlek.

Vad är värsta fallet för Quicksort och hur uppkommer det?(Definition)::$O(n^2)$. Det uppstår när pivot-elementet konsekvent väljs så att delistorna blir extremt obalanserade (t.ex. vid redan sorterad data om man väljer första/sista elementet).

Ange och motivera ordo för insättning och borttagning i en heap.(Definition)::$O(\log n)$. Motivering: Trädets höjd är logaritmisk och vid justering (bubbling) rör man sig längs en väg från rot till löv.

Ange ordo för add(E) (sist i listan) för en väl-implementerad array-baserad lista.(Definition)::Amorterad tid $O(1)$. I enstaka fall $O(n)$ när arrayen är full och måste kopieras.

Ange ordo för antal jämförelser vid urvalssortering (selection sort).(Definition)::$O(n^2)$. Man måste leta igenom den osorterade delen för varje element.

Ange ordo för antal platsbyten vid urvalssortering.(Definition)::$O(n)$. Man gör endast ett byte per genomgång av arrayen.

Varför är det bra att kunna analysera en algoritms effektivitet teoretiskt?(Definition)::För att kunna förutsäga hur algoritmen presterar när indatan växer, oberoende av specifik hårdvara.

Vad innebär komplexitetsfunktionen $T(n)$?(Definition)::Den beskriver det faktiska antalet operationer en algoritm utför som en funktion av indatans storlek $n$.

Vad är ordo för binär sökning?(Definition)::$O(\log n)$. Sökrymden halveras i varje steg.

Vad är en abstrakt datatyp (ADT)?(Definition)::En specifikation av data och tillåtna operationer, utan att ange hur dessa implementeras.

Hur förhåller sig en ADT till en datastruktur?(Definition)::Datastrukturen är den konkreta implementationen (t.ex. array eller länkad lista) av den abstrakta datatypen.

Jämför array och länkad lista (för- och nackdelar).(Definition)::Array: Snabb åtkomst via index ($O(1)$), men dyr storleksändring. Länkad lista: Dynamisk storlek och snabb insättning ($O(1)$) om man har referensen, men långsam sökning ($O(n)$).

Beskriv ADT Stack.(Definition)::En linjär datastruktur som följer LIFO-principen (Last-In, First-Out). Centrala operationer: push, pop, peek.

Beskriv ADT Kö (Queue).(Definition)::En linjär datastruktur som följer FIFO-principen (First-In, First-Out). Centrala operationer: enqueue, dequeue.

Vad är en iterator?(Definition)::Ett objekt som används för att stega igenom en samling element utan att exponera samlingens inre struktur.

Varför är iteratorer viktiga för effektivitet?(Definition)::Vid t.ex. en länkad lista tillåter iteratorn genomgång i $O(n)$, medan upprepad get(i) skulle ta $O(n^2)$.

Definiera ett binärt sökträd (BST).(Definition)::Ett binärt träd där varje nads vänstra subträd endast innehåller värden mindre än nodens värde, och högra subträdet endast värden större än nodens värde.

Beskriv termerna Fullt, Komplett och Balanserat träd.(Definition)::Fullt: Varje nod har 0 eller 2 barn. Komplett: Alla nivåer fyllda utom sista (som fylls från vänster). Balanserat: Höjdskillnad mellan vänster och höger subträd är max 1 för alla noder.

Vad är ordo för sökning i ett BST?(Definition)::Genomsnittligt $O(\log n)$, men i värsta fall (osorterat träd) $O(n)$.

Definiera en Heap.(Definition)::Ett komplett binärt träd där varje nod uppfyller heap-egenskapen (t.ex. i en min-heap är föräldern alltid mindre än sina barn).

Hur fungerar öppen adressering vid krockar?(Definition)::Om en plats är upptagen letar man efter nästa lediga plats i arrayen enligt ett förbestämt mönster (linjär/kvadratisk probning).

Hur fungerar krockhantering via länkning (chaining)?(Definition)::Varje plats i hashtabellen innehåller en lista av alla element som hashats till samma index.

Hur bör equals och hashCode hänga ihop i Java?(Definition)::Om a.equals(b) är sant måste a.hashCode() == b.hashCode(). Omvänt gäller dock inte nödvändigtvis.

Vad är en algoritm?(Definition)::En ändlig mängd väl definierade instruktioner för att lösa en specifik uppgift.

Vad är fördelen med rekursion jämfört med iteration?(Definition)::Kan ge kortare, mer lättläst kod för problem som är naturligt rekursiva (t.ex. trädgenomgång).

Vad är nackdelen med rekursion jämfört med iteration?(Definition)::Tar mer minne pga metodanrop på stacken och kan leda till StackOverflow.

Vad innebär det att en sorteringsalgoritm är stabil?(Definition)::Att den bevarar den inbördes ordningen för element med lika nycklar.

Beskriv Backtracking.(Definition)::En metod för att systematiskt söka igenom lösningar genom att prova en väg och "backa" om man når en återvändsgränd.

Vad är ett minsta uppspännande träd (MST)?(Definition)::Ett träd som förbinder alla noder i en graf med minsta möjliga totala kantvikt.

Hur fungerar Dynamisk Programmering?(Definition)::Man delar upp problemet i överlappande delproblem, löser dem en gång och sparar resultaten (memoization/tabulering) för att undvika onödiga omberäkningar.
