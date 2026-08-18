---
tags: [begrepp, HI1025, KTH, year2025, programmering]
created: 2025-05-19
updated: 2026-08-17
---
# HI1025 Begrepp Övning 4

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

## Begrepp

Direct Memory Access (DMA) (Definition):: En hårdvarufunktion som tillåter kringutrustning (peripherals) att överföra data direkt till eller från huvudminnet utan CPU:ns direkta medverkan för varje dataenhet (t.ex. byte eller ord). CPU:n initierar DMA-överföringen genom att programmera en DMA-kontroller (DMAC) med källadress, destinationsadress, antal bytes och överföringsriktning. (Tänk: *En specialiserad kopieringsmaskin för data som avlastar CPU:n*).

DMA Transfer Modes (Överföringslägen för DMA) (Definitioner) (3)
??
Olika sätt en DMA-kontroller kan hantera busstillgång och dataöverföring:
- **Block DMA (eller Burst Mode):** DMA-kontrollern tar över systembussen och överför hela datablocket i en enda, kontinuerlig sekvens. CPU:n är blockerad från bussåtkomst under denna tid. Snabbast för DMA, men kan blockera CPU:n länge.
- **Cycle Stealing Mode (Transparent Mode):** DMA-kontrollern tar över bussen för korta perioder, ofta bara för att överföra en enstaka dataenhet (t.ex. ett ord), mellan CPU:ns buss-cykler eller när CPU:n inte använder bussen. Mindre störande för CPU:n men långsammare DMA-överföring.
- **Demand Transfer Mode (eller Burst Transfer som svar på begäran):** En kompromiss där DMA-kontrollern begär bussen och överför data i "bursts" (kortare block) så länge kringutrustningen är redo och bussen är tillgänglig.
(Tänk: *Block: Allt på en gång. Cycle Stealing: Små bitar när CPU:n inte tittar. Demand: Skurar av data vid behov*).

DMA Controller (DMAC) (Definition):: En specialiserad hårdvaruenhet som hanterar DMA-överföringar. Den programmeras av CPU:n och tar sedan hand om själva dataflytten mellan minne och periferienheter. (Tänk: *Dirigenten för DMA-operationer*).

Bus Master (Bussmästare) (Definition):: En hårdvaruenhet (som CPU eller DMA-kontroller) som kan initiera och styra dataöverföringar på systembussen. Endast en bussmästare kan kontrollera bussen åt gången. (Tänk: *Den som för tillfället har kontroll över motorvägen för data*).

Double Buffering (Dubbelbuffring / Ping-Pong Buffering) (Teknik):: En teknik där två buffertar används för att överföra data. Medan en buffert fylls (t.ex. av DMA från en periferienhet) eller bearbetas, kan den andra bufferten användas för att läsa ut tidigare data eller förberedas för nästa operation. Detta minskar väntetider och möjliggör kontinuerligt dataflöde, t.ex. vid ljud- eller videouppspelning. (Tänk: *Två hinkar; fyll den ena medan den andra töms*).

FatFs (Definition):: Ett generiskt, plattformsoberoende filsystemmodul designat för små inbyggda system, som implementerar FAT/exFAT-filsystemen (File Allocation Table). Det är skrivet i C och är känt för sitt lilla minnesavtryck. (Tänk: *Ett kompakt filsystem för microcontrollers och SD-kort*).

File Allocation Table (FAT) (Filsystem):: Ett filsystem som ursprungligen utvecklades för MS-DOS och som fortfarande används på många portabla lagringsenheter (t.ex. SD-kort, USB-minnen). Det använder en tabell (File Allocation Table) för att hålla reda på vilka kluster (grupper av sektorer) som tillhör vilka filer och i vilken ordning. (Tänk: *En karta som länkar ihop delarna av en fil på disken*).

Cluster (Kluster i FAT-filsystem) (Definition):: Den minsta logiska enheten för diskutrymmesallokering i ett FAT-filsystem. Ett kluster består av ett fast antal sammanhängande sektorer. En fil allokeras ett eller flera kluster. (Tänk: *En standardstor låda för att lagra fildelar*).

Volume Boot Record (VBR) / BIOS Parameter Block (BPB) (FAT-filsystem) (Definitioner) (2)
??
Viktiga strukturer i början av en FAT-formaterad volym:
- **Volume Boot Record (VBR):** Den första sektorn på en partition som innehåller ett FAT-filsystem. Innehåller körbar kod för att starta operativsystemet (om partitionen är bootbar) samt BPB.
- **BIOS Parameter Block (BPB):** En datastruktur inom VBR som beskriver de fysiska och logiska egenskaperna hos volymen, såsom sektorstorlek, antal sektorer per kluster, antal FAT-tabeller, totalt antal sektorer, etc.
(Tänk: *Volymens ID-kort och tekniska specifikation*).

SD Card (Secure Digital Card) (Lagringsmedium):: Ett icke-flyktigt minneskortformat som används flitigt i portabla enheter som kameror, telefoner och inbyggda system för datalagring. (Tänk: *Ett litet, portabelt minneschip*).

SPI (Serial Peripheral Interface) (Kommunikationsprotokoll):: Ett synkront seriellt kommunikationsgränssnitt som ofta används för kortdistanskommunikation, primärt i inbyggda system, mellan en master (t.ex. en mikrokontroller) och en eller flera slavenheter (t.ex. sensorer, minneskort som SD-kort). (Tänk: *En enkel seriell "samtalslinje" mellan chip*).

SD Card Commands (Kommandon för SD-kort via SPI) (Protokoll):: Specifika kommandon (t.ex. CMD0, CMD17, CMD24) som skickas från en master (värd) till ett SD-kort via SPI-gränssnittet för att initiera kortet, läsa/skriva block, hämta status, etc. Varje kommando har ett index, argument och förväntar sig ett specifikt svar. (Tänk: *Specialkoder för att styra och kommunicera med ett SD-kort*).
