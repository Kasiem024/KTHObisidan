# HI1025 Begrepp Övning 1

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HI1025 #begrepp

---

## Begrepp

.h (Header file) (Definition):: En fil som innehåller *deklarationer* av funktioner, variabler, makron och datatyper. Används för att dela kod mellan olika källkodsfiler och främjar **återanvändbarhet** och **abstraktion**. (Tänk: Innehållsförteckning).
<!--SR:!2025-04-04,1,223!2025-03-25,3,250-->

.c (Source file) (Definition):: En fil som innehåller den faktiska *implementationen* (koden) av funktioner och variabler. (Tänk: Själva boken).
<!--SR:!2025-04-14,5,263!2025-04-09,7,288-->

`#include` (Definition):: Ett direktiv som infogar innehållet från en headerfil i den aktuella filen, vilket möjliggör användning av deklarerade funktioner och variabler från andra filer. (Tänk: Kopiera och klistra in)
<!--SR:!2025-04-14,5,243!2025-04-09,7,270-->

Abstraction (Definition):: Att *dölja komplexa detaljer* och endast visa den *nödvändiga informationen*. Gör kod lättare att förstå och använda. Operativsystemet använder detta för att skapa enklare gränssnitt.
<!--SR:!2025-04-11,2,226!2025-04-07,5,248-->

Huvudidéerna med **abstraktion** inom operativsystem (3)
||
- Att *dölja komplexiteten* i hårdvara och mjukvara
- Skapa *enklare, mer användarvänliga gränssnitt*
- Programmerare ska inte behöva bry sig om *hur* saker fungerar på låg nivå, bara *att* de fungerar
<!--SR:!2025-04-10,1,188-->

Processen som **abstraktion** inom ett OS:: OS skapar en *illusion* av att varje program har sin *egen CPU* (virtuell CPU). Detta kallas *virtualisering*. Gör det möjligt att köra *flera program samtidigt*, även om det bara finns en (eller få) fysiska CPU:er.
<!--SR:!2025-04-10,1,222!2025-04-04,1,223-->

Adressrymden som abstraktion inom ett OS:: En *illusion* av att varje process har ett *stort, sammanhängande, privat minne* (virtuella adresser). Programmeraren behöver *inte* veta hur det fysiska minnet är organiserat.
<!--SR:!2025-04-11,2,223!2025-04-14,5,263-->

Relationen mellan **virtualisering** och **abstraktion**:: En *teknik* för att skapa abstraktioner. En *fysisk resurs* (t.ex. CPU, minne) får det att se ut som *många virtuella instanser*. Detta är grunden för process- och adressrymdsabstraktionerna
<!--SR:!2000-01-01,1,250!2025-04-03,1,222-->

Relationen mellan **indirektion** och **abstraktion** (Definition) (3)
??
När man *inte refererar direkt* till något, utan via en *mellanhand*. Exempel:
- *Virtuellt minne*: Virtuella adresser pekar *indirekt* på fysiska adresser via en sidtabell.
- *Inode map* (i LFS): Inoder pekar *indirekt* på data på disken.
- *Fördel*: Gör det möjligt att *flytta runt* underliggande data (minnessidor, diskblock) utan att ändra alla referenser.
<!--SR:!2025-04-10,1,222!2025-04-11,3,262-->

Reusability (Återanvändbarhet) (Definition):: Att skriva kod som kan användas i flera olika sammanhang utan (eller med minimala) ändringar. Sparar utvecklingstid, minskar risken för fel, förbättrar konsistensen och underlättar underhåll av kodbasen. (Tänk: Legobitar).
<!--SR:!2025-03-25,1,228!2025-04-05,2,243-->

Maintainability (Underhållbarhet) (Definition):: Att skriva kod som är lätt att förstå, ändra och felsöka. Viktigt för långsiktig programvaruutveckling. Enkel och koncis kod (*Lauer's Law*) och ren, förståelig kod är att föredra framför extremt optimerad kod.
<!--SR:!2025-04-04,2,246!2025-04-09,7,250-->

Cohesion (Definition):: Ett mått på hur väl *relaterade funktionerna* inom en modul eller klass är. Innebär att en modul har ett *väldefinierat ansvar* och gör en sak väl. Leder till mer läsbar, förståelig och underhållbar kod, samt underlättar återanvändning och testning
<!--SR:!2025-04-03,2,243!2025-04-07,5,268-->

Coupling (Koppling) (Definition):: Ett mått på hur *oberoende olika moduler eller klasser* är. Innebär att ändringar i en modul har minimal påverkan på andra moduler, vilket underlättar underhåll och minskar risken för buggar.
<!--SR:!2025-03-23,1,230!2025-03-25,2,248-->

Information Hiding (Informationsdöljande) (Definition):: En princip som innebär att implementationen och interna detaljer av en modul döljs från omvärlden, och endast ett väl definierat gränssnitt exponeras.
<!--SR:!2025-04-03,1,222!2025-04-04,2,226-->

Fördelar med Information Hiding (5)
??
- *Modularitet*: Systemet blir enklare att *bygga och förstå i delar*.
- *Förbättrad förståelse*: Man behöver bara förstå *gränssnittet*, inte *hur* det fungerar internt.
- *Underhåll*: Lättare att *ändra och uppdatera* implementationen utan att påverka andra delar.
- *Flexibilitet*: Implementationen kan *ändras* utan att påverka andra moduler.
- *Säkerhet*: Förhindrar *obehörig åtkomst* och *manipulation* av intern data.
<!--SR:!2025-03-29,1,226!2025-04-14,5,246-->

C incomplete types (Definition) (3)
??
- En typ som *deklarerats men inte definierats fullständigt* (t.ex. `struct MyStruct;`).
- Kompilatorn vet *namnet* men inte *storleken* eller *strukturen*.
- Används ofta med pekare för att skapa *abstrakta datatyper* och främja informationsdöljande.
<!--SR:!2000-01-01,1,250!2025-03-30,2,246-->

malloc (Definition):: En C-funktion som allokerar ett minnesblock på *heapen* (dynamisk minnesallokering). Returnerar en `void *`. Kan leda till *minnesläckor*.
<!--SR:!2025-04-03,1,206!2025-04-07,5,268-->

free (Definition):: En C-funktion som frigör ett minnesblock på heapen som tidigare allokerats med `malloc`.
<!--SR:!2025-04-09,7,286!2025-04-09,7,270-->

void * (Definition):: En *generisk pekare* i C. Kan peka på vilken datatyp som helst, men måste *explicit typomvandlas* innan den kan användas. Används ofta med `malloc`. (Tänk: En universell fjärrkontroll; returtyp från malloc).
<!--SR:!2025-04-03,1,222!2025-04-04,2,242-->

Function pointers (Funktionspekare) (Definition):: En variabel som pekar på en funktion. Möjliggör att skicka funktioner som argument till andra funktioner, och att skapa *dynamiska funktionsanrop*. (Tänk: En adress till en funktion; callback-funktioner).
<!--SR:!2025-04-03,1,208!2025-04-07,5,266-->
