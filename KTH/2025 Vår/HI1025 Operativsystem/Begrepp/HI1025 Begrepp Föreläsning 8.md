---
tags:
  - begrepp
  - HI1025
  - KTH
  - year2025
---
Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`
Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

---

## Begrepp

Inter-Process Communication (IPC) (Interprocesskommunikation) (Definition):: Mekanismer som tillåter olika processer att utbyta data och synkronisera sina aktiviteter. Detta kan ske mellan processer på samma dator eller över ett nätverk. (Tänk: *Hur processer pratar med varandra och samarbetar*).
Shared Memory (Delat Minne) (IPC-mekanism):: En IPC-teknik där två eller flera processer ges tillgång till samma minnesregion. Processerna kan sedan kommunicera genom att läsa och skriva till detta delade minne. Kräver extern synkronisering (t.ex. lås, semaforer) för att undvika race conditions. (Tänk: *En gemensam skrivtavla för processer*).
Mapped Memory (Minnesmappade Filer) (IPC-mekanism):: En form av delat minne där en fil mappas direkt in i en process adressrymd. Ändringar i minnesregionen kan (beroende på inställningar) reflekteras i filen och vice versa. Detta kan användas för IPC mellan processer som mappar samma fil. (Tänk: *En fil som beter sig som ett delat minne*).
Pipes (Rör) (IPC-mekanism):: En enkel IPC-mekanism i Unix-liknande system som tillhandahåller en enkelriktad kommunikationskanal mellan två relaterade processer (ofta en förälder och ett barn). Data som skrivs till ena änden av röret kan läsas från den andra. (Tänk: *Ett enkelriktat rör för data mellan nära besläktade processer*).
FIFO (Named Pipes / Namngivna Rör) (IPC-mekanism):: Liknar pipes men är inte begränsade till relaterade processer. En FIFO har ett namn i filsystemet och kan användas av orelaterade processer för enkelriktad kommunikation. (Tänk: *Ett publikt, enkelriktat rör för data mellan vilka processer som helst*).
Socket (Sockel) (Nätverks-IPC):: Ett programmeringsgränssnitt (API) som möjliggör kommunikation mellan processer, antingen på samma dator eller över ett nätverk (t.ex. Internet). Socklar är grunden för de flesta nätverksapplikationer. (Tänk: *En nätverksanslutningspunkt för processer*).
TCP vs. UDP (Transportprotokoll) (Jämförelse) (2)
??
Två vanliga transportprotokoll som används med IP-nätverk och socklar:
- **TCP (Transmission Control Protocol):** Tillhandahåller en tillförlitlig, anslutningsorienterad, ordnad och dubbelriktad byteström. Inkluderar felkontroll, flödeskontroll och omsändning av förlorade paket. (Tänk: *Rekommenderat brev med leveransbekräftelse*).
- **UDP (User Datagram Protocol):** Tillhandahåller en otillförlitlig, anslutningslös datagramtjänst. Snabbare och mindre overhead än TCP, men garanterar inte leverans, ordning eller frånvaro av dubletter. (Tänk: *Vykort som skickas på vinst och förlust*).
Portnummer (Nätverkskommunikation):: Ett 16-bitars heltal som används för att identifiera en specifik process eller tjänst som en nätverksanslutning eller ett datagram ska adresseras till på en värddator. Används tillsammans med en IP-adress. (Tänk: *Lägenhetsnumret på en specifik gatuadress (IP-adress)*).
IP-adress (Nätverkskommunikation):: En unik numerisk etikett som tilldelas varje enhet (t.ex. dator, server) som är ansluten till ett datornätverk som använder Internet Protocol (IP) för kommunikation. (Tänk: *Gatuadressen för en dator i nätverket*).
URL (Uniform Resource Locator):: En standardiserad sträng som specificerar var en resurs (t.ex. en webbsida, en fil) finns tillgänglig och mekanismen för att hämta den (t.ex. HTTP, FTP). (Tänk: *Den fullständiga webbadressen till en specifik resurs*).
DNS (Domain Name System):: Ett hierarkiskt och distribuerat namngivningssystem som översätter människovänliga domännamn (t.ex. <www.kth.se>) till numeriska IP-adresser som datorer använder för att identifiera varandra i nätverk. (Tänk: *Internets telefonkatalog som kopplar namn till nummer*).
Socket API: Grundläggande serveranrop (Funktioner) (3)
??
Tre centrala funktionsanrop för att sätta upp en lyssnande server-socket:
1. **`socket()`:** Skapar en ny kommunikationsändpunkt (socket) och returnerar en fildeskriptor för den.
2. **`bind()`:** Associerar en nyskapad socket med en specifik lokal IP-adress och portnummer.
3. **`listen()`:** Förbereder en bunden socket att acceptera inkommande anslutningsförfrågningar från klienter, och anger en kögräns för väntande anslutningar.
(Tänk: *Skapa telefonlinje, koppla till nummer, slå på ringsignalen*).
Socket API: Anslutningshantering (Server/Klient) (Funktioner) (2)
??
Två centrala funktionsanrop för att etablera en anslutning:
- **`accept()` (Server):** Används av en server för att acceptera en inkommande anslutningsförfrågan från en klient på en lyssnande socket. Returnerar en ny socket-fildeskriptor för den etablerade anslutningen. Blockar tills en anslutning tas emot.
- **`connect()` (Klient):** Används av en klient för att initiera en anslutning till en specificerad fjärrserver (IP-adress och portnummer).
(Tänk: *Servern svarar i telefon (`accept`), klienten ringer upp (`connect`)*).
Socket API: Dataöverföring & Stängning (Funktioner) (3)
??
Vanliga funktionsanrop för att skicka/ta emot data och stänga en socket-anslutning:
1. **`read()` / `recv()`:** Läser data från en ansluten socket.
2. **`write()` / `send()`:** Skriver data till en ansluten socket.
3. **`close()`:** Stänger en socket-anslutning och frigör den associerade fildeskriptorn.
(Tänk: *Prata i telefon (`read`/`write`) och lägga på (`close`)*).
Naming (Namngivning i distribuerade system):: Processen att tilldela unika och åtkomliga namn till resurser (t.ex. filer, tjänster, servrar, processer) i ett distribuerat system så att de kan lokaliseras och användas av andra komponenter. (Tänk: *Att ge allt ett unikt och sökbart namn i ett stort system*).
Serialization (Serialisering):: Processen att omvandla en datastruktur eller ett objekt till ett format (t.ex. en byteström, JSON, XML) som kan lagras (t.ex. i en fil eller databas) eller överföras över ett nätverk, för att sedan kunna återskapas (deserialiseras) i sin ursprungliga form. (Tänk: *Packa ner ett objekt i en låda för transport eller lagring*).
Distributed Shared Memory (DSM) (Distribuerat Delat Minne):: En abstraktion som tillåter processer på olika datorer i ett distribuerat system att dela ett gemensamt adressutrymme, som om de körde på samma maskin. Systemet hanterar komplexiteten med att hålla minnet konsistent över nätverket. (Tänk: *En magisk skrivtavla som delas av flera datorer samtidigt*).
Distributed File System (DFS) (Distribuerat Filsystem):: Ett filsystem vars data är utspridd över flera servrar eller lagringsenheter i ett nätverk, men som presenteras för användaren som ett enda, sammanhängande filsystem. Möjliggör delad åtkomst till filer från flera klienter. (Tänk: *Ett globalt filarkiv som ser lokalt ut*).
Remote Invocation (Fjärranrop):: En mekanism som tillåter ett program på en dator att anropa en procedur eller metod som exekverar på en annan dator i ett nätverk, som om det vore ett lokalt anrop. (Tänk: *Att ringa en funktion på en annan dator*).
Statelessness (Tillståndslöshet i distribuerade system):: En egenskap hos en server eller ett protokoll där servern inte lagrar någon information (tillstånd) om tidigare interaktioner med en klient mellan anrop. Varje anrop från klienten måste innehålla all nödvändig information för att servern ska kunna behandla det. Förenklar återhämtning efter serverkrascher. (Tänk: *Servern har inget minne av tidigare samtal, varje nytt samtal är som det första*).
Idempotent Operation (Idempotent Operation):: En operation som kan utföras flera gånger med samma indata utan att resultatet eller systemets tillstånd ändras efter den första lyckade exekveringen. Viktigt i distribuerade system där anrop kan behöva upprepas på grund av nätverksfel. (Tänk: *Att trycka på hissknappen flera gånger har samma effekt som att trycka en gång*).
Update Visibility & Stale Cache (Cacheproblem i DFS) (Problem) (2)
??
Två relaterade problem som uppstår vid användning av cachning i distribuerade filsystem:
- **Update Visibility (Uppdateringssynlighet):** Fördröjningen innan en ändring som görs av en klient blir synlig för andra klienter som accessar samma data.
- **Stale Cache (Inaktuell Cache):** En situation där en klients lokala cache innehåller en gammal, inaktuell version av data som redan har modifierats på servern av en annan klient.
(Tänk: *När ser alla den senaste versionen, och hur undviker man att jobba med gamla kopior?*).
RPC (Remote Procedure Call) (Fjärrproceduranrop):: En specifik teknologi för fjärranrop som låter ett program exekvera en procedur (funktion) i en annan adressrymd (vanligtvis på en annan dator) utan att programmeraren explicit behöver koda detaljerna för fjärrinteraktionen. (Tänk: *En standardiserad metod för att "ringa" funktioner på andra datorer*).
Web Services (Webbtjänster):: En standardiserad metod för att integrera webbaserade applikationer över Internet. Använder ofta HTTP för kommunikation och format som XML eller JSON för datautbyte. Tillåter olika system att interagera med varandra oberoende av plattform eller programmeringsspråk. (Tänk: *Program som pratar med varandra över webben med standardiserade språk*).
