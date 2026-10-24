# Plan: byt taggkonventionen från inline till YAML-listform

Datum: 2026-10-22. Reviderad 2026-10-24 efter två adversariella granskningar. Premisslinsen
(`premise-reviewer`) gav GO WITH CHANGES och konformanslinsen (`kiro_default`, endast läsning)
gav CHANGES REQUIRED. Fynden och vad som gjordes med dem står i avsnittet *Granskningen*.

**Status 2026-10-24: genomförd.** Kasiem bad agenten köra den, och den kördes 13:49 med
`-ExcludePath CM1000,SF1686`: 536 konverterade, 0 överhoppade, 0 misslyckade. SR-jämförelsen ren,
auditen ren, lint 550/0, deck-hygien ren. Backup i
`%USERPROFILE%\KTHObsidian-backups\tags-to-list-2026-10-24-135010\`.
**Rättelse mot vad som står nedan:** auditen blev *helt* ren, inte `inlineStyleTags 1`, eftersom auditens
scope utesluter alla `_index.md`. CM1000:s `_index.md` är alltså kvar i inline-form men syns inte i
auditen. Detaljerna och ett tillbud med backupen står i F105 och i `lessons-learned.md`.

## Beslutet och skälet

Kasiem valde alternativ 3. Obsidians egenskapspanel skriver om `tags:` till listform när en nots taggar
redigeras i appen. Vaultets standard är inline-form (`tags: [a, b]`), så varje redigering i appen ger en
`listStyleTags`-avvikelse. Det har hänt sex gånger. Vi vänder därför standarden till den form som appen
själv skriver, så att problemet försvinner vid källan i stället för att lagas i efterhand.

Den form Obsidian skriver, uppmätt i en fil som appen nyss har skrivit om:

```text
tags:
  - tenta
  - HI1031
```

Det är två mellanslag, ett bindestreck, ett mellanslag och sedan värdet, en tagg per rad. `tags:` står
ensamt på sin rad.

## Nuläget, uppmätt 2026-10-22

Mätningen gäller 670 .md-filer utanför `.obsidian`, `.trash`, `.git` och `.kiro`:

| Form | Antal filer |
| --- | --- |
| Inline | 558 |
| Lista | 13 |
| Frontmatter utan `tags:` | 73 |
| Ingen frontmatter | 26 |

- Ingen inline-array sträcker sig över flera rader.
- Inget inline-värde är citerat, har en kommentar eller är en tom lista.
- Under `KTH/` har ingen fil BOM eller CRLF. `Meta/Vault Findings & Backlog.md` är däremot CRLF.
- Torrkörningen mäter om allt detta innan något skrivs.

## Leverans

### 1. Nytt skript: `Meta/Obsidian Plugins/Scripts/Convert-TagsToList.ps1` (inline → lista)

**Källkod och sökvägar**
- Källkoden är ren ASCII (T1).
- Filerna hittas med `Get-ChildItem`. Inga svenska sökvägar hårdkodas och git används inte (T2).
- Skriptet hittar själv vaultets rot, och `-Root` gör att det kan köras mot en kopia.

**Scope**
- Scope är auditens `InScope`, kopierad ordagrant, plus alla `_index.md`.
- Noter vars frontmatter innehåller `excalidraw` hoppas över, precis som i auditen.
- Utanför scope och aldrig rörda: `Filer/`, `.obsidian/`, `.kiro/`, `.trash/` och `Templates/`. Mallarna
  ändras för hand, se punkt 6.
- **`-ExcludePath <delsträngar>`** hoppar dessutom över varje sökväg som innehåller någon av strängarna
  (skiftlägesokänsligt). Tom som standard. Den finns för att lämna en mapp som en annan agent redigerar
  helt ifred: 2026-10-24 konverterade en parallell agent CM1000:s PDF:er, så den körningen använder
  `-ExcludePath CM1000,SF1686` och rör då inte CM1000:s nya `_index.md` (som annars är den enda filen
  som överlappar). Se *Samtidig agent* nedan.

**Vad som ändras**
- Bara `tags:`-raden i den första frontmattern ändras.
- Frontmattern hittas rad för rad. Öppningen är rad 1 med exakt `---`. Stängningen är den första
  senare raden som börjar med `---`, som i auditen. Ingen `(?s)`-regex används (T13).

**Hoppas över och rapporteras, inget skrivs**
- Värden som inte består av bokstäver, siffror, `_`, `/` och `-`, eller som inte börjar med en bokstav
  eller siffra. Det täcker citattecken, mellanslag, `:`, `#`, `[`, `]` och `,` i värdet.
- `tags: []`, ett tomt element och text efter `]`.
- Mer än en `tags`/`tag`-nyckel, eller en avvikande stavning av nyckeln.
- Blandade radslut eller ett ensamt CR.
- En fil som inte går att avkoda till UTF-8 och tillbaka byte för byte.

**Torrkörning (standard)**
- Listar varje fil som skulle ändras, varje överhoppad fil med skäl, och en summa: att ändra, redan
  lista, utan taggar, överhoppade.

**`-Apply`**
- Säkerhetskopierar varje fil innan den skrivs. Kopian ligger i en **varaktig** mapp utanför både
  `%TEMP%` och Drive: `%USERPROFILE%\KTHObsidian-backups\tags-to-list-<tid>\`, med de relativa
  sökvägarna bevarade.
- `-BackupDir` styr om mappen. Testerna använder det och lägger då backupen i `%TEMP%`.
- När körningen är klar skrivs backupens sökväg ut, tillsammans med en färdig återställningsrad.

**Kontroll före skrivning, i minnet**
- Den nya filen tolkas med en separat listläsare. Taggarna ska vara identiska med de gamla, element för
  element och ordinalt.
- Alla bytes före `tags:`-raden och efter det nya blocket ska vara identiska med originalets.
- BOM ligger i de oförändrade bytesen och bevaras därmed (T9).
- Det nya blocket använder samma radslut som raden det ersätter (T12).

**Kontroll efter skrivning**
- Filen läses tillbaka från disk och ska vara byte för byte det som avsågs.
- Annars skrivs originalets bytes tillbaka direkt och filen rapporteras som FAILED.

**Omkörning och exit**
- Skriptet är idempotent: en fil som redan är i listform är "redan lista" och ändras inte.
- Exit 0 betyder att inget behöver ändras och inget hoppades över. Exit 1 betyder att något hittades,
  ändrades eller hoppades över. Sammanfattningsraden säger vilket.

### 2. Det gamla `Format-FrontmatterTags.ps1` (lista → inline) lämnas orört

Det är Kasiems instruktion. Varje hänvisning till det som "reparationen" tas bort ur `scripts.md` och
`current-state.md`, och dess tabellrad märks: *ersatt: konverterar tillbaka till inline, kör det inte*.

Kvarvarande risk: om någon ändå kör det med `-Apply` flaggar den vända auditen genast varje fil som
`inlineStyleTags`. Felet syns alltså direkt, och `Convert-TagsToList` återställer det. Om skriptet i
stället ska vägra köra är det Kasiems beslut, eftersom det betyder att det gamla skriptet ändras.

### 3. `Vault-Audit.ps1` vänds

**Buckets**
- Den nya bucketen `inlineStyleTags` ersätter `listStyleTags`.
- Inline-taggar läses fortfarande, så att vokabulärkontrollerna fungerar på filer som inte är
  konverterade än.

**Listtolkningen rättas.** Den bär nu hela vaultet.
- I dag är regexen `(?ms)...\S.*`. `.*` går över radslut, så varje senare `- x`-rad i frontmattern
  räknas som en tagg. Det gäller till exempel `aliases` i listform, som Obsidians panel också skriver.
- Den nya läsaren tar raderna efter `tags:` och slutar vid första raden som inte är ett listelement.
- Den tar bort citattecken på samma sätt som inline-grenen gör.

### 4. `Test-VaultAudit.ps1`

- **Varje** inline-`tags:` i harnessen skrivs i listform:
  - `$goodTags` och `_index`-fixturen
  - backlog- och README-fixturerna (`tags: [meta]` på rad cirka 101, 111, 164 och 175)
  - alla planterade Bad-filer
- `c-listtags.md` ersätts av `c-inlinetags.md`, som är i inline-form.
- I `$expect` byts `listStyleTags` mot `inlineStyleTags`.
- Den rena fixturen får en negativ kontroll: en not där `tags:` följs av `aliases:` i listform, och
  alias-värdet får inte läcka in som tagg.
- Alla assertions ska passera.

### 5. `Get-NoteStructureCensus.ps1`

Den lär sig läsa listform med samma radläsare som auditen. Dess `notesInScope` ska vara lika med
auditens.

### 6. Mallarna

- **Fem mallar** skrev `tags: [<% taggar.join(", ") %>]`: Begrepp, Föreläsning, Default,
  Seminarium och Kurs Index. Nu skriver de `tags:` på en egen rad, följt av ett uttryck som först delar
  varje element vid kommatecken och sedan skriver en rad `  - värde` per tagg.
  - Ett ämne som skrivs in vid frågan, till exempel "nätverk, programmering", blir alltså två taggar,
    precis som i inline-formen. Utan delningen hade det blivit en enda trasig tagg.
  - `taggar` kan inte bli tom, eftersom `"KTH"` alltid finns med och `.filter(Boolean)` används.
- **Två mallar** har bokstavlig inline-form: CM1008 Meeting och Annotator. De skrivs om till listrader.
  Uttrycket `year<% tp.date.now("YYYY") %>` blir kvar i sitt listelement.
- **Verifiering:**
  - Uttrycket körs i node med ett exempel på `taggar`, och resultatet tolkas med js-yaml.
  - De bokstavliga mallarna tolkas med ett exempelvärde.
  - Efter sin körning skapar Kasiem **en** not med Begrepp-mallen och kör auditen. Det räcker, eftersom
    uttrycket är identiskt i alla fem. Sedan raderar han noten.

### 7. Dokumentation, i samma ändring

**`Meta/Vault Standard.md`**
- §3: regeln, exemplet och skälet, som är att Obsidians egenskapspanel skriver den här formen.
- §3 ska också säga att **formen bara kontrolleras av auditen.** Dataview gör om båda formerna till
  samma array och kan inte se skillnad, så det går inte att skriva en fråga för `Atlas/Vault Health
  Report.md`. add-a-convention steg 4 kräver att detta står i standarden.
- Rad cirka 364: `_index`-frontmattern skrivs i listform.

**`.kiro/steering/scripts.md`**
- En ny tabellrad med exit-koder.
- Under "Which one to reach for" ersätts `listStyleTags → Format-FrontmatterTags` med
  `inlineStyleTags → Convert-TagsToList`.
- Den gamla raden märks som ersatt.
- "two writing scripts" blir "three", på raderna cirka 36 och 92.

**`README.md`**
- "två som skriver" blir "tre", och F-intervallet höjs.
- De inaktuella siffrorna "33 stycken" och "46 assertions" ersätts med uppmätta värden.

**`llms.txt`, rad 108:** exemplet skrivs i listform.

**Backloggen**
- Raden "Frontmatter tag style | 100 % inline array" i *Already verified uniform* (rad cirka 181) är
  ett levande påstående och skrivs om.
- En ny post, **F105**. F103 och F104 är redan tagna, så läs det högsta numret i filen precis innan.
- Intervallet höjs i backloggens frontmatter, i `README.md` och i `product.md`.

**`current-state.md`**
- Auditen är röd med `inlineStyleTags` tills Kasiem har kört konverteringen, och det är väntat.
- Kör aldrig `-Apply` åt honom, och "laga" aldrig med det gamla skriptet.

**Ändras inte**
- `.kiro/`-filer med inline-taggar, eftersom de ligger utanför auditen.
- Historiska backloggposter och arkiv.
- SR-skriptens självtestfixturer. `Test-NosrNote` bryr sig inte om formen, och SR-jämförelsen på
  kopian visar att `nosr` hittas i listform.

## Risker och vakter

| Risk | Vakt |
| --- | --- |
| En tagg tappas eller byter plats, särskilt `nosr` (F64) | Kontrollen i minnet före skrivning, kontrollen efter läsning från disk, och SR-jämförelsen av `nosrNotes` på kopian och i hans körning. |
| Något annat än `tags:`-raden ändras | Byte-jämförelse av prefix och suffix i minnet, och byte-läsning efter skrivning. På kopian gör js-yaml en djupjämförelse av **hela** frontmattern före och efter, alltså det Obsidian och Quartz ser. |
| BOM tas bort (T9) | Detekteras från bytes. Den ligger i det oförändrade prefixet. |
| CRLF blir LF (T12) | Det nya blocket använder radens eget radslut. En CRLF-fixtur ingår i testet. Blandade radslut hoppas över. |
| Ett `---` i brödtexten tas för frontmattern (T13) | Frontmattern läses rad för rad och bara den första tolkas. En fixtur har `---` i brödtexten. |
| Svensk text eller svenska sökvägar i skriptet (T1, T2) | Källkoden är ASCII, filerna hittas med `Get-ChildItem`, och git används inte. |
| En annan process skriver samtidigt: Obsidian, telefonen, Drive | Förberedelsen i körordningen: telefonen synkad och oanvänd, Obsidian stängt, Drive klart. Per fil läses filen om precis före skrivning, och ändras den däremellan hoppas den över. |
| En annan **agent** redigerar en mapp samtidigt | `-ExcludePath` lämnar mappen helt orörd. 2026-10-24 gäller det CM1000 och SF1686. Utan uteslutningen är CM1000:s nya `_index.md` den enda överlappande filen; med den är överlappet noll. |
| Ingen varaktig återställningspunkt, eftersom inget är committat sedan 2026-10-05 | Backupen hamnar utanför `%TEMP%` och Drive, och återställningsraden skrivs ut. Att committa först är valfritt och hans beslut. |
| Värden som kräver YAML-citat | Filen hoppas över och rapporteras. Inga sådana finns i dag. |
| Den delade SR-baslinjen skrivs om (T22) | Egen `-BaselinePath` används både i testet och i hans körning. |
| Skriptet körs två gånger | Det är idempotent. Andra körningen på kopian ska ge 0 ändringar. |
| Quartz läser formen annorlunda | Quartz tolkar frontmatter med gray-matter (`docs/plugins/Frontmatter.md`), och Quartz egen dokumentation skriver `tags:` i listform. js-yaml-jämförelsen på kopian visar att datan är identisk. |

## Test, utan att röra det riktiga vaultet

1. **Syntetisk fixtur i `%TEMP%`.** Den ska ta högst en timme. Utfallet jämförs mot förväntade bytes.
   - Kantfallen:
     - LF och CRLF, med och utan BOM
     - blandade radslut
     - `nosr` först och sist
     - svenska taggar och `HH1802/HH1802KS1`
     - `tags: []`, ett citerat värde och text efter `]`
     - redan listform och två `tags:`
     - `---` i brödtexten och `tags:` som andra nyckel
     - inga taggar och ingen frontmatter
   - Dessutom en omkörning, en simulerad skrivmiss där återställningen ska slå till, en junction som
     pekar ut ur vaultet, och `-ExcludePath` som ska lämna en hel mapp orörd.
2. **Hela vaultet som kopia i `%TEMP%`.**
   - Kopian byggs i två steg. Först skapas ett fullständigt träd av tomma platshållare
     (`robocopy /CREATE`), så att länk- och mappkontrollerna ser alla filer. Sedan skrivs textfilerna
     (`.md`, `.json` och konfiguration) över med sitt riktiga innehåll.
   - Före körningen sparas en SR-baslinje med egen sökväg, och `Get-TagInventory` körs.
   - Sedan körs `-Apply` på kopian.
   - Efteråt måste allt detta hålla:
     - SR-jämförelsen visar alla siffror oförändrade.
     - js-yaml gör en djupjämförelse av varje ändrad fils frontmatter före och efter, och den är
       identisk.
     - `Get-TagInventory` ger samma utdata som före körningen.
     - Den vända auditen är ren.
     - Censusens `notesInScope` är lika med auditens.
     - Lint är ren.
     - En andra `-Apply` ändrar 0 filer.
     - Återställningsraden, prövad på kopian, ger en kopia som är byte-identisk med originalet.
3. **Grindar.** `Test-VaultAudit`, `Test-ScriptHygiene`, `Test-DocHygiene` och lint ska alla vara
   rena.
4. **Torrkörning mot det riktiga vaultet.** Antalet att ändra ska stämma med kopians. En andra
   torrkörning med `-ExcludePath CM1000,SF1686` ska ge ett mindre, och inga CM1000/SF1686-rader.
5. **Adversariell granskning av skriptet och testresultaten**, innan överlämningen.
6. **`-Apply` körs aldrig mot det riktiga vaultet.** Kasiem kör det själv.

## Ordningen när Kasiem kör

Kör allt i PowerShell. Steg 1 till 5 klistras in som de står.

**0. Förberedelse**
- Avsluta repetitionen på telefonen och kör FolderSync en gång. Öppna inte Obsidian på telefonen igen
  förrän i steg 7.
- Stäng Obsidian helt på datorn. Skriptet vägrar köra `-Apply` om Obsidian är igång.
- Kontrollera att Google Drive visar att allt är synkat.

```powershell
cd "G:\My Drive\KTHObsidian"
$S = "Meta\Obsidian Plugins\Scripts"
$B = "$env:TEMP\sr-baseline-tags-to-list.json"

# 1. SR-baslinje i en egen fil
powershell -NoProfile -ExecutionPolicy Bypass -File "$S\Get-SRIntegrity.ps1" -Save -BaselinePath $B

# 2. Torrkörning. SUMMARY-raden ska sluta med skipped=0 failed=0
powershell -NoProfile -ExecutionPolicy Bypass -File "$S\Convert-TagsToList.ps1" -ExcludePath CM1000,SF1686

# 3. Skarp körning. Spara raderna "backup:" och "restore:" som skrivs ut sist
powershell -NoProfile -ExecutionPolicy Bypass -File "$S\Convert-TagsToList.ps1" -ExcludePath CM1000,SF1686 -Apply

# 4. SR-jämförelse. Ska ge "RESULT: clean"
powershell -NoProfile -ExecutionPolicy Bypass -File "$S\Get-SRIntegrity.ps1" -Compare -BaselinePath $B

# 5. Audit. Ska ge "RESULT: deviations" med enbart "inlineStyleTags 1" (CM1000:s _index.md), se nedan
powershell -NoProfile -ExecutionPolicy Bypass -File "$S\Vault-Audit.ps1"
```

**`-ExcludePath CM1000,SF1686` är med för den samtidiga agenten.** Se *Samtidig agent* nedan. När den
agenten är klar och CM1000 är committat kör man en vanlig `Convert-TagsToList.ps1 -Apply` utan flaggan,
så konverteras den sista filen och auditen blir helt ren.

**Vid torrkörningen 2026-10-24** gav steg 2, med `-ExcludePath CM1000,SF1686`:

```text
SUMMARY convert=536 alreadyList=13 noTags=0 excalidraw=0 skipped=0 failed=0
```

Utan flaggan var det `convert=537`. Skillnaden är CM1000:s `_index.md`, som flaggan lämnar ifred.
Om han har redigerat taggar sedan dess kan antalen skilja något. Det som spelar roll är `skipped=0` och
`failed=0`.

**Om steg 2 visar överhoppade filer**
- Kör inte steg 3. Säg till.
- Varje överhoppad fil listas med sitt skäl.

**Om steg 4 inte ger `RESULT: clean`, eller steg 5 visar mer än den väntade raden**
- Steg 5 (auditen) ska visa `inlineStyleTags 1` — det är CM1000:s `_index.md`, som uteslöts med flit.
  Det är väntat, inte ett fel. Vill man ha en helt ren audit före commit får man i stället komma överens
  med den andra agenten om just den filen (se *Samtidig agent*).
- Om SR-jämförelsen (steg 4) visar någon ändring, eller auditen visar något annat än den enda
  `inlineStyleTags`-raden:
  - Öppna inte Obsidian.
  - Kör restore-raden från steg 3, som ser ut så här:

    ```text
    powershell ... -File "...\Convert-TagsToList.ps1" -Root "G:\My Drive\KTHObsidian" -RestoreFrom "C:\Users\ekasalm\KTHObsidian-backups\tags-to-list-<tid>" -Apply
    ```

  - Säg sedan till.

**Efter körningen**

6. Vänta tills Drive har laddat upp allt. Öppna sedan Obsidian på datorn.
7. Kör FolderSync på telefonen och kontrollera att inga konfliktfiler har dykt upp.
8. Skapa en not med Begrepp-mallen och kontrollera att taggarna står som en lista under `tags:`. Radera
   sedan noten.

**Om det som redan ligger i arbetsträdet**
- Ändringarna i auditen, mallarna och dokumenten ligger redan där innan han kör, eftersom de inte rör
  några noter.
- Fram till körningen är auditen röd med `inlineStyleTags`, och pre-push-hooken blockerar då en push.
- När han vill committa ska den vända auditen och de konverterade noterna ingå i samma commit, annars
  blir CI rött. **Stagea per namn och utelämna CM1000- och SF1686-sökvägarna**, så att den andra agentens
  pågående flytt lämnas kvar i arbetsträdet åt den agenten. Kör aldrig `git add -A` eller `git add .`.

## Samtidig agent (2026-10-24)

En annan agent konverterar PDF:erna i CM1000-mappen och har flyttat kursen från `2025 Höst` till
`2026 Höst`. Deras arbete ligger helt under `CM1000`- och `SF1686`-sökvägar: en otrackad ny `_index.md`,
de raderade gamla `_index`-filerna och ett nittiotal PDF:er. PDF:er ligger ändå utanför skriptets scope.
Den enda filen som annars hade överlappat är CM1000:s nya `_index.md`, som skriptet skulle skriva om till
listform.

`-ExcludePath CM1000,SF1686` tar bort även det överlappet, så körningen och en efterföljande commit blir
helt oberoende av när den agenten arbetar. Priset är att CM1000:s `_index.md` står kvar i inline-form och
rapporteras som `inlineStyleTags 1` tills den agentens arbete är committat och man kör en vanlig
konvertering på den filen.

Verifierat 2026-10-24: med flaggan rör torrkörningen 536 filer, 0 under CM1000/SF1686, och alla 641
KTH-noter är byte-identiska med läget före körningen.

## Granskningen 2026-10-24

| # | Lins | Fynd | Åtgärd |
| --- | --- | --- | --- |
| P1 | premiss, HIGH | Samtidiga skrivare (två enheter, Drive och FolderSync) | Förberedelsesteg 0 och 6–7 |
| P2 | premiss, HIGH | Ingen varaktig backup | Backup utanför `%TEMP%` och Drive, och en återställningsrad som är testad på kopian |
| P3 | premiss, HIGH | Det gamla skriptet är kvar och kan köras | Kasiem sa att det ska lämnas orört. Hänvisningarna tas bort och den vända auditen gör en körning synlig direkt. Spärren är hans beslut. |
| P4 | premiss, MEDIUM | Överlämningen går inte att följa ensam | Konkreta rader, ett förberedelsesteg och vad han gör om något avviker |
| P5/C7 | båda, MEDIUM | Mallarna är otestade | Node och js-yaml, plus en testnot som han skapar |
| P6 | premiss, MEDIUM | Massomskrivningen är det enda riskfyllda steget | Den behålls, eftersom det är hans val, och skyddas av P1, P2 och kontrollerna |
| P7 | premiss, LOW | Quartz | Belägg från gray-matter plus js-yaml-jämförelsen |
| P8 | premiss, LOW | Kantfallen skyddar mot sådant som inte finns i dag | Fixturen begränsas till en timme |
| C1 | konformans, HIGH | Numret F103 är redan taget | F105, efter att det högsta numret har lästs |
| C2 | konformans, HIGH | Health Report saknas i planen | §3 säger att formen bara kontrolleras av auditen och att Dataview inte kan se den |
| C3 | konformans, HIGH | "two writing scripts" blir fel | Blir "three" i `scripts.md` och "tre" i `README.md` |
| C4 | konformans, HIGH | Standardens `_index`-rad (cirka 364) saknas | Ingår i punkt 7 |
| C5 | konformans, MEDIUM | Skriptet är inte registrerat | En tabellrad med exit-koder, och `Test-ScriptHygiene` körs |
| C6 | konformans, MEDIUM | Harnessens README- och backlogfixturer är kvar i inline | All inline-form i harnessen skrivs om |
| C8 | konformans, MEDIUM | T1 och T2 saknas i risktabellen | Tillagda |
| C9 | konformans, LOW (höjd till MEDIUM) | Auditens listtolkning läcker över radslut | Rättas och får en negativ kontroll, se punkt 3 |
| E1 | egen | `llms.txt:108` och backlograden *Already verified uniform* | Ingår i punkt 7 |
