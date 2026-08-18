---
tags: [begrepp, HI1025, KTH, year2025, programmering]
created: 2025-04-06
updated: 2026-08-17
---
# HI1025 Begrepp Föreläsning 4

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

## Begrepp

Paging Model (Definition):: En minneshanteringsteknik där både den virtuella adressrymden och det fysiska minnet delas upp i lika stora block: **sidor** (virtuellt minne) och **ramar** (fysiskt minne). Möjliggör virtualisering av minnet, icke-sammanhängande minnesallokering och minskar fragmentering.
<!--SR:!2025-04-10,1,226!2025-04-09,1,230-->

Linear Page Table (Definition):: En enkel datastruktur, oftast en array, som OS använder för att mappa virtuella sidnummer (VPN) till fysiska ramnummer (PFN). Varje process har sin egen. Kan bli mycket stor för stora adressrymder.
<!--SR:!2025-05-13,5,247!2025-04-10,1,226-->

Address Translation (Definition):: Processen att översätta en *virtuell adress* till en *fysisk adress* med hjälp av en sidtabell. MMU gör denna översättning.
<!--SR:!2025-05-19,2,230!2025-04-11,2,246-->

Virtual Page (VP) vs. Page Frame (PF) (Definition);; En **Virtual Page (VP)** är ett block med fast storlek (t.ex. 4KB) i en process virtuella adressrymd. En **Page Frame (PF)** är ett block med samma fasta storlek i det fysiska minnet. Den virtuella sidan mappas till en eller ingen fysisk sidram.
<!--SR:!2025-04-10,1,226-->

Page Table Base Register (PTBR) (Definition):: Ett register som innehåller adressen till *början av den aktiva processens sidtabell*.
<!--SR:!2025-04-20,2,246!2025-04-17,1,226-->

Page Fault (Definition):: Ett *avbrott* som genereras av CPU:n när ett program försöker komma åt en virtuell sida som *inte är laddad* i det fysiska minnet (RAM). OS måste då hämta sidan från disken (**swap space**) till minnet.
<!--SR:!2025-04-22,2,246!2025-04-22,2,246-->

Segmentation Fault (Definition);; Kan uppstå om en process försöker komma åt minne som *inte tillhör ett av processens segment* eller om en *ogiltig adress* i processens adressrymd används.
<!--SR:!2025-05-15,2,226-->

Protection Fault (Definition):: Ett fel som uppstår när en process försöker utföra en otillåten operation på en giltig och närvarande minnessida, t.ex. skriva till en read-only sida.
<!--SR:!2025-04-18,2,246!2025-04-22,2,246-->

Translation Look-aside Buffer (TLB) (Definition):: En liten, snabb hårdvarucache i MMU:n. Lagrar nyligen använda mappningar mellan virtuella sidnummer och fysiska ramnummer för att påskynda adressöversättningen och undvika långsamma sökningar i huvudminnet.
<!--SR:!2025-04-20,2,246!2025-04-19,1,226-->

Temporal Locality (Definition):: Innebär att en nyligen åtkommen minnesadresser sannolikt kommer att åtkommas igen inom en snar framtid.
<!--SR:!2025-04-12,3,266!2025-04-11,2,246-->

Spatial Locality (Definition):: Innebär att om ett program kommer åt minne på en viss adress x, kommer det sannolikt snart att komma åt minne nära x.
<!--SR:!2025-05-10,2,246!2025-05-15,7,286-->

Least Recently Used (LRU) (Definition):: En *sidersättningspolicy* som byter ut den sida som *inte har använts på längst tid*. Antagandet är att sidor som nyligen använts sannolikt kommer att användas igen. Implementeringen kan vara komplex eftersom det krävs att hålla reda på när varje sida senast användes.
<!--SR:!2025-04-12,3,266!2025-05-15,7,306-->

Random (Replacement Policy) (Definition):: En *sidersättningspolicy* som väljer en *slumpmässig sida* att byta ut när en ny sida behöver laddas in i minnet.
<!--SR:!2025-04-12,3,266!2025-05-15,7,306-->

Multi-level Page Table (Definition):: En hierarkisk (trädliknande) struktur för sidtabeller. Den linjära sidtabellen delas upp i mindre delar, och en hierarki av "sidkataloger" (page directories) används för att peka ut endast de delar av sidtabellen som innehåller giltiga mappningar.
<!--SR:!2025-05-06,1,227!2025-05-08,3,267-->

Storage Hierarchies (Definition):: Ett koncept som beskriver hur datalagring organiseras i *olika nivåer* baserat på *hastighet, kostnad och flyktighet*. Snabbare och dyrare lagring (som CPU-register och cache) används för data som behöver nås ofta, medan långsammare och billigare lagring (som huvudminne och disk) används för större datamängder som inte behöver nås lika snabbt.
<!--SR:!2025-05-15,7,286!2025-04-26,3,266-->

Swap space (Definition);; Ett område på hårddisken som används som ett *komplement till det fysiska minnet (RAM)*. När det fysiska minnet blir fullt kan operativsystemet flytta (*swappa ut*) mindre använda sidor från RAM till swap space för att frigöra minne. Om en process sedan behöver en sida som har swappats ut, måste den hämtas tillbaka (*swappas in*) till RAM, vilket är en *långsam operation*.
<!--SR:!2025-04-10,1,226-->

Page replacement policies (Definition):: *Algoritmer* som operativsystemet använder för att bestämma *vilken sida i det fysiska minnet som ska bytas ut* när en ny sida behöver laddas in och det inte finns något ledigt minne. Målet är att välja en sida som sannolikt inte kommer att behövas inom kort för att minimera antalet sidfel. Exempel inkluderar FIFO, Random och LRU/LFU.
<!--SR:!2025-05-18,5,226!2025-04-11,3,250-->

FIFO (First-In, First-Out) (Definition):: En *enkel sidersättningspolicy* som byter ut den sida som har funnits i minnet *längst tid*, oavsett hur nyligen den användes.
<!--SR:!2025-05-20,7,286!2025-04-11,3,250-->

LFU (Least Frequently Used) (Definition):: En *sidersättningspolicy* som byter ut den sida som har *använts minst antal gånger*.
<!--SR:!2025-05-07,2,246!2025-05-20,7,286-->

The Clock Algorithm (Definition);; En *sidersättningsalgoritm* som är en *approximation av LRU* och enklare att implementera. Den behandlar sidorna som ordnade i en *cirkulär kö* och använder en *referensbit* för varje sida. När en sida refereras sätts biten till 1. När en sida behöver bytas ut går en "*visare*" runt kön och letar efter en sida med referensbit 0. När en sida med referensbit 1 passeras nollställs biten. Sidan där visaren stannar (med bit 0) byts ut.
<!--SR:!2025-04-12,3,266-->