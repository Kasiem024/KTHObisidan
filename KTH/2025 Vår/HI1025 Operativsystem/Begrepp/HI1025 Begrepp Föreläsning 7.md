---
tags: [begrepp, HI1025, KTH, year2025, programmering]
created: 2025-05-19
updated: 2026-08-17
---
# HI1025 Begrepp Föreläsning 7

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

## Begrepp

Persistens (Storage) (Definition):: Egenskapen hos ett system att lagra data så att den överlever strömavbrott och omstarter. Storage (lagringsenheter) refererar till de fysiska medier (t.ex. hårddiskar, SSD) där persistent data sparas. (Tänk: *Data som stannar kvar, även när datorn stängs av*).

Device Drivers (Enhetsdrivrutiner) (Definition):: Mjukvarukomponenter som tillåter operativsystemet att kommunicera med och styra specifika hårdvaruenheter (t.ex. grafikkort, nätverkskort, diskar). De abstraherar hårdvarans komplexitet och erbjuder ett standardiserat gränssnitt. (Tänk: *Tolk och instruktör för varje hårdvarupryl*).

Memory-mapped I/O vs. Dedicated I/O Instructions (Interaktion med enheter) (Alternativ) (2)
??
Två metoder för CPU:n att kommunicera med hårdvaruenheters register och minne:
- **Memory-mapped I/O:** Enhetsregister mappas till en del av det vanliga fysiska adressutrymmet. CPU:n använder vanliga load/store-instruktioner för att läsa/skriva till enhetsregister, som om de vore vanliga minnesceller.
- **Dedicated I/O Instructions (Port-mapped I/O):** CPU:n har speciella I/O-instruktioner (t.ex. `in`/`out` på x86) och ett separat I/O-adressutrymme för att kommunicera med enheter.
(Tänk: *Prata med enheter via vanliga minnesadresser vs. speciella I/O-portar och -kommandon*).

Polled I/O vs. Interrupt-driven I/O (Hantering av I/O-slutförande) (Alternativ) (2)
??
Två metoder för operativsystemet att avgöra när en I/O-operation är slutförd:
- **Polled I/O (Polling):** CPU:n kontrollerar upprepade gånger (poller) statusregistret för I/O-enheten för att se om operationen är klar. Kan vara ineffektivt då CPU-tid slösas på att vänta.
- **Interrupt-driven I/O (Avbrottsstyrd I/O):** I/O-enheten skickar en avbrottssignal (interrupt) till CPU:n när operationen är klar. CPU:n kan då utföra annat arbete under tiden och hanterar avbrottet när det inträffar.
(Tänk: *Fråga upprepade gånger "är du klar?" vs. "säg till när du är klar"*).

Direct Memory Access (DMA) (Definition):: En hårdvarumekanism som tillåter I/O-enheter att överföra data direkt till eller från huvudminnet utan CPU:ns direkta medverkan för varje byte/ord. CPU:n initierar överföringen, men DMA-kontrollern sköter själva dataflytten, vilket frigör CPU:n för andra uppgifter. (Tänk: *En dedikerad dataflyttare som avlastar CPU:n vid stora I/O-överföringar*).

Seek Time vs. Rotational Delay (Diskåtkomstkomponenter) (Definitioner) (2)
??
Två huvudsakliga fördröjningskomponenter vid åtkomst till data på en traditionell hårddisk (HDD):
- **Seek Time (Söktid):** Tiden det tar för läs/skrivhuvudet att positionera sig över rätt spår (cylinder) på disken.
- **Rotational Delay (Rotationsfördröjning):** Tiden det tar för disken att rotera så att rätt sektor på spåret hamnar under läs/skrivhuvudet.
(Tänk: *Flytta armen till rätt rad (seek) och vänta på att rätt ord snurrar fram (rotation)*).

RAID (Redundant Array of Independent Disks) (Definition):: En teknologi som kombinerar flera fysiska diskenheter till en eller flera logiska enheter för att uppnå ökad prestanda (t.ex. genom striping/RAID 0), feltolerans (t.ex. genom spegling/RAID 1 eller paritet/RAID 5), eller en kombination av dessa. (Tänk: *Teamarbete för hårddiskar för bättre prestanda och/eller säkerhet*).

File (Fil) (Definition):: En namngiven samling av relaterad information som lagras på ett sekundärminne (persistent lagring). För operativsystemet är en fil ofta en sekvens av bytes. (Tänk: *Ett digitalt dokument eller databehållare*).

Directory (Katalog/Mapp) (Definition):: En struktur i ett filsystem som används för att organisera filer och andra kataloger hierarkiskt. En katalog innehåller referenser (namn och pekare) till dessa objekt. (Tänk: *En pärm eller mapp för att sortera filer*).

(Un-)Mount (Montering/Avmontering av filsystem) (Definition):: Processen att göra ett filsystem (t.ex. på en diskpartition eller extern enhet) tillgängligt inom operativsystemets katalogträd genom att associera det med en specifik katalog (monteringspunkt). Avmontering är den omvända processen. (Tänk: *Koppla in/ut en lagringsenhets innehåll i den övergripande filstrukturen*).

Track, Sector, Block (Disk/Filsystem-enheter) (Definitioner) (3)
??
Grundläggande enheter för datalagring och -hantering:
- **Track (Spår):** En cirkulär bana på ytan av en diskplatta där data lagras magnetiskt.
- **Sector (Sektor):** Den minsta fysiskt adresserbara enheten på ett spår, traditionellt 512 bytes. Data läses och skrivs i hela sektorer.
- **Block (Block):** En logisk enhet av data som filsystemet använder, består oftast av en eller flera sammanhängande sektorer (t.ex. 4KB). Allokering av diskutrymme sker i block.
(Tänk: *Spår är som varv på en LP-skiva, sektorer är små tårtbitar på spåret, block är vad filsystemet jobbar med*).

iNode (Index Node) (Definition):: En datastruktur i Unix-liknande filsystem som lagrar metadata om en fil eller katalog, såsom ägare, rättigheter, tidsstämplar, storlek och pekare till de datablock där filens innehåll finns. Varje fil/katalog har en unik iNode. (Tänk: *Bibliotekskortet för varje fil med all information utom själva innehållet*).

Superblock (Superblock) (Definition):: En datastruktur i ett filsystem som innehåller kritisk information om själva filsystemet, såsom dess typ, storlek, antal block, information om var viktiga datastrukturer (som iNode-tabellen och allokeringsbitmaps) finns, och status för filsystemet. (Tänk: *Filsystemets huvudbok eller innehållsförteckning*).

Bit Map Block (Allokeringsbitmap) (Definition):: Ett block (eller en serie block) i ett filsystem som används för att hålla reda på vilka data-block eller iNodes som är lediga respektive upptagna. Varje bit i bitmapen representerar statusen för ett block/en iNode. (Tänk: *En karta som visar vilka platser som är lediga eller upptagna*).

`.` (Punkt) och `..` (Punkt-punkt) (Katalogreferenser):: Speciella katalogposter i Unix-liknande filsystem. `.` (punkt) refererar till den aktuella katalogen själv, medan `..` (punkt-punkt) refererar till föräldrakatalogen (katalogen ovanför i hierarkin). (Tänk: *`.` är "här" och `..` är "en nivå upp"*).

Disk Aware File Systems (Diskmedvetna Filsystem) (Definition):: Filsystem som är designade för att optimera prestanda genom att ta hänsyn till den underliggande lagringsenhetens (särskilt traditionella hårddiskars) fysiska egenskaper och begränsningar, t.ex. genom att placera relaterade datablock nära varandra för att minimera söktider. (Tänk: *Filsystem som känner sin hårddisk och packar smart*).

Crash Consistency Problem (Kraschkonsistensproblemet) (Definition):: Problemet att säkerställa att filsystemets datastrukturer på disken förblir i ett giltigt och konsekvent tillstånd även om systemet kraschar (t.ex. på grund av strömavbrott) mitt under en serie av skrivoperationer som tillsammans utgör en logisk uppdatering. (Tänk: *Hur ser man till att bokföringen stämmer även om strömmen går mitt i en transaktion?*).

fsck (File System Check) vs. Journaling (Loggning) (Kraschhanteringstekniker) (Alternativ) (2)
??
Två huvudsakliga tekniker för att hantera kraschkonsistens i filsystem:
- **fsck (File System Check):** Ett verktyg som skannar igenom filsystemets metadata efter en krasch för att upptäcka och (försöka) reparera inkonsekvenser. Kan vara tidskrävande för stora filsystem.
- **Journaling (Loggning / Write-Ahead Logging):** Innan ändringar skrivs till sina slutgiltiga platser i filsystemet, skrivs en beskrivning av ändringarna (en transaktion) till en speciell logg (journal). Vid återhämtning efter krasch kan systemet använda loggen för att snabbt slutföra påbörjade operationer eller återställa partiella ändringar, vilket leder till ett konsekvent tillstånd.
(Tänk: *`fsck` är som att göra en fullständig revision efteråt, `journaling` är som att skriva ner vad man tänker göra innan man gör det*).

Log-structured File System (LFS) (Loggstrukturerat Filsystem) (Definition):: Ett filsystemdesign där alla skrivningar, både data och metadata, sker sekventiellt till en cirkulär, loggliknande struktur på disken. Gamla versioner av data och metadata blir kvar på sina ursprungliga platser (men markeras som ogiltiga). LFS syftar till att omvandla alla skrivningar till stora, sekventiella operationer för att förbättra skrivprestanda, särskilt på enheter där slumpmässiga skrivningar är långsamma. Kräver periodisk "städning" (garbage collection). (Tänk: *Allt skrivs som i en ständigt växande dagbok, gamla sidor rensas senare*).
