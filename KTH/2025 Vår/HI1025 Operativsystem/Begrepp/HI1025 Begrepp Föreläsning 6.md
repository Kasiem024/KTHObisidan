---
tags: [begrepp, HI1025, KTH, year2025, programmering]
created: 2025-05-19
updated: 2026-08-17
description: "Condition Variables (Villkorsvariabler): Synkroniseringsprimitiver som tillåter trådar att vänta (blockera) tills ett visst villkor blir uppfyllt."
---
# HI1025 Begrepp Föreläsning 6

## Begrepp

Condition Variables (Villkorsvariabler) (Definition):: Synkroniseringsprimitiver som tillåter trådar att vänta (blockera) tills ett visst villkor blir uppfyllt. Används alltid tillsammans med ett mutexlås för att undvika race conditions när villkoret kontrolleras och tråden blockeras. (Tänk: *Ett väntrum där trådar sover tills något specifikt händer*).

Wait & Signal (för Villkorsvariabler) (Operationer) (2)
??
Två huvudsakliga operationer på villkorsvariabler, alltid använda med ett associerat mutexlås:
- **`wait(cond_t *c, mutex_t *m)`:** Atomärt släpper låset `m` och försätter den anropande tråden i sovande tillstånd på villkorsvariabeln `c`. När tråden väcks (av `signal` eller `broadcast`), återtar den automatiskt låset `m` innan `wait` returnerar.
- **`signal(cond_t *c)` (eller `notify`):** Väcker *en* av trådarna som för närvarande väntar på villkorsvariabeln `c`. Om inga trådar väntar har anropet ingen effekt. Den väckta tråden kommer att försöka återta det associerade mutexlåset.
(Tänk: *`wait` är "gå och lägg dig tills X är sant", `signal` är "väck en som väntar på X"*).

Spurious Wakeups (Falska Uppvaknanden) (Definition):: En situation där en tråd som väntar på en villkorsvariabel kan vakna upp från `wait()`-anropet utan att ha blivit explicit signalerad av en annan tråd via `signal()` eller `broadcast()`. På grund av detta måste villkoret alltid kontrolleras på nytt i en loop efter att `wait()` returnerat. (Tänk: *Att vakna av sig själv utan att alarmet ringt, man måste kolla klockan igen*).

Bounded Buffer (Begränsad Buffert / Producent-Konsumentproblemet) (Definition):: Ett klassiskt synkroniseringsproblem där en eller flera producenttrådar genererar data och placerar den i en buffert med fast storlek, samtidigt som en eller flera konsumenttrådar hämtar data från bufferten. Kräver synkronisering för att hantera full/tom buffert och säkerställa korrekt åtkomst till den delade bufferten. (Tänk: *Ett löpande band med begränsat antal platser mellan två arbetsstationer*).

Semaphores (Semaforer) (Definition):: En generell synkroniseringsprimitiv som upprätthåller en intern räknare och stöder två huvudsakliga atomära operationer: `wait()` (eller `P()`, `sem_wait()`) och `post()` (eller `V()`, `sem_post()`). `wait()` minskar räknaren och blockerar om räknaren är negativ (eller noll, beroende på implementation). `post()` ökar räknaren och väcker en väntande tråd om några finns. Kan användas för både mutex-liknande lås (binär semafor) och för att hantera tillgång till ett begränsat antal resurser (räknande semafor). (Tänk: *En generaliserad låsmekanism eller resurshanterare*).

Reader-Writer Locks (Läsare-Skrivare-Lås) (Definition):: En typ av lås som tillåter flera samtidiga läsare av en datastruktur, men endast en skrivare åt gången. Om en skrivare har låset, blockeras alla andra läsare och skrivare. Om en eller flera läsare har låset, blockeras skrivare men andra läsare kan tillåtas. Syftar till att öka parallellitet när läsoperationer är vanligare än skrivoperationer. (Tänk: *Många kan läsa en bok samtidigt, men bara en kan skriva i den utan att störa andra*).

Deadlock (Systemlåsning) (Definition):: En situation där två eller flera processer/trådar är blockerade och väntar på varandra i en cirkulär kedja, så att ingen av dem kan fortsätta. Varje process väntar på en resurs som hålls av en annan process i kedjan. (Tänk: *Två personer som möts i en smal korridor och vägrar backa*).

Deadlock: Fyra Nödvändiga Villkor (Definition) (4)
??
För att ett deadlock ska kunna inträffa måste samtliga fyra följande villkor vara uppfyllda samtidigt:
1. **Mutual Exclusion (Ömsesidig Uteslutning):** Resurser kan endast användas av en process/tråd åt gången (d.v.s. de är inte delbara på ett sätt som undviker konflikt).
2. **Hold and Wait (Hålla och Vänta):** En process/tråd håller minst en resurs och väntar på att förvärva ytterligare resurser som hålls av andra processer/trådar.
3. **No Preemption (Ingen Förtursrätt/Avbrytbarhet):** En resurs kan inte med våld tas ifrån en process/tråd som håller den; den måste släppas frivilligt.
4. **Circular Wait (Cirkulär Väntan):** Det finns en uppsättning väntande processer/trådar ${P_0, P_1, ..., P_n}$ där $P_0$ väntar på en resurs som hålls av $P_1$, $P_1$ väntar på en resurs som hålls av $P_2$, ..., $P_n$ väntar på en resurs som hålls av $P_0$.

(Tänk: *Receptet för en garanterad systemlåsning*).
Deadlock: Hanteringsstrategier (Definition) (4)
??
Fyra huvudsakliga strategier för att hantera deadlocks:

1. **Prevention (Förebyggande):** Designa systemet så att minst ett av de fyra nödvändiga villkoren för deadlock aldrig kan uppfyllas. Kan leda till sämre resursutnyttjande.
2. **Avoidance (Undvikande):** Använda information om framtida resursbehov för att dynamiskt fatta beslut som säkerställer att systemet aldrig hamnar i ett deadlock-tillstånd. Kräver förkunskap (t.ex. Banker's algorithm).
3. **Detection and Recovery (Upptäckt och Återhämtning):** Tillåta att deadlocks inträffar, upptäcka dem (t.ex. genom att analysera resursallokeringsgrafen) och sedan vidta åtgärder för att lösa upp dem (t.ex. avsluta processer, ta tillbaka resurser).
4. **Ignorance (Ignorans / "Ostrich Algorithm"):** Anta att deadlocks är så sällsynta att kostnaden för att hantera dem är högre än kostnaden för att de ibland inträffar. Systemet startas då oftast om manuellt. Vanligt i många generella operativsystem.
(Tänk: *Planera bort, navigera runt, lösa upp efteråt, eller stoppa huvudet i sanden*).
