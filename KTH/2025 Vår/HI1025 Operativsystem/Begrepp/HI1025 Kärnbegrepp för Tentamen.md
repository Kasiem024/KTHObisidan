---
tags: [begrepp, HI1025, KTH, programmering, tenta, year2025]
---
# HI1025 Kärnbegrepp för Tentamen

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`
Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

---

## Del 1: Virtualisering – Processorn (Mekanismer & Policyer)

Process(Definition)::Ett program under exekvering, med egen adressrymd, programräknare och allokerade systemresurser. Det är den grundläggande enheten för resurstilldelning och schemaläggning.

CPU-skyddslägen(Definition)(2)
??
- **Kernel Mode (Kärnläge):** Ger OS-kärnan full åtkomst till hårdvara och privilegierade instruktioner för systemkritiska operationer.
- **User Mode (Användarläge):** Begränsar applikationers åtkomst för systemskydd. Växling sker via systemanrop/avbrott.
<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->

Systemanrop(Definition)::Det kontrollerade gränssnittet och mekanismen genom vilket ett program i user mode begär en tjänst från operativsystemkärnan, vilket orsakar en `trap` till kernel mode.

ContextSwitch(Definition)::Operativsystemets mekanism för att byta den process som körs på CPU:n. Innebär att **spara tillståndet** (CPU-register, programräknare etc.) för den utgående processen och **ladda tillståndet** för den inkommande processen.
<!--SR:!2025-05-27,3,270!2000-01-01,1,250-->

ProcessControlBlock(PCB)(Definition)::En datastruktur i OS-kärnan som lagrar all information om en specifik process, t.ex. process-ID, tillstånd (ready, running, blocked), CPU-register, programräknare, minnespekare, och schemaläggningsinformation.
<!--SR:!2025-05-29,3,278!2000-01-01,1,250-->

Scheduler(Definition)::Den del av operativsystemet som väljer vilken process från `ready`-kön som ska tilldelas CPU:n härnäst, baserat på en schemaläggningspolicy.
<!--SR:!2025-06-03,7,299!2025-05-27,3,270-->

Timer-avbrott(Definition)::Ett periodiskt hårdvaruavbrott som tvingar CPU:n att avbryta den körande processen och ge kontrollen tillbaka till operativsystemet. Kritiskt för preemptiv schemaläggning.
<!--SR:!2025-05-27,3,270!2000-01-01,1,250-->

IdleProcess(Definition)::En speciell lågprioriterad process som schemaläggaren kör när inga andra användar- eller systemprocesser är redo att exekvera. Kan sätta CPU:n i lågenergiläge.

Schemaläggningspolicyer(Definition)(4)
??
- **FCFS (First-Come, First-Served):** Icke-preemptiv; processer körs i ankomstordning. Kan orsaka konvoj-effekt.
- **SJF (Shortest Job First):** Oftast icke-preemptiv; väljer processen med kortast total exekveringstid. Optimal för genomsnittlig väntetid om alla tider är kända.
- **STCF (Shortest Time-to-Completion First) / PSJF:** Preemptiv SJF; om ett nytt jobb med kortare återstående tid anländer, byts den körande processen ut.
- **Round Robin (RR):** Preemptiv; varje process får köra en kort tidslucka (kvantum). Rättvis men kan ha hög overhead.
<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->

TurnaroundTime(Definition)::Total tid en process tillbringar i systemet, från ankomst till slutförande. Beräknas som $T_{completion} - T_{arrival}$.

ResponseTime(Definition)::Tiden från att en process anländer (eller begäran görs) tills den *första gången* får CPU-tid och börjar exekvera. Beräknas som $T_{first\_run} - T_{arrival}$.
<!--SR:!2000-01-01,1,250!2025-05-30,3,279-->

## Del 2: Virtualisering – Minnet

VirtuellAdress(Definition)::Adress som används av en process inom dess egen isolerade adressrymd, oberoende av fysiskt minne.
<!--SR:!2025-05-27,3,270!2000-01-01,1,250-->

FysiskAdress(Definition)::Faktisk adress i datorns RAM-minne som MMU:n översätter virtuella adresser till.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

C-programsMinneslayout(Definition)(4)
??
- **Text (Kod):** Innehåller de kompilerade maskininstruktionerna. Skrivskyddad.
- **Data:** Innehåller globala och statiska variabler (initierade och oinitierade/BSS).
- **Stack:** Används för lokala variabler, funktionsparametrar, returadresser. Växer och krymper dynamiskt (LIFO).
- **Heap:** Används för dynamiskt allokerat minne (via `malloc`/`free`).
<!--SR:!2025-05-27,3,250!2025-05-27,3,270-->

StackFrame(Aktiveringspost)(Definition)::Ett minnesområde på stacken som skapas vid varje funktionsanrop. Innehåller funktionens argument, returadress, och utrymme för dess lokala variabler. Möjliggör rekursion.
<!--SR:!2025-05-27,3,270!2000-01-01,1,250-->

MemoryManagementUnit(MMU)(Definition)::Hårdvaruenhet som översätter virtuella adresser till fysiska adresser och upprätthåller minnesskydd.
<!--SR:!2025-05-27,3,270!2000-01-01,1,250-->

Adressöversättning(Paging)(Definition)::Processen där en virtuell adress (uppdelad i **VPN** och **Offset**) översätts av MMU:n. VPN används för att hitta motsvarande **PFN** i processens **sidtabell**. PFN kombineras med offseten för att bilda den fysiska adressen.
<!--SR:!2025-05-25,1,230!2000-01-01,1,250-->

PageTable(Sidtabell)(Definition)::En datastruktur per process som lagrar mappningen mellan dess virtuella sidnummer (VPN) och fysiska ramnummer (PFN). Varje **Page Table Entry (PTE)** innehåller PFN samt kontrollbitar (`present`, `protection`, etc.).
<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->

TranslationLookasideBuffer(TLB)(Definition)::En snabb hårdvarucache i MMU:n som lagrar nyligen använda VPN $\rightarrow$ PFN-mappningar för att påskynda adressöversättningen.

PageFault(Sidfel)(Definition)::Ett undantag (trap) från MMU:n när en process försöker komma åt en virtuell sida vars `present`-bit i sidtabellen är 0 (sidan är inte i RAM). OS:et måste då ladda in sidan från disken.

Page Replacement Algorithms (Sidersättningsalgoritmer) (Definition) (3)
||
När RAM är fullt och ett sidfel kräver att en ny sida laddas in, måste en befintlig sida bytas ut. Vanliga algoritmer:
1. **FIFO (First-In, First-Out):** Byter ut den äldsta sidan i minnet.
2. **LRU (Least Recently Used):** Byter ut den sida som inte använts på längst tid.
3. **Clock Algorithm (Klockalgoritmen):** En effektivare approximation av LRU som använder en referensbit.

HierarkiskSidtabell(Multi-levelPageTable)(Definition)::En sidtabellstruktur i flera nivåer (t.ex. page directory som pekar på page tables) för att reducera minnesåtgången för sidtabeller i system med stora, glesa virtuella adressrymder. Endast de delar av sidtabellen som behövs allokeras.

Fragmentering(Definition)(2)
??
- **Intern Fragmentering:** Minnesspill *inuti* ett allokerat block, när blocket är större än den data det innehåller.
- **Extern Fragmentering:** Ledigt minne är uppdelat i många små, icke-sammanhängande block, vilket förhindrar allokering av större sammanhängande block trots att tillräckligt totalt minne finns.

## Del 3: Samtidighet (Concurrency)

ProcessVsThread(Definition)::**Process:** Ett program under exekvering med egen adressrymd. **Thread (Tråd):** En exekveringsenhet *inom* en process; delar processens adressrymd men har egen stack och register.

RaceCondition(Definition)::Ett feltillstånd där resultatet av samtidiga operationer på delad data beror på den oförutsägbara relativa exekveringsordningen mellan trådar/processer.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

CriticalSection(Definition)::Det kodsegment där en delad resurs accessas och som måste skyddas (t.ex. med lås) för att förhindra race conditions genom att säkerställa mutual exclusion.

MutualExclusion(Mutex)(Definition)::En egenskap och mekanism som säkerställer att endast en tråd/process åt gången kan exekvera en kritisk sektion. Grunden för att skydda delade data.

Lock(Lås)(Definition)::En synkroniseringsprimitiv som används för att uppnå mutual exclusion. En tråd "förvärvar" (`lock()`) låset innan den går in i en kritisk sektion och "frigör" (`unlock()`) det efteråt.

ConditionVariable(Villkorsvariabel)(Definition)::Synkroniseringsmekanism som låter trådar vänta (sova) på att ett specifikt programmerardefinierat villkor blir sant. Används alltid tillsammans med ett mutexlås. Operationer: `wait()`, `signal()`, `broadcast()`.

Semaphore(Semafor)(Definition)::En generell synkroniseringsvariabel (ett heltal) som stöder två atomära operationer: `wait()` (P) som minskar värdet (blockerar om $\le0$) och `post()` (V) som ökar värdet (kan väcka blockerad tråd). Används för mutual exclusion (binär) eller resurshantering (räknande).

Deadlock(Systemlåsning)(Definition)::Ett tillstånd där en uppsättning processer/trådar är permanent blockerade eftersom varje process/tråd i uppsättningen håller en resurs och väntar på en resurs som hålls av en annan process/tråd i samma uppsättning, resulterande i en cirkulär väntan.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

DeadlockFyraNödvändigaVillkor(Definition)(4)
??
1. **Mutual Exclusion:** Resurser är icke-delbara.
2. **Hold and Wait:** En tråd håller resurser medan den väntar på andra.
3. **No Preemption:** Resurser kan inte tvångsfritas.
4. **Circular Wait:** En cirkulär kedja av trådar där varje väntar på nästa.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

`fork()`(Systemanrop)(Definition)::Ett systemanrop i Unix-liknande system som skapar en ny process (barnprocess) som är en nästan exakt kopia av den anropande processen (förälderprocessen). Returnerar 0 i barnet och barnets PID i föräldern.
<!--SR:!2025-05-27,3,250!2025-05-27,3,270-->

## Del 4: Beständighet (Persistence)

FileSystem(Definition)::Operativsystemets mekanism för att organisera, lagra, namnge och hämta filer och kataloger på beständiga lagringsmedia.

iNode(IndexNode)(Definition)::En datastruktur i Unix-liknande filsystem som lagrar metadata om en fil/katalog (ägare, rättigheter, storlek, tidsstämplar) och pekare till dess datablock. Filnamnet lagras i katalogen.
<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->

Directory(Katalog)(Definition)::En speciell fil vars innehåll är en lista av par: <filnamn, iNode-nummer>, vilket möjliggör en hierarkisk filstruktur. Innehåller `.` (denna katalog) och `..` (föräldrakatalogen).

Superblock(Definition)::Ett block i början av ett filsystem som innehåller kritisk information om själva filsystemet: dess typ, storlek, antal block, och var andra viktiga strukturer finns.
<!--SR:!2000-01-01,1,250!2025-05-31,7,250-->

DataBlock(Definition)::Den minsta enheten av diskutrymme som allokeras till filers innehåll (t.ex. 4KB).
<!--SR:!2025-05-29,3,258!2000-01-01,1,250-->

Allokeringsbitmap(Definition)::En datastruktur (ofta en bitvektor) som filsystemet använder för att hålla reda på vilka datablock och/eller iNoder som är lediga respektive upptagna.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

SeekTimeOchRotationalDelay(HDD)(Definition)(2)
??
Två huvudsakliga mekaniska fördröjningar vid hårddiskaccess:
1. **Seek Time (Söktid):** Tiden för läs/skrivhuvudet att flytta sig till rätt spår.
2. **Rotational Delay (Rotationsfördröjning):** Väntetiden för rätt sektor att rotera fram under huvudet.
DirectMemoryAccess(DMA)(Definition)::En hårdvaruteknik som tillåter I/O-enheter att överföra data direkt till/från huvudminnet utan kontinuerlig CPU-inblandning, vilket frigör CPU:n och ökar I/O-prestandan.

CrashConsistency(Definition)::Filsystemets förmåga att bibehålla ett giltigt och användbart tillstånd även om systemet kraschar mitt under pågående skrivoperationer.
<!--SR:!2025-05-27,3,250!2000-01-01,1,250-->

Journaling(Write-AheadLogging)(Definition)::En teknik för kraschkonsistens där ändringar som ska göras i filsystemet först skrivs till en loggfil (journalen). Vid återhämtning efter krasch används journalen för att snabbt återställa filsystemet till ett konsekvent tillstånd.

Pipe(`|`)(ShellMekanism)::En mekanism i kommandoskal som kopplar standard utdata (stdout) från ett kommando till standard indata (stdin) för ett annat kommando.
<!--SR:!2000-01-01,1,250!2025-05-27,3,270-->

SocketAPI(Definition)::Ett programmeringsgränssnitt för nätverkskommunikation. Involverar att skapa en **socket**, **binda** till IP/port (server), **lyssna** (server), **ansluta** (klient), **acceptera** (server), samt **skicka/ta emot** data. **TCP** ger tillförlitlig anslutning.

IP-adress Och Portnummer (Definition)(2)
??
För nätverkskommunikation:
1. **IP-adress:** Identifierar en unik värddator på nätverket.
2. **Portnummer:** Identifierar en specifik applikation eller tjänst på värddatorn.
<!--SR:!2000-01-01,1,250!2025-05-29,3,278-->
