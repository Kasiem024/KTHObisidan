---
tags: [begrepp, föreläsning, HI1029, KTH, programmering, year2026]
created: 2026-01-18
updated: 2026-05-26
---
# HI1029 Begrepp Föreläsning 1-4

Algoritm(Definition);; Ett begränsat antal **instruktioner** för att lösa en uppgift som, från givna indata, med säkerhet leder till **korrekta utdata**.
<!--SR:!2026-03-11,1,166!2026-03-11,1,200-->

Datastruktur(Definition);; En struktur som **organiserar** och **lagrar** data i minnet för effektiv åtkomst och bearbetning.

Abstrakt Datatyp(ADT)(Definition);; En specifikation av **vad** man kan göra med data (operationer) men inte **hur** det görs (implementation).
<!--SR:!2026-03-11,1,186!2026-03-11,1,186-->

Skillnaden mellan ADT och Datastruktur(Definition)
||
- **ADT** är ett gränssnitt (*vad*)
- **Datastruktur** är den tekniska realiseringen (*hur*).

ADT Lista(Definition);; En samling element där varje element har en specifik **position** eller **index**.

Komplexitetsfunktion(T(n))(Definition);; En matematisk funktion som beskriver hur **antalet instruktioner** i en algoritm växer när problemets storlek ($n$) ökar.
<!--SR:!2000-01-01,1,250!2026-03-11,1,166-->

Ordo-notation(Big-O)(Definition);; En teoretisk **övre gräns** som beskriver en algoritms effektivitet i värsta fall när $n$ går mot oändligheten.

Definition av O(n²)(Definition);; Det existerar konstanter $c$ och $n_0$ så att $T(n) \le c \cdot n^2$ för alla $n > n_0$.

Amortiserad tidskostnad(Definition);; Det **genomsnittliga** tidsbehovet för en operation (t.ex. `ArrayList.add`) över en lång sekvens av anrop.

Array-lista Fördelar(2)
??
- Direktåtkomst via index ($O(1)$)
- Minneseffektiv om arrayen är välfylld
<!--SR:!2026-03-11,1,200!2026-03-14,3,230-->

Array-lista Nackdelar(2)
??
- Kostsamt att sätta in/ta bort i början ($O(n)$)
- Kräver **omallokering** (`reallocate`) när den blir full ($O(n)$)

Tidskomplexitet: get(index) & set(index) i ArrayList(Definition):: $O(1)$

Tidskomplexitet: add(index, element) i ArrayList(Definition):: $O(n)$ (p.g.a. **elementförflyttning**)
<!--SR:!2026-03-14,3,220-->

Nod (i länkad lista)(Definition);; En behållare som innehåller **data** och en **referens** (pekare) till nästa element.

Länkad lista Fördelar(2)
??
- Kan växa **dynamiskt** utan omallokering
- Effektiv insättning/borttagning i början ($O(1)$)

Länkad lista Nackdelar(2)
??
- Ingen direktåtkomst ($O(n)$ för att hitta index $i$)
- Kräver extra minne för **referenser** (pekare)
<!--SR:!2000-01-01,1,250!2026-03-11,1,170-->

Dubbellänkad lista(Definition);; En lista där varje nod har referenser till både **nästa** och **föregående** nod.
<!--SR:!2026-03-11,1,166!2026-03-11,2,206-->

Iterator(Definition);; Ett objekt som används för att **traversera** en samling element sekventiellt utan att exponera den interna strukturen.
<!--SR:!2026-03-11,1,200!2000-01-01,1,250-->

Varför Iterator i länkad lista?(Definition):: För att uppnå $O(n)$ vid genomgång av hela listan, utan iterator (via index) blir det $O(n^2)$.

hasNext()(Iterator)(Definition):: Returnerar **true** om det finns fler element kvar att hämta i genomgången.
<!--SR:!2026-03-14,3,206-->

next()(Iterator)(Definition):: Returnerar **nästa element** i sekvensen och flyttar iteratorns position framåt.

Tidskomplexitet: get(index) i Länkad lista(Definition):: $O(n)$
<!--SR:!2026-03-11,1,200-->

Tidskomplexitet: add(0, element) i Länkad lista(Definition):: $O(1)$

Stack(ADT)(Definition);; En linjär datastruktur som följer principen **LIFO** (Last-In, First-Out).
<!--SR:!2000-01-01,1,250!2026-03-13,2,186-->

push(element)(Stack)(Definition):: Lägger till ett nytt element **längst upp** på stacken.

pop()(Stack)(Definition):: Tar bort och returnerar det **översta** elementet.
<!--SR:!2026-03-13,2,186-->

peek()(Stack)(Definition):: Returnerar det **översta** elementet utan att ta bort det från stacken.

Stack-operationer(Komplexitet)(Definition):: Alla standardoperationer (`push`, `pop`, `peek`, `empty`) utförs på **$O(1)$**.

Postfix-notation(RPN)(Definition);; Ett sätt att skriva matematiska uttryck där **operatorn kommer efter** sina operander (t.ex. `3 4 +`).
<!--SR:!2000-01-01,1,250!2026-03-14,3,220-->

Stack vid metodanrop(Definition):: Processorn använder en stack för att lagra **returadresser** och lokala variabler vid funktionsanrop.
<!--SR:!2026-03-11,1,200-->

Minnesjämförelse: Länkad Stack vs Array Stack(2)
||
- **Länkad**: Konstant dubbelt så mycket minne (data + referens)
- **Array**: Kan ha upp till 4x "dead space" om den är gles men inte krympt

Varför är Länkad Lista lämplig för Stack?(Definition):: Den har alltid exakt rätt storlek och kräver aldrig dyr **omallokering** vid `push`.

Kö(ADT)(Definition);; En linjär datastruktur som följer principen **FIFO** (First-In, First-Out).

First-In, First-Out (FIFO)(Definition);; Det element som sattes in först är också det som tas ut först.
<!--SR:!2000-01-01,1,250!2026-03-11,1,206-->

enqueue(element)(Definition);; Operationen att lägga till ett element **längst bak** i kön.
<!--SR:!2000-01-01,1,250!2026-03-14,3,220-->

dequeue()(Definition);; Operationen att ta bort och returnerar elementet **längst fram** i kön.

peek() / front()(Kö)(Definition):: Returnerar elementet längst fram i kön **utan** att ta bort det.

Queue i Java(Implementationer)(Definition):: I Java är Queue ett interface som vanligtvis implementeras av klasserna **LinkedList** eller **ArrayDeque**.

Queue-metoder: Insättning(2)
||
- offer(e) : Returnerar false/null om det misslyckas (rekommenderas)
- add(e) : Kastar ett **Exception** om det misslyckas

Queue-metoder: Borttagning(2)
||
- poll() : Returnerar null om kön är tom (rekommenderas)
- remove() : Kastar ett **NoSuchElementException** om kön är tom

Queue-metoder: Inspektion(2)
||
- peek() : Returnerar null om kön är tom (rekommenderas)
- element() : Kastar ett **NoSuchElementException** om kön är tom

Kö-implementation (med enkel Array)(Definition):: Att flytta alla element vid borttagning (dequeue) ger tidskomplexitet **$O(n)$**, vilket är ineffektivt.

Cirkulär Array(Lösning för kö)(Definition):: Använder **modulo-operatorn** för att låta index "wrappa runt" arrayens slut för att nå **$O(1)$**.

Cirkulär Array(Index-formler)(2)
||
- Öka rear : `rear = (rear + 1) % maxSize`
- Öka front : `front = (front + 1) % maxSize`

Medlemsvariabler i cirkulär array-kö(4)
??
- **front**: index för första elementet
- **rear**: index för sista elementet
- **size**: antal element just nu
- **maxSize**: arrayens totala kapacitet

Kö-implementation (med Länkad lista)(Definition):: Kräver referenser till både **head** (front) och **tail** (rear) för att uppnå **$O(1)$** för alla operationer.

Jämförelse: ArrayQueue vs LinkedListQueue(2)
||
- **ArrayQueue**: Effektivare minnesmässigt per element, men måste allokera om vid full array
- **LinkedListQueue**: Alltid $O(1)$ vid insättning, men tar mer minne p.g.a. nod-referenser

Användningsområden för Kö(3)
??
- Printköer (skrivare)
- Processhantering i operativsystem
- **Bredden-först-sökning** (BFS) i grafer
