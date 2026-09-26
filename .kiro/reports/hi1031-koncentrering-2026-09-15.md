---
tags: [meta]
description: "Plan och strykningslistor för att koncentrera HI1031 kapitel 4, 5, 9 och 10 till de direkta tentafrågorna. Fynd från fyra omfångsjägare 2026-09-15, med beslut och verifieringskedja."
---

# HI1031 — koncentrering av kapitel 4, 5, 9 och 10, 2026-09-15

Kasiem talade med sin lärare, som pekade ut **kapitel 6, 11, 16 och 17 som de viktigaste att öva
på**. Dessa fyra står därför kvar orörda. Kapitel 1 och 2 står också kvar, för han har redan börjat
lära sig dem. Kvar att koncentrera: **kapitel 4, 5, 9 och 10** — åtta filer.

Uppgiften är att skära ned båda filerna per kapitel så att de bara täcker de direkta tentafrågorna.
Hans ord: *"jag tror inte att jag behöver lära mig väldigt mycket utanför de direkta tentafrågorna
för de kapitlen."*

## MANDATET SOM ÄNDRATS — läs detta först

Vid genomgången 2026-09-10 **avvisades** en rad strykningar i just dessa kapitel med motiveringen att
**en muntlig examinator ställer följdfrågor**. Det argumentet gäller inte längre för kapitel 4, 5, 9
och 10. Bekräftat av Kasiem 2026-09-15. De avvisade strykningarna ska alltså göras om de inte direkt
besvarar en tentafråga.

Det gäller **bara dessa fyra kapitel**. För 6, 11, 16 och 17 står de gamla besluten kvar.

## LÄGET OCH MÅLET

| Kapitel | Frågor | Not nu | Deck nu | Not mål | Deck mål |
|---|---|---|---|---|---|
| 04 Interprocesskommunikation | 6 | 361 | 58 | ~240 | ~35 |
| 05 Fjärranrop | 4 | 285 | 42 | ~175 | ~31 |
| 09 Web services | 5 | 392 | 50 | ~230 | ~30 |
| 10 Peer-to-peer-system | 5 | 437 | 58 | ~230 | ~32 |
| **Summa** | **20** | **1475** | **208** | **~875** | **~128** |

## DET VIKTIGASTE FYNDET: ren strykning räcker inte till radmålet

**Alla fyra omfångsjägarna sa detta oberoende av varandra.** Om man bara raderar hela stycken som
ingen fråga behöver landar noterna på:

| Kapitel | Enbart strykning | Radmål | Gap |
|---|---|---|---|
| 04 | ~300 | 240 | 60 |
| 05 | ~260 | 175 | 85 |
| 09 | ~300 | 230 | 70 |
| 10 | ~353 | 230 | 123 |

Alltså **1475 → cirka 1215, en minskning på 18 procent**. För att nå cirka 875 måste den prosa som
blir kvar också **skrivas om stramare**, inte bara beskäras. Det är en annan och långsammare
operation.

**Kortmålen nås däremot med ren strykning:** 208 → cirka 128, utan att slå ihop kort.

**Varför gapet finns:** `### Muntligt svar` står kvar per beslut, och kostar cirka 12 rader per fråga.
Med 20 frågor är det cirka 240 rader som inte kan röras, plus header och `## Luckor och källor`. Det
är ett strukturellt golv.

### Risken med att skriva om i stället för att stryka

Projektets vanligaste fel är att **uppgradera bokens gardering till ett påstående** — *suggests* blir
*måste*, *should* blir *måste*, ett *generally* tappas. Det felet fångades i tre kapitel i rad. En
omskrivningsrunda är precis det tillfälle då det händer.

**Motåtgärd, obligatorisk:** garderingarna ska vara ordagrant kvar efter omskrivningen. Kontrolleras
med sökning efter *brukar*, *kan*, *ofta*, *i regel*, *antyder*, *generellt*, *typiskt* i de berörda
styckena före och efter, med samma antal.

**Vad omskrivningen INTE kräver:** ingen ny läsning ur boken. All fakta i filerna är redan
faktagranskad — faktagranskaren kontrollerade **15 påståenden i kapitel 5, 26 i kapitel 9 och 32 i
kapitel 10, med noll sakfel i alla tre**. Kapitel 4 granskades också av alla fem granskarna, men
antalet kontrollerade påståenden finns inte antecknat. Arbetet är att korta befintlig, verifierad
text. Därför gäller **inte** regeln om att läsning och skrivning måste ligga i samma kontextfönster.

## STRYKNINGSLISTOR PER KAPITEL

Radnumren gäller filerna som de ser ut 2026-09-15 och **blir ogiltiga vid första redigeringen i
filen** (T8). Bearbeta varje fil i **fallande radordning**, eller läs om filen efter varje skrivning.

### Kapitel 5 Fjärranrop — 285 → ~175, deck 42 → 31

Radnummer verifierade av omfångsjägaren med grep.

- `111-118` "Åt andra hållet: när middleware är värt priset" — 8 r, upprepar fråga 1
- `55-56` binder — hur klienten får sin första fjärreferens
- `57-58` skräpsamlingsmekanismen
- `126-129` fråga 2 "Så kan du tänka"
- `251-254` fråga 4 "Så kan du tänka"
- Lägst prio: `16-17`, `88-89`, `147-148`, `212-213` — raderna "Bokens avsnitt"

**Trippeldubblett att lösa:** "skicka objektreferens som parameter" står i fråga 1 (rad 27 och 77-79),
fråga 2 (124-125) och fråga 4 (251-253). **Behåll förekomsten i fråga 1**, som äger mekaniken.

**Deck, 11 kort bort** (positioner i filen): 5 vinster, 13 binder, 20 uttryckskraft, 10
fjärrreferensmodul, 40 konstruktor/main, 4 fabriksmetoder, 34 ytlig, 28 SOAP, 12 autogenerering,
19 idempotent, 41 paradigm.

**Hängande talpunkter:** fråga 2 talpunkt 5 bär "tvärtom"-svaret efter att `111-118` gått — den står
självständigt och klarar sig. Fråga 1 talpunkt 3 får sitt enda stöd i sig själv efter strykningen.

### Kapitel 4 Interprocesskommunikation — 361 → ~240, deck 58 → ~35

- `305-330` **hela systemvirtualiseringen**, 26 r — noten säger själv att §7.7.1 ligger utanför
  kursens läslista. Största enskilda stryket.
- `89-93` XML:s välformat, element och attribut — syntax, inte "vad XML är"
- `144-145` multicasts felmodell — dubblett, fråga 4 äger multicast
- router- och klass D-detaljer i fråga 3 — samma skäl
- `136` exempellistan HTTP/FTP/Telnet/SMTP
- `120-121` exempellistan DNS/VoIP

**Hängande talpunkter:** fråga 6 talpunkt 1 skrivs om, talpunkt 5 och 6 stryks eller skrivs om — alla
tre bygger på systemvirtualiseringen. Fråga 3 talpunkt 2 tappar sitt DNS/VoIP-stöd.

**Deck:** de 6 systemvirtualiseringskorten plus "Vilka två slags virtualisering". Resten av vägen till
35 kräver att granulära kort under fråga 5 och TCP dras.

**Tre kandidater ur septemberlistan finns inte längre i filen** — de togs bort vid en tidigare runda.

### Kapitel 9 Web services — 392 → ~230, deck 50 → 30

Elva namngivna block. De största:

- `371-392` `## Luckor och källor` — kortas hårt
- `315-331` Ajax-styckena
- `33-39` stycket om tjänstebeskrivning
- `145-166` resurs och hypermedia — kortas, inte bort
- `29-31` "Blanda inte ihop web server och web service"
- `95-99` "En detalj som är lätt att blanda ihop"
- `129-131` "Siffran att nämna" — dubblett av Amazons REST/SOAP-fördelning på `51-54`

**MÅSTE BEVARAS, det är svaret på fråga 2:** att boken och restfulapi.net **motsäger varandra** om
REST. Boken beskriver REST som HTTP med fyra metoder; artikeln säger att REST inte är HTTP. De sex
principerna och ordet *hypermedia* finns **bara i artikeln**. Frågan ber uttryckligen om principerna
och om hypermedias roll. `Varningen` på `168-173` och attributionen på rad `125` står kvar, men
komprimeras.

**14× och 882× behålls** — de tjänar fråga 3:s "jämför", och fråga 3:s talpunkt 6 bygger på dem.
Ligger på `231-234`.

**Deck: 20 kort bort → 30 kvar.** F1:5, F2:9, F3:8, F4:4, F5:4.

**Hängande talpunkter:** fråga 5 talpunkt 3 (Google Maps) och talpunkt 5 (skikt 1-2).

### Kapitel 10 Peer-to-peer-system — 437 → ~230, deck 58 → ~32

- `326-344` de tre sökstrategierna och Gnutella-versionerna — 19 r
- `287-297` prefixrutning, Pastry, O(log N) — 11 r
- `255-265` överläggets fyra formella uppgifter — 11 r
- `73-75`, `122-125`, `211-213`, `394-398` fyra "Så kan du tänka" — 15 r
- `25-30` "Varför det inte räcker att köpa fler servrar" — 6 r
- `152-155` "Boken tar inte ställning" — censur och whistleblowing, utanför upphovsrättsfrågan
- `270-273` GUID och indextjänst, BitTorrent-detalj
- `283-285` DOLR
- `177-179` kontrasten funktionellt / icke-funktionellt
- `267-268`, `390-392` två glosor — korten räcker
- `32-34` exempelföretagen Google och Amazon

**Det bekräftade felet:** talpunkt 4 under fråga 3, rad `227-228`, säger *"Overnet hade en snittsession
på 135 minuter mot 37,7 timmar i Microsofts företagsnät"*. Siffran finns inte i faktastycket och inte
på något kort — kortet ströks som trivia i september. **Meningen stryks, siffran återinförs inte.**

**Hängande talpunkter:** fråga 4 talpunkt 4 (Pastry, O(log N), prefixrutning → ersätts med "GUID:t
avgör placeringen"), fråga 4 talpunkt 6 (sökstrategierna och ultrapeers → meningen stryks), fråga 2
talpunkt 6 (slutklausulen om anonymitet och censur på rad `171` → stryks).

**Deck: cirka 26 kort bort → 32 kvar.** F1:6, F2:8, F3:4, F4:7, F5:7.

## BESLUT — var omfångsjägarna följs och var de går emot

1. **Kapitel 5: alla sex delar av figur 5.15 stannar i noten**, fjärrreferensmodulen inräknad. De är
   tillsammans svaret på fråga 1:s andra led, "hur RMI fungerar". Bara dess **kort** stryks.
2. **Kapitel 5 landar på 31 kort, inte 25.** Att komma till 25 kräver att fråga 3:s jämförelseaxlar
   och anropssemantiken skärs, och fråga 3 *är* "jämför sockets, RPC, RMI och webbtjänster". Avråds.
3. **Kapitel 9: källkonflikten om REST och 14×/882× stannar.** Båda är svar, inte utfyllnad.
4. **Kapitel 10: både fråga 1:s fördelskort och fråga 3:s kravkort stannar** trots delvis överlapp —
   de svarar på olika frågor.
5. **Kapitel 10: Overnet-talpunkten stryks**, siffran återinförs inte.

### Den enda strykning jag är tveksam till

**Kapitel 10, prefixrutningen och sökstrategierna.** Fråga 4 är tredelad och ber om *hur man hittar en
specifik resurs*. Prefixrutning **är** mekanismen i ett strukturerat system, och sökstrategierna är
mekanismen i ett ostrukturerat. Kvar blir "GUID:t avgör vilken nod som äger objektet, och överlägget
rutar dit" plus figur 10.11:s kontrast, vilket besvarar frågan men utan mekanik. Det följer mandatet.
**Nämn detta för honom** — det är den mest mekanismtunga av de tjugo frågorna.

## ARBETSORDNING

Ett kapitel i taget, helt färdigt och verifierat innan nästa börjar.

1. **Kapitel 5** först — minsta filen, kalibrerar metoden och radutfallet.
2. **Kapitel 4** — svårast strukturellt med sex frågor och mest omskrivning.
3. **Kapitel 9**.
4. **Kapitel 10** — största blockstrykningarna, mest mekaniskt.

Uppdatera `STATUS` här per kapitel när det är klart, så arbetet överlever en kompaktering.

| Kapitel | Status |
|---|---|
| 05 | **KLART 2026-09-15.** Not 285 → **236**, deck 42 → **31** (22 `::`, 3 `;;`, 6 `\|\|`). Verifierat: en enda namngiven fil rörd, `cards 42 -> 31`, `markers placed on cards` oförändrat 1477, `excludedCards` −11 exakt, CR 0, inga dubbla blankrader, alla nio garderingar intakta, audit `RESULT: clean`, lint 549 filer 0 issues. |
| 04 | **KLART 2026-09-15.** Not 361 → **312**, deck 58 → **41** (25 `::`, 8 `;;`, 8 `\|\|`). Verifierat: `cards 58 -> 41`, `markers placed on cards` oförändrat 1477, inga markörer flyttade, CR 0, inga dubbla blankrader, alla garderingar intakta inklusive Saltzer-hedgen "suggests an answer", audit `RESULT: clean`, lint 549 filer 0 issues. |
| 09 | **KLART 2026-09-15.** Not 392 → **334**, deck 50 → **37** (25 `::`, 6 `;;`, 6 `\|\|`). |
| 10 | **KLART 2026-09-15.** Not 437 → **341**, deck 58 → **34** (23 `::`, 3 `;;`, 8 `\|\|`). |

## SLUTRESULTAT — alla fyra klara 2026-09-15

| Kapitel | Frågor | Not före → efter | Rader per fråga | Deck före → efter |
|---|---|---|---|---|
| 05 Fjärranrop | 4 | 285 → **236** | 59 | 42 → **31** |
| 04 Interprocesskommunikation | 6 | 361 → **312** | 52 | 58 → **41** |
| 09 Web services | 5 | 392 → **334** | 67 | 50 → **37** |
| 10 Peer-to-peer-system | 5 | 437 → **341** | 68 | 58 → **34** |
| **Summa** | **20** | **1475 → 1223 (−17 %)** | | **208 → 143 (−31 %)** |

**Verifierat i ett svep efter sista kapitlet:** `-Compare` namnger **exakt de fyra avsedda filerna** och
inga andra, `cards 58->41`, `42->31`, `50->37`, `58->34`; `excludedCards` föll 533 → 468, alltså **−65 =
208 − 143 exakt**; `markers placed on cards` stod still på **1477** genom hela sessionen och ingen markör
flyttades; CR 0 och inga dubbla blankrader i någon av de åtta filerna; garderingarna kontrollerade i alla
fyra noter, inklusive Saltzers *"suggests an answer"*, 14×/882×-förbehållet och IP:s legacy-reservation;
`Vault-Audit.ps1` **clean**, lint **549 filer 0 issues**, `Test-DocHygiene.ps1` **clean**.

## VAD PROGNOSERNA VAR VÄRDA — läs detta före nästa liknande uppdrag

**Kortmålen träffades varje gång. Radmålen missades varje gång, åt samma sida.**

| | Mitt mål | Utfall |
|---|---|---|
| Kap 05 not | 175 | 236 |
| Kap 04 not | 255 | 312 |
| Kap 09 not | 275 | 334 |
| Kap 10 not | 285 | 341 |

Felet är **+35 %, +22 %, +21 %, +20 %** — alltså inte slumpmässigt. Efter kapitel 5 skrev jag in en
×1,2-korrigering i denna fil och missade sedan ändå med 20 % tre gånger. **Korrigeringen borde vara ×1,45
på en rå uppskattning, eller så bör man sluta uppskatta totalen och räkna per fråga i stället.**

**Rader per fråga är det enda stabila måttet, och det varierar med frågans form:** 52 rader per fråga när
frågorna är enkla (kapitel 4, sex korta frågor), 67–68 när de är fler- eller tredelade (kapitel 9 fråga 2
har fyra led; kapitel 10 fråga 4 har tre). **En fyrdelad fråga kostar inte mer än en enkel för att jag
skriver för mycket — den kostar mer för att den frågar om fyra saker.**

**Det strukturella golvet, mätt:** cirka 14 rader låsta `### Muntligt svar` per fråga, plus rubrik och
avsnittshänvisning, plus de faktarader talpunkterna vilar på. Med tjugo frågor är det över 300 rader som
inte kan röras. **Notlängden sitter i antalet tentafrågor, inte i hur mycket slask som fanns att ta bort.**

## ADVERSARIELL GRANSKNING 2026-09-15 — tio granskare, och vad de hittade

Tio read-only granskare kördes parallellt: täckning per kapitel (4), fakta mot boken (2), kort, korsvis
konsistens, luckavsnittens egna påståenden, och språk. **De hittade tolv verkliga fel. Alla åtgärdade.**

**Två sakfel.** Kapitel 5 skrev att en parameter kan vara "stor eller **trög**" — boken skriver *large or
complex*, och kapitel 4 översatte samma bokställe korrekt som "stor eller komplex". Kapitel 5 påstod också
att fjärrobjektreferensen som parameter är "**hela** skillnaden mot RPC" när boken listar **två**.

**Två tillplattade garderingar, båda i kapitel 4:s deck.** "så sändaren slipper veta vilka som är med"
saknade bokens *usually*, och "vilket **sparar** investering i serverdatorer och energi" saknade bokens
*has the potential to reduce*. Noten hade garderingarna kvar i båda fallen — felet uppstod bara i decket.
**Slutsats: garderingskontrollen måste köras på decket också, inte bara på noten.**

**Tre falska påståenden om filerna själva.** Kapitel 5:s luckavsnitt listade "skräpsamling" som medvetet
utanför noten, men den bär hela svaret på fråga 4. Kapitel 4:s inledning utlovade en `**Så kan du tänka**`-
märkning trots att båda sådana stycken strukits. Kapitel 9 hade en föräldralös talpunkt — "den princip som
oftast hoppas över i praktiken" fanns inte i något faktastycke.

**Fem kortfel.** Tre highlights på ett kort (kapitel 10:s DHT-operationer) och två på ett annat (kapitel 9:s
SOAP-kuvert) mot regel 5. Tre överlastade kort ur mina egna sammanslagningar. Kapitel 10:s kort "de tre
**första**" och "de tre **sista**" kraven var obesvarbara, eftersom ordningen är bokens och godtycklig —
omformulerade till bokens egen tematiska uppdelning: tre krav följer av att systemet är stort, tre av att
datorerna varken ägs eller kan litas på.

**Och det starkaste fyndet, som bekräftade min egen tvekan:** kapitel 10:s fråga 4 hade blivit
**obesvarbar för ostrukturerade system**. Kvar fanns bara "söka igenom topologin", vilket granskaren
korrekt kallade en omskrivning av frågan snarare än en mekanism. De tre sökstrategierna är återinförda i
komprimerad form, tre rader i stället för nitton.

### Vad som avvisades, och varför

**Avdubblering av kapitel 5 fråga 4 mot kapitel 9 fråga 3.** Två granskare fann fem dubblettpar och kallade
det slöseri inom samma kurs. **De har fel om orsaken.** Tentan ställer samma jämförelse två gånger — kapitel
5 fråga 4 är "skillnaderna och likheterna mellan distribuerade objekt och webbtjänster" och kapitel 9 fråga
3 är "jämför distribuerade objekt med webbtjänster". Dubbleringen ligger i **specifikationen**, inte i
materialet. Att ta bort den ur något av kapitlen gör en tentafråga obesvarbar ur sitt eget kapitel.

**Listkortet med REST:s sex principer** bryter mot riktlinjen om högst fem punkter, men frågan ber
uttryckligen om sex namngivna principer. Behållet.

### Kvar att bestämma, inte fel

Granskarna namngav cirka **femton odefinierade termer** — marshalling, middleware, socket, IDL,
`operationId`, CDR, proxy, CORBA, mellanprogram, *separation of concerns* med flera. Jag glossade de tre
mest bärande (marshalling och request-reply i kapitel 4, *best-effort* i kapitel 10). **Att glossa resten
kostar cirka 15 rader och drar åt motsatt håll mot koncentrationen** — det är författarens avvägning.
Språkgranskaren namngav femton tunga formuleringar; de fem värsta är åtgärdade, tio står kvar.

## SLUTLIGA SIFFROR efter granskning och åtgärder

| Kapitel | Not | Deck |
|---|---|---|
| 04 | 361 → **314** | 58 → **41** |
| 05 | 285 → **237** | 42 → **32** |
| 09 | 392 → **335** | 50 → **38** |
| 10 | 437 → **347** | 58 → **35** |
| **Summa** | **1475 → 1233 (−16 %)** | **208 → 146 (−30 %)** |

Åtgärderna efter granskningen la tillbaka 10 rader och 3 kort. **Verifierat:** `excludedCards` 533 → 471,
alltså −62 = 208 − 146 exakt; `markers placed on cards` **1477** oförändrat; noll kort med mer än en
highlight och noll highlights i `||`-kroppar i alla fyra deck; CR 0; audit clean; lint 549 filer 0 issues.

## KALIBRERING EFTER TVÅ KAPITEL — använd denna, inte gissningar

| Kapitel | Frågor | Not före → efter | Rader per fråga | Deck före → efter | Kort per fråga |
|---|---|---|---|---|---|
| 05 | 4 | 285 → **236** | 59 | 42 → **31** | 7,8 |
| 04 | 6 | 361 → **312** | 52 | 58 → **41** | 6,8 |

**Radantalet per fråga är den stabila storheten, inte totalen.** Cirka **52–59 rader och 7 kort per
fråga** när filen är nedskuren så långt det går utan att ta bort svar. Kapitel 4 har sex frågor och kan
därför inte bli kortare än kapitel 5 med fyra, hur hårt man än skär.

**Mina egna uppskattningar har varit cirka 20 procent för låga i båda fallen** — 175 mot 236, och 255 mot
312. Det är exakt den systematiska underskattning som arkivet dokumenterar för detta projekt. **Multiplicera
med 1,2.**

**Prognos för de två som återstår**, med 5 frågor var:

| Kapitel | Nu | Prognos not | Prognos deck |
|---|---|---|---|
| 09 | 392 | **~275** | **~35** |
| 10 | 437 | **~285** | **~35** |
| **Summa alla fyra** | **1475** | **~1108 (−25 %)** | **~142 (−32 %)** |

## RADMÅLEN ÄR OMRÄKNADE EFTER KAPITEL 5 — läs innan nästa kapitel

**Kapitel 5 landade på 236 rader mot målet 175.** Det var inte slarv, det är ett golv. Så här ser
budgeten ut när filen är nedskuren så långt det går utan att ta bort svar:

| Post | Rader |
|---|---|
| Frontmatter, H1, inledning | 10 |
| 4 × H2 + "Bokens avsnitt" + blankrader | 16 |
| 4 × `### Muntligt svar` med 23 talpunkter — **låst** | 62 |
| `## Luckor och källor` | 14 |
| Figur 5.9:s tabell | 7 |
| **Summa låst eller nästan låst** | **109** |
| Faktaprosa, 4 frågor | 127 |

För att nå 175 skulle faktaprosan behöva ner till 66 rader, alltså **16 rader per fråga**. Kapitel 5:s
fråga 3 är en fyrvägsjämförelse på fyra axlar plus tre anropssemantiker, och fråga 4 är ytterligare en
jämförelsefråga. **Två av fyra frågor är jämförelsefrågor, och axlarna ÄR svaret.** Under 16 rader per
fråga börjar man ta bort det tentan frågar om.

**Omräknade mål**, som tar hänsyn till hur mycket rent sidospår varje kapitel faktiskt har:

| Kapitel | Nu | Gammalt mål | Omräknat | Varför |
|---|---|---|---|---|
| 04 | 361 | 240 | **~255** | 26 r systemvirtualisering utanför läslistan, plus exempellistor och XML-syntax — mer rent raderbart än kap 5 |
| 09 | 392 | 230 | **~275** | Luckor 22 r, Ajax 17 r, flera metastycken |
| 10 | 437 | 230 | **~290** | Cirka 80 r identifierade blockstrykningar |
| **Summa med kap 5** | **1475** | **~875** | **~1056** | **−28 procent, inte −41** |

**Kortmålen håller däremot exakt.** Kapitel 5 landade på 31 som planerat, och totalen 208 → cirka 128
står kvar.

**Slutsatsen att inte tappa:** i denna filtyp sitter radantalet i antalet frågor och i hur många av dem
som är jämförelsefrågor, inte i hur mycket slask som finns. Ett kapitel med sex frågor kan inte bli
kortare än ett med fyra bara för att man skär hårdare.

## VERIFIERING — per kapitel, i denna ordning

1. `Get-SRIntegrity.ps1 -Save` **omedelbart** före deckändringen, `-Compare` efter. Läs raden per
   **namngiven fil** — den är beviset att exakt de avsedda korten försvann. En vaulttotal kan inte
   skilja min ändring från något annat som händer samtidigt.
2. `Get-DeckPairCensus.ps1 -Course HI1031 -Chapter NN` — kort per separator, radantal, CR-tecken och
   dubbla blankrader för båda filerna. Läs de två filnamnen den skriver ut.
3. **Läs tillbaka de redigerade områdena.** Kortantal bevisar kvantitet, aldrig struktur (T20): ett
   flerradskort där bara punkterna byts lämnar framsidan och `||` kvar, och den orphanade separatorn
   räknas fortfarande som ett kort.
4. **Garderingskontroll:** samma antal *brukar*, *kan*, *ofta*, *i regel*, *antyder*, *generellt*,
   *typiskt* i omskrivna stycken före och efter.
5. `Vault-Audit.ps1` → kräv `RESULT: clean`.
6. `cmd /c "npx markdownlint-cli2 **/*.md"` med **oquoterad** glob, och kontrollera att raden
   `Linting: N files` är nollskild (T11).
7. `Test-DocHygiene.ps1` när denna fil ändrats.

## FÄLLOR SOM GÄLLER JUST DETTA ARBETE

- **Septemberlistans radnummer var föråldrade** och tre kort den namngav finns inte längre — de var
  konsoliderade till ett. Verifiera varje mål mot filen innan du rör det; ett misslyckat `strReplace`
  säger bara "not found", vilket lätt läses som "redan fixat".
- **Fallande radordning eller läs om filen efter varje skrivning** (T8).
- **Hela kortblocket i `oldStr`** när ett flerradskort ska bort — framsida, `||` och punkter (T20).
- **Sök literalt med `.Contains()`**, inte regex: `|`, `*` och `.` i korttext gör en "literal"
  sökning till ett mönster som matchar överallt (T16).
- **En hel-filomskrivning kan konvertera LF till CRLF.** Kontrollera `CR chars = 0` efteråt.
- **MD026:** rubriker får inte sluta med punkt. Tentafrågorna gör det, så rubrikerna har den
  strippad — återinför den inte vid en omskrivning.
