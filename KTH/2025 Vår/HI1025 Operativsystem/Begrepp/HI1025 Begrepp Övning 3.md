# HI1025 Begrepp Övning 3

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`
Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`
Tags: #year2025 #KTH #HI1025 #begrepp #linux

---

## Begrepp

Shell (Skal) (Definition):: Ett textbaserat användargränssnitt (kommandotolk) som används för att interagera med operativsystemet genom att mata in kommandon. (Tänk: *Operativsystemets tolk och dirigent*).

Kernel space vs User space (Definition) (2)
??
Två åtskilda minnesområden i ett operativsystem:
- **Kernel space (Kärnrymd):** Minnesutrymme där operativsystemets kärna (kernel) exekverar och har fullständig åtkomst till hårdvaran och alla systemresurser. Processer kan endast komma åt kärnrymden via systemanrop.
- **User space (Användarrymd):** Minnesutrymme där användarapplikationer exekverar. Processer i användarrymden har begränsad åtkomst till hårdvara och systemresurser för att skydda systemets integritet.
(Tänk: *Kärnans skyddade verkstad vs. användarens öppna kontor*).
bash (Definition):: En vanlig och kraftfull kommandotolk (shell) för Unix-liknande system; akronym för "Bourne Again SHell". (Tänk: *Standardtolken i många Linux-distributioner*).

Konfigurationsfiler (t.ex. .bashrc) (Definition):: Skriptfiler som körs automatiskt när en viss tjänst eller ett program startar för att anpassa dess beteende. `.bashrc` är en specifik skriptfil som `bash`-skalet exekverar vid start av en interaktiv session för att ställa in användarens miljö (alias, variabler, funktioner etc.). (Tänk: *Personliga startinställningar för ditt skal*).

Variabler (Shell, t.ex. $PATH) (Definition):: Namngivna platshållare för data som används av skalet och program. `$PATH` är en central miljovariabel som innehåller en lista över kataloger där skalet letar efter körbara filer. (Tänk: *Skalets minneslappar och programkatalog*).

Alias (Shell) (Definition):: Egendefinierade kortkommandon eller alternativa namn för längre eller ofta använda kommandon i ett shell. Syftar till att förenkla och effektivisera kommandoradsanvändning. (Tänk: *Smeknamn för dina favoritkommandon*).

Script (Shellskript) (Definition):: En textfil innehållande en sekvens av kommandon avsedda att exekveras av ett kommandoskal (t.ex. bash). Används för att automatisera uppgifter och skapa mer komplexa programflöden. (Tänk: *En receptbok med instruktioner för skalet*).

`ls` (Linux-kommando);; Listar innehåll (filer och kataloger) i en angiven katalog, eller den nuvarande katalogen om ingen anges. (Tänk: *Visa kataloginnehåll*).

`cd` (Linux-kommando);; Byter den aktuella arbetskatalogen (Change Directory). (Tänk: *Flytta till en annan mapp*).

`pwd` (Linux-kommando);; Skriver ut den fullständiga sökvägen till den aktuella arbetskatalogen (Print Working Directory). (Tänk: *Var är jag?*).

`mkdir` (Linux-kommando);; Skapar en ny katalog (Make Directory). (Tänk: *Skapa ny mapp*).

`rm` (Linux-kommando);; Tar bort (remove) filer och kataloger. (Tänk: *Radera permanent*).

`man` (Linux-kommando);; Visar manualsidan (hjälpdokumentationen) för ett angivet kommando eller program. (Tänk: *Instruktionsboken*).

`ps` (Linux-kommando);; Visar information om aktiva processer i systemet (Process Status). (Tänk: *Lista processer*).

`top` (Linux-kommando);; Visar en dynamiskt uppdaterad, interaktiv lista över systemets processer, oftast sorterade efter CPU-användning. (Tänk: *Live-monitor för processer*).

`kill` (Linux-kommando);; Skickar en specificerad signal till en process, vanligtvis för att avsluta den (t.ex. med signalen `SIGTERM` eller `SIGKILL`). (Tänk: *Skicka signal, oftast för att stoppa process*).

`grep` (Linux-kommando);; Söker igenom text (från filer eller standard input) och skriver ut rader som matchar ett specificerat mönster (ofta ett reguljärt uttryck). (Tänk: *Hitta textmönster*).

`find` (Linux-kommando);; Söker efter filer och kataloger inom en kataloghierarki baserat på en rad olika kriterier som namn, typ, storlek, ändringsdatum, etc. (Tänk: *Avancerad fil-letare*).

`ssh` (Linux-kommando);; Ansluter säkert till en fjärrdator över ett nätverk (Secure SHell), vilket möjliggör fjärrstyrning och exekvering av kommandon. (Tänk: *Säker fjärrinloggning*).

`scp` (Linux-kommando);; Kopierar filer säkert mellan datorer över ett nätverk (Secure CoPy), använder SSH för dataöverföring och autentisering. (Tänk: *Säker filkopiering över nätverk*).

`sudo` (Linux-kommando);; Tillåter en behörig användare att exekvera ett kommando som en annan användare, oftast som superanvändaren (root), enligt specifikation i `sudoers`-filen. (Tänk: *Kör med administratörsrättigheter*).

Processer (Parent/Child) (Linux):: En process är ett program under exekvering. I Unix-liknande system skapas en ny process (child) av en existerande process (parent) genom systemanropet `fork()`. Child-processen är initialt en kopia av parent-processen men får ett eget unikt process-ID och kan sedan exekvera ett annat program via t.ex. `exec()`. (Tänk: *Process-familjer där föräldrar skapar barn*).

Signaler (Linux):: En form av asynkron interprocesskommunikation i Unix-liknande system. Signaler används för att meddela en process att en viss händelse har inträffat, t.ex. ett avbrott från användaren (`SIGINT`), ett försök att avsluta processen (`SIGTERM`), eller ett allvarligt fel. (Tänk: *Korta meddelanden eller programvaruavbrott till processer*).

Pipe (`|`) (Shell-mekanism):: En funktion i kommandoskal som kopplar standard utdata (stdout) från ett kommando till standard indata (stdin) för ett annat kommando, vilket möjliggör att flera kommandon kan seriekopplas. (Tänk: *Ett rör som leder dataflödet mellan kommandon*).

Omdirigering (`>`, `>>`, `<`) (Shell-mekanism):: En funktion i kommandoskal för att ändra standard in-, ut- eller feldataflöden för ett kommando. `>` omdirigerar utdata till en fil (skriver över), `>>` omdirigerar utdata och lägger till i slutet av en fil, `<` omdirigerar indata från en fil. (Tänk: *Styra om var kommandon hämtar/lämnar sin data*).

Användare, Grupper & Rättigheter (Linux) (Definition) (3)
??
Tre centrala koncept för åtkomstkontroll i Linux:
- **Användare:** Individer eller konton som kan logga in och interagera med systemet. Varje fil och process ägs av en användare.
- **Grupper:** Samlingar av användare. Används för att ge flera användare samma åtkomsträttigheter till filer och kataloger.
- **Rättigheter:** Behörigheter (läsa, skriva, exekvera) som definierar vad en användare (ägare), medlemmar i en grupp, och övriga (others) får göra med en fil eller katalog.
(Tänk: *Vem är du, vilken klubb tillhör du, och vad får du göra?*).

Filhantering (Montering) (Linux):: Processen att ansluta ett filsystem (ofta från en lagringsenhet som en hårddiskpartition eller USB-minne) till en specifik katalog (monteringspunkt) i det existerande katalogträdet, vilket gör filsystemets innehåll tillgängligt. (Tänk: *Att haka på en ny lagringsvolym i filsystemet*).

Daemon (Linux):: Ett program som körs kontinuerligt i bakgrunden, utan direkt interaktion med en användare, för att utföra systemuppgifter eller tillhandahålla tjänster (t.ex. webbserver, databasserver). (Tänk: *Systemets tysta arbetare som kör i bakgrunden*).

Service (Linux):: En applikation eller process, ofta en daemon, som hanteras av systemets init-system (t.ex. systemd). Services kan startas, stoppas, och hanteras på ett standardiserat sätt och tillhandahåller specifik funktionalitet. (Tänk: *En väldefinierad systemtjänst, ofta en daemon under kontroll*).

Pakethantering (t.ex. apt-get) (Linux):: Ett system som automatiserar processen att installera, uppgradera, konfigurera och ta bort mjukvarupaket. `apt-get` är ett kommandoradsverktyg för APT (Advanced Package Tool), vanligt i Debian-baserade distributioner. (Tänk: *Systemets centrala programinstallatör och -underhållare*).

Valgrind (Verktyg):: Ett instrumenteringsramverk för dynamisk analys av program, särskilt användbart för att upptäcka minneshanteringsfel (t.ex. minnesläckor, ogiltig minnesåtkomst) och för profilering av programprestanda. (Tänk: *Minnesfelsökaren och prestandaprofilerararen*).

GDB (GNU Debugger) (Verktyg):: En kraftfull, portabel debugger som fungerar för många programmeringsspråk. Används för att köra program under kontrollerade former, sätta brytpunkter, inspektera variabler och minne, samt stega igenom kod. (Tänk: *Programmerarens schweiziska armékniv för felsökning*).

Make & Makefile (Definition) (2)
??
Två relaterade komponenter för byggautomatisering:
- **Make:** Ett verktyg som automatiskt bygger körbara program och bibliotek från källkod genom att tolka beroenden och kommandon specificerade i en `Makefile`.
- **Makefile:** En textfil som definierar en uppsättning uppgifter (targets), deras beroenden av andra filer, och de kommandon som krävs för att skapa eller uppdatera dessa uppgifter.
(Tänk: *Bygginstruktioner (Makefile) och byggarbetaren (make)*).

Versionshantering (Git) (Definition):: System och praxis för att spåra och hantera ändringar i filer, oftast källkod, över tid. Git är ett populärt, distribuerat versionshanteringssystem som möjliggör samarbete, grenhantering och spårbarhet av ändringar. (Tänk: *En avancerad dagbok och samarbetsplattform för projektfiler*).
