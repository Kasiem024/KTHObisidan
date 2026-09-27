# HI1031 tentaprojekt — återinträdesprompt

> [!important] This is no longer the re-entry file
> The HI1031 exam-prep project it describes is **finished**, and the current re-entry prompt lives
> at **`.kiro/reentry.md`**. Go there first. Keep reading this file only if the task is HI1031
> again — it is the archive of that project, and its calibration numbers, book line offsets,
> confirmed errata and reviewer briefs are still accurate and still expensive to re-derive.
>
> **Two figures in here are superseded.** The card target of **40–60 per deck** was replaced on
> 2026-09-26 by "as few as possible, as concentrated on the exam questions as possible" — 40 is not
> a floor, and the ten decks now hold 15 to 29 cards each, 219 in total. The **exam date** of
> 21–23 September 2026 is past; the exam was moved and no new date has been given. See
> `.kiro/steering/product.md` and `.kiro/steering/current-state.md`, which are the live files.

**Detta är den enda filen du behöver få pekad på.** Den skrivs över i slutet av varje
kontextfönster, precis före `/compact`, och innehåller allt som behövs för att fortsätta arbetet.
Läs den hela innan du gör något.

**Uppdatera den innan du säger "kör compact".** Skriv om `BÖRJA HÄR`, `DECKENS LÄGE`,
kalibreringstabellen och `Senaste kända värden`. Lämna resten som
det är om inget nytt lärt sig — reglerna och fällorna är dyrköpta och ska inte tappas.

Senast uppdaterad: **2026-09-10**. **Tentafrågeprojektet är klart och genomgånget.** Nästa uppgift är
mappen `Begrepp/` för HI1031 — den står först, under `FÖRSTA UPPGIFTEN EFTER ÅTERINTRÄDE`.

**Filen har vuxit ur sitt namn.** Den heter `hi1031-tenta-reentry.md` efter tentafrågeprojektet, men är
nu återinträdesfilen för HI1031-arbete i allmänhet. Byt inte namn — det är sökvägen han ger vid varje
återinträde.

---

## FÖRSTA UPPGIFTEN EFTER ÅTERINTRÄDE

**Titta på mappen `Begrepp/` för HI1031 och noterna i den.**

```text
KTH/2026 Höst/HI1031 Distribuerade informationssystem/Begrepp/
```

**14 noter, 19–28 rader var, 17 flashcards tillsammans, noll SR-markörer, alla taggade `nosr`.** Alla har
`## Definition`, `## Kopplat till` och `## Flashcards`. **Ingen har `## Tenta-fokus`** — och det är
==inte ett fel==, avsnittet är valfritt enligt standarden.

**Han har bara sagt "titta på".** Det är en inspektionsuppgift. Inventera, rapportera vad du ser, låt
honom styra vad som ska göras. **Gissa inte fram ett omskrivningsuppdrag.**

**Tre saker du kan gå fel på direkt:**

1. **Dubbletter mot kapiteldecken är tillåtna och ska inte städas.** `Begrepp/` är referensmaterial som
   delas mellan kurser. Flera av de 14 termerna finns med avsikt även i kapitel 4, 5, 6, 10, 16 och 17:s
   deck. Fattat beslut i `product.md`.
2. **`## Flashcards` måste vara sista avsnittet.** Auditen kontrollerar det och sajtbygget är beroende av
   det. Nya avsnitt går ovanför.
3. **`nosr` rörs inte och tas inte upp.**

**Fullständig briefing med tabell per not, vad som är värt att titta på och vilket skript som äger
siffrorna:** se `BÖRJA HÄR — mappen Begrepp/` längre ner i denna fil. Läs den innan du börjar.

**Resten av filen** är tentafrågeprojektet, som är klart. Reglerna om språk, kortdata, verifiering och
fällor gäller fortfarande allt arbete i detta vault — hoppa inte över dem.

---

---

## MÅL

Kasiem ska klara kursens muntliga tentamen i HI1031 Distribuerade informationssystem:
**muntlig enskild examination, 21–23 september 2026.**

Han läser **inte** kursboken. Han lär sig av det du skriver: teorifilen och flashcardsen. Han skriver av
faktan för hand och organiserar sina egna anteckningar efter viktiga begrepp medan han gör det. Det är hela
hans metod.

Målet är att kunna besvara kursens tentafrågor — ingenting mer. **Varje not måste därför vara
självbärande och korrekt, för han kan inte upptäcka fel.**

**Han har gett full frihet över korten**, 2026-09-10: *"bry dig inte om ett kort har historik, om den inte
är nödvändig kastar du den. du har också frihet att omformulera kort med historik."* Undantaget står nu
inskrivet i `conventions.md` §1. **Fråga inte om lov för att stryka ett markörbärande kort** — men bevisa
aritmetiken ur `-Compare`:s per-fil-rader efteråt.

## HUR DU SKA ARBETA

**Stanna inte för att rapportera.** Fråga inte om lov. Arbeta vidare tills uppgiften är klar eller
kontextfönstret tar slut.

**Detta gällde när kapitel skrevs, och gäller fortfarande för allt större arbete:** efter varje avslutad
enhet, i denna ordning:

1. Kör verifieringskedjan.
2. Starta de 5 adversariella granskarna som subagenter. De rapporterar bara, ändrar inget.
3. Åtgärda deras fynd. Gå emot dem när de har fel, men kontrollera själv mot boken först.
4. Kör verifieringskedjan igen.
5. **Granska ditt kontextfönster och var ärlig.** Räcker det till en hel enhet till: fortsätt direkt.
   Räcker det inte: **uppdatera denna fil**, och säg sedan bara "kör compact".

**Så bedömer du ärligt.** Ett kapitel kostade 600–900 nya bokrader lästa, två filer skrivna, fem
granskarrapporter lästa, plus åtgärder. Tumregeln höll varje gång: **ett kapitel per kontextfönster.**

**Det starkaste varningstecknet är slarvfel, inte känslan av utrymme.** Räkna dina egna misstag under
arbetet. **Två eller fler betyder stopp**, oavsett hur mycket plats du tror du har.

**Vid en granskningsuppgift över många filer:** kör granskarna **parallellt, en per fil eller kapitel**, med
varje rapport kapad till 20–25 rader, och **skriv fynden till en varaktig fil innan du börjar åtgärda**.
Åtgärderna spänner över flera kontextfönster och rapporterna dör med fönstret annars. Genomgången av alla
tio kapitel gjordes så, och fyndfilen är `.kiro/reports/hi1031-genomgang-2026-09-10.md`.

**Den risk som avgör när något skrivs ur boken:** läsning och skrivning måste ligga i samma obrutna
kontext. Slår kompakteringen till mellan läsningen och skrivningen skriver du ur ditt eget sammandrag
i stället för ur boken — och han kan inte upptäcka det, eftersom han inte läser boken.
**Stoppa hellre för tidigt än för sent.**

## SPRÅK OCH OMFÅNG — överordnat allt annat

Han sa 2026-09-09 att språket var "för komplicerat och vetenskapligt", att korten var "alldeles för
många" och att scopet nog var "för brett". Inskrivet i `.kiro/steering/product.md` och
`.kiro/skills/write-flashcards/SKILL.md` regel 15.

1. **Vardaglig svenska.** Korta ord, korta meningar, som du skulle säga det högt. Facktermer är helt
   OK — de är tentans vokabulär. Akademisk ton är det inte: *skillnaden* inte *distinktionen*,
   *bygger på* inte *vilar på*, *gör att* inte *medför att*, *så* inte *således*. Skriv ingen mening
   du inte skulle säga till en klasskamrat.
2. **Få kort.** Kortantal är en **kostnad**, inte ett mått på täckning.
3. **Korta kort.** Ett faktum, en eller två rader.
4. **Smalare scope.** Är något inte direkt relaterat till en tentafråga är det irrelevant. **Ta bort
   det — korta det inte.**

**Måtten:** **40–60 kort** per deck, **150–250 rader** per teorifil.

### Räkna budgeten per fråga INNAN du skriver

| Kapitel | Frågor | Kort | Notrader | Rader per fråga |
|---|---|---|---|---|
| 1 | 5 | 61 | 286 | 53 |
| 2 | 5 | 54 | 268 | 54 |
| 4 | 6 | 60 | 370 | 62 |
| 5 | 4 | 44 | 295 | 74 |
| 6 | 5 | 51 | 394 | 79 |
| 9 | 5 | 54 | 409 | 82 |
| 10 | 5 | 59 | 450 | 90 |
| 11 | 5 (8 delfrågor) | 52 | 721 | 90 per delfråga |
| 16 | 5 | 50 | 600 | 120 |
| 17 | 4 | 43 | 526 | 132 |

**Kapitel 17 är projektets värsta överdrag: budget 370, resultat 546 före strykningar, alltså 48 procent
över — och talpunkterna var skrivna till filen först.** Slutsatsen är obekväm men mätt: **att skriva
talpunkterna först är nödvändigt men inte tillräckligt.** Det som saknades var det andra ledet — att
**stanna när en frågas radkvot är slut**. Kvoten var 60 faktarader per fråga; de fyra blocken blev 86, 90,
100 och 90. Ingen enskild rad var fel, men ingen räknade heller.

Golvet är strukturellt: varje fråga kostar **55–90 notrader** (fakta plus `### Muntligt svar`), plus
cirka 6 raders header och 15 rader `## Luckor och källor`. **Radmålet 250 har bara nåtts en gång.**

**Räkna om budgeten efter frågornas FORM, inte bara antalet.** Skalan, mätt över sju kapitel:

| Frågans form | Kostnad |
|---|---|
| Enkel — "Beskriv vad X är" | ~55 rader |
| Tvådelad — "Beskriv X **och hur det implementeras**" | ~75 rader |
| Tredelad — tre frågetecken i samma punkt | ~90 rader |

Formeln: `enkla × 55 + tvådelade × 75 + tredelade × 90 + 21`.

**MEN FORMELN UNDERSKATTAR, systematiskt och med ungefär 20 %.** Detta är mätt, inte gissat:
kapitel 9 fick budgeten 330 och blev **409**; kapitel 10 fick 370 och blev **450**. Båda ligger cirka
80 rader över. **Multiplicera formelns svar med 1,2** och skriv mot den siffran. För kapitel 10 hade
det gett 444, alltså nästan exakt rätt.

**Och var ärlig om vad budgeten är till för.** Den har missats i **sju kapitel av sju**. Dess verkliga
värde är inte att träffa ett tal, utan att tvinga dig att bestämma **vad som ska utelämnas innan du
skriver**. Trimningen efteråt återvinner bara omkring 7 % av raderna — i kapitel 10 gick noten
496 → 450 trots tio strykningar, eftersom fjorton rader glosor lades till samtidigt.

**Räkna ALLTID med glosbudgeten.** Täckningsgranskaren hittar odefinierade termer i varje kapitel, och
att glossa dem är den enskilt mest värdefulla åtgärden granskarna ger — men den ==lägger till== rader.
Kapitel 9 gick 406 → 409 **trots** sex strykningar; kapitel 10 lade till sex glosor (säker hash,
O(log N), topologi, namnrymd, självorganiserande, best-effort) på cirka 14 rader. **Lägg 15 rader i
budgeten för glosor från början**, och glossa när du skriver, inte i efterhand.

**Skriv inte långt och trimma sedan.** Det har misslyckats i **varje** kapitel: kapitel 4 skrevs på 469
rader, kapitel 5 på 317, kapitel 6 på **529** mot en budget på 300, kapitel 9 på 406 mot 330, kapitel 10
på **496** mot 370.

**Och när du trimmar: skär SCOPE, inte ord.** Detta är det fel du gör om och om igen. I kapitel 5
sparade en hel omskrivningsrunda **8 rader av 70**. I kapitel 6 gick första omskrivningen 529 → 446 och
andra 446 → 406, båda genom att komprimera formuleringar, medan **åtta riktade strykningar av hela
stycken tog bort 30 rader på en bråkdel av arbetet**. Komprimerad prosa radbryts till samma radantal.
Ta bort hela punkter och stycken.

**Låt omfångsjägaren avgöra hur mycket som ska bort.** I både kapitel 6 och 9 sa den självmant att
noten **inte** skulle tvingas ner till målet, med motiveringen att de sista raderna är just de svar
tentan begär. Den bedömningen har följts och varit rätt. Den är också bättre än din egen — du har
underskattat längden i varje kapitel. **Men den överskattar ibland åt andra hållen:** i kapitel 10 bad
den om 89 raders strykningar och cirka 33 togs, eftersom resten var sådant tentafrågan uttryckligen
kräver (Gnutella och sökstrategierna hör till fråga 4:s tredje del, prefixrutning är svaret på "hur
hittar man en resurs", och kontrasten funktionellt/icke-funktionellt är det som gör fråga 3 begriplig).
**Läs dess motivering, inte bara dess lista.**

**RÄKNA KORTEN INNAN DU VERIFIERAR.** Nytt fel i kapitel 10: decket skrevs på **66 kort** mot målet
40–60, och det upptäcktes först i `kverify.ps1`. Kortantalet drar iväg på `::`-korten — planen sa ~30
enradiga och det blev 49. **Räkna medan du skriver, per tentafråga**, och håll dig till ungefär 10 kort
per fråga. Ett deck på 66 måste ändå ner, så arbetet blir gjort två gånger.

**Tekniken som NU ÄR BEVISAD — men bara om du gör den på riktigt:** skriv `### Muntligt svar` FÖRST,
som ett arbetsutkast med sex talpunkter per fråga. Skriv sedan **bara** de fakta de sex punkterna
behöver, och kasta resten av det du läst. Filens ordning ska fortfarande vara fakta först och muntligt
svar sist — det är bara din skrivordning som ändras.

**Mätningen som visar att det fungerar, och vad som förstör det.** Kapitel 11 skrevs i två fönster och
gav ett kontrollerat experiment:

- **Fönster A skrev talpunkterna till filen först** och landade på **329 rader mot en budget på 330** —
  första gången på åtta kapitel som budgeten hölls, utan någon trimningsrunda alls.
- **Fönster B skisserade dem bara i huvudet** och landade på **406 rader mot 330**, alltså 23 % över —
  exakt samma överdrag som kapitel 9 och 10.

**Skillnaden är att faktiskt skriva ner dem, inte att tänka dem.** Ett utkast i huvudet disciplinerar
ingenting. Skriv talpunkterna som text innan du skriver en enda faktarad.

**Och trimningen efteråt räddar dig inte.** Kapitel 11 gick 734 → 721 efter sju scope-strykningar,
eftersom fyra glosor lades till samtidigt — **13 rader netto av cirka 30 strukna**. Samma mönster som
kapitel 9 (406 → 409 trots sex strykningar) och kapitel 10 (496 → 450 trots tio).

**Rör inte notstrukturen.** Fakta först, `### Muntligt svar` sist per fråga. Han har uttryckligen
avvisat att vända på den, med sin egen motivering:

> jag kommer ändå skriva ner faktan först, det är hela poängen med hur jag lär mig jag skriver ner
> det du skriver och jag strukturerar det jag skriver ner baserat på viktiga begrepp

Han fick en gång frågan om `### Muntligt svar` kunde tas bort för att nå 250 rader och **svarade
inte — fråga inte igen, behåll dem.**

## BESLUT SOM ÄR FATTADE — ifrågasätt dem inte

1. **`nosr`-taggen rörs inte och tas inte upp.**
2. Dubbletter över kapitelgränser är OK. Varje deck ska besvara sina egna frågor.
3. Det spelar ingen roll var i boken svaret finns. Ange avsnitt, gör ingen sak av det.
4. **Saknas svaret i boken: säg det**, skriv in det i `## Luckor och källor`, **hitta aldrig på**.
   Undantaget var MVC i kapitel 2, som tentan kräver och boken saknar helt — där gavs allmän kunskap,
   tydligt flaggad som icke-bokens. Gör likadant om det återkommer.
5. Inga bilder, inga diagram. Testat och avvisat.
6. Granskarna rapporterar bara. Du åtgärdar.
7. Egna slutsatser märks **"Så kan du tänka"** i noter och **"(egen slutsats)"** på kort.

## DEN FELTYP DU OFTAST GÖR

**Uppgradera aldrig bokens gardering till ett påstående.** Detta har fångats i tre kapitel i rad och
är ditt vanligaste fel:

- Kapitel 2: underhållbarhet kallades "bokens huvudargument" när boken bara nämner den först.
- Kapitel 4: nätverksvirtualisering "löser dilemmat i Saltzers end-to-end-argument" — boken skriver
  "**suggests** an answer to the dilemma" och "**partially** address the problems".
- Kapitel 5: "boken säger att program **måste** minimera antalet fjärranrop" — boken skriver
  "this **suggests** that programs need to take this factor into account, **perhaps** by minimizing
  remote interactions". Samma runda fångade även *should* → *måste* och ett tappat *generally*.

När boken hedgar — *suggests*, *may*, *should*, *generally*, *often*, *typically*, *in most cases* —
**måste garderingen med i noten.**

**I kapitel 11 var garderingarna för första gången rena** — källgranskaren gick igenom nio flaggade
hedgar och hittade inget ställe där noten påstod rakt ut. Felet är alltså möjligt att undvika: leta
aktivt efter bokens hedge-ord medan du skriver, inte efteråt.

## DEN ANDRA FELTYPEN: DITT EGET `## Luckor och källor`

**Kontrollera varje siffra och varje påstående i luckavsnittet innan du är klar.** Det är det enda
stycket i noten som handlar om *filen själv* i stället för om boken, så ingen faktakontroll mot boken
fångar det. Tre gånger nu har en granskare fått hitta felet:

- **Kapitel 10:** jag skrev att figur 10.1 hade "2 av 6 rader" — i själva verket finns fyra
  radetiketter.
- **Kapitel 11:** jag skrev "alla nio delfrågor" när tentan har **åtta** (fråga 5 är bara en rubrik över
  5.1 och 5.2), och jag påstod att Kerberos nämndes i fråga 2 när ordet bara fanns i luckavsnittet
  självt.

**Tre konkreta kontroller innan du säger att du är klar:** räkna delfrågorna i filen och jämför med
tentan; sök upp varje term du påstår förekommer någonstans i noten; och räkna om varje "N stycken" du
skrivit.

**I kapitel 16 var luckavsnittet för första gången felfritt** — källgranskaren kontrollerade alla fem
påståenden och samtliga höll. De tre kontrollerna ovan är alltså det som behövs; gör dem.

## DEN TREDJE FELTYPEN: DUBBLETTER ÖVER SEKTIONSGRÄNSER

**När flera tentafrågor täcker samma material flyttar dubblettrisken från "inom en sektion" till "mellan
sektioner", och då ser du den inte.** Ny i kapitel 16, där fråga 3, 4 och 5 alla handlade om samma tre
metoder. Jag delade upp ägandet i förväg, skrev noten utan att upprepa mig — och byggde ändå **två
dubblettpar i decket**, mellan sektion 4 och 5 och mellan sektion 1 och 4. Kortgranskaren fångade båda.

Skälet är att man räknar kort **per sektion** medan man skriver, vilket är rätt för antalet men blint för
innehållet: varje sektion ser rimlig i sig. **Gör därför en läsning av hela decket i följd innan du
verifierar**, och leta specifikt efter kort vars svar kunde bytas mot varandra.

**Åtgärden är inte alltid att stryka det ena.** I kapitel 16 var båda korten i ett par det direkta svaret
på sin egen tentafråga, så att bara ta bort ett hade lämnat en fråga sämre besvarad. Det som fungerade var
att **skriva om det ena så att det testar ett faktum som ingen kort hade** — deadlockens vanlighet i
interaktiva program, respektive vad som händer vid konflikt hos alla tre metoderna. Dubbletten försvann
och ett nytt faktum kom in.

**Men en lagning kan skapa ett nytt fel.** I kapitel 17 lagade jag dubbletten mellan `uncertain` i avsnitt
2 och 4 genom att fylla avsnitt 4:s kort med allt som var unikt för det — och gjorde det därmed
**överlastat med fyra fakta**. Kortgranskaren fick fånga det. **Läs om kortet efter varje lagning och
räkna fakta på det**, precis som om det var nyskrivet.

### Ett värre fel än dubbletten: nästan identiska framsidor

**Två kort vars framsidor nästan är identiska men vars svar skiljer sig är sämre än en ren dubblett**, för
då blir båda obesvarbara — ledtråden avgör inte svaret. Kapitel 17 hade ett sådant par: *"vad får en
deltagare göra om den är klar men aldrig fått något `canCommit?`"* i avsnitt 2 och *"vad gör en
subtransaktion som aldrig får något `canCommit?`"* i avsnitt 3. Svaren är ==ensidig abort== respektive
==fråga med `getStatus`==, och decket hade dessutom ett tredje svar på samma ledtråd, ==`getDecision`==, i
avsnitt 4.

**Lagningen är att skriva situationen in i framsidan**, inte att stryka något: "I vanlig 2PC…" och "I
nästlad 2PC…". **Sök igenom decket efter framsidor som börjar likadant** innan du verifierar — det är
samma blindhet som ger dubbletter över sektionsgränser, men den kostar mer.

## KÄLLOR

- **Tentafrågorna:** `KTH/2026 Höst/HI1031 Distribuerade informationssystem/Filer/Canvas/Tentor/Tentafrågor HI1031 Distribuerade informationssystem.md`
- **Boken, 20 681 rader:** `KTH/2026 Höst/HI1031 Distribuerade informationssystem/Filer/Litteraturlista/Distributed Systems Concepts and Design 2012 Edition 5.md`
- **Samma bok som PDF i samma mapp.** Se nästa avsnitt.
- **KursPM:** `.../Filer/Canvas/Kursinformation/KursPM HI1031 Distribuerade informationssystem (HT26).md`
- **REST-artikeln:** `KTH/2026 Höst/HI1031 .../Filer/Webbsidor/REST - restfulapi.net.md` — restfulapi.net
  "What is REST?", som KursPM kräver för kapitel 9. En städad kopia med frontmatter och källhänvisning.
  **Sökvägen stod fel i denna fil fram till kapitel 9** — den pekade på `.kiro/reports/rest.md`, dit
  filen sparades först men varifrån den flyttades (se F-posten i backloggen). **Obs att `glob` inte
  hittar den**, för `**/Filer/Webbsidor/` är gitignorerad och glob respekterar `.gitignore`; använd
  läsverktyget på hela sökvägen, eller lista katalogen.

`Filer/` är utanför auditens scope och gitignorerad. **Läs den, ändra den aldrig.**

## BOKENS TEXTVERSION TRUNKERAR BREDA TABELLER

Breda jämförelsetabeller är sönderklippta i `.md`-versionen: högerkolumnen tom, rader kapade, hela
rader borta, ibland hela figuren tom. Bekräftat och åtgärdat på:

| Figur | Vad som fattas | PDF-sida |
|---|---|---|
| 2.1 | trunkerad, men ingen fråga behöver den | – |
| 4.15 | 4 av 8 rader, hela Motivation-kolumnen tom | 192 |
| 4.18 | MPI:s send-varianter, men MPI är utanför scope | – |
| 5.6 och 5.7 | **helt tomma**, bara figurtexten finns | – |
| 5.9 | alla tre kolumnrubrikerna saknas | 214 |
| 6.1 | radetiketterna borta, celltexten kapad | – |
| 6.13 | förvanskade rubriker ("Ffiltering") | – |
| 6.27 | radetiketterna för *Space-uncoupled* och *Communication pattern*, cellerna under *Style of service*, och hela *Main intent* utom ordet "Reliable" | 292 |
| 9.19 | Description-kolumnen kapad mitt i mening; ingen fråga behöver den | – |
| 10.1 | radetiketterna för *Network dynamics* och *Security and anonymity* saknas helt; av de 4 kvarvarande raderna har bara en något i högerkolumnen | 442 |
| 10.11 | hela den ostrukturerade kolumnen tom | 462 |
| 11.13 | rubrikraden sammansmält med TEA-raden, så TEA:s tre värden ligger inne i kolumnrubrikerna; alla siffror läsbara | – |
| 11.18 | **finns inte alls** i textversionen: bildtexten står två gånger och diagrammet under den andra är i själva verket figur 11.19:s record-protokoll | 529 |
| 16.9 | hela *Reason*-kolumnen kapad mitt i mening i alla tre rader, och de två första kolumnerna saknar rubrik; ja/nej-värdena läsbara | 702 |
| 16.10 | **helt tom** — bara bildtexten finns; löptexten ger dock hela exemplet, så ingen återställning behövdes | – |
| 16.15 | rubrikraden sammansmält, så "read write" ligger i en cell; alla fyra värden ändå läsbara | – |
| 16.29 | olikhetstecknet i regel 1 saknas, och **saknas även i PDF:ens textextraktion** — alltså inte kontrollerbart på den vägen i någon källa. Regel 2 och 3 intakta | – |
| 17.22 | **hela *Action*-kolumnen kapad mitt i mening i fem av sex rader** — och detta är figuren som *är* svaret på fråga 4 | **776** |
| 17.18 | radetiketterna för *Transaction status* och *Intentions list* saknades helt, och intentions-raden var kapad | **768** |
| 17.19 | loggen för banktjänsten, svårt förvanskad — men prosan går igenom hela exemplet steg för steg | – |
| 17.20 | **helt tom**, bara bildtexten — shadow versions ligger utanför tentafrågorna | – |
| 17.14 | reducerad till lösa fragment; prosan förklarar fantomdeadlocken i sin helhet | – |

**Kapitel 17 är färdigkontrollerat.** Hela: figur **17.4**, **17.5**, **17.7**, **17.10** och **17.11** —
och skälet är värt att minnas: **de är formaterade som text, inte som tabeller.** Det är tabellformatet som
går sönder i konverteringen. Skadade: 17.22, 17.18, 17.19, 17.20 och 17.14 enligt tabellen. Figur **17.9**
och **17.12** har stympade rubriker men läsbara värden. Figur 17.1, 17.2, 17.3, 17.6, 17.8, 17.13 och 17.15
är diagram.

**Snabbaste vägen att hitta en figur i PDF:en:** siffran i bokens bildfilnamn, `_page_NNN_`, **är**
PDF-sidindexet. Figur 17.15 låg under `_page_763_`, så figur 17.22 cirka 260 bokrader senare gissades till
sidindex ~773 och hittades på 776 vid en svepning över 760–790. Kapitel 16 gick på cirka **26 bokrader per
PDF-sida**, och kapitel 17 ligger nära samma.

**Kapitel 16 är färdigkontrollerat.** Hela: figur 16.14, 16.16, 16.19, 16.23 och 16.32, samt figur
16.22:s väntetabell. Skadade: 16.9, 16.10, 16.15 och 16.29 enligt tabellen. Figur 16.6 och 16.12 har
förskjutna rubrikrader men läsbara värden. Figur 16.20, 16.21, 16.28, 16.30, 16.31 och 16.33 är diagram
utan tabell.

**Kapitel 11 är färdigkontrollerat.** Hela: 11.1, 11.2, 11.3, 11.4 och 11.12. Skadade: 11.13 och 11.18
enligt tabellen ovan. Figur 11.5, 11.6, 11.10, 11.11, 11.16, 11.17 och 11.19 är diagram utan tabell, och
11.7–11.9 är C-kodlistningar.

**Kapitel 16 och 17 har breda tabeller kvar att kontrollera.** Gör det som rutin. I kapitel 9 var
figur 9.12, 9.16 och 9.17 hela — bara 9.19 var kapad, och den behövdes inte. I kapitel 10 är figur
10.4, 10.5 och 10.14 hela, 10.7 i stort intakt, och 10.2/10.3/10.6/10.12/10.16 är bilder utan tabell.

Python 3.12 och `pypdf 5.1.0` finns. Mönstret:

```python
import glob, io
from pypdf import PdfReader
cand = glob.glob(r"G:\My Drive\KTHObsidian\KTH\*\HI1031*\Filer\Litteraturlista\*.pdf")
reader = PdfReader(cand[0])
out = []
for i, page in enumerate(reader.pages):
    t = page.extract_text() or ""
    if "din figurrubrik" in t:
        out.append("=== PAGE %d ===" % i); out.append(t)
with io.open(r"C:\Users\ekasalm\AppData\Local\Temp\fig.txt", "w", encoding="utf-8") as f:
    f.write("\n".join(out))
```

Skriv utdata till `%TEMP%` och läs filen med läsverktyget — **stdout trunkerar å ä ö**. Färdiga
skript ligger kvar: `%TEMP%\fig59.py`, `fig415.py`, `fig101.py`, `figs.py`.

## DECKENS LÄGE

| Deck | Kort | SR-markörer | I repetition |
|---|---|---|---|
| Kap 01 | **61** | **61** | ja |
| Kap 02 | **53** | **15** | ja |
| Kap 04 | **58** | 0 | **nej — `nosr`** |
| Kap 05 | **42** | 0 | **nej — `nosr`** |
| Kap 06 | **50** | 0 | **nej — `nosr`** |
| Kap 09 | **50** | 0 | **nej — `nosr`** |
| Kap 10 | **58** | 0 | **nej — `nosr`** |
| Kap 11 | **49** | 0 | **nej — `nosr`** |
| Kap 16 | **50** | 0 | **nej — `nosr`** |
| Kap 17 | **43** | 0 | **nej — `nosr`** |

**Siffrorna ovan är efter genomgången 2026-09-10**, då alla tio kapitel gicks igenom mot två frågor: är
allt innehåll nödvändigt för tentafrågorna, och är språket vardagligt. Fynden och vad som gjordes står i
`.kiro/reports/hi1031-genomgang-2026-09-10.md`. **Kasiem gav då full frihet att stryka och skriva om kort
även när de bär repetitionshistorik** — sju kort ströks ur kapitel 1 med sina markörer. Fråga inte om lov
för det igen.

**Kapitel 1 har FEM tentafrågor, inte fyra** som denna fil länge påstod. Noten besvarar alla fem; fråga 5
om IP och RFC har egen rubrik och fyra egna kort. Det var ett dokumentationsfel, inte en lucka.

**Kapitel 1 är det enda decket med hans repetitionshistorik.** Markörer är levande data, får aldrig
flyttas eller skrivas om, och `<!--SR:...-->` ska vara byte-identiskt före och efter. I övriga deck
finns inga markörer — skär fritt.

**Noterna för kapitel 4, 5, 6, 9 och 10 är otrackade i git** (skapade efter senaste commit), så de
syns inte i `git diff --numstat`. Det är normalt, inte ett tecken på misslyckad skrivning — mät
notens radantal med `kverify.ps1`, inte med git.

## LEVERANSER PER KAPITEL — båda ur samma läspass

**A.** `HI1031 Tentafrågor och Svar - Kap NN <samma namn som decket>.md` i kursens `Anteckningar/`:
frontmatter `tags: [tenta, HI1031, databaser, programmering, KTH, year2026]` plus `description`,
`created`, `updated`; H1 = filnamnet; en H2 per tentafråga **utan avslutande punkt**; "Bokens
avsnitt: X" under rubriken; faktapunkter med fet etikett för mekanism, fördel, nackdel, felfall;
"Så kan du tänka" för egna förklaringar; `### Muntligt svar` sist per fråga med 5–6 numrerade
talpunkter; `## Luckor och källor` sist i filen.

**B.** Bygg om decket `HI1031 Begrepp - Kap NN …`: en H2 per tentafråga, 40–60 kort.

**Separatorer:** `::` enradigt enkelriktat, `;;` enradigt **omvänt**, `||` flerradigt enkelriktat,
`??` flerradigt omvänt. Byt aldrig separator på ett kort som bär en markör. Undvik ja/nej-kort och
listkort med fler än fem punkter.

**Ett `;;`-kort måste ha en baksida som entydigt pekar tillbaka på framsidan.** Detta har fångats i
kapitel 2, 4 och 5. Och **gör aldrig flera `;;`-kort vars baksidor liknar varandra** — de tre
anropssemantikerna i kapitel 5 var `;;` och blev omöjliga att skilja baklänges, så de gjordes `::`.

## ARBETSGÅNG

1. Läs kapitlets tentafrågor ordagrant.
2. Mappa varje fråga till bokavsnitt. Kontrollera breda tabeller mot PDF:en.
3. **Räkna budgeten:** frågor × 10 kort och × 60 notrader. Skriv mot den siffran.
4. Läs de mappade avsnitten — i detta kontextfönster.
5. `Get-SRIntegrity.ps1 -Save` **omedelbart** innan du rör decket.
6. Skriv noten och bygg om decket ur samma läsning.
7. Verifiera, granska, åtgärda, verifiera igen.
8. Bedöm kontextfönstret. Uppdatera denna fil om du ska stoppa.

## DE FEM GRANSKARNA

Alla `kiro_default`, read-only, parallella (inget `depends_on`). **`subagent`-steg kräver fältet
`role`** — utan det faller schemavalideringen. **Varje brief måste kräva högst 20–25 rader**, annars
skriver de tusentals ord. Ge var och en de fullständiga filsökvägarna och tentafrågorna ordagrant.

- **Omfångsjägaren** — vad tjänar ingen tentafråga? Ge den kortantalet och radantalet, och kräv att
  den namnger **exakt vilka kort som ska bort, ordagrant, rangordnade sämst först**, plus vilka
  notstycken som ska skäras. Säg uttryckligen att `### Muntligt svar` och notstrukturen är låsta.
- **Faktagranskaren** — kontrollera varje påstående, siffra och citat mot boken. Ge den en **numrerad
  lista över de påståenden du själv är minst säker på**, och bokens radintervall för kapitlet. Varna
  för falska negativa: boken radbryter mitt i meningar, siffergruppering varierar (60,000 mot
  60 000), sök skiftlägeskänsligt, och **rapportera aldrig "saknas i boken" på ett enda negativt
  sökresultat**.
- **Täckningsgranskaren** — per fråga: räcker materialet för ett muntligt svar på en minut, och
  vilken enda följdfråga är obesvarad? **Be den särskilt leta efter termer som materialet ANVÄNDER
  men aldrig DEFINIERAR** — det är dess mest värdefulla fynd och har gett träffar i både kapitel 4
  (`at-least-once`, Saltzers argument) och 5 (`SOAP`, `Serializable`, `lös koppling`,
  `flödeskontroll`). Är någon fråga en **värderingsfråga**, be den bedöma om han kan *ta och försvara
  en ståndpunkt*, inte bara räkna upp fakta.
- **Kortgranskaren** — dubbletter inom decket (viktigast), separatorval, kort som testar mer än ett
  faktum, ja/nej-kort, för långa listkort, och om språket är vardagligt nog. Säg att vissa kort
  **medvetet slagits ihop** för att hålla antalet nere, och fråga vilka sammanslagningar som gått för
  långt.
- **Källgranskaren** — är de påstådda luckorna verkliga, stämmer alla avsnittsnummer, och är något
  som står som **bokens** påstående i själva verket ditt eget? **Be den uttryckligen leta efter
  ställen där boken hedgar men noten påstår rakt ut** — det har gett det enda substantiella fyndet
  i två kapitel i rad.

De hittar riktiga fel varje gång. **Behåll alla fem — överlappet är det som fångar saker.**

## VERIFIERING — i denna ordning, varje kapitel

1. `Get-SRIntegrity.ps1 -Save` före deckändringen, `-Compare` efter. Exit 1 är förväntat.
   - **`markers placed on cards` ska vara oförändrat.**
   - **`activeCards`-deltat ska vara exakt nya minus gamla kortantalet.** Stämmer det inte har du
     räknat fel — lös det innan du går vidare. Kapitel 5: 2404 → 2346, alltså −58, exakt 102 → 44.
   - **För ett `nosr`-deck rör sig `cards excluded by nosr`, inte `activeCards`.** Kapitel 9, 10, 11,
     16 och 17 är alla `nosr`, så detta gäller för allt som är kvar. Kapitel 6 gav 577 → 480, alltså
     −97, exakt 148 → 51, medan `activeCards` stod helt still — det är hur det ska se ut.
   - `-Compare` skriver också ut en rad per **namngiven fil** med `cards N -> M`. Läs den — den är
     det starkaste beviset, eftersom en vaulttotal inte kan skilja din ändring från en
     telefonrepetition som kommer in mitt i sessionen.
2. `powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Vault-Audit.ps1"`
   → kräv `RESULT: clean`.
3. `cmd /c 'npx markdownlint-cli2 "**/*.md"'` — **enkla** yttre citattecken. Läs raderna `Linting:`
   och `Summary:`. Dubbla citattecken ger `Linting: 0 files` plus `0 issues`, vilket ser ut som
   godkänt men inte är det.
4. Bara för `.kiro/`-ändringar, inklusive denna fil: `Test-DocHygiene.ps1`.

**Senaste kända värden, efter kapitel 17:** `cards in active deck` **2122**, `cards excluded by nosr`
**600**, `notes tagged nosr` **43**, `markers placed on cards` **1463** i 315 filer, audit
`notesInScope=526` av 703 filer med **12 `listStyleTags`-avvikelser som inte är mina**, lint **549 filer,
0 issues**.

**Läs de tre första talen med försiktighet.** De rörde sig kraftigt under sessionen av skäl som inte var
mina: `activeCards` föll 2346 → 2122 och `nosr` steg 339 → 600, men **bara +37 av det är kapitel 17:s
deck**. Resten är att fyra HI1031-deck och några HI1032-deck fick `nosr` av en annan process. Markörerna
steg 1457 → 1463 utan att jag rörde en markör. **Ta alltid `-Save` omedelbart före din egen ändring och
läs raden per namngiven fil** — det var den raden som visade att allt kortarbete var mitt och inget annat.

**Markörerna gick 1455 → 1457 mellan kapitel 5 och 6 utan att jag rörde någon markör** — två nya i en ny
fil, med alla kortantal oförändrade. Det är en telefonrepetition som synkat tillbaka, alltså exakt den
fälla som står under FÄLLOR nedan. Det är också det bevis som `.kiro/steering/current-state.md` efterlyste
för att repetitionsdata fortfarande flödar tillbaka från telefonen; nämn det om han frågar om
telefonuppsättningen. Under kapitel 9 låg markörerna still på 1457.

## MÄTNING — tre fällor som gett falska siffror

1. **Filtrera alltid på kurskoden.** `-Filter "*Begrepp - Kap 02*.md"` matchar även HI1032:s deck,
   och `-First 1` valde HI1032. Det gav "10 kort" för ett deck med 62. Nu **T19** i `traps.md`.
   Skriv `-Filter "HI1031 Begrepp - Kap NN*.md"` och **skriv ut filnamnet vid siffrorna**.
2. **CRLF:** `[^\r\n]*$` matchar noll rader i en CRLF-fil. Skriv `\r?$`. (**T12**.)
3. **MD026** slår på rubriker som slutar med punkt. Tentafrågorna slutar med punkt, så
   `## Fråga 2 – Beskriv vad XML är och vad det kan användas till.` ger lint-fel. **Ta bort den
   avslutande punkten.** Frågetecken är OK. Kostade tre lint-fel i kapitel 4.

**Det finns ett riktigt skript för detta nu:** `Get-DeckPairCensus.ps1` i
`Meta/Obsidian Plugins/Scripts/`, befordrat ur `%TEMP%` den 2026-09-10 efter att ha använts i alla tio
kapitel. Körs som

```text
powershell -NoProfile -ExecutionPolicy Bypass -File "Meta\Obsidian Plugins\Scripts\Get-DeckPairCensus.ps1" -Course HI1031 -Chapter 06
```

Det filtrerar på kurskoden, **vägrar gissa** om mönstret matchar mer än en fil, skriver ut vilka två filer
det mätte, räknar kort per separator, och rapporterar SR-markörer, CR-tecken, radantal och dubbla
blankrader för båda filerna. Lägg till `-OutFile` om du vill ha det till fil. Exit 1 betyder bara att en
fil inte gick att peka ut entydigt — det dömer aldrig om innehållet.

## FÄLLOR SOM FAKTISKT BITIT

- **Kedja inte ihop många kommandon.** Kör ett steg per anrop, skriv till `%TEMP%`, läs med
  läsverktyget.
- **Stdout trunkerar å ä ö** och kan svälja hela rader. Ett `Get-ChildItem`-anrop som skriver ett
  svenskt filnamn till stdout kan ge **helt tom utdata**. Skriv till fil i stället.
- **MD012 vid tilläggsgränsen:** `insert` i slutet av en fil ger dubbla blankrader. Hänt fyra gånger.
- **Långa inline-PowerShell-kommandon** går sönder på parenteser inuti `foreach`, eller vägras med
  `Access is denied. (os error 5)`. Skriv en `.ps1` i `%TEMP%` och kör med `-File`.
- **En hel-filomskrivning konverterar CRLF till LF.** Kapitel 6:s not var den enda CRLF-filen och är nu
  LF, så hela vaultet är LF vad dessa filer gäller. Blir `note CR chars` plötsligt nollskilt har något
  annat skrivit filen.
- **Kontrollera vilken fil en `strReplace` gäller.** En riktades mot decket när texten låg i noten.
  Sök upp den exakta strängen med grep först om du är osäker — ett misslyckat `strReplace` säger bara
  "not found", vilket lätt läses som att texten redan är fixad.
- **Vaultet ändras under dig.** Markörer gick 1429 → 1455 utan att någon redigerade något (en
  telefonrepetition som synkade). Ta `-Save` omedelbart före din egen ändring.
- **En annan agent kan vara aktiv.** `Meta/Vault Findings & Backlog.md` har vuxit utan att det var
  mitt. Lämna den ifred.

## KÄNDA LUCKOR OCH DOKUMENTATIONSFEL

- **MVC finns inte i boken.** Verifierat på fem sätt av två oberoende granskare. Kapitel 2 fråga 2
  svaras på allmän grund, tydligt flaggat.
- **Boken FÖRKLARAR Saltzers end-to-end-argument, i §2.3.3**, med både parafras och e-postexemplet.
  Äldre dokumentation påstod motsatsen. Korsreferensen §4.5 → §2.3.3 är alltså riktig.
- **Bokens korrekturfel i §4.2.1 är bekräftat ordagrant** av två granskare: den hänvisar till §4.5.1
  för multicast-portar, men §4.5.1 handlar om overlay-nät. Rätt är **§4.4.1**, och §4.2.2 hänvisar
  korrekt dit.
- **Objektmodellen, framtvingad inkapsling och gratis heterogenitet står i §5.4.1, inte §8.2.**
  Bekräftat ordagrant — §8.2 sammanfattar bara och skriver själv att det "already been covered in
  Section 5.4.1". En äldre version av kapitel 5:s not hade fel här.
- **Figur 5.9:s kolumnrubriker** i FIGUREN är *Retransmit request message*, *Duplicate filtering*,
  *Re-execute procedure or retransmit reply*. Löptexten i §5.3.1 kallar dem något annat
  (*Retry request message*, *Retransmission of results*) — en verklig skillnad i boken, inte ett fel
  i noten.
- **Ordet "hypermedia" finns inte NÅGONSTANS i boken** — verifierat med grep över hela filen, noll
  träffar, inte bara i REST-avsnittet. Boken listar inte heller några namngivna REST-principer. Kapitel
  9 fråga 2 vilar därför på REST-artikeln. De två källorna **motsäger varandra** — boken beskriver REST
  *som* HTTP med fyra metoder, restfulapi.net säger "REST != HTTP". **Båda står i noten, attribuerade.**
- **Ordet "Ajax" finns inte i kapitel 9.** Verifierat: Ajax förekommer bara på rad **963 (§1.6)** och
  **1316–1389 (§2.3.2)**, plus i sakregistret — ingenting i 7567–8441. Boken kopplar **aldrig** Ajax till
  webbtjänster; bryggan i kapitel 9 fråga 5 är egen syntes, flaggad två gånger.
- **Kapitel 9:s Ajax-begränsningar är TRE, inte två** — den tredje är skild från de två första av en
  figurtext (figur 2.8). Ett gammalt kort memorerade två. Den tredje är att ==en visad sida inte kan
  uppdateras när applikationsdatat på servern ändras==.
- **Kapitel 5:** siffrorna 14× och 882× mäter **SOAP mot CORBA**, inte sockets mot distribuerade
  objekt.
- **Kapitel 6 fråga 5 krävde syntes** och är löst: bokens figur 6.27 står först, omgrupperingen i
  sändare/mottagare/implementatör är märkt som min. Boken grupperar aldrig så — bekräftat av granskare.
- Boken kallar aldrig HTTP "tillståndslöst". Att IP är best-effort står i **kapitel 3**, inte 1.
- KursPM markerar §10.5–10.6 kursivt men **kapitel 10 fråga 4 kräver §10.5.3**; §16.7 är kursivt men
  **kapitel 16 fråga 4 och 5 kräver det**. Samma mönster som kapitel 4 fråga 6, som krävde §7.7.
- **Kapitel 17:s befintliga deck** har ett kort om *platta mot nästlade transaktioner* medan tentan
  frågar om *platt mot hierarkisk 2PC* — en annan distinktion. Tre av dess fyra frågor är otäckta.
- `.kiro/steering/product.md` kallar felaktigt `HI1031-20192.pdf` "an old exam". Det är kursplanen
  från HT19. **Det finns inget gammalt tentaprov.**
- Frontmatter-taggen `databaser` är omotiverad för de flesta HI1031-kapitel men är vault-konvention.
  **Lämnad medvetet.**

## VAD SOM ÄR KLART

**Kapitel 1** — noten 744 → **286 rader**, decket 93 → **68 kort**. De 25 korten utan
repetitionshistorik togs bort; de 68 med historik skrevs om till enklare språk **utan att ändra vad
de testar**. Bevisat: varje `<!--SR:...-->`-sträng sparades före ändringen och jämfördes sorterad
efteråt — 68 före, 68 efter, mängderna byte-identiska.

**Kapitel 2 Systemmodeller** — noten **268 rader**, decket 39 → **54 kort**. Alla fem granskarna
körda, fyra fynd åtgärdade plus en faktarättelse (boken listar **fem** plattformsexempel, inte tre).
Ett fynd avvisades medvetet: omfångsjägaren ville stryka stycket om skiktning kontra flerskikt, men
boken **definierar** flerskikt genom just den kontrasten.

**Kapitel 4 Interprocesskommunikation** — noten **370 rader**, decket 122 → **60 kort**. Sex frågor
gör det till det tyngsta kapitlet. Alla fem granskarna körda; åtgärdat end-to-end-överdriften, en
oflaggad värdering, tre dubblettpar, en separator och två odefinierade termer. Figur 4.15 hämtad ur
PDF:en. **Sex av omfångsjägarens 16 strykningar avvisades medvetet** — listorna HTTP/FTP/Telnet/SMTP
och DNS/VoIP, XML:s välformat, hypervisor-termen, samt full- och paravirtualisering. Skälet: en
muntlig examinator ber om konkreta exempel, och "hur virtualisering görs" är en rimlig följdfråga på
"vad vinner man".

**Kapitel 5 Fjärranrop** — noten **295 rader**, decket 102 → **44 kort**. `activeCards` 2404 → 2346,
alltså −58, exakt 102 → 44. Alla fem granskarna körda. Faktagranskaren fann **noll sakfel** i 15
kontrollerade påståenden. Åtgärdat: latensöverdriften (bokens *suggests… perhaps* hade blivit
*måste*), *should* → *måste* om undantag, ett tappat *generally* om servanter, tre dubblettpar, tre
`;;`-kort som var omöjliga att skilja baklänges, och **fyra odefinierade termer** som fick glossor —
`SOAP`, *serialiserbar*, *lös koppling* och *flödeskontroll*. **Tre av omfångsjägarens strykningar
avvisades:** binder-kortet (hur klienten får sin första referens är en säker följdfråga),
fjärrreferensmodulen (en av figur 5.15:s sex delar, alltså själva svaret på "hur RMI fungerar") och
hela `## Luckor och källor` (den är hederlighetskravet, inte utfyllnad).

**Kapitel 6 Indirekt kommunikation** — noten **394 rader**, decket 148 → **51 kort** (35 `::`, 6 `;;`,
10 `||`). `nosr` 577 → 480, alltså −97, exakt 148 → 51. Alla fem granskarna körda. Faktagranskaren
kontrollerade **24 påståenden och fann noll sakfel** — kapitlets fakta är alltså solida. Åtgärdat:
påståendet att tabellen i fråga 5 var "ordagrant ur figuren", vilket övertolkade eftersom den är översatt
och delvis rekonstruerad ur PDF:en; tre tappade garderingar (*generally* om de tre receive-stilarna,
*potential* om den centrala mäklaren som felpunkt); två dubblettkort; två sammanslagna kort som delades;
och tre kort skrevs om till vardagligare svenska. Figur 6.27 hämtad ur PDF-sida 292, och **figur 6.1 och
6.13 upptäcktes också vara stympade** och är nu inskrivna i luckorna.

**Två av omfångsjägarens strykningar avvisades:** kortet om filtering-based routing (listkortet nämner
bara ordet, kortet ger de tre datastrukturerna) och styckena om rendezvous och informed gossip, eftersom
fråga 3 uttryckligen ber om *hur* publish-subscribe kan implementeras och de är två av bokens fem
strategier. **Omfångsjägaren rekommenderade själv att inte tvinga noten ner till 300 rader**, med
motiveringen att de sista raderna är just de implementationssvar tentan begär — den bedömningen följdes.

**Kapitel 9 Web services** — noten **409 rader**, decket 184 → **54 kort** (39 `::`, 6 `;;`, 9 `||`).
`nosr` 480 → 350, alltså −130, exakt 184 → 54. Alla fem granskarna körda. Faktagranskaren kontrollerade
**26 påståenden mot rätt källa och fann noll sakfel**; den delade också upp vilken källa som bär vad —
boken bär punkt 1–13 och 19–26, artikeln bär 14–18. Åtgärdat: en tappad gardering (*generally* om att
tjänstebeskrivningen genererar stubbar), påståendet att boken beskriver Ajax och webbtjänster "som
arkitekturmönster sida vid sida" (Ajax står som exempel under flerskiktsarkitektur, inte som eget
mönster), **åtta odefinierade termer glossade** — marshalling, servant, proxy, koreografi, skikt/tier,
URI/URL/URN och synkroniseringsfrikoppling — samt sex scope-strykningar, en dubblett bort, tre
sammanslagna kort delade och tre kort omskrivna till vardagligare svenska.

**Källgranskaren stärkte en lucka i stället för att motsäga den:** ordet *hypermedia* finns inte
någonstans i boken, inte bara i REST-avsnittet.

**Två av omfångsjägarens strykningar avvisades:** stycket om skillnaden web server / web service
(boken säger det uttryckligen, och det är en klassisk muntlig kontrollfråga på "vad är en webbtjänst"),
och hela effektivitetsstycket — 14×/882× är en verklig jämförelseaxel i en jämförelsefråga, så det
kortades i stället till fyra rader med garderingen kvar.

**Kapitel 10 Peer-to-peer-system** — noten **450 rader**, decket 144 → **59 kort** (44 `::`, 4 `;;`,
11 `||`). `nosr` 350 → 265, alltså −85, exakt 144 → 59. Alla fem granskarna körda. Faktagranskaren
kontrollerade **32 påståenden och fann noll sakfel**. Figur 10.1 och 10.11 hämtade ur PDF-sidorna 442
och 462. Åtgärdat: en tappad gardering (boken skriver "costs **tend to** dominate", noten sa
"dominerar"), **ett sakfel i min egen luckbeskrivning** (jag skrev att figur 10.1 hade "2 av 6 rader" —
i själva verket finns 4 radetiketter och det är *Network dynamics* och *Security and anonymity* som
saknas helt), två tappade garderingar i muntliga svar, påståendet att boken "ger två skäl" mjukat till
"i löptexten" eftersom det är min gruppering, **sex glosor** (säker hash, O(log N), topologi, namnrymd,
självorganiserande, best-effort), tio scope-strykningar, fyra dubblettkort bort, två trivia-kort bort
(sessionslängderna och 43–70 %-siffran), ett ja/nej-kort omskrivet, prefixrutning `;;` → `::` eftersom
dess baksida låg nära routing overlay, och två kort omskrivna från "garderar" till vardaglig svenska.

**Tre slarvfel i kapitel 10**, alla dokumenterade i budgetavsnittet ovan: noten skrevs på 496 rader mot
370, decket på 66 kort mot 40–60, och luckbeskrivningen innehöll ett räknefel som granskaren fick fånga.

**Kapitel 16 och 17 hade ingen teorifil alls** när projektet nådde dem — bara 12 respektive 6 stubbkort.
Båda är nu skrivna från noll.

**Kapitel 11 Säkerhet — HELT KLART.** Noten **721 rader**, decket 16 → **52 kort** (33 `::`, 6 `;;`,
13 `||`). `nosr` 265 → **301**, alltså +36, exakt 16 → 52 — kapitlets deck *växte*, till skillnad från
alla tidigare. `activeCards` stod still på 2346 och markörerna på 1457. Audit ren, lint 0 issues i 547
filer. Skrivet i två fönster: fråga 1, 2, 3 och 3.1 i det första, fråga 4, 4.1, 5.1, 5.2 plus
`## Luckor och källor` i det andra. Alla fem granskarna körda på hela filen i fönster B.

**Faktagranskaren kontrollerade 25 påståenden och fann noll sakfel** — kapitlets siffror är solida.
Åtgärdat efter granskarna: fyra glosor (checksumma, block-/strömchiffer, CBC, principal — alla från
täckningsgranskaren, och *checksumma* var det viktigaste eftersom hela integritetssvaret vilar på den),
Q2:s avsnittshänvisning kompletterad med §11.1.1 och §11.1.2 (oförnekbarhet definieras på rad 9337 och
fantomuttaget står på 9255, båda utanför §11.2), sju scope-strykningar, två dubblettkort sammanslagna,
utmaningskortet `;;` → `::` (baksidan var ett scenario som inte pekade tillbaka), ett kort bort och
"vilar på" → "bygger på".

**Källgranskaren hittade två fel i min egen luckbeskrivning**, precis som i kapitel 10: jag skrev "alla
nio delfrågor" när tentan har **åtta** (fråga 5 är bara en rubrik över 5.1 och 5.2), och jag påstod att
Kerberos nämndes i fråga 2 — ordet fanns bara i luckavsnittet självt. **Garderingarna var däremot rena:
källgranskaren hittade inget ställe där boken hedgar men noten påstår rakt ut**, första gången på åtta
kapitel.

**Figur 11.18 saknades helt i textversionen** och är hämtad ur PDF:en. Figur 11.3, 11.4 och 11.12 är
hela; 11.13 är läsbar men har rubrikraden sammansmält med TEA-raden.

**Kapitel 16 Transaktioner och samtidighetskontroll — KLART.** Noten **600 rader**, decket 12 → **50
kort** (38 `::`, 8 `;;`, 4 `||`). `nosr` 301 → **339**, alltså +38, exakt 12 → 50. `activeCards` stod
still på 2346 och markörerna på 1457. Audit ren, lint 0 issues i 548 filer, `notesInScope` 524 → 525.
Läste §16.2, §16.2.1, §16.2.2, §16.4, §16.4.1, §16.5, §16.6 och §16.7 — cirka 850 bokrader — och hoppade
§16.1, §16.3 och §16.4.2 medvetet.

**Faktagranskaren kontrollerade 28 påståenden och fann noll sakfel.** Källgranskaren gick igenom tio
flaggade garderingar och ==alla var bevarade==, plus att ==luckavsnittet var felfritt i alla fem
påståenden== — första gången i projektet som det stycket håller. De två första feltyperna ovan är alltså
möjliga att undvika.

Åtgärdat efter granskarna: fråga 5:s avsnittshänvisning kompletterad med §16.2.1 (serialiserbarheten och
konfliktreglerna kommer därifrån, inte ur §16.7, som inte sammanfattar §16.2.1); **ett stycke med
grundbegrepp lagt först under fråga 1**, eftersom täckningsgranskaren visade att ==transaktion, commit,
abort och objekt aldrig definierades== fast alla fem frågor bygger på dem; glosor för *kritisk sektion*
och *atomärt steg*; sex scope-strykningar och tre komprimeringar (uppgraderingslås, granulariteten,
valideringsformernas jämförelse, de moderna exemplen från 15 till 6 rader, och praktikstycket i fråga 5
som dubblerade fråga 4); **två dubblettpar i decket omskrivna** enligt den tredje feltypen ovan; och tre
nischkort bort.

**Tre av omfångsjägarens strykningar avvisades:** stycket om för tidiga skrivningar, eftersom boken
definierar strikta körningar utifrån ==både== dirty reads och för tidiga skrivningar, så fråga 2:s svar
inte går att ge utan dem; stycket om distribuerade deadlocks, eftersom täckningsgranskaren oberoende sa
att det är den enda mest sannolika följdfrågan på fråga 1 i en kurs om distribuerade system — den
bedömningen väger tyngre; och blocket om vad de tre metoderna gör åt dirty reads, som i stället
komprimerades, eftersom fråga 2 uttryckligen frågar *hur* man kommer åt problemet.

**Omfångsjägaren sa själv att noten inte skulle tvingas ner till 490** och pekade på att cirka 25 rader av
överdraget sitter i den låsta figur-forensiken under `## Luckor och källor`. Noten gick 621 → 600 efter
strykningarna, alltså ==21 rader netto av cirka 43 strukna==, eftersom grundbegreppsstycket och glosorna
lades till samtidigt. Samma mönster som kapitel 9, 10 och 11.

**Talpunkterna skrevs till filen först**, och det gav 621 rader mot budgeten 490 — bättre än kapitel 9,
10 och 11 fönster B i relativa termer, men fortfarande 27 procent över. Felet satt i fråga 1, som fick
cirka 105 faktarader mot planerade 85. **Budgetera per fråga och stanna när kvoten är slut**, inte bara
totalt.

**Kapitel 17 Distribuerade transaktioner — KLART. Sista kapitlet.** Noten **526 rader**, decket 6 → **43
kort** (29 `::`, 6 `;;`, 8 `||`). Kortdeltat var ==+28 enradiga, +2 omvända, +7 flerradiga = +37==, exakt
6 → 43, och en enda namngiven fil rörd. Lint 0 issues i 549 filer. Läste §17.1 till §17.4.3, §17.5 fram
till edge chasing-algoritmens tre steg, och §17.6 till §17.6.4 — cirka 710 bokrader.

**Faktagranskaren kontrollerade 32 påståenden och fann noll sakfel.** Källgranskaren gick igenom åtta
flaggade garderingar och ==alla var bevarade==, bekräftade ==alla tolv figurhänvisningar==, och fann
==luckavsnittet felfritt i alla fem påståenden== — andra kapitlet i rad. Den noterade också att en nionde
gardering jag varnat för (deltagare går "normalt" med på commit vid tidsstämpelordning) ==helt saknades i
noten==, alltså utelämnad snarare än tillplattad.

Åtgärdat efter granskarna: **sex glosor** från täckningsgranskaren — ==väntegraf med kant och cykel==
(viktigast; hela deadlock-svaret vilade på en graf vars kanter aldrig förklarades), ==tentativ version==,
==permanent lagring mot flyktigt minne== vid första användningen i fråga 2 i stället för först i fråga 4,
plus commit, abort och serialiserbarhet i fråga 1. Dessutom skrevs ==regel 2 och regel 3 om till ord==,
eftersom nummer utan innehåll inte betyder något för någon som inte läst kapitel 16:s valideringsavsnitt.
Nio scope-strykningar på cirka 40 rader (Gray 1978, felmodellen komprimerad, konsensusresonemanget,
trefas-commit, de kooperativa alternativstrategierna, bankexemplets utvikning, checkpointing-definitionen,
de två sätten att läsa loggen, shadow versions-avgränsningen). Fyra kort bort, ett överlastat kort delat,
och ==två kort med nästan identiska framsidor särskiljda==.

**Två av omfångsjägarens strykningar avvisades:** stycket om att distribuerad deadlock är svårare att
upptäcka än lokal, eftersom fråga 1 uttryckligen ber om *vilka extra problem* och "det obvious fixet
fungerar inte, och här är varför" är direkt svarande; och de tre skälen mot central detektering, som bär ett
eget kort.

**Omfångsjägaren sa att noten inte skulle tvingas ner till 370, men — till skillnad från tidigare kapitel —
att den här hade verklig fetma:** cirka 60 rader 2PC-teori som ingen fråga kräver. Den bedömningen var rätt
och följdes. Noten gick 546 → 526.

## BÖRJA HÄR — mappen `Begrepp/` för HI1031 (fullständig briefing)

**Detta är nästa uppgift, och den är ny.** Tentafrågeprojektet är färdigt (se `VAD SOM ÄR KLART` längre
ner) — rör inte de tio kapitelparen om han inte ber om det. Uppgiften nu är att **titta på mappen
`Begrepp/` för HI1031 och noterna i den**.

```text
KTH/2026 Höst/HI1031 Distribuerade informationssystem/Begrepp/
```

**Han har bara sagt "titta på" — det är en inspektionsuppgift, inte en skrivuppgift.** Inventera, rapportera
vad du ser, och låt honom styra vad som ska göras. Gissa inte fram ett omskrivningsuppdrag.

### Vad som faktiskt ligger där — mätt 2026-09-10

**14 noter**, alla korta, 19–28 rader. Tillsammans **17 flashcards** och **noll SR-markörer**.

| Not | Rader | Kort |
|---|---|---|
| Anropssemantik | 26 | 2 |
| Distribuerat system | 22 | 1 |
| Fjärrmetodanrop (RMI) | 21 | 1 |
| Fjärrprocedursanrop (RPC) | 21 | 1 |
| Heterogenitet | 20 | 1 |
| Indirekt kommunikation | 24 | 2 |
| Klient-server-modellen | 28 | 1 |
| Marshalling | 20 | 1 |
| Middleware | 21 | 1 |
| Peer-to-peer | 20 | 1 |
| Skalbarhet | 20 | 1 |
| Transaktion (ACID) | 26 | 2 |
| Transparens | 23 | 2 |
| Tvåfas-commit (2PC) | 19 | 1 |

**Alla 14 har `## Definition`, `## Kopplat till` och `## Flashcards`.** Ordningen i filerna är
Definition → Kopplat till → Flashcards. **Ingen av dem har `## Tenta-fokus`.**

### Fyra saker att veta INNAN du föreslår något

1. **Att `## Tenta-fokus` saknas är inte ett fel.** `Meta/Vault Standard.md` säger uttryckligen att
   avsnittet är ==optional, only where exam guidance exists==, och att de flesta noter i vaultet inte har
   det — 42 av 396. Rapportera det som en möjlighet, inte som en avvikelse.
2. **`## Flashcards` måste vara sista avsnittet.** Det gäller i 342 av 342 noter som har ett, auditen
   kontrollerar det, och ==den publicerade sajten är beroende av det== — dess korttransformator vid
   bygget skriver bara om innehåll under den rubriken. Lägger du till ett avsnitt går det ovanför.
3. **Dubbletter mot kapiteldecken är TILLÅTNA och ska inte "städas".** Detta är ett fattat beslut i
   `product.md`: `Begrepp/` är ==referensmaterial som delas mellan kurser== och räknas mot
   självbärighet ==i ingen riktning==. Flera av de 14 begreppen är samma termer som finns i kapitel 4, 5,
   6, 10, 16 och 17:s deck. **Det är meningen.** Föreslå inte avdubblering mot decken.
4. **Alla 14 är taggade `nosr`**, så deras kort ligger utanför repetitionen. `nosr` tas inte upp och rörs
   inte — det är också ett fattat beslut.

### Vad som är värt att titta på

- **Noterna är tunna.** 19–28 rader med 1–2 kort var. Frågan att ställa honom är om de ska djupare, eller
  om de är avsiktligt korta just för att de är referens och kapitelnoterna bär tyngden.
- **Täckningen.** 14 begrepp mot tio kapitel. Vilka centrala termer ur kursen saknas helt? Säkerhet
  (kapitel 11) och webbtjänster (kapitel 9) ser oföreträdda ut i listan — men kontrollera mot
  `Begrepp/`-mappar i andra kurser också, eftersom mappen delas.
- **`## Kopplat till`.** Standarden säger att den bara ska länka ==related concepts==, inte frågelistor
  eller sessionsnoter, och att ==tomt är okej== när inget genuint hör ihop. Kontrollera om länkarna håller
  och om grafen har uppenbara luckor.
- **`Atlas/Tenta-prioritering.md`** är enligt `product.md` den fil som prioriterar `## Tenta-fokus`-arbete.
  Läs den innan du föreslår något om just det avsnittet.

### Verktyg för just detta

`Get-NoteStructureCensus.ps1` **äger siffrorna om begreppsnoter** — antal noter, hur många som har varje
avsnitt, kortkollektioner. Citera skriptet, inte prosan, och kör det innan du påstår något om täckning.
Dess `notesInScope` måste vara lika med auditens; skiljer de sig mäter det en annan population.

## PROJEKTETS TILLSTÅND — tentafrågorna är klara

**Alla tio kapitel är klara: 1, 2, 4, 5, 6, 9, 10, 11, 16 och 17**, och därefter genomgångna en gång till
mot två frågor — är allt innehåll nödvändigt för tentafrågorna, och är språket vardagligt. Fynden och
åtgärderna står i `.kiro/reports/hi1031-genomgang-2026-09-10.md`. **Skriv inga fler kapitel.**

**Två saker väntar på hans beslut, inte på arbete:**

1. **Auditen är röd** på `listStyleTags` i **11 filer** — sju HI1032-deck (kapitel 02, 18, 19, 23, 24, 25,
   26), HI1032:s begreppsnot `TCP-IP-modellen.md`, och HI1031:s deck för kapitel 02, 04 och 05. De ändrades
   av **en annan process** mellan 08:12 och 08:19 den 2026-09-10. **Ingen av dem är skriven av detta
   projekt.** Rör dem inte utan att fråga; en annan agent kan ha dem öppna.

   **Beskrivningen här var fel fram till 2026-09-10.** Den sa "12 filer — sju HI1032-deck, två
   HE1033-begreppsnoter och HI1031:s deck för kapitel 1, 2, 4 och 5". Ingen HE1033-fil finns i auditens
   lista, kapitel 1:s deck inte heller, och den tolfte filen var
   `HI1031 .../Begrepp/Klient-server-modellen.md` — en begreppsnot som beskrivningen inte nämnde alls.
   **Den är nu lagad**: taggarna skrevs tillbaka till inline-form med `nosr` kvar, vilket tog antalet
   12 → 11. Läs `-Detail`, inte detta stycke.
2. **Fyra HI1031-deck fick `nosr` av samma process**, vilket tog `notes tagged nosr` från 39 till 43 och
   ==kapitel 1:s kort ur aktiv repetition==. Markörerna finns kvar. Det kan vara avsiktligt, eftersom alla
   andra HI1031-deck redan var `nosr`.

## BOKENS RADNUMMER

Kapitelgränser: kap 1 **396–1030**, kap 2 **1030–1855**, kap 4 **3059–3707**, kap 5 **3708–4579**,
kap 6 **4580–5515**, kap 7 **5516–6719**, kap 8 **6720–7566**, kap 9 **7567–8441**,
kap 10 **8442–9223**, kap 11 **9224–10422**, kap 16 **13689–14896**, kap 17 **14897–15761**.
Kapitel 3, 7, 8, 12–15 står inte i kurslitteraturlistan.

Avsnittsoffset:

- §1.1 396, §1.2 414, §1.3 498, §1.4 613, §1.5 647, §1.5.1 651, §1.5.2 680, §1.5.3 698, §1.5.4 719,
  §1.5.5 751, §1.5.6 780, §1.5.7 790, §1.5.8 828, §1.6 840, §1.7 983.
- §2.1 1031, §2.2 1049, §2.3 1075, §2.3.1 1089, §2.3.2 1275, §2.3.3 1425, §2.4 1491.
- §4.1 3059, §4.2.1 3099, §4.2.2 3123, §4.2.3 3141, §4.2.4 3227, §4.3 3267, §4.3.3 3388,
  §4.3.4 3468, §4.4 3478, §4.4.1 3494, §4.4.2 3540, §4.5 3552, §4.5.1 3565, §4.6 3620.
- §5.2 3736, §5.3 3918, §5.3.1 3948, §5.4 4085, §5.4.1 4100, §5.4.2 4222, §5.4.3 4340, §5.5 4360,
  §5.6 4513. Figur 5.9 vid 3980.
- §6.1 4580, §6.2 4635, §6.2.2 4690, §6.2.3 JGroups 4747, §6.3 4827, §6.3.2 4939, §6.4 5054,
  §6.4.2 5103, §6.4.3 JMS 5139, §6.5 5211, §6.6 5454. Figur 6.27 vid 5483.
- §7.7 6419, §7.7.1 6421, §7.7.2 Xen 6440. §8.2 6745.
- §9.1 7567, §9.2 7601, REST-boxen 7655, §9.2.1 7671, §9.2.2 7826, §9.2.4 7918, §9.3 7940,
  §9.7.1 SOA 8304. Verifierade radnummer inom kapitlet: definitionen av webbtjänstgränssnitt 7603,
  "cannot be accessed directly by browsers" 7573, web server mot web service 7575, låg koppling 7625,
  de tre förstärkarna 7644–7647, transparens 7663, 50 000 utvecklare 7607, brandväggar 7824,
  WS-ReliableMessaging 7815–7822, 14×/882× 7934, IOR och DNS 7926–7928, SOA-definitionen 8306,
  mashup och JBidwatcher 8310. §9.4 är UDDI, §9.5 XML-säkerhet, §9.6 koordination och koreografi.
- **Ajax: §2.3.2.** De tre begränsningarna 1320, `XmlHttpRequest` 1375, skikt 1–2 och "nästan alltid
  asynkront" 1385, synkront vidare till datahanteraren 1387, Google Maps 1389. Ajax nämns också §1.6
  rad 963.
- §10.1 8442, §10.2 8506, §10.3 8556, §10.4 8617, §10.5 8685, §10.5.1 8693, §10.5.3 8870,
  §10.6 8956, §10.7 9143. Figur 10.1 vid 8477, figur 10.11 vid 8925. Verifierade radnummer inom
  kapitlet: de fem kännetecknen 8454, de sex icke-funktionella kraven 8570, sessionslängderna 8595,
  replikeringsfaktor 16 vid 8614, routing overlayens fyra uppgifter 8636, DHT/DOLR-gränssnitten 8660,
  Chord/CAN/Kademlia 8686, Pastry 128-bit och O(log N) 8700, "normally UDP" 8712, 43–70 % vid 8895,
  Gnutella 0.4 och 0.6 vid 8905–8945, sökstrategierna 8918, de tre fördelarna och två svagheterna 9165.
- **Kapitel 11 rad 9224–10422, avsnittsoffset nu UPPMÄTTA:** §11.1 9224, §11.1.1 Threats and attacks
  9251, §11.1.2 9311, §11.1.3 9345, §11.2 9368, §11.2.1 Cryptography 9386, §11.2.2 Uses of cryptography
  9394, §11.2.3 Certificates 9466, §11.2.4 Access control 9512, §11.2.5 Credentials 9566, §11.2.6
  Firewalls 9584, §11.3 9596, §11.3.1 symmetriska 9688, §11.3.2 asymmetriska 9740, §11.3.3 hybrid 9797,
  §11.4 Digital signatures 9801, §11.4.1 med publika nycklar 9829, §11.4.2 MACs 9867, §11.4.3 Secure
  digest functions 9887, §11.4.4 CA 9938, §11.5 9961, §11.5.1 prestanda 9967, §11.5.2 politik 9990,
  §11.6 10004, §11.6.1 Needham–Schroeder 10012, §11.6.2 Kerberos 10032, §11.6.3 TLS 10198, §11.6.4
  WiFi 10311, §11.7 Summary 10380. Figur 11.13 (prestanda) vid ~9985.
- **Kapitel 16 rad 13689–14896, avsnittsoffset UPPMÄTTA:** §16.1 13690, §16.1.1 Simple synchronization
  13698, §16.1.2 Failure model 13732, §16.2 Transactions 13742, §16.2.1 Concurrency control 13825,
  §16.2.2 Recoverability from aborts 13939, §16.3 Nested transactions 13982, §16.4 Locks 14033,
  §16.4.1 Deadlocks 14166, §16.4.2 Increasing concurrency 14277, §16.5 Optimistic 14349, §16.6 Timestamp
  ordering 14435, §16.7 Comparison 14682, §16.8 Summary 14714.
- **§16.1, §16.3 nästlade transaktioner och §16.4.2 frågas inte om** av någon tentafråga och är medvetet
  olästa. Låsningsreglerna för nästlade transaktioner i §16.4 likaså. **Obs att kapitel 17 fråga 3
  handlar om platt mot hierarkisk 2PC, inte om nästlade transaktioner** — en annan distinktion.
- **§11.2.4 Access control, §11.2.5 Credentials och §11.2.6 Firewalls frågas inte om** av någon
  tentafråga och är medvetet olästa. Samma för §11.6.1, §11.6.2 Kerberos och §11.6.4 WiFi.
