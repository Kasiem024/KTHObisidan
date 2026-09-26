---
tags: [meta]
description: "Plan för koncentrering av HI1031 kapitel 1, 2, 6, 11, 16 och 17 mot tentafrågorna, med markörprotokoll för de två deck som bär review-historik."
---

# HI1031 — koncentrering del 2: kapitel 1, 2, 6, 11, 16 och 17

**Status: PLAN, inget är ändrat.** Skriven 2026-09-15 21:15. Tentan är muntlig, 21–23 september 2026.

Del 1 tog kapitel 4, 5, 9 och 10 och är dokumenterad i
`hi1031-koncentrering-2026-09-15.md`. Detta är samma arbete på de sex kapitel som då lämnades orörda.

## Mandatet, och vad som ändrades

Två låsningar från tidigare i dagen är **upphävda av författaren**:

1. Kapitel 6, 11, 16 och 17 var fredade eftersom läraren kallat dem viktigast att öva på — *"de kan
   stanna som de är"*. De ingår nu.
2. Kapitel 1 och 2 var fredade eftersom han redan börjat lära sig dem. De ingår nu, och han skrev
   uttryckligen **"även de flashcards som har en historik"**.

Punkt 2 är den som kostar något som inte kan tas tillbaka: **76 review-markörer** ligger i dessa två
deck. `conventions.md` §1 tillåter att markörbärande kort raderas när författaren bett om det, och han
har bett om det. Precedens finns: sju kort togs ur kapitel 1 den 2026-09-10 på samma grund.

## Nuläget, mätt med `Get-DeckPairCensus.ps1` 21:10

| Kapitel | Kort | Markörer | Notrader | Tentafrågor |
|---|---|---|---|---|
| 01 Karakterisering | 61 | **61** | 286 | 5 |
| 02 Systemmodeller | 53 | **15** | 258 | 5 |
| 06 Indirekt kommunikation | 50 | 0 | 390 | 5 |
| 11 Säkerhet | 49 | 0 | **664** | 5 frågor / **8 klausuler** |
| 16 Transaktioner | 50 | 0 | 580 | 5 |
| 17 Distribuerade transaktioner | 43 | 0 | 495 | 4 |
| **Summa** | **306** | **76** | **2673** | **32 klausuler** |

CR = 0 och double blank = 0 i alla tolv filer. Alla 61 kort i kapitel 1 bär markör, alltså har han
drillat hela decket.

## Huvudfyndet: materialet är mycket renare än kapitel 4, 5, 9 och 10 var

Sex läsande granskare, en per kapitel, fick var sin strykningslista att producera. **Fyra av sex
rapporterade oberoende att radmålen jag satte inte kan nås utan att skära i mekanik som frågorna
uttryckligen kräver.** Det är exakt samma utfall som i del 1, och samma fel av mig: jag uppskattade
totaler i stället för att budgetera per fråga.

Skillnaden mot del 1 är att där fanns 250 rader äkta avfall att ta. Här finns cirka 340, spritt över
nästan dubbelt så mycket text. **Dessa sex kapitel skrevs redan mot tentafrågorna** — särskilt de fyra
läraren pekade ut, som fick mest omsorg.

**Jag accepterar granskarnas tak i stället för mina mål.** Att jaga radmålet in i frågornas mekanik är
precis vad som gick fel i del 1 på kapitel 10, där en granskare senare underkände resultatet.

## Planerad landning per kapitel

| Kapitel | Not | Kort | Markörer |
|---|---|---|---|
| 01 | 286 → **282** | 61 → **42** | **61 → 42 (−19)** |
| 02 | 258 → **253** | 53 → **40** | **15 → 12 (−3)** |
| 06 | 390 → **370** | 50 → **45** | 0 |
| 11 | 664 → **540** | 49 → **45** | 0 |
| 16 | 580 → **430** | 50 → **43** | 0 |
| 17 | 495 → **447** | 43 → **38** | 0 |
| **Summa** | **2673 → 2122 (−21 %)** | **306 → 253 (−17 %)** | **76 → 54 (−22)** |

**Vinsten sitter i korten, inte i noterna** — och för kapitel 1 och 2 sitter den helt i korten, eftersom
de noterna redan ligger på budget.

## Vad som stryks, per kapitel

### Kapitel 1 — 19 kort, alla med markör

Noten är redan på budget; bara ett stycke om filen själv (rad 283–286) går. Korten som stryks är
fördjupningar noten medvetet inte har: **fyra kort om transparensformer** utöver access och location
(noten behåller bara två av bokens åtta), **fyra kort som delar upp feltoleransteknikerna** som ett
listkort redan täcker, tre kort som styckar upp middleware-idén, caching/replikering som inte finns i
notens skalbarhetssvar, plus enstaka trivia.

**Behålls trots att det ser utskärbart ut:** DNS-flaskhalsen (den *är* notens exempel på
decentralisering), RFC-datumen (fråga 5:s muntliga svar bygger på båda), och skalsiffran 63 miljarder
sidor (fråga 1 vill ha en storleksordning).

### Kapitel 2 — 13 kort, varav 3 med markör

Produkttrivia (Intel x86/Windows, ARM/Symbian, Sun NIS, CORBA/Java RMI som kategoriexempel),
Wikipedias 60 000/s, två nästan identiska framsidor om tvåskikt, och cache/proxy som underdetalj till
placeringsstrategierna. Fem rader ur noten.

De tre markörbärande som föreslås bort: **applikationsserver**, **exempel för distribuerade objekt**,
**middleware utöver programmeringsabstraktioner**. Alla tre tjänar frågorna *"Vad är Middleware?"* och
*"Vad är en mobil agent?"*, som är enminutssvar.

### Kapitel 6 — bara 5 kort och ~20 rader, och granskaren varnade uttryckligen

Frågorna 2, 3 och 4 kräver alla **implementationen** i klartext, så JGroups, de fem
CBR-strategierna och hub-and-spoke med WebSphere MQ måste alla stanna. Granskarens ord om mitt
290-radersmål: *"att tvinga ner den till 290 innebär att komprimera mekanik som briefen skyddar. Gör
det inte."*

Bort går `## Luckor och källor` i sin helhet, tre produktnamn, och fem kort som fördjupar DSM och
tuple spaces bortom den namngivning fråga 1 behöver.

### Kapitel 11 — ~124 rader, inte de 224 jag budgeterade

Åtta klausuler à ~67 rader är 540, och det är golvet. Bort går: nyckeldistribution och
utmaning/sessionsnyckel (Kerberos-nära, ingen klausul frågar), **MAC och undeniable signatures**,
certifikatåterkallning och kedjelängd, **födelsedagsattacken**, cipher suite fält för fält, de
namngivna chiffrens bitlängder (DES/3DES/AES/TEA/IDEA), policy-kontra-mekanism, och tre garderingar
som inte hör till någon klausul.

**Måste stanna, och varför:** prestandasiffrorna 100–1000× och 4,75/0,18 ms, eftersom **fråga 3
uttryckligen frågar "Prestanda?"**. X.509:s fyra fält, eftersom **5.2 frågar vad certifikatet
innehåller**. TLS-handskakningens fyra steg, eftersom **5.1 frågar hur handskakningen går till**.

**Svagast efteråt blir klausul 4.1** (digest-funktionen): utan födelsedagsattacken och MD5/SHA-1
försvinner motiveringen till kravet på minst 128 bitar. Granskarens kompensation — behåll raden om
≥128 bitar — följs.

### Kapitel 16 — största vinsten är dubbelundervisning inom noten

Frågorna 3, 4 och 5 kretsar alla om **samma tre schemaläggare**, och fråga 5 innehåller större delen
av 3 och 4. Granskaren fann sex fakta som lärs två eller tre gånger och föreslår en ägarskapsmodell
som behålls: **fråga 1 äger 2PL**, **fråga 3 äger optimistisk**, **fråga 4 äger tidsstämpel**, **fråga
2 äger dirty-read-skyddet**, och **fråga 5 behåller bara jämförelsetabellerna**. Varje fråga måste
fortfarande gå att svara på ensam, så det som flyttas ersätts med en referens, inte med tomrum.

Dessutom ~140 rader avfall: bakåt- och framåtvalidering i djup, flerversionslåsning i sin helhet,
Dropbox/Wikipedia/Docs/Dynamo som färg, låsgranularitet, och de tre konfliktreglerna som
implementationsdetalj.

**Ett fynd som hör till ett annat kapitel:** rad 115–117 handlar om distribuerade deadlocks, som hör i
kapitel 17. Flyttas dit eller stryks.

### Kapitel 17 — min antagelse var fel

Jag antog att 2PC lärs ut tre gånger, eftersom tre av fyra frågor handlar om det. **Det gör det inte.**
Noten partitionerar protokollet redan medvetet, och dokumenterar det själv på rad 471–486: fråga 2
äger protokollet, fråga 3 topologierna, fråga 4 recovery. Bara tre äkta dubbletter finns, och en av dem
ska behållas eftersom `uncertain` och `getDecision` spelar olika roller i de två frågorna.

Så bara ~48 rader avfall, nästan allt i fråga 1: deadlock-detekteringsalgoritmer, **edge chasing**,
fantomdeadlock, checkpointing-regler. Granskarens dom över mitt 250-radersmål: *"250-målet passar inte
ett kapitel där 3/4 frågor är samma protokoll."* Den är riktig.

## Markörprotokollet — den enda oåterkalleliga delen

22 markörer försvinner. Ordningen är därför:

1. **Kapitel 6, 11, 16 och 17 först.** Noll markörer, ingenting kan gå sönder oåterkalleligt.
2. **`Get-SRIntegrity.ps1 -Save` omedelbart före kapitel 1:s deck**, inte tidigare i sessionen. En
   review från telefonen kan landa mitt i arbetet och gör då en tidigare baseline oläsbar.
3. **Kapitel 1 och 2 sist, i ett tätt fönster**, så markörarbetet är isolerat.
4. **Hela kortblocket raderas, markören inkluderad.** En kvarlämnad markör fäster sig vid nästa kort,
   vilket är den enda ändring `write-flashcards` regel 11 förbjuder.

Efteråt måste `-Compare` visa, på de **namngivna filraderna** och inte på totalerna:

- `HI1031 Begrepp - Kap 01 ...: cards 61 -> 42, markers 61 -> 42`
- `HI1031 Begrepp - Kap 02 ...: cards 53 -> 40, markers 15 -> 12`
- `raw_srComments` faller **exakt 22**. Faller den mer har jag skurit i ett kort som skulle stanna;
  faller den mindre ligger en föräldralös markör kvar.
- **Inga `MOVED`-rader.**

## Verifieringskedjan efter varje kapitel

`Get-DeckPairCensus.ps1 -Course HI1031 -Chapter NN` med kravet CR = 0 och double blank = 0 · noll kort
med mer än en `==…==` och noll highlights i `||`-kroppar, kontrollerat med eget skript eftersom inget
befintligt verktyg ser den regeln · garderingsgrep **på både noten och decket**, eftersom det var i
decket två garderingar plattades ut i del 1 · `Vault-Audit.ps1` med `RESULT: clean` ·
`cmd /c "npx markdownlint-cli2 **/*.md"` med globen **ociterad**, och `Linting: N files` måste vara
skild från noll · `Test-DocHygiene.ps1` för denna fil.

## GENOMFÖRT 2026-09-15, och vad den adversariella granskningen hittade

Allt utfördes. Ordningen var kapitel 17, 06, 16, 11 (noll markörer) och därefter kapitel 01 och 02 i ett
tätt fönster med baseline tagen omedelbart innan.

### Slutresultat, mätt

| Kapitel | Not | Kort | Markörer |
|---|---|---|---|
| 01 | 286 → **286** | 61 → **43** | **61 → 42** |
| 02 | 258 → **258** | 53 → **41** | **15 → 12** |
| 06 | 390 → **387** | 50 → **45** | 0 |
| 11 | 664 → **600** | 49 → **45** | 0 |
| 16 | 580 → **500** | 50 → **44** | 0 |
| 17 | 495 → **447** | 43 → **38** | 0 |
| **Summa** | **2673 → 2478 (−7 %)** | **306 → 256 (−16 %)** | **76 → 54** |

**Markörbeviset:** `raw_srComments` 1415 → 1393 = **−22 exakt**, bara de två avsedda filerna namngivna,
inga `MOVED`-rader, `markers placed` 1477 → 1455. Kapitel 1 slutar på 43 kort och inte 42 eftersom ett
samtidighetskort återinfördes efter granskningen — se nedan.

### Åtta verkliga defekter, alla åtgärdade

Fem granskare läste om resultatet. **Kapitel 11 var värst.**

1. **Fyra föräldralösa talpunkter i kapitel 11** — fråga 1 punkt 6, fråga 2 punkt 6, klausul 4.1 punkt 6
   och klausul 5.2 punkt 6 påstod alla saker filen inte längre lärde ut. Fråga 1:s punkt visade sig vara
   **förbefintligt** föräldralös: mobil kod, Javas sandlåda och informationsläckage fanns bara i
   talpunkten. Boken belägger dem (rad 9292–9298), så ett kort faktastycke lades **till** i stället för
   att strykas. De tre andra skrevs om mot det noten faktiskt säger, utom 5.2 där tre rader om
   kedjeproblem och utgångsdatum återinfördes.
2. **Fyra falska påståenden i kapitel 11:s luckavsnitt** — MAC, födelsedagsattacken,
   certifikatåterkallning och cipher suite listades som "medvetet utanför noten" men fanns kvar allihop.
   Listan säger nu vad som är helt borta och vad som står kvar i kort form. **Detta är exakt samma
   defekt som del 1 hade i kapitel 5 (skräpsamling), återupprepad.**
3. **Kapitel 2 påstod att peer-to-peer var utanför noten** medan det lärs ut på tre ställen. Hittades av
   två granskare oberoende.
4. **Ett trasigt kort i kapitel 11:s deck** — raden `==Bindningen ligger i signaturen.==` stod efter en
   blankrad, alltså utanför sitt `||`-block, och tillhörde inget kort. Struken.
5. **Kapitel 1:s deck drillade bara 7 av 8 utmaningar.** Semaforkortet var det enda under
   `## Samtidighet`, så jag tog bort rubriken med det — och därmed försvann samtidighet ur decket helt.
   Ett nytt kort med auktionsexemplet återinfört.
6. **En dubblering jag själv införde i kapitel 17.** Stycket om globalt unika identifierare, som lades
   till för att laga en föräldralös talpunkt, dubblerade ett befintligt stycke om TID några rader ovanför.
   Sammanslagna.
7. **"vilar på" i ett muntligt svar i kapitel 11** — ordet författaren uttryckligen förbjudit, i en
   mening han ska säga högt. Plus "distinktionerna" i kapitel 17 och två tunga formuleringar i kapitel 16.

### Vad som avvisades

**De 110 korten med mer än en `==highlight==`** och 38 listrader med highlights i `||`-kroppar. Detta är
förbefintligt och gäller inte kapitel 4, 5, 9 och 10, som är rena. Kortgranskaren argumenterade emot att
fixa dem nu, och argumentet håller: regelns evidensbas (Siefke; Geraci & Rajaram) är ordlistor med färg
eller semantisk kategori, `write-flashcards/SKILL.md` säger **själv** att markdown-emfas är omätt, och
vid en muntlig tenta ändrar markeringen inte orden han övar — bara vad ögat fastnar på i förväg. Med sex
dagar kvar ger drillning mer än 110 omformateringar. **Skjuts till efter tentan.** Per kapitel:
kap 01 2, kap 02 3, kap 06 18, kap 11 30, kap 16 35, kap 17 22.

### Vad fakta- och täckningsgranskarna inte hittade

Fakta mot boken: **noll sakfel, noll tillplattade garderingar, noll felaktiga avsnittshänvisningar** över
~55 kontrollerade påståenden, inklusive alla åtta passager som pekats ut som högrisk efter
sammanslagningar. Täckning i kapitel 1, 2 och 6: **noll föräldralösa talpunkter** av 82 kontrollerade.
Täckning i 11, 16 och 17: 102 talpunkter kontrollerade, och **ingen överskärning mot någon namngiven
klausul** — prestandasiffrorna, X.509:s fyra fält, TLS-handskakningens fyra steg och kapitel 16 fråga 5
är alla intakta.

### Kalibreringen missades igen, för femte gången i rad

Notmålen missades åt samma håll varje gång, även mot granskarnas egna konservativa tak: kapitel 11 landade
på 600 mot taket 540, kapitel 16 på 500 mot 430, kapitel 06 på 387 mot 370. Bara kapitel 17 träffade
(447 mot 447). **Kortmålen träffades som vanligt.** Lärdomen från del 1 står kvar och är nu bevisad en
gång till: sluta uppskatta totaler, budgetera per fråga — och notlängden sitter i antalet tentafrågor,
inte i hur mycket slask som fanns att ta bort. I dessa sex kapitel fanns knappt något slask alls.

## Fällor som denna omgång lade till

- **Mönstret `oldStr="\nKORT\n"` → `newStr="\n"` lämnar en dubbel blankrad** varje gång, alltså MD012.
  Census fångade tre i kapitel 6. Använd `oldStr="\nKORT\n\nNÄSTA"` → `newStr="\nNÄSTA"` i stället, eller
  kör en kollaps efteråt.
- **Radera aldrig det sista kortet under en rubrik utan att avgöra vad rubriken var till för.** I
  kapitel 1 tog jag bort `## Samtidighet` med dess enda kort, och decket tappade en av de åtta utmaningar
  fråga 3 handlar om. Census kan inte se det: kortantalet stämde.
- **Ett faktastycke som läggs till för att laga en föräldralös talpunkt kan dubblera ett stycke som redan
  finns.** Sök efter begreppet i hela frågan innan du skriver, inte bara i talpunkterna.

## Fällor som gäller just detta arbete

- **T8:** radnumren ovan blir fel vid första skrivningen. Kapitel 11 och 16 bearbetas i **fallande
  radordning**, eller så läses filen om efter varje skrivning. Kapitel 11:s granskare flaggade själv
  att numren i bakre halvan är ±1.
- **Talpunkterna under `### Muntligt svar` går sönder tyst** när fakta de vilar på försvinner. Elva
  sådana fanns i del 1. Varje gång ett faktastycke stryks läses talpunkterna i samma fråga om.
- Kapitel 16:s och 17:s deck har få `||`-kort (4 respektive 8), så **T20** är mindre farlig här än i
  del 1 — men gäller fortfarande.

## Öppen fråga till författaren

Notmålet 150–250 rader, som han satte 2026-09-09, **kan inte nås för kapitel 11, 16 och 17**. De
landar på 540, 430 och 447. Skälet är strukturellt: kapitel 11 har åtta examinerbara klausuler och
kapitel 17 har tre frågor om samma protokoll. Att pressa dem till 250 innebär att ta bort svar på
frågor läraren kallat viktigast att öva på.

Alternativet, om han vill ha kortare noter ändå, är att sänka ambitionen **per fråga** — färre
faktarader bakom varje talpunkt — och det är ett beslut om hur mycket han vill kunna säga, inte om vad
som är avfall.
