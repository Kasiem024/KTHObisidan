---
tags:
  - tenta
  - CM1000
  - matematik
  - KTH
  - year2026
created: 2026-10-26
updated: 2026-10-26
description: "Självständig kontextfil om CM1000:s tentor för AI-verktyg: kursens upplägg HT2026, en analys per område av alla 388 uppgifter i 53 gamla skrivningar HT2019–HT2025 med typer, metoder ur lösningsförslagen, mönsterlösningar och en rad per uppgift, samt vad som är verifierat och osäkert."
---
# CM1000 Tentaanalys - AI-kontext

## Så används filen

Filen är självständig. En AI-handledare ska kunna hjälpa till att plugga CM1000 utan att läsa något
annat. Allt är hämtat ur kursens KursPM, detaljplanering och formelsamling för HT2026 och ur **alla
53 gamla skrivningar HT2019–HT2025** (83 filer: kontrollskrivningar, Fx-skrivningar, tentor, omtentor,
en hemtenta och en komplettering).

**Regler för den som använder filen:**

1. Svara på svenska, vardagligt. Facktermer är bra, akademisk ton är det inte.
2. Målet är **godkänt**: alla sex grundläggande områden klarade (avsnittet nedan). Prioritera dem.
3. **Hitta inte på uppgifter eller lösningar.** Varje rad i tabellerna är hämtad ur en gammal skrivning,
   och svaret ur examinatorns eget lösningsförslag. Där det står `Lösning saknas i underlaget.` finns
   inget facit — säg det, lös inte uppgiften som om svaret vore känt.
4. De gamla skrivningarna kommer från **äldre upplägg** av kursen (fyra KS per år, tentor med Del I–III).
   Mönstren gäller uppgifternas innehåll; examinationsformen för i år står i nästa avsnitt. HT2025 ligger
   närmast i år, och varje område har ett stycke om de senaste åren.
5. En uppgift godkänns bara om den är **helt** rätt. Filen ger uppgiften och svaret i korthet; för att
   träna en fullständig lösning, öppna den sittning som `### Mönsterlösningar` pekar på — filen för
   varje sittning står i *Källfiler* sist.

**Så läses ID och tabeller.** Ett ID som `HT2024 KS1 U2` är läsåret (HT2024 = hösten 2024 och våren
efter), skrivningen och uppgiftens nummer. Uppgift N hör alltid till område N; `U2a`/`U2b` är två
alternativ där bara ett fick lösas. Varje område har sju delar: typerna med antal, vad uppgifterna ber
om, hur lösningsförslagen löser dem, vad formelsamlingen har och saknar, uppgifter som återkommer,
mönsterlösningar och en rad per uppgift. **Alla antal i filen är räknade av ett skript** ur tabellerna.

**Öppen fråga att få besvarad först:** delas formelsamlingen ut på **KS1**? Den heter *"Formelsamling
för KS2"* och KursPM HT2026 nämner inga hjälpmedel. Svaret avgör om lagarna och definitionerna i
område 1–3 måste kunnas utantill eller finns på bladet. Fråga examinatorn.

**För KS1 och KS2 räcker område 1, 2, 3, 4, 7 och 8.** Område 5, 6, 9 och högrebetygsuppgifterna
behövs bara för högre betyg på tentan; lägg ingen KS-tid där.

**Rader att inte lära sig som fakta.** Här är källan själv fel eller oense med sig själv, och raden
säger det. Lär dig svaret som raden anger, inte det tryckta mellansteget:

- HT2021 Tentamen januari U1 — lösningens sista rad trycker fel slutsats.
- HT2023 KS4 U2b — lösningen har ett felaktigt mellansteg.
- HT2020 KS2 U4 — tryckfel i ett mellansteg; svaret är rätt.
- HT2023 Tentamen januari U7 — lösningen listar bara fyra gradtal för en graf med fem hörn.
- HT2021 KS4 U8 — uppgiften säger en gul kula, lösningen räknar med tre; svaret 540 hör till lösningens
  version, och lösningen skriver dessutom 30 för ett binomialtal som är 10.
- HT2023 Fx2 U8 — lösningen skriver ett binomialtal fel på ett ställe men räknar rätt.
- HT2019 Fx1 U9a — lösningens steg är felnumrerade.
- HT2025 Tentamen U10 — lösningens slutmening blandar ihop $x$ och $y$.

## Kursen och examinationen HT2026

| Fält | Värde |
| --- | --- |
| Kurs | CM1000 Diskret Matematik, 8,0 hp, period 2 (start 2026-10-26) |
| Examinator | Erik Melander |
| Moment | TEN1 (5,0 hp, skriftligt) och RED1 (3,0 hp, muntor) |
| Kurslitteratur | Specialskriven, nio kapitel = nio delområden |

**Godkänt på TEN1.** KursPM: *"Teorin i kursen är uppdelad i nio delområden baserade på kapitel i
kurslitteraturen. Man behöver under kursen visa att man kan klara sex av dem för att bli godkänd på
TEN1"*. Ett område klaras genom att lösa en uppgift på det: *"För godkänt på en uppgift krävs det att man
klarar uppgiften helt och hållet."*

| Grundläggande (alla sex krävs för E) | Kapitel | Avancerade (sätter betyget) | Kapitel |
| --- | --- | --- | --- |
| Logik | 1 | Relationer | 5 |
| Mängdlära | 2 | Fördjupad talteori | 6 |
| Funktioner | 3 | Sannolikhetslära | 9 |
| Talteori | 4 | | |
| Grafteori | 7 | | |
| Kombinatorik | 8 | | |

| Betyg | Grundläggande | Avancerade |
| --- | --- | --- |
| E | 6 | 0 |
| D | 6 | 1 eller 0 + godkänd överbetygsuppgift |
| C | 6 | 2 eller 1 + godkänd överbetygsuppgift |
| B | 6 | 3 eller 2 + godkänd överbetygsuppgift |
| A | 6 | 3 + godkänd överbetygsuppgift |

**Tillfällen.** KS1 **10/11**, kapitel 1, 2, 3. KS2 **30/11**, kapitel 4, 7, 8. Tenta **5/1** med *"10
uppgifter, en från varje delområde i kursen och en avslutande överbetygsuppgift för högre betyg"*.
Omtenta 31/3. KursPM: *"Godkänt delområde räknas som godkänt under hela nuvarande läsår
(HT2026-VT2027)"* och *"Det är alltså möjligt att bli godkänd på TEN1 innan ordinarie tenta."* Efter
tenta och omtenta finns Fx-komplettering: *"Om man har som mest 2 grundläggande områden kvar att klara
till godkänt efter tentan blir man kallad till Fx-kompletteringen."* Muntorna (RED1) gäller kapitel 5 i
v. 50. AI är inte tillåtet på tenta eller KS.

**Hjälpmedel HT2026: inte bekräftat.** KursPM HT2026 nämner inga hjälpmedel. Formelsamlingen heter
*"Formelsamling för KS2 i CM1000 HT25"*. HT2025:s Fx2 och omtenta i april skriver *"Inga tillåtna
hjälpmedel förutom ingående formelsamling"*; alla äldre skrivningar tillät ett handskrivet A4-ark. Om
formelsamlingen finns på **KS1** är alltså okänt — fråga examinatorn.

**Formelsamlingen** har avsnitt för område 1, 2, 3, 4, 7 och 8: logikens lagar och de fem
slutledningsreglerna; mängdlärans definitioner och lagar; funktionsdefinitionerna (injektiv, surjektiv,
bijektiv, invers, identitet, sammansättning); delbarhet, kongruens, divisionsalgoritmen, Bézouts sats och
Euklides algoritm; Eulers sats om gradtal, Dijkstras, Prims och Kruskals algoritmer; fakultet,
permutationer, binomial- och multinomialtal, inklusion–exklusion, urvalstabellen, binomialsatsen och
Pascals formel. **Område 5, 6 och 9 har inget avsnitt**, och grafteorins rubrik *Definitioner* är tom.

## Snabböversikt

| Område | Var det prövas HT2026 | Uppgifter | Sittningar | Vanligaste typ, alla år | Vanligaste typ HT2024–HT2025 |
| --- | --- | --- | --- | --- | --- |
| 1 Logik | KS1 (10/11) och tentan | 42 | 42 | Ekvivalensutredning (14) | Härledningsbedömning (8) av 13 |
| 2 Mängdlära | KS1 (10/11) och tentan | 54 | 47 | Sanningshaltsutredning (21) | Sanningshaltsutredning (5) av 16 |
| 3 Funktioner | KS1 (10/11) och tentan | 56 | 49 | Funktionslag (12) | Funktionslag (5) av 16 |
| 4 Talteori | KS2 (30/11) och tentan | 39 | 39 | Kongruensekvation (14) | Delbarhetsbevis (4) av 11 |
| 7 Grafteori | KS2 (30/11) och tentan | 39 | 39 | Kortaste väg (13) | Euler och Hamilton (3), Kortaste väg (3) av 10 |
| 8 Kombinatorik | KS2 (30/11) och tentan | 39 | 39 | Urval och räkneprinciper (9) | Anagram och omordning (2), Binomialutveckling och konstantterm (2), Inklusion och exklusion (2), Urval och räkneprinciper (2) av 10 |
| 5 Relationer | bara tentan, sätter betyget | 36 | 33 | Egenskapsutredning (19) | Allmänt resonemang (2), Egenskapsutredning (2) av 6 |
| 6 Fördjupad talteori | bara tentan, sätter betyget | 31 | 31 | Summaidentitet (12) | Delbarhet (2), Summaidentitet (2) av 6 |
| 9 Sannolikhetslära | bara tentan, sätter betyget | 30 | 29 | Total sannolikhet (9) | Bayes sats (1), Betingad sannolikhet (1), Klassisk sannolikhet (1), Sannolikhetsbevis (1), Total sannolikhet (1) av 5 |
| Högrebetygsuppgifter | överbetygsuppgiften sätter betyget, och kan ibland täcka ett område | 22 | 13 | Talteori och kongruenser (6) | Funktionsbevis (1), Grafbevis (1), Induktionsbevis (1), Relationsegenskaper (1) av 4 |

Raderna för område 5, 6, 9 och högrebetygsuppgifterna betyder inget för godkänt — de sätter betyget.
Kolumnen **HT2024–HT2025** är den bästa ledtråden till i år; där den skiljer sig från alla år, gå efter
den senaste. Antalet efter "av" är hur många uppgifter området hade de två åren.

**KS1 och KS2 de senaste åren.** Vilken typ som kom på KS1 och KS2 HT2024–HT2025, och vilka typer
området hade på alla sittningar de åren. I år är KS2 bara område 4, 7, 8; HT2025:s KS2 tog också om
1, 2, 3 och HT2024:s KS2 var område 1–6, så de KS2-raderna är tunna.

| Område | På KS1/KS2 HT2024–HT2025 (typ och ID) | Alla typer HT2024–HT2025 (alla sittningar) |
| --- | --- | --- |
| 1 Logik | Härledningsbedömning (HT2024 KS1 U1); Ekvivalensutredning (HT2025 KS1 U1) | Ekvivalensutredning, Giltighetsbevis, Härledningsbedömning, Kryssuppgift, Utsagans giltighet |
| 2 Mängdlära | Identitetsbevis (HT2024 KS1 U2); Sanningshaltsutredning (HT2025 KS1 U2a); Kartesisk produkt (HT2025 KS1 U2b) | Identitetsbevis, Kartesisk produkt, Konkret mängdräkning, Potensmängd, Sanningshaltsutredning |
| 3 Funktioner | Bijektion och invers (HT2024 KS1 U3); Egenskapsbestämning (HT2025 KS1 U3a); Sammansättning (HT2025 KS1 U3b) | Bijektion och invers, Egenskapsbestämning, Funktionslag, Mängdbild, Sammansättning |
| 4 Talteori | gcd och allmän delbarhet (HT2024 KS2 U4); Restklassgenomgång (HT2025 KS2 U4) | Bézout och relativt prima, Delbarhetsbevis, Kongruensekvation, Restklassgenomgång, gcd och allmän delbarhet |
| 7 Grafteori | Kortaste väg (HT2025 KS2 U7) | Euler och Hamilton, Gradtal och handskakning, Isomorfi och delgraf, Kortaste väg, Trädbevis, Uppspännande träd |
| 8 Kombinatorik | Inklusion och exklusion (HT2025 KS2 U8) | Anagram och omordning, Binomialidentitet och bevis, Binomialutveckling och konstantterm, Inklusion och exklusion, Kulor i urnor och fördelning, Urval och räkneprinciper |

## Underlaget och hur skrivningarna har sett ut

53 sittningar efter slag (antal sittningar; omtentamen räknar april och september): KS1 7; KS2 7; Tentamen 7; Fx1 7; KS3 6; Omtentamen 6; Fx2 6; KS4 5; Hemtentamen 1; Komplettering 1. Matrisen visar vilka uppgifter varje sittning hade per
område (K1–K9; Hö = uppgift 10 och uppåt) och om uppgiftsfil (P) och lösningsfil (L) finns.

| Sittning | Filer | K1 | K2 | K3 | K4 | K5 | K6 | K7 | K8 | K9 | Hö |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| HT2019 KS1 | L | 1 | 2 | 3 |  |  |  |  |  |  |  |
| HT2019 KS2 | L |  |  |  | 4 | 5 | 6 |  |  |  |  |
| HT2019 KS3 | L |  |  |  |  |  |  | 7 | 8 | 9 |  |
| HT2019 KS4 | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2019 Tentamen januari | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11, 12, 13 |
| HT2019 Fx1 | L | 1 | 2 | 3 |  | 5a, 5b | 6 | 7 | 8 | 9a, 9b |  |
| HT2019 Hemtentamen april | P | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2019 Komplettering | P |  | 2 | 3 |  | 5 | 6 |  |  |  |  |
| HT2020 KS1 | L | 1 | 2 | 3 |  | 5 |  |  |  |  |  |
| HT2020 KS2 | L |  | 2 |  | 4 | 5 | 6 |  |  |  |  |
| HT2020 KS3 | L |  |  | 3 |  |  |  | 7 | 8 | 9 |  |
| HT2020 KS4 | L | 1 | 2a, 2b | 3a, 3b | 4 | 5a, 5b | 6 | 7 | 8 | 9 |  |
| HT2020 Tentamen januari | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2020 Fx1 | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2020 Omtentamen april | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2020 Fx2 | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2021 KS1 | P+L | 1 | 2 | 3 |  | 5 |  |  |  |  |  |
| HT2021 KS2 | P+L |  | 2 |  | 4 | 5 | 6 |  |  |  |  |
| HT2021 KS3 | P+L |  |  | 3 |  |  |  | 7 | 8 | 9 |  |
| HT2021 KS4 | P+L | 1 | 2a, 2b | 3a, 3b | 4 | 5a, 5b | 6 | 7 | 8 | 9 |  |
| HT2021 Tentamen januari | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2021 Fx1 | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2021 Omtentamen april | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2021 Fx2 | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2021 Omtentamen september | L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2022 KS1 | P+L | 1 | 2 | 3 |  |  |  |  |  |  |  |
| HT2022 KS2 | P+L |  | 2 | 3 | 4 | 5 | 6 |  |  |  |  |
| HT2022 KS3 | P+L |  |  | 3 |  |  |  | 7 | 8 | 9 |  |
| HT2022 KS4 | P+L | 1 | 2a, 2b | 3a, 3b | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2022 Tentamen januari | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2022 Fx1 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2022 Fx2 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2023 KS1 | P+L | 1 | 2 | 3 |  |  |  |  |  |  |  |
| HT2023 KS2 | P+L |  | 2 | 3 | 4 | 5 | 6 |  |  |  |  |
| HT2023 KS3 | P+L |  |  | 3 |  |  |  | 7 | 8 | 9 |  |
| HT2023 KS4 | P+L | 1 | 2a, 2b | 3a, 3b | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2023 Tentamen januari | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2023 Fx1 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2023 Omtentamen april | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10, 11 |
| HT2023 Fx2 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2024 KS1 | P+L | 1 | 2 | 3 |  |  |  |  |  |  |  |
| HT2024 KS2 | P+L | 1 | 2 | 3 | 4 | 5 | 6 |  |  |  |  |
| HT2024 KS3 | P+L | 1 | 2a, 2b | 3a, 3b | 4 | 5 | 6 | 7 | 8 | 9 |  |
| HT2024 Tentamen januari | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2024 Fx1 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2024 Omtentamen april | P+L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2024 Fx2 | P+L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2025 KS1 | L | 1 | 2a, 2b | 3a, 3b |  |  |  |  |  |  |  |
| HT2025 KS2 | L | 1 | 2a, 2b | 3a, 3b | 4 |  |  | 7 | 8 |  |  |
| HT2025 Tentamen | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2025 Fx1 | L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |
| HT2025 Omtentamen april | L | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
| HT2025 Fx2 | L | 1 | 2 | 3 | 4 |  |  | 7 | 8 |  |  |

### Hur skrivningarna har sett ut

Underlaget har 53 gamla sittningar. Uppgift N hör alltid till område N: K1–K9 är de nio delområdena och "Hö" (uppgift 10 och uppåt) är högrebetygsproblem. De flesta år har fyra kontrollskrivningar, en tenta i januari, en omtenta i april och två fx-skrivningar (HT2024 hade tre KS, HT2025 bara två). Upplägget har ändrats över tid:

| Period | Kontrollskrivningar (områden) | Tenta (Del I–III) | Fx-skrivningar |
| --- | --- | --- | --- |
| HT2019 | KS1=1,2,3 · KS2=4,5,6 · KS3=7,8,9 · KS4=1–9 (omtag) | 1–9 + Hö 10,11,12,13 | Fx1=1,2,3,5,6,7,8,9 (ingen 4) |
| HT2020–HT2021 | KS1=1,2,3,5 · KS2=2,4,5,6 · KS3=3,7,8,9 · KS4=1–9 (omtag; a/b på 2,3,5) | 1–9 + Hö 10,11 | Fx1,Fx2=1–9 |
| HT2022–HT2023 | KS1=1,2,3 · KS2=2,3,4,5,6 · KS3=3,7,8,9 · KS4=1–9 (omtag; a/b på 2,3) | 1–9 + Hö 10 (HT2023 Omtentamen april: Hö 10,11) | Fx1,Fx2=1,2,3,4,7,8 |
| HT2024 | KS1=1,2,3 · KS2=1–6 · KS3=1–9 (omtag; a/b på 2,3) | 1–9 + Hö 10 | Fx1,Fx2=1,2,3,4,7,8 |
| HT2025 | KS1=1,2,3 (a/b på 2,3) · KS2=1,2,3,4,7,8 (a/b på 2,3) | 1–9 + Hö 10 | Fx1,Fx2=1,2,3,4,7,8 |

En senare skrivning ger ofta en andra chans på tidigare områden. KS4 tog HT2019–HT2023 om alla nio områdena från KS1–KS3; HT2024 gjorde KS3 samma sak. HT2025 KS2 tar om KS1:s områden 1,2,3 och lägger till 4,7,8. HT2021 hade dessutom en omtenta i september med bara områdena 1,2,3,4,7,8. Fx-skrivningarna från HT2022 och framåt täcker just de sex områdena 1,2,3,4,7,8 och hoppar över 5,6,9.

HT2019 har två specialfall från pandemin: en hemtentamen i april (uppgift 1–9 + Hö 10,11) och en lista kompletteringsuppgifter, båda med hemmatentaregler.

**Närmast HT2026:** HT2025 ligger närmast. Det året fanns bara KS1 och KS2 (som i år), KS1 = områdena 1,2,3, tentan = 1–9 plus ett högrebetygsproblem (uppgift 10), och båda fx-skrivningarna = de sex grundområdena 1,2,3,4,7,8. HT2022–HT2024 ligger nära på tenta och fx. Skillnader mot i år: i år är KS2 bara 4,7,8, medan HT2025 KS2 var 1,2,3,4,7,8 (alltså ett omtag på KS1 också), och ingen gammal KS2 är exakt 4,7,8. Hjälpmedlen skiljer sig också (se nedan) — HT2025:s kända regler säger formelsamling, HT2022–HT2024 säger handskrivet A4-ark.

### Regler som skrivningarna själva anger

- **Hjälpmedel, A4-ark (HT2020–HT2024):** "Tillåtna hjälpmedel är ett A4-ark med egna anteckningar från kursen. Anteckningar får finnas på båda sidor av arket, men det måste vara precis ett A4 ark och anteckningarna måste vara *handskrivna*" (HT2022 KS1). HT2024 KS2 skärper till "ett (*inte* två) A4-ark".
- **Hjälpmedel, formelsamling (HT2025):** "Inga tillåtna hjälpmedel förutom ingående formelsamling" (HT2025 Omtentamen april, HT2025 Fx2). Enda stället i underlaget där formelsamlingen nämns som hjälpmedel.
- **Hjälpmedel, hemtenta (HT2019):** "all kurslitteratur och allt kursmaterial är tillåtna hjälpmedel" (HT2019 Hemtentamen april).
- **Miniräknare:** "Ingen form av miniräknare är tillåten" (HT2022 KS1 med flera); "Ingen miniräknare är tillåten" (HT2021 KS3).
- **Skrivtid:** KS normalt "2 timmar och 45 minuter med start 15.15" (HT2022 KS1), längre KS 3–4 tim 45 min (HT2024 KS3: "4 timmar och 45 minuter"); tenta "5 timmar med start 8.00" (HT2024 Tentamen januari); fx "3 timmar" (HT2024 Fx1); under pandemin "1 timme och 45 minuter + 25-30 minuter extra tid för bildhantering" (HT2021 KS1).
- **Bedömning:** "Ingen poängsättning sker, varje lösning är antingen helt rätt eller helt fel – dock bedöms inte lösningar som har slarvfel i sig som felaktiga om slarvfelet inte ändrar den logiska strukturen" (HT2019 Hemtentamen april, HT2021 Omtentamen april).
- **Motiveringar:** "Om inget annat anges i uppgifterna krävs alltid tydliga, fullständiga och korrekta motiveringar" (HT2022 och framåt). Otydliga lösningar "rättas inte utan anses vara underkända" (HT2019 Hemtentamen april).
- **Venndiagram:** "Som vanligt får *inte* Venndiagram ingå i en lösning" (HT2025 KS1, HT2025 KS2). Undantag förekommer: "Som ett undantag är det nu tillåtet att använda Venndiagram, men... *måste* de vara mycket tydliga... Bara Venndiagram med bristfällig text är underkänt" (HT2021 Fx1). Privat kladd som inte lämnas in är alltid tillåtet.
- **Mängdteoretisk sanningstabell:** tillåten men "UTAN sammanblandning om vad som är en mängd och vad som är en utsaga" (HT2025 KS1/KS2). I en enskild uppgift kan den förbjudas: "Sanningstabell får inte användas i denna uppgift" (HT2022 KS4, uppgift 1).
- **Bara diagram eller tabell räcker inte (tenta):** "Det går till exempel absolut inte att bara svara med diagram eller tabeller utan åtföljande text som i detalj motiverar varför slutsatser kan dras. Visa alltså *hur* du resonerar" (HT2023 Tentamen januari, HT2023 Omtentamen april).
- **Högst en av 2a och 2b:** "Högst en av 2a och 2b får lösas och det räcker med en korrekt lösning på en av dem för godkänt på område 2. Mängdlära. Lämna INTE in lösningar på båda!" (HT2022 KS4). Samma gäller 3a/3b (och 5a/5b vissa år).
- **Del I–III och betyg:** "Del I... nio problem som svarar mot kursens nio delområden... För lägsta godkända betyg (E) måste alla nio delområden vara avklarade"; Del II ger C, Del III ger A (HT2021 Omtentamen april).
- **Tidigare avklarat behöver inte göras om:** "De problem som svarar mot delområden som tidigare är avklarade från kursens kontrollskrivningar behöver inte lösas" (HT2019 Hemtentamen april). Det är så KS kan klara av områden före tentan.
- **Tillgodoräknande, "täcka område N":** "Om en uppgift som tillhör ett högre betyg löses korrekt och den uppgiften kan sägas *täcka* ett av de grundläggande nio delområdena... anses [området] då avklarat... I alla uppgifter för högre betyg anges vilken uppgift i Del I som de kan täcka" (HT2019 Hemtentamen april, HT2021 Omtentamen april).
- **Muntlig tentamen (äldre år):** "de uppgifter som kan användas för muntlig tentamen är 2, 3, 5 och 6" (HT2021 Tentamen januari); "Till denna kontrollskrivning hör Muntlig Tentamen 2..." (HT2021 KS4).

### Det som saknas i underlaget

- **Två sittningar saknar lösningsfil helt:** HT2019 Hemtentamen april och HT2019 Komplettering (bara uppgiftsfil). Det finns alltså inga facit för HT2019 Hemtentamen april U1–U11 eller HT2019 Komplettering U2, U3, U5, U6.
- **Facit som bara upprepar uppgiften:** HT2024 Fx2 U1 och HT2024 Fx2 U7 (extraktionen hittade ingen egen lösning för dem).
- **Sittningar med bara lösningsfil, så försättstextens regler saknas:** HT2025 KS1, HT2025 KS2, HT2025 Tentamen och HT2025 Fx1 — deras hjälpmedelsregel är alltså **okänd**, inte antagen. Samma gäller de HT2019- och HT2020-sittningar som bara har lösningsfil (HT2019 KS1–KS4, Tentamen januari, Fx1 och HT2020:s sittningar, där bara enstaka hjälpmedelsrader finns, t.ex. i HT2020 KS1) och HT2021 Omtentamen september. HT2019 Hemtentamen april och HT2019 Komplettering har däremot försättstext med regler.
- **Viktigast för i år:** formelsamlingen nämns som hjälpmedel bara i HT2025 Omtentamen april och HT2025 Fx2. Vad som gällde på HT2025 KS1, KS2, Tentamen och Fx1 går inte att läsa ur underlaget, så det kan varken bekräfta eller motsäga om en formelsamling fanns på KS1.
- **Numreringshopp är avsiktliga, inte luckor:** fx-skrivningarna saknar ofta uppgift 5 och 6 (de täcker bara områdena 1,2,3,4,7,8), och flera äldre skrivningar saknar uppgift 4. Så står det i källorna.

## Område 1 – Logik

**grundläggande område – KS1 (10/11) och tentan.** Uppgifter i underlaget: 42, från 42 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Ekvivalensutredning | 14 | 14 | HT2019–HT2025 | 2 |
| Härledningsbedömning | 12 | 12 | HT2019–HT2025 | 8 |
| Giltighetsbevis | 8 | 8 | HT2019–HT2025 | 1 |
| Utsagans giltighet | 3 | 3 | HT2022–HT2025 | 1 |
| Kryssuppgift | 3 | 3 | HT2021–HT2025 | 1 |
| Konnektivomskrivning | 2 | 2 | HT2021–HT2022 | 0 |

- **Härledningsbedömning** – en numrerad härledning med premisser och en slutsats ges; avgör om den är giltig och visa stegen, annars ge en tilldelning som uppfyller premisserna men inte slutsatsen.
- **Giltighetsbevis** – en härledning eller en namngiven slutledningsregel påstås gälla och ska bevisas giltig, med formell härledning eller sanningstabell.
- **Ekvivalensutredning** – avgör om en eller flera logiska ekvivalenser eller implikationer mellan givna utsagor gäller; bevisa de sanna och ge motexempel för de falska.
- **Utsagans giltighet** – avgör om en enda sammansatt utsaga alltid är sann, alltid falsk eller kontingent; bevisa eller ge motexempel.
- **Konnektivomskrivning** – skriv om en utsaga så att bara ett särskilt konnektiv används, Scheffers streck eller Pierces pil.
- **Kryssuppgift** – kryssa för flera par eller härledningar om de är ekvivalenta eller korrekta; högst ett fel och inga motiveringar krävs.

### Vad uppgifterna ber om

Uppgift 1 hör alltid till Logik, men alla skrivningar har den inte: den finns i 42 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx1 7 av 7; Fx2 6 av 6; Hemtentamen 1 av 1; KS1 7 av 7; KS4 5 av 5; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: KS2 2 av 7; KS3 1 av 6. Aldrig: Komplettering 0 av 1. (Räknat ur matrisen.) Formerna varierar men kretsar kring några få saker.

- Vanligast: en numrerad härledning med premisser och en slutsats, och frågan "är härledningen giltig eller inte?" (HT2024 KS1 U1).
- Gäller den: visa varje steg med namngiven slutledningsregel. Gäller den inte: ge en tilldelning av sanningsvärden som uppfyller alla premisser men inte slutsatsen (HT2019 Hemtentamen april U1).
- "Bara en tabell utan text är underkänt" — en sanningstabell måste följas av text som förklarar hur den används (HT2024 KS1 U1).
- Ibland är sanningstabell uttryckligen förbjuden och härledning krävs (HT2024 KS2 U1).
- En annan form ber dig avgöra om två utsagor är logiskt ekvivalenta, eller vilka av flera ekvivalenser som gäller (HT2023 KS1 U1, HT2023 KS4 U1).
- En form ber dig avgöra om en enda utsaga är tautologi, kontradiktion eller kontingent (HT2022 Fx2 U1).
- Kryssuppgift: flera rader där du kryssar ekvivalent eller inte, korrekt eller inkorrekt; högst ett fel för godkänt och inga motiveringar krävs (HT2022 KS1 U1).
- Specialform: ett nytt konnektiv införs och en utsaga ska skrivas om med bara det konnektivet (HT2021 Fx2 U1, HT2022 Tentamen januari U1).
- Du måste skilja på att bevisa att något gäller för alla och att motbevisa, där en enda tilldelning räcker (HT2020 Omtentamen april U1).

**De senaste åren (HT2024–HT2025):** två former förekommer sida vid sida. Den ena är härledningsbedömningen "är härledningen giltig eller inte?" med fyra till fem numrerade premisser och krav på full motivering i text (HT2024 KS1 U1, HT2024 Tentamen januari U1, HT2025 Fx1 U1). Den andra är ekvivalensutredningen "bevisa eller motbevisa att en ekvivalens alltid gäller" (HT2025 KS1 U1) eller "är formeln sann för alla?" (HT2025 Tentamen U1). HT2025, som ligger närmast den här terminen, hade ekvivalensutredning på både KS1 och tentan. Sanningstabell är oftast tillåten men måste förklaras i text, och är ibland förbjuden.

### Så löser lösningsförslagen uppgifterna

**Härledningsbedömning**

1. Försök först härleda slutsatsen; om försöken misslyckas leds du att i stället söka ett motexempel (HT2024 Fx1 U1).
2. För att bevisa giltighet, gör ett antagande och numrera det: antingen slutsatsens förled för hypotetisk härledning, eller motsatsen till slutsatsen för indirekt härledning (HT2024 KS2 U1, HT2024 Omtentamen april U1).
3. Dra nya rader steg för steg med namngiven slutledningsregel och hänvisning till radnummer tills slutsatsen nås (HT2024 Omtentamen april U1).
4. För att motbevisa, sätt slutsatsen falsk; är slutsatsen en implikation ger det direkt förledet sant och efterledet falskt (HT2024 Fx1 U1).
5. Arbeta sedan systematiskt fram övriga sanningsvärden så att alla premisser blir sanna, och redovisa den färdiga tilldelningen (HT2024 Fx1 U1).

Fallgropar: bara en sanningstabell utan förklarande text underkänns (HT2024 KS1 U1); ibland är sanningstabell förbjuden så då måste du härleda (HT2024 KS2 U1).

**Giltighetsbevis**

1. Välj metod: formell härledning, eller sanningstabell för en regel med få utsagor (HT2023 Fx1 U1).
2. Vid härledning, numrera premisserna, gör vid behov ett antagande och härled slutsatsen med namngivna regler (HT2022 KS4 U1).
3. Fastnar du, skriv om implikationer till disjunktioner eller använd kontraposition för att komma vidare (HT2021 Fx1 U1).
4. Vid sanningstabell, ställ upp alla rader, peka ut raderna där alla premisser är sanna och visa att slutsatsen är sann just där (HT2021 Omtentamen september U1).

Fallgropar: en sanningstabell måste förklaras i text, annars underkänt (HT2021 Omtentamen september U1).

**Ekvivalensutredning**

1. Välj sanningstabell eller omskrivning med logiska lagar (HT2023 Tentamen januari U1).
2. Vid sanningstabell, bygg en kolumn per utsaga och jämför: identiska kolumner betyder ekvivalenta, en enda skiljande rad betyder inte ekvivalenta (HT2020 Fx2 U1, HT2023 Tentamen januari U1).
3. Vid omskrivning, skriv om implikationer till disjunktioner och använd DeMorgan och distributiva lagen tills ena ledet blir lika det andra (HT2023 KS1 U1).
4. Gäller ekvivalensen inte, ge en tilldelning som gör ena ledet sant och det andra falskt (HT2021 Omtentamen april U1, HT2023 KS4 U1).

Fallgropar: en sanningstabell måste tolkas i text, och ska uppgiften lösas på två olika sätt måste båda redovisas (HT2023 Tentamen januari U1).

**Utsagans giltighet**

1. För att visa tautologi, skriv om utsagan med logiska lagar tills den blir sann, till exempel att ett led tillsammans med sin negation alltid är sant (HT2022 Fx2 U1).
2. För att visa kontingent, ge en tilldelning som gör utsagan sann och en annan som gör den falsk (HT2022 Fx2 U1).
3. Är utsagan en implikation, utnyttja att en implikation med falskt förled eller sant efterled alltid är sann (HT2023 Omtentamen april U1).
4. För att visa att den inte alltid gäller, hitta en enda tilldelning som gör den falsk (HT2023 Omtentamen april U1).

Fallgropar: skilj på att visa "alltid sann", som kräver bevis för alla, och "inte alltid sann", där ett motexempel räcker (HT2023 Omtentamen april U1).

**Konnektivomskrivning**

1. Skriv först om grundbyggstenarna negation, konjunktion och disjunktion med bara det nya konnektivet, med hjälp av dess definition (HT2022 Tentamen januari U1).
2. Skriv om hela utsagan till negation, konjunktion och disjunktion först, till exempel implikation till disjunktion (HT2021 Fx2 U1).
3. Byt sedan stegvis ut varje del mot sin konnektiv-form; vänta dig många parenteser (HT2022 Tentamen januari U1).

Fallgropar: slutsvaret får bara innehålla det nya konnektivet och parenteser (HT2021 Fx2 U1).

**Kryssuppgift**

1. Avgör varje rad för sig med en snabb omskrivning eller ett litet resonemang (HT2022 KS1 U1).
2. Kryssa en ruta per rad; en rad utan kryss räknas som fel (HT2021 KS1 U1).
3. Sikta på alla rätt: högst ett fel ger godkänt, men HT2025 Fx2 U1 kräver alla rätt (HT2022 KS1 U1, HT2025 Fx2 U1).

Fallgropar: inga motiveringar krävs, så lägg tiden på att hinna igenom alla rader utan slarv (HT2022 KS1 U1).

### Formelsamlingen och kapitlet

Formelsamlingen skriver för Logik: symbolerna för "för alla", "det finns" och implikation; lagarna kommutativa, associativa, distributiva, dubbel negation, idempotens, DeMorgan, absorption och kontraposition (inklusive att en implikation kan skrivas som en disjunktion); samt de fem slutledningsreglerna modus ponens, modus tollens, disjunktiv syllogism, hypotetisk syllogism och dilemma.

Det som uppgifterna och lösningarna behöver men bladet inte ger:

- Härledningsstrategierna: hypotetisk härledning (antag förledet), indirekt härledning eller motsägelsebevis (antag motsatsen till slutsatsen) och bevis genom falluppdelning (HT2024 KS2 U1, HT2022 KS4 U1, HT2019 Tentamen januari U1).
- Konjunktiv förenkling (dra ut ett led ur en konjunktion) och sammanslagning (slå ihop två rader till en konjunktion) (HT2024 KS3 U1).
- Hur man hittar ett motexempel genom att sätta slutsatsen falsk och arbeta baklänges till premisserna (HT2024 Fx1 U1).
- Definitionen av exklusivt eller, som ges i uppgiftstexten när den behövs (HT2024 KS1 U1).
- Biimplikationen och dess samband med exklusivt eller, som inte står på bladet (HT2021 Tentamen januari U1).
- Specialkonnektiven Scheffers streck och Pierces pil med sina definitioner, som införs i uppgiften (HT2021 Fx2 U1, HT2022 Tentamen januari U1).
- Begreppen tautologi, kontradiktion och kontingent, som definieras i uppgiften (HT2022 Fx2 U1).

### Uppgifter som återkommer

- Härledningsbedömning med fyra till fem premisser, "är den giltig?": HT2024 KS1 U1, HT2024 KS2 U1, HT2024 Fx1 U1, HT2024 Omtentamen april U1, HT2025 Fx1 U1.
- Ett nytt konnektiv (NAND/NOR) införs och en utsaga skrivs om eller en identitet visas med bara det: HT2021 Fx2 U1, HT2022 Tentamen januari U1, HT2022 Fx1 U1.
- Reglerna för hur en implikation fördelas över konjunktion respektive disjunktion: HT2024 KS3 U1, HT2025 KS2 U1.
- En icke-standardregel ska bevisas giltig (destruktivt dilemma, utvidgat dilemma, dilemma): HT2019 Tentamen januari U1, HT2021 Omtentamen september U1, HT2023 Fx1 U1.
- Kryssuppgift korrekt/inkorrekt, ekvivalent/inte eller sant/falskt: HT2021 KS1 U1, HT2022 KS1 U1, HT2025 Fx2 U1.

### Mönsterlösningar

- **Härledningsbedömning**: HT2024 Omtentamen april U1
- **Giltighetsbevis**: HT2025 Omtentamen april U1
- **Ekvivalensutredning**: HT2023 Tentamen januari U1
- **Utsagans giltighet**: HT2023 Omtentamen april U1
- **Konnektivomskrivning**: HT2022 Tentamen januari U1
- **Kryssuppgift**: HT2025 Fx2 U1

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS1 U1 | Härledningsbedömning | Är härledningen giltig? 1. $p \to q$ 2. $q \to r$ 3. $r \to p \lor \neg q$, slutsats $r$. Gäller den, visa stegen; annars ge en tilldelning som uppfyller premisserna men inte slutsatsen. | Inte korrekt. Sanningstabell: när $p, q, r$ alla är falska är premisserna 1, 2 och 3 uppfyllda men slutsatsen $r$ inte. Metod: ställ upp tabell och läs av raden. |
| HT2019 KS4 U1 | Giltighetsbevis | Visa att härledningen är korrekt, där $q \oplus s \Leftrightarrow (q \land \neg s) \lor (\neg q \land s)$: 1. $p \to q$ 2. $r \to s$ 3. $q \to \neg s$ 4. $p \lor r$, slutsats $q \oplus s$. | Korrekt. Härledning: härled först $p \to q \lor s$ och $r \to q \lor s$, dra $q \lor s$ med dilemma, kombinera med omskrivning av 3 och distributiva lagen till $q \oplus s$. |
| HT2019 Tentamen januari U1 | Giltighetsbevis | Bevisa att slutledningsregeln destruktivt dilemma är giltig (grundregler eller sanningstabell): 1. $p \to r$ 2. $q \to s$ 3. $\neg r \lor \neg s$, slutsats $\neg p \lor \neg q$. | Giltig. Kontraposition av 1 och 2 ger $\neg r \to \neg p$ och $\neg s \to \neg q$; bevis genom falluppdelning på $\neg r \lor \neg s$ ger i båda fallen $\neg p \lor \neg q$. |
| HT2019 Fx1 U1 | Ekvivalensutredning | Antag att $p, q, r$ uppfyller $p \land q \to r$, $q \land r \to p$ och $p \land r \to q$. Gäller då $p \leftrightarrow q$ och $q \leftrightarrow r$? Varför, varför inte? | Nej. Motexempel: $p = sann$, $q = r = falsk$ uppfyller alla tre kraven men då har $p, q, r$ inte samma sanningsvärde, så biimplikationerna gäller inte. |
| HT2019 Hemtentamen april U1 | Härledningsbedömning | Studera härledningen 1. $p \to q$ 2. $q \to \neg p$ 3. $p \lor \neg r$, slutsats $r$. Är den korrekt? Visa en härledning eller sanningstabell, annars ge en tilldelning som uppfyller premisserna men inte slutsatsen. | Lösning saknas i underlaget. |
| HT2020 KS1 U1 | Härledningsbedömning | Är slutledningen giltig? 1. $p \to q \lor r$ 2. $q \to t \lor \neg r$ 3. $r \to t \lor \neg q$ 4. $\neg t$, slutsats $r \land q \to \neg p$. Visa reglerna, annars ge en tilldelning till $p, q, r, t$ som uppfyller premisserna men inte slutsatsen. | Giltig. Hypotetisk härledning: antag $r \land q$, använd DeMorgan och modus tollens upprepat för att få $\neg p$, avsluta med $r \land q \to \neg p$. |
| HT2020 KS4 U1 | Härledningsbedömning | Härledningen är korrekt eller felaktig: 1. $p \to q$ 2. $q \to r$ 3. $\neg r \lor p$ 4. $q \lor r$, slutsats $p$. Visa (sanningstabell eller steg) om korrekt, annars ge en tilldelning till $p, q, r$ som uppfyller premisserna men inte slutsatsen. | Giltig. Indirekt härledning: antag $\neg p$; disjunktiv syllogism och modus ponens ger en motsägelse $\bot$, alltså $p$. |
| HT2020 Tentamen januari U1 | Ekvivalensutredning | Formulera och bevisa en av DeMorgans lagar för tre utsagor $p, q, r$. Sanningstabell får inte användas men DeMorgan för två utsagor får användas. | Lagen $\neg(p \lor q \lor r) \Leftrightarrow \neg p \land \neg q \land \neg r$. Bevis: skriv $p \lor q \lor r$ som $p \lor (q \lor r)$ och tillämpa DeMorgan för två utsagor i två steg. |

| HT2020 Fx1 U1 | Ekvivalensutredning | Låt $p, q, u, v$ vara givna. Visa att $(\neg p \to u) \land (\neg q \to v) \Leftrightarrow (p \land q) \lor (u \land q) \lor (p \land v) \lor (u \land v).$ | Gäller. Metod: skriv om varje implikation som en disjunktion, och använd distributiva lagen två gånger tills vänsterledet blir högerledet. |
| HT2020 Omtentamen april U1 | Ekvivalensutredning | Var och en är sann för alla $p, q, r$ eller inte; bevisa de sanna, ge motexempel för de falska. 1. $\neg p \to \neg q \Leftrightarrow \neg(\neg p \land q)$ 2. $p \land (q \lor r) \Leftrightarrow (p \land q) \lor r$ 3. $(p \to q) \land (q \to r) \land (r \to p) \Leftrightarrow \neg((p \lor q \lor r) \land (\neg p \lor \neg q \lor \neg r))$ | 1 och 3 gäller, 2 gäller inte. 1 via omskrivning (kontraposition). 3 via resonemang: båda leden säger att alla har samma sanningsvärde. Motexempel för 2: $p$ falsk och $r$ sann. |
| HT2020 Fx2 U1 | Ekvivalensutredning | Tre utsagor $(p \land r) \lor (\neg p \land \neg(q \oplus r)) \qquad (p \to r) \land (r \lor q) \qquad r \lor (\neg p \land q \land \neg r)$ ges; två är ekvivalenta och en är det inte. Visa vilka två som är ekvivalenta och varför den tredje inte är det. ($\oplus$ är exklusivt eller.) | Den andra och tredje är ekvivalenta, den första inte. Metod: sanningstabell med alla tre; de två vars kolumner är identiska är ekvivalenta, den som skiljer sig på en rad är den tredje. |
| HT2021 KS1 U1 | Kryssuppgift | Svarsformulär: kryssa ekvivalenta eller inte för varje par (högst ett fel; $p \oplus q$ betyder $(p \lor q) \land (\neg(p \land q))$). Paren: $\neg(p \land (q \lor r))$ och $q \lor r \to \neg p$; $\neg(p \oplus q)$ och $(p \to q) \land (\neg p \to \neg q)$; $\neg(p \land q \land \neg r)$ och $\neg p \lor q \lor r$; $(r \to \neg q) \to p$ och $p \lor (q \land r)$. | Alla par är ekvivalenta utom $\neg(p \land q \land \neg r)$ och $\neg p \lor q \lor r$. Metod: avgör varje rad med omskrivning. |
| HT2021 KS4 U1 | Ekvivalensutredning | Ett påstående gäller för alla $p, q, r$ och ett gör det inte: $r \to (q \to \neg p) \Leftrightarrow p \to (q \to \neg r) \qquad p \to (q \to r) \Leftrightarrow q \to (r \to p)$. Bevisa det sanna och ge en tilldelning som visar att det andra inte gäller. | Första påståendet är sant (omskrivning: skriv implikationerna som disjunktioner och använd associativa och kommutativa lagen). Andra är falskt: $p = sann$, $q = sann$, $r = falsk$ ger leden olika sanningsvärden. |
| HT2021 Tentamen januari U1 | Giltighetsbevis | Visa att härledningen är korrekt utan sanningstabell och ange reglerna: 1. $p \to q$ 2. $q \to p \lor r$ 3. $r \to \neg(p \oplus q)$, slutsats $p \leftrightarrow q$. Ledning: $p \oplus q \Leftrightarrow \neg(p \leftrightarrow q)$. | Korrekt. Motsägelsebevis: antag $\neg(p \leftrightarrow q)$, alltså $p \oplus q$; modus tollens på 3 ger $\neg r$; disjunktiv syllogism och omskrivning ger $q \to p$, som med 1 ger motsägelsen $\bot$ (lösningens sista rad trycker felaktigt $p \to q$). |
| HT2021 Fx1 U1 | Giltighetsbevis | Visa att slutledningen är riktig och ange reglerna: 1. $p \to (q \to r)$ 2. $(p \to q) \to r$ 3. $r \to \neg t$ 4. $\neg t \to \neg r$, slutsats $\neg q$. Kan inte lösas bara med sanningstabell. | Riktig. Omskrivning av 3 och 4 ger via distributiva lagen $\neg r$; modus tollens på 2 ger $\neg(p \to q)$, dvs $p \land \neg q$; ur $p$ och 1 fås $q \to r$, och modus tollens ger $\neg q$. |
| HT2021 Omtentamen april U1 | Ekvivalensutredning | Utred om ekvivalenserna gäller (bevis om ja, annars en tilldelning som visar att den inte gäller): $(p \lor q) \to (r \lor q) \Leftrightarrow (p \to r) \lor q \qquad (p \land q) \to (r \land q) \Leftrightarrow (p \to r) \land q.$ Sanningstabeller är tillåtna. | Den första gäller, den andra inte. Metod: sanningstabeller. Motexempel för den andra: $q = falsk$ ger vänsterledet sant och högerledet falskt. |

| HT2021 Fx2 U1 | Konnektivomskrivning | Scheffers streck definieras $p \vert q \Leftrightarrow \neg(p \land q)$ (NAND). Skriv om $(p \land q) \to \neg p$ så att bara Scheffers streck och parenteser används. | Svar: $(((p \vert q) \vert (p \vert q)) \vert p)$. Metod: skriv om negation som $p \vert p$, skriv implikationen som en disjunktion och byt stegvis ut delarna mot Scheffer-form. |
| HT2021 Omtentamen september U1 | Giltighetsbevis | Bevisa med sanningstabeller att två icke-standardregler är giltiga. Utvidgad disjunktiv syllogism: $p \lor q \lor r$, $\neg q$, $\neg r$, slutsats $p$. Utvidgat dilemma: $p \to r$, $q \to w$, $p \lor q$, slutsats $r \lor w$. Endast tabell utan text underkänns. | Båda giltiga. Metod: ställ upp sanningstabell (8 respektive 16 rader), peka ut raderna där alla premisser är sanna och visa att slutsatsen ($p$ respektive $r \lor w$) är sann just där; förklara i text. |
| HT2022 KS1 U1 | Kryssuppgift | Kryssa korrekt eller inkorrekt för sex härledningar (högst ett fel): (1) $p \lor q$, $p \to q$ $\therefore q$; (2) $p \lor q$, $\neg p \to \neg q$ $\therefore q$; (3) $p \lor q$, $\neg p \to \neg q$ $\therefore p$; (4) $\neg(p \land q)$, $p \to q$ $\therefore \neg p$; (5) $\neg(p \land q)$, $\neg p \to \neg q$ $\therefore \neg p$; (6) $\neg(p \land q)$, $\neg p \to \neg q$ $\therefore \neg q$. Inga motiveringar krävs. | Härledning 2 och 5 (mitten på varje rad av tre) är inkorrekta; de övriga fyra är korrekta. Metod: avgör varje härledning för sig. |
| HT2022 KS4 U1 | Giltighetsbevis | Visa att härledningen är korrekt steg för steg med reglerna (sanningstabell förbjuden): 1. $p \to q$ 2. $q \to (r \lor \neg w)$ 3. $r \to \neg p$ 4. $p \to w$, slutsats $\neg p$. | Korrekt. Indirekt härledning: antag $p$; modus ponens ger $q$ och $r \lor \neg w$; modus tollens ger $\neg r$, disjunktiv syllogism $\neg w$, modus tollens på 4 ger $\neg p$ och därmed motsägelsen $\bot$. |
| HT2022 Tentamen januari U1 | Konnektivomskrivning | Pierces pil definieras $p \downarrow q \Leftrightarrow \neg(p \lor q)$ (NOR). Skriv om $(p \lor q) \to p$ så att bara Pierces pil och parenteser används. | Svar: $(((p \downarrow q) \downarrow p) \downarrow ((p \downarrow q) \downarrow p))$. Metod: skriv om negation som $p \downarrow p$, skriv implikationen som en disjunktion och byt stegvis ut delarna mot Pierce-form. |
| HT2022 Fx1 U1 | Ekvivalensutredning | Pierces pil: $p \downarrow q \Leftrightarrow \neg(p \lor q)$ (NOR). Visa att $(p \downarrow q) \downarrow (p \downarrow p) \Leftrightarrow p$ för alla utsagor $p, q$. Alla metoder tillåtna. | Gäller. Metod: expandera varje pil med definitionen till negationer och disjunktioner och förenkla; sista steget använder absorptionslagen. |
| HT2022 Fx2 U1 | Utsagans giltighet | Avgör, för båda utsagorna, om de är tautologier, kontradiktioner eller kontingenta, med full motivering: $p \lor ((p \to q) \land (p \to r))$ samt $(p \to \neg q) \land (q \to \neg p) \land (r \to p)$. | Den första är en tautologi (förenklas till sann). Den andra är kontingent: alla falska gör den sann, medan $p$ sann och $q$ falsk gör den falsk. Metod: omskrivning plus två tilldelningar. |
| HT2023 KS1 U1 | Ekvivalensutredning | Avgör om de två utsagorna är logiskt ekvivalenta: $p \land (q \land \neg r) \quad \text{och} \quad (p \land q) \land \neg(q \land r).$ Alla giltiga metoder tillåtna. | Ekvivalenta. Metod: arbeta med högerledet, använd DeMorgan och distributiva lagen; termen med $q \land \neg q$ faller bort som kontradiktion och kvar blir vänsterledet. |

| HT2023 KS4 U1 | Ekvivalensutredning | Bilda $A \Leftrightarrow (p \to q) \land (r \lor w) \qquad B \Leftrightarrow \neg(p \land q) \to (\neg r \lor \neg w) \qquad C \Leftrightarrow (p \land q) \to (r \land w).$ Utred vilka av $A \Leftrightarrow B \qquad A \Leftrightarrow C \qquad B \Leftrightarrow C$ som gäller; bevisa dem som gäller och motbevisa de andra. | Ingen av ekvivalenserna gäller. Metod: sanningstabell (16 rader). $r$, $w$ sanna och $p$, $q$ falska ger $A$ och $B$ olika; $p$, $q$, $r$ sanna och $w$ falsk ger $A$ och $C$ olika. |
| HT2023 Tentamen januari U1 | Ekvivalensutredning | Undersök om $(p \to q) \lor (\neg q \to p) \qquad \neg(p \land \neg q)$ är ekvivalenta, både med och utan sanningstabell (en tabell utan förklarande text räcker inte). | Inte ekvivalenta. Sanningstabell: kolumnerna skiljer sig på andra raden. Utan tabell: första utsagan skrivs om till en tautologi, medan den andra är falsk då $p$ är sann och $q$ falsk. |
| HT2023 Fx1 U1 | Giltighetsbevis | Bevisa att slutledningsregeln dilemma gäller med en sanningstabell och förklara noga hur tabellen används: 1. $p \lor q$ 2. $p \to r$ 3. $q \to w$, slutsats $r \lor w$. | Gäller (lösningen är en beskrivning, ingen utskriven tabell). Metod: 16 rader för $p, q, r, w$; på varje rad där alla premisser är sanna är även $r \lor w$ sann, vilket visar regeln. |
| HT2023 Omtentamen april U1 | Utsagans giltighet | Den ena utsagan gäller för alla $p, q, r$, den andra inte: $((p \to q) \to p) \to p, \qquad (p \lor q) \to ((p \to r) \land (q \to r)).$ Bevisa den sanna och ge en tilldelning som visar att den andra inte är sann. | Första är alltid sann: om $p$ sann, implikation med sant efterled; om $p$ falsk, implikation med falskt förled. Andra blir falsk för $p$ sann och $q$, $r$ falska. |
| HT2023 Fx2 U1 | Ekvivalensutredning | För varje påstående, bevisa om sant eller visa falskt: $p \lor (q \land r) \Rightarrow (p \lor q) \land r, \qquad p \lor (q \land r) \Leftarrow (p \lor q) \land r, \qquad p \lor (q \land r) \Leftrightarrow (p \lor q) \land r.$ | Första och sista är falska, det andra ($\Leftarrow$) är sant. Metod: motexempel $p$, $q$ sanna och $r$ falsk för det första; sanningstabell visar det andra; det tredje är en konjunktion av de två och blir därför falskt. |
| HT2024 KS1 U1 | Härledningsbedömning | Är härledningen giltig eller inte? 1. $p \to q \lor r$ 2. $q \to s$ 3. $r \to s \lor t$ 4. $t \to \neg s$, slutsats $p \to s \oplus t$. Full motivering krävs; bara en tabell utan text är underkänt. Ledning: $s \oplus t$ betyder $(s \lor t) \land \neg(s \land t)$. | Giltig. Hypotetisk härledning: antag $p$; modus ponens ger $q \lor r$; dilemma ger $s \lor s \lor t$, idempotens ger $s \lor t$; DeMorgan på 4 ger $\neg(s \land t)$; tillsammans $s \oplus t$, alltså $p \to s \oplus t$. |
| HT2024 KS2 U1 | Härledningsbedömning | Är härledningen giltig eller inte? Full motivering utan sanningstabell: 1. $\neg p \lor q$ 2. $r \to \neg q$ 3. $s \to r \lor t$ 4. $s \to \neg t$, slutsats $s \to \neg p$. | Giltig. Hypotetisk härledning: antag $s$; modus ponens ger $\neg t$ och $r \lor t$; disjunktiv syllogism ger $r$; modus ponens ger $\neg q$; disjunktiv syllogism med 1 ger $\neg p$, alltså $s \to \neg p$. |
| HT2024 KS3 U1 | Härledningsbedömning | En av två regler är korrekt, den andra felaktig; avgör vilken och ge full utredning för båda. Regel 1: om $p \to q$ och $r \to s$ så gäller $(p \land r) \to (q \land s)$. Regel 2: om $p \to q$ eller $r \to s$ så gäller $(p \lor r) \to (q \lor s)$. | Regel 1 korrekt, regel 2 felaktig. Regel 1 via hypotetisk härledning (antag $p \land r$, konjunktiv förenkling, modus ponens, sammanslagning). Motexempel för regel 2: $p = falsk$, $q = falsk$, $r = sann$, $s = falsk$. |

| HT2024 Tentamen januari U1 | Härledningsbedömning | Avgör om slutsatsen är korrekt: 1. $p \to \neg r$ 2. $r \lor q$ 3. $r \to \neg s$ 4. $\neg(\neg s \land \neg p)$, slutsats $q$. | Korrekt. Härledning: DeMorgan på 4 ger $s \lor p$; omskrivning av 3 ger $s \to \neg r$; dilemma på 5, 6 och 1 ger $\neg r$; disjunktiv syllogism med 2 ger $q$. |
| HT2024 Fx1 U1 | Härledningsbedömning | Är härledningen giltig eller inte (utan sanningstabell)? 1. $p \to q \lor r$ 2. $s \to \neg t$ 3. $p \land s \to \neg u$ 4. $\neg r \to t$ 5. $q \to r \lor u$, slutsats $p \to \neg u$. | Ogiltig. Metod: sätt slutsatsen falsk, dvs $p$ sann och $u$ sann; premiss 3 via kontraposition tvingar $s$ falsk; välj sedan $t, q, r$ sanna så att alla premisser blir uppfyllda men slutsatsen falsk. |
| HT2024 Omtentamen april U1 | Härledningsbedömning | Avgör om härledningen är korrekt eller inte (motivering i text; bara en tabell utan text är underkänt): 1. $(s \to p) \lor \neg r$ 2. $r \to (t \lor p)$ 3. $s \lor \neg(q \land t)$ 4. $q$, slutsats $r \to p$. | Korrekt. Hypotetisk härledning: antag $r$; disjunktiv syllogism ger $s \to p$; modus ponens ger $t \lor p$; omskrivningar av 3 ger $s \lor \neg t$ och med 4 disjunktiv syllogism; dilemma ger $p$, alltså $r \to p$. |
| HT2024 Fx2 U1 | Härledningsbedömning | Avgör om härledningen är korrekt eller inte (alla metoder tillåtna): 1. $\neg r \to s$ 2. $s \to u$ 3. $\neg(u \lor t)$ 4. $t \to \neg r$ 5. $\neg p \to t$, slutsats $p$. | Lösning saknas i underlaget. |
| HT2025 KS1 U1 | Ekvivalensutredning | Bevisa eller motbevisa att $(p \to (q \to r)) \Leftrightarrow ((p \land q) \to r)$ alltid gäller. Alla metoder tillåtna. | Gäller (ekvivalenta). Metod: sanningstabell; kolumnerna för $p \to (q \to r)$ och $(p \land q) \to r$ är identiska. |
| HT2025 KS2 U1 | Utsagans giltighet | Visa eller motbevisa giltigheten av formeln $\left((p \to q) \land (r \to s)\right) \to \left((p \lor r) \to (q \lor s)\right).$ | Formeln är giltig (en tautologi). Metod: naturlig deduktion med fallanalys — anta vänsterledet, konjunktionseliminering, anta $p \lor r$, fall på $p$ respektive $r$ ger båda $q \lor s$, sedan implikationsintroduktion. |
| HT2025 Tentamen U1 | Ekvivalensutredning | Är formeln sann för alla $p, q, r, s$? Ge ett bevis: $(p \land (q \lor r)) \to s \Leftrightarrow ((p \land q) \to s) \land ((p \land r) \to s)$. | Gäller (sann för alla). Metod: ekvivalenskedja — skriv om vänsterledet med att en implikation är en disjunktion, DeMorgan och distributiva lagen tills det blir högerledet. |
| HT2025 Fx1 U1 | Härledningsbedömning | Är härledningen korrekt? Visa stegen (ingen sanningstabell) om ja, annars ge en tilldelning till $p, q, r, s, t$ som uppfyller alla premisser men inte slutsatsen: 1. $(p \lor q) \to r$ 2. $r \to (s \lor t)$ 3. $\neg s \to \neg p$ 4. $q \to \neg t$ 5. $\neg r \to q$, slutsats $r \land (s \lor t)$. | Korrekt. Indirekt härledning: antag $\neg r$; modus ponens med 5 ger $q$; disjunktiv addition ger $p \lor q$; modus ponens med 1 ger $r$, en motsägelse $\bot$, alltså $r$; modus ponens med 2 ger $s \lor t$, konjunktiv addition ger $r \land (s \lor t)$. |

| HT2025 Omtentamen april U1 | Giltighetsbevis | Visa att härledningen är korrekt och redovisa reglerna: 1. $p \lor q \to r$ 2. $\neg s \to \neg r \lor \neg t$ 3. $s \land t \to u$ 4. $r \to t$ 5. $\neg r \lor u$ 6. $p \lor q$, slutsats $s \land u$. | Korrekt. Modus ponens ger $r$ och sedan $t$; omskrivning ger $r \land t$; DeMorgan på 2 ger $\neg s \to \neg(r \land t)$, modus tollens ger $s$; disjunktiv syllogism på 5 ger $u$; alltså $s \land u$. |
| HT2025 Fx2 U1 | Kryssuppgift | Avgör om tre påståenden är sanna eller falska (inga motiveringar, men alla måste vara rätt). 1: $(p \to q) \lor (r \to p)$ är en tautologi. 2: $p \to (q \to r)$ och $(p \to q) \to r$ är logiskt ekvivalenta. 3: Från $(p \to q) \land (q \to \neg p)$ följer $\neg p \land \neg q$. | 1 sant, 2 falskt, 3 falskt. 1: skrivs om till sann. 2: motexempel $p$ falsk, $q$ sann, $r$ falsk. 3: $\neg p \land q$ uppfyller också premissen. |

## Område 2 – Mängdlära

**grundläggande område – KS1 (10/11) och tentan.** Uppgifter i underlaget: 54, från 47 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Sanningshaltsutredning | 21 | 21 | HT2019–HT2025 | 5 |
| Identitetsbevis | 13 | 13 | HT2020–HT2025 | 3 |
| Kartesisk produkt | 11 | 11 | HT2019–HT2025 | 3 |
| Konkret mängdräkning | 5 | 5 | HT2020–HT2024 | 2 |
| Potensmängd | 3 | 3 | HT2024–HT2025 | 3 |
| Kryssuppgift | 1 | 1 | HT2020–HT2020 | 0 |

- **Identitetsbevis** – en given mängdlikhet eller inklusion sägs gälla för alla mängder och ska bevisas, med formelmanipulation, elementargument eller mängdteoretisk sanningstabell.
- **Sanningshaltsutredning** – ett eller två påståenden ges; avgör vilket som gäller, bevisa det sanna och ge ett konkret motexempel för det falska.
- **Kartesisk produkt** – likheter och inklusioner som bygger på kryssprodukten, visade på parnivå med villkoret för när ett par ligger i en produkt.
- **Konkret mängdräkning** – räkna ut en bestämd mängd eller dess antal element ur mängder som är explicit givna eller definierade.
- **Potensmängd** – påståenden om potensmängden och dess storlek.
- **Kryssuppgift** – flera sant/falskt-påståenden utan motivering, där alla måste vara rätt.

### Vad uppgifterna ber om

Uppgift 2 hör alltid till Mängdlära, men alla skrivningar har den inte: den finns i 47 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx1 7 av 7; Fx2 6 av 6; Hemtentamen 1 av 1; KS1 7 av 7; KS4 5 av 5; Komplettering 1 av 1; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: KS2 6 av 7; KS3 1 av 6. (Räknat ur matrisen.) Nästan alla former handlar om att bevisa eller motbevisa en mängdformel.

- Vanligast: en mängdidentitet eller inklusion ska visas gälla för alla mängder, "Visa att ... alltid gäller" (HT2023 KS2 U2, HT2024 KS2 U2).
- En lika vanlig form ger två påståenden där det ena är sant och det andra falskt; bevisa det sanna och ge ett motexempel med konkreta mängder för det falska (HT2021 KS1 U2, HT2023 Fx1 U2).
- "Venndiagram är inte tillåtna" som bevismetod; ett logiskt hållbart argument krävs, även om man får rita diagram privat (HT2019 Fx1 U2, HT2023 KS2 U2).
- Använder du mängdteoretisk sanningstabell måste du skilja noga på vad som är en utsaga och vad som är en mängd (HT2022 Tentamen januari U2, HT2025 KS1 U2a).
- En sanningstabell måste förklaras i text; bara tabellen räcker inte (HT2024 KS2 U2).
- På KS och Fx med deluppgifter får du lösa högst en av 2a och 2b; lämnar du in båda rättas ingen (HT2022 KS4 U2a, HT2024 KS3 U2a).
- Symmetrisk differens och kryssprodukt definieras oftast i uppgiftstexten när de används (HT2021 KS2 U2, HT2024 KS3 U2b).
- Ibland är uppgiften i stället att räkna ut en bestämd mängd ur givna mängder (HT2024 Omtentamen april U2).

**De senaste åren (HT2024–HT2025):** formen är "bevisa eller motbevisa" en eller två givna mängdformler, där du själv måste avgöra sanningshalten (HT2024 Tentamen januari U2, HT2025 Fx1 U2). På KS1 och KS2 kommer uppgiften som ett val mellan 2a och 2b (HT2025 KS1 U2a, HT2025 KS2 U2a). Kryssprodukten och potensmängden återkommer (HT2024 Fx1 U2, HT2025 KS2 U2a), och mängdteoretisk sanningstabell är uttryckligen tillåten men måste formuleras noggrant. HT2025, som ligger närmast den här terminen, hade ett 2a/2b-val på både KS1 och KS2.

### Så löser lösningsförslagen uppgifterna

**Identitetsbevis**

1. Skriv om mängddifferens och symmetrisk differens till snitt, union och komplement, så att bara de operationerna återstår (HT2022 Tentamen januari U2, HT2023 KS2 U2).
2. Bearbeta ena ledet med distributiva lagen, DeMorgan och dubbla komplementet tills det blir lika det andra ledet (HT2024 KS2 U2, HT2022 KS2 U2).
3. Inför en kortare beteckning för ett återkommande deluttryck för att minska risken för räknefel (HT2023 KS1 U2, HT2022 KS2 U2).
4. Alternativt, för en inklusion, visa implikationen att ett godtyckligt element i vänsterledet ligger i högerledet (HT2019 KS4 U2, HT2022 KS4 U2b).
5. Alternativt bevisa en likhet genom två inklusioner, vänster i höger och höger i vänster (HT2023 KS4 U2a).

Fallgropar: ett led som snittas med sin egen negation blir tomma mängden och faller bort (HT2023 KS1 U2); Venndiagram duger inte som bevis (HT2023 KS2 U2).

**Sanningshaltsutredning**

1. Gissa först om formeln är sann, till exempel genom ett privat Venndiagram eller några små testmängder (HT2022 KS1 U2).
2. Tror du den är sann, bevisa den med formelmanipulation eller elementargument precis som ett identitetsbevis (HT2023 KS4 U2b, HT2025 Fx1 U2).
3. Tror du den är falsk, leta ett litet motexempel och räkna ut vänster- och högerled explicit och visa att de skiljer sig (HT2021 Fx2 U2, HT2022 KS1 U2).
4. Vid två påståenden: bevisa det sanna fristående och motbevisa det falska var för sig, utan att luta dig mot att det ena följer av det andra (HT2023 Fx1 U2, HT2025 Tentamen U2).

Fallgropar: att visa det ena falskt bevisar inte att det andra är sant, det måste bevisas separat (HT2023 Fx1 U2, HT2025 KS2 U2a).

**Kartesisk produkt**

1. Översätt medlemskap i en produkt till ett villkor på elementen: ett par ligger i produkten precis när förstakoordinaten ligger i första mängden och andrakoordinaten i andra (HT2022 Fx1 U2, HT2019 KS4 U2).
2. Visa en produktidentitet genom ekvivalenskedjan att ett par ligger i vänsterledet precis när det ligger i högerledet (HT2022 Fx1 U2, HT2025 KS1 U2b).
3. För ett motexempel, välj små konkreta mängder och räkna ut båda leden som uppräknade par (HT2024 Fx1 U2).
4. För kardinalitet, räkna antalet par direkt ur antalet val för varje koordinat (HT2022 Fx2 U2).

Fallgropar: en produktlikhet som ser rimlig ut kan vara falsk, kontrollera med konkreta mängder (HT2024 Fx1 U2).

**Konkret mängdräkning**

1. Räkna ut varje delmängd steg för steg och skriv ut den som en uppräkning av element (HT2024 Omtentamen april U2, HT2020 Tentamen januari U2).
2. Bygg upp det efterfrågade uttrycket utifrån och in, en operation i taget (HT2024 Omtentamen april U2).
3. Ska du hitta mängder som uppfyller givna villkor, konstruera ett exempel och verifiera varje villkor för sig (HT2024 Fx2 U2).

Fallgropar: håll ordning på universum när du tar komplement (HT2024 Omtentamen april U2).

**Potensmängd**

1. Räkna element i en potensmängd med att en mängd med n element har en potensmängd med två upphöjt till n element (HT2025 KS2 U2a, HT2024 KS3 U2a).
2. Motbevisa en potensmängdslikhet genom att jämföra antalet element i de två leden för små mängder (HT2024 KS3 U2a).
3. Bevisa en sann potensmängdslikhet med att en delmängd av ena ledet är en delmängd av det andra (HT2025 KS2 U2a).

Fallgropar: elementen i en potensmängd är själva mängder, blanda inte ihop element och delmängd (HT2025 Tentamen U2).

**Kryssuppgift**

1. Avgör varje rad för sig: skilj på om ett objekt är ett element i mängden eller en delmängd av den (HT2020 Fx1 U2).
2. Kom ihåg att tomma mängden är en delmängd av varje mängd (HT2020 Fx1 U2).

Fallgropar: inga motiveringar krävs men alla svar måste vara rätt, så dubbelkolla varje rad (HT2020 Fx1 U2).

### Formelsamlingen och kapitlet

Formelsamlingen skriver för Mängdlära: definitionerna av delmängd, element, snitt, union, komplement, mängdsubtraktion, kartesisk produkt, symmetrisk differens (som $(A \cup B) - (A \cap B)$), potensmängd och kardinalitet; talmängderna; samt lagarna kommutativa, associativa, distributiva, dubbla komplementet, idempotens, DeMorgan, absorption och kardinalitetslagarna för produkt och potensmängd.

Det som uppgifterna och lösningarna behöver men bladet inte ger:

- Elementargumentet: att visa en mängdlikhet genom att skriva om "ett element ligger i vänsterledet" till en ren logisk utsaga och jämföra med högerledet (HT2023 Omtentamen april U2, HT2025 KS2 U2b).
- Hur en mängdteoretisk sanningstabell ställs upp och tolkas, med utsagor som "elementet ligger i A" (HT2021 KS4 U2b).
- Att en likhet kan visas genom två inklusioner åt var sitt håll (HT2025 Tentamen U2).
- Kontraposition för mängder: en inklusion gäller precis när inklusionen mellan komplementen gäller åt andra hållet (HT2019 KS4 U2, HT2025 Fx1 U2).
- Att tomma mängden är en delmängd av varje mängd (HT2023 Fx1 U2).
- Att symmetrisk differens också kan skrivas $(A - B) \cup (B - A)$, den form uppgifterna oftast definierar (HT2021 Fx2 U2).
- Att symmetrisk differens av flera mängder är de element som ligger i ett udda antal av mängderna (HT2021 KS1 U2).
- Motexempelmetoden: att motbevisa en formel genom att välja små konkreta mängder och räkna ut båda leden (HT2022 KS1 U2).
- Skillnaden mellan att vara element i och delmängd av en mängd, särskilt med nästlade mängder (HT2020 Fx1 U2).

### Uppgifter som återkommer

- Visa en mängdidentitet med mängddifferens och symmetrisk differens genom formelmanipulation: HT2021 Tentamen januari U2, HT2022 Tentamen januari U2, HT2023 KS2 U2, HT2024 KS2 U2.
- Två påståenden, ett sant och ett falskt, bevisa det sanna och motbevisa det falska: HT2021 KS1 U2, HT2021 KS2 U2, HT2021 Fx1 U2, HT2023 Fx1 U2.
- En produktidentitet visas på parnivå med elementargument: HT2022 Fx1 U2, HT2025 KS1 U2b.
- Visa eller motbevisa $A - (B - C) = (A - B) \cup (A \cap C)$ (samma formel båda åren): HT2023 KS4 U2b, HT2025 Fx1 U2.
- Potensmängdslikhet med union eller snitt, bevisa eller motbevisa: HT2024 KS3 U2a, HT2025 KS2 U2a.
- Givet inklusionsvillkor, måste mängderna bli lika eller tomma: HT2019 KS1 U2, HT2019 Tentamen januari U2, HT2019 Fx1 U2.

### Mönsterlösningar

- **Identitetsbevis**: HT2024 KS2 U2
- **Sanningshaltsutredning**: HT2025 Fx1 U2
- **Kartesisk produkt**: HT2024 Fx1 U2
- **Konkret mängdräkning**: HT2024 Omtentamen april U2
- **Potensmängd**: HT2025 KS2 U2a
- **Kryssuppgift**: HT2020 Fx1 U2

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS1 U2 | Sanningshaltsutredning | Tre mängder med 1. $A \subset B$, 2. $B \subset C$ och 3. $C \subset A \cup B^{c}$: måste vi då alltid ha $C = \emptyset$? Om inte, ge exempel på tre mängder som uppfyller kraven men där $C \neq \emptyset$. | Nej, $C = \emptyset$ behövs inte. Motexempel: $A = \{1\}$, $B = \{1\}$, $C = \{1, 2\}$ uppfyller de tre kraven men $C \neq \emptyset$. Metod: hitta en uppsättning där inte alla fält som bygger upp $C$ tvingas tomma. |
| HT2019 KS4 U2 | Kartesisk produkt | Låt $A, B, C$ vara mängder med $A \subset B$ och $C^{c} \subset B^{c}$. Visa att $(B \times C)^{c} \subset (A \times B)^{c}$. Ledning: $E \subset F$ och $F^{c} \subset E^{c}$ hänger ihop. | Gäller. Metod: kontraposition $E \subset F \Leftrightarrow F^{c} \subset E^{c}$ ger den ekvivalenta formen $A \times B \subset B \times C$; välj $(x, y) \in A \times B$ och använd $A \subset B$ och $B \subset C$ för att få $(x, y) \in B \times C$. |
| HT2019 Tentamen januari U2 | Sanningshaltsutredning | Låt $A, B, C, D$ vara mängder. Om $A \subset C$, $B \subset D$ och $C \cup D = \emptyset$, måste vi då alltid ha $A = B$? Bevisa, annars ge fyra mängder som uppfyller kraven men där $A \neq B$. | Ja, och till och med $A = B = \emptyset$. Metod: antag $x \in A$; då ger $A \subset C$ att $C \neq \emptyset$, vilket ger $C \cup D \neq \emptyset$, en motsägelse, så $A = \emptyset$; på samma sätt $B = \emptyset$. |
| HT2019 Fx1 U2 | Sanningshaltsutredning | Antag att mängderna $A, B, C$ uppfyller $A \cap B \subset C$ och $B \cap C \subset A$ respektive $A \cap C \subset B$. Måste vi då ha $A = B = C$? Ge bevis, annars tre mängder som uppfyller kraven men inte $A = B = C$. Venndiagram får inte användas. | Nej. Motexempel: $A = \{1\}$, $B = C = \emptyset$ uppfyller alla tre kraven men inte $A = B = C$. Metod: ge ett litet motexempel med ett logiskt hållbart argument i stället för Venndiagram. |
| HT2019 Hemtentamen april U2 | Kartesisk produkt | Betrakta utsagorna $A \subset B \land C \subset D \Rightarrow A \times B \subset C \times D \qquad \text{och} \qquad A \subset C \land B \subset D \Rightarrow A \times B \subset C \times D.$ Den ena är sann och den andra falsk. (a) Ange och bevisa den sanna. (b) Ange den falska och ge fyra mängder $A, B, C, D$ som visar att den är falsk. | Lösning saknas i underlaget. |
| HT2019 Komplettering U2 | Kartesisk produkt | Bevisa formeln $A \times B \cup C \times D \subset (A \cup C) \times (B \cup D)$ och ge exempel på fyra mängder $A, B, C, D$ där inte likhet råder mellan $A \times B \cup C \times D$ och $(A \cup C) \times (B \cup D)$. | Lösning saknas i underlaget. |
| HT2020 KS1 U2 | Kartesisk produkt | Låt $A, B, C$ vara icketomma mängder med $A \times B \subset B \times C$ och $B \times C \subset C \times A$. Visa att $A = B = C$. | Gäller. Metod: elementargument. Välj $x \in A$; då ger $A \times B \subset B \times C$ att $x \in B$, alltså $A \subset B$; på samma sätt $B \subset C$ och $C \subset A$. Kedjan $A \subset B \subset C \subset A$ ger $A = B = C$. |
| HT2020 KS2 U2 | Sanningshaltsutredning | Låt $A, B, C$ vara godtyckliga mängder. Vad kan du säga om mängden $(A - (B \cup C)) \cap ((A \cap B) \cup (A \cap C))?$ Bevisa ditt påstående utan Venndiagram. | Mängden är tomma mängden. Metod: skriv om $A - (B \cup C)$ som snitt med komplementet och använd att ett led snittat med sin negation ger $A \cap \emptyset = \emptyset$. |

| HT2020 KS4 U2a | Identitetsbevis | Låt $A, B, C$ beteckna tre mängder. Visa att utsagorna $A \cap B \subset C^{c}$, $B \cap C \subset A^{c}$ och $A \cap C \subset B^{c}$ i själva verket är ekvivalenta. Venndiagram får inte användas. | Ekvivalenta. Metod: skriv om $A \cap B \subset C^{c}$ med delmängdsdefinitionen och DeMorgan till den symmetriska utsagan $x \in A^{c} \lor x \in B^{c} \lor x \in C^{c}$; eftersom den är symmetrisk i $A, B, C$ ger de andra två samma utsaga. |
| HT2020 KS4 U2b | Sanningshaltsutredning | Avgör om $(A \cup B) - C \subset B \land A \cap C \subset B \Rightarrow A \subset B$ är sant för alla mängder $A, B, C$. Om sant, bevisa utan Venndiagram; om falskt, ge tre mängder som motbevisar det. | Sant. Metod: skriv om $(A \cup B) - C \subset B$ till $A \cap C^{c} \subset B$; eftersom $A = (A \cap C) \cup (A \cap C^{c})$ och båda delarna ligger i $B$ följer $A \subset B$. |
| HT2020 Tentamen januari U2 | Konkret mängdräkning | Inför $E \oplus F = (E - F) \cup (F - E)$ och sätt $A = \{1, 2, 3, 4, 7, 8\}$, $B = \{3, 4, 5, 6, 7, 9\}$, $C = \{1, 2, 5, 6, 7, 10\}$. Beräkna $\vert (A \cap B) \cup (B \cap C) \times (A \oplus B \oplus C) \vert$. | 20. Metod: $(A \cap B) \cup (B \cap C)$ blir $\{3, 4, 5, 6, 7\}$ och $A \oplus B \oplus C$ blir $\{7, 8, 9, 10\}$, så produktens storlek är $5 \cdot 4 = 20$. |
| HT2020 Fx1 U2 | Kryssuppgift | Sätt $M = \{\emptyset, \{\emptyset\}\}$ och avgör vilka påståenden som är sanna respektive falska (inga motiveringar, men alla måste vara rätt): (a) $\emptyset \subset M$, (b) $\{\emptyset\} \subset M$, (c) $\{\{\emptyset\}\} \subset M$, (d) $\emptyset \in M$, (e) $\{\emptyset\} \in M$, (f) $\{\{\emptyset\}\} \in M$. | (a)-(e) sanna, (f) falsk. Metod: skilj på element i och delmängd av $M$; $\emptyset$ är delmängd av alla mängder, medan $\{\{\emptyset\}\}$ inte är ett element i $M$. |
| HT2020 Omtentamen april U2 | Identitetsbevis | Visa att två mängder $A, B$ är disjunkta precis då unionen är lika med den symmetriska differensen $(A - B) \cup (B - A)$. Venndiagram får inte användas. | Gäller. Metod: visa ekvivalensen $A \cap B = \emptyset \Leftrightarrow (A - B) \cup (B - A) = A \cup B$ åt båda håll; framåt direkt, bakåt med motsägelsebevis där ett element i $A \cap B$ inte kan ligga i $(A - B) \cup (B - A)$. |
| HT2020 Fx2 U2 | Sanningshaltsutredning | Bilda $S_1 = (A \cup B) \cap (C \cup D) \qquad S_2 = (A \cap B) \cup (C \cap D).$ Gäller någon generell delmängdsrelation $S_1 \subset S_2 \quad \text{eller} \quad S_2 \subset S_1$ för alla $A, B, C, D$? Bevisa den som gäller, annars ge motexempel för var och en. | Ingen av relationerna gäller generellt. Motexempel: $A = \emptyset$, $B = \emptyset$, $C = \{1, 2\}$, $D = \{2, 3\}$ ger $S_1 = (\emptyset) \cap (C \cup D) = \emptyset$ men $S_2 = \{2\}$, så inte $S_2 \subset S_1$; genom att kasta om rollerna fälls även $S_1 \subset S_2$. |
| HT2021 KS1 U2 | Sanningshaltsutredning | Låt $A, B, C, D$ vara vilka mängder som helst. Ett påstående är sant, det andra falskt: (1) antalet element i $A \oplus B \oplus C \oplus D$ är alltid jämnt; (2) om ett element ligger i $A \oplus B \oplus C \oplus D$ ligger det i ett udda antal av mängderna. Bevisa det sanna och ge fyra konkreta mängder som motbevisar det falska. ($\oplus$ är symmetrisk differens.) | Det första är falskt, det andra sant. Motexempel för (1): $A = B = C = \{1\}$ och $D = \emptyset$ ger $A \oplus B \oplus C \oplus D = \{1\}$, ett udda antal element. Metod för (2): fallanalys på hur många mängder $x$ ligger i; de jämna fallen leder till motsägelse. |
| HT2021 KS2 U2 | Sanningshaltsutredning | Två påståenden ($A, B, C$ godtyckliga, ett sant ett falskt): $A \oplus C = \emptyset \land A \cap B \cap C = \emptyset \Rightarrow A \cup C = \emptyset \qquad A \cap C = \emptyset \land B \subset A \cup C \Rightarrow B \subset A \oplus C.$ Bevisa det sanna och ge tre mängder som motbevisar det falska. $\oplus$ är symmetrisk differens $(E - F) \cup (F - E)$. | Det första är falskt, det andra sant. Motexempel: $A = C = \{1\}$ och $B = \emptyset$ ger $A \oplus C = \emptyset$ men $A \cup C = \{1\} \neq \emptyset$. Metod för det andra: använd $A \cup C = A \oplus C \cup (A \cap C)$ och $A \cap C = \emptyset$. |

| HT2021 KS4 U2a | Kartesisk produkt | Låt $A \subset E$, $\vert A \vert < \vert E \vert$, $B \subset F$, $\vert B \vert < \vert F \vert$, och $U = E \times F$ ändligt universum. Ett påstående är sant, det andra inte: P1: $(A^{c} \times B^{c})^{c} = (A \times B) \cup (A^{c} \times B) \cup (A \times B^{c})$. P2: $\vert (A^{c} \times B^{c})^{c} \vert = \vert A \times B \vert$. Bevisa det sanna och ge ett motexempel $A, B, E, F$ för det falska. | Påstående 2 är falskt. Motexempel: $A = \{1\}$, $E = \{1, 2, 3\}$, $B = \{a\}$, $F = \{a, b, c\}$; då har $\vert (A^{c} \times B^{c})^{c} \vert$ fem element men $\vert A \times B \vert$ bara ett ($5 \neq 1$). Påstående 1 bevisas med elementargument på parnivå. |
| HT2021 KS4 U2b | Identitetsbevis | Låt $A, B, C$ vara godtyckliga. Visa att vi alltid har $((A \cup B \cup C) - (A \oplus B \oplus C)) \cup (A \cap B \cap C) = (A \cap B) \cup (B \cap C) \cup (A \cap C).$ Ledning: elementargument med sanningstabell; $\oplus$ ger de element som ligger i ett udda antal av $A, B, C$. | Gäller. Metod: inför $p \Leftrightarrow x \in A$, $q \Leftrightarrow x \in B$, $r \Leftrightarrow x \in C$, ställ upp mängdteoretiska sanningstabeller för $x \in VL$ och $x \in HL$ och konstatera att kolumnerna är identiska, alltså $VL = HL$. |
| HT2021 Tentamen januari U2 | Identitetsbevis | Visa, utan Venndiagram, för alla $A, B, C$ identiteten $(A \cup B \cup C) - (B \cap C) = (A - (B \cup C)) \cup (B \oplus C).$ Här är $B \oplus C$ mängden $(B - C) \cup (C - B)$. | Gäller. Metod: skriv först om $B \oplus C$ till $(B \cup C) \cap (B \cap C)^{c}$, skriv sedan om båda leden med distributiva lagen tills de representerar samma mängd. |
| HT2021 Fx1 U2 | Sanningshaltsutredning | Ett påstående är sant, det andra falskt: $A \subset B \cap C \land B \subset A \cap C \land C \subset A \cap B \Rightarrow A = B = C$ och $A \subset B \cup C \land B \subset A \cup C \land C \subset A \cup B \Rightarrow A = B = C$. Bevisa det sanna och ge tre mängder som motbevisar det falska. | Det första är sant, det andra falskt. Bevis: $A \subset B \cap C \land B \subset A \cap C$ ger $A \subset C$, och på liknande sätt $C \subset B$ och $B \subset A$, alltså $A = B = C$. Motexempel för det andra: $A = \emptyset$, $B = \{1\}$, $C = \{1\}$ uppfyller förleden men inte $A = B = C$. |
| HT2021 Omtentamen april U2 | Konkret mängdräkning | Oändliga unioner och snitt definieras $\bigcup_{n=1}^{\infty} A_n = \{x : (\exists n : x \in A_n)\} \qquad \text{respektive} \qquad \bigcap_{n=1}^{\infty} A_n = \{x : (\forall n : x \in A_n)\}.$ Låt $A_n = \{x \in \mathbb{R} : -1/n < x < 1/n\}$. Vad är $\bigcup_{n=1}^{\infty} A_n$ respektive $\bigcap_{n=1}^{\infty} A_n$? Fullständig motivering krävs. | $\bigcup_{n=1}^{\infty} A_n = A_1 = (-1, 1)$ och $\bigcap_{n=1}^{\infty} A_n$ blir $\{0\}$. Metod: mängderna är kapslade, $A_1 \subset A_2 \subset A_3 \subset \ldots$; unionen blir största mängden $A_1$, och i snittet ligger bara $0$ eftersom varje $x \neq 0$ faller ur för tillräckligt stort $n$. |
| HT2021 Fx2 U2 | Sanningshaltsutredning | Symmetrisk differens $A \oplus B$ är $(A - B) \cup (B - A)$. De två "distributiva lagarna" 1. $A \oplus (B \cup C) = (A \oplus B) \cup (A \oplus C)$, 2. $A \oplus (B \cap C) = (A \oplus B) \cap (A \oplus C)$ gäller inte. Bevisa det genom att ge mängder $A, B, C$ som bryter mot var och en och räkna ut $VL$ och $HL$. | Ingen av lagarna gäller. Motexempel för båda: $A = \{1, 2, 4\}$, $B = \{2, 3, 4\}$, $C = \{4\}$; för lag 1 blir $A \oplus (B \cup C)$ lika med $\{1, 3\}$ men högerledet $\{1, 2, 3\}$. Metod: räkna ut $VL$ och $HL$ explicit och visa $VL \neq HL$. |
| HT2021 Omtentamen september U2 | Identitetsbevis | Visa, för godtyckliga mängder $A, B, C$, att formeln $(A \cap B) \cup C \subset (((A \cup B) - C) - (A \cap B))^{c}$ gäller. | Gäller. Metod: arbeta med högerledet; DeMorgan och dubbla komplementet ger $(A \cup B)^{c} \cup (C \cup (A \cap B))$, som är $(A \cup B)^{c} \cup VL$. Eftersom högerledet är en union med $VL$ följer $VL \subset HL$. |
| HT2022 KS1 U2 | Sanningshaltsutredning | Låt $A, B, C, D$ vara fyra godtyckliga mängder. Avgör om formeln $(A - B) \cup (B - C) \cup (C - D) \cup (D - A) = A \cup B \cup C \cup D$ stämmer. Om ja, bevisa; om nej, ge fyra mängder där leden skiljer sig. | Stämmer inte. Motexempel: $A = B = C = D = \{1\}$ ger $(A - B) \cup (B - C) \cup (C - D) \cup (D - A) = \emptyset$ medan $A \cup B \cup C \cup D$ är $\{1\}$. Metod: välj lika mängder så att alla differenser blir tomma. |

| HT2022 KS2 U2 | Identitetsbevis | Symmetrisk differens definieras $A \oplus B = (A \cap B^{c}) \cup (B \cap A^{c})$. Visa, utan Venndiagram, mängdidentiteten $(A^{c} \oplus B^{c})^{c} = (A \cup B^{c}) \cap (B \cup A^{c}).$ | Gäller. Metod: sätt $E = A^{c}$, $F = B^{c}$; då är $(A^{c} \oplus B^{c})^{c} = (E \oplus F)^{c}$, expandera med definitionen och DeMorgan och sätt tillbaka så att det blir $(A \cup B^{c}) \cap (B \cup A^{c})$. |
| HT2022 KS4 U2a | Konkret mängdräkning | Med $E = \{1, 2, 3, 4\} \qquad F = \{a, b, c, d\}$ och $U = E \times F$ som universum, $A \subset E$, $B \subset F$, $\vert B \vert = 2$, och $(1, c), (2, d) \in A \times B^{c} \qquad \text{och} \qquad (3, c), (4, d) \in A^{c} \times B^{c}.$ Vad är $A \times B$? Fullständig motivering krävs. | $A \times B$ är $\{(1, a), (2, a), (1, b), (2, b)\}$. Metod: villkoren ger $1, 2 \in A$ och $3, 4 \in A^{c}$, så $A = \{1, 2\}$; och $c, d \in B^{c}$ med $\vert B \vert = 2$ ger $B = \{a, b\}$. |
| HT2022 KS4 U2b | Identitetsbevis | Tre följder av mängder: $A_{1} \subset A_{2} \subset A_{3} \subset \ldots$, $B_{1} \supset B_{2} \supset B_{3} \supset \ldots$ och $C_{n} = A_{n} - B_{n}$. Visa att $C_{1} \subset C_{2} \subset C_{3} \subset \ldots$ genom att visa $C_{n} \subset C_{n+1}$ för alla $n$. | Gäller. Metod: $C_{n} \subset C_{n+1}$ är ekvivalent med $A_{n} \cap B_{n}^{c} \subset A_{n+1} \cap B_{n+1}^{c}$; eftersom $B_{n} \supset B_{n+1}$ ger $B_{n}^{c} \subset B_{n+1}^{c}$, och tillsammans med $A_{n} \subset A_{n+1}$ följer inklusionen. |
| HT2022 Tentamen januari U2 | Identitetsbevis | Låt $A, B, C, D$ vara godtyckliga mängder. Visa, utan Venndiagram, att likheten $(A \cup B) - (C \cup D) = ((A - C) - D) \cup ((B - C) - D)$ alltid gäller. Vid sanningstabell, blanda inte ihop utsagor och mängder. | Gäller. Metod: sätt $E = C \cup D$, skriv $(A \cup B) - E = (A \cup B) \cap E^{c}$, använd distributiva lagen och DeMorgan för att få $(A \cap C^{c} \cap D^{c}) \cup (B \cap C^{c} \cap D^{c})$, som är högerledet. |
| HT2022 Fx1 U2 | Kartesisk produkt | Låt $A, B, C, D$ vara godtyckliga mängder. Visa att formeln $(C - A) \times (B \cap D) = (A^{c} \times B) \cap (C \times D).$ alltid gäller, genom att visa ekvivalensen att ett par ligger i vänsterledet precis när det ligger i högerledet. | Gäller. Metod: elementargument. $(x, y) \in VL$ ger $x \in C \cap A^{c} \land y \in B \cap D$, det vill säga $x \in A^{c} \land y \in B \land x \in C \land y \in D$; högerledet ger exakt samma villkor, alltså $VL = HL$. |
| HT2022 Fx2 U2 | Kartesisk produkt | Låt $A, B$ vara mängder med ändligt antal element. Visa att det alltid gäller att $\vert (A \times B) \cap (B \times A) \vert = \vert A \cap B \vert^{2}.$ | Gäller. Metod: ett par $(x, y)$ ligger i $(A \times B) \cap (B \times A)$ precis när $x \in A \cap B \land y \in A \cap B$; med $\vert A \cap B \vert = n$ finns $n$ val för var koordinat, så antalet par är $n \cdot n = n^{2}$. |
| HT2023 KS1 U2 | Sanningshaltsutredning | Låt $A, B, C$ vara tre godtyckliga mängder och avgör om vi alltid har $A = (A \cup B \cup C) - ((B - A) \cup (C - A)).$ Fullständig motivering; Venndiagram är inte en giltig metod. | Stämmer. Metod: skriv om högerledet med DeMorgan och distributiva lagen; sätt $Z = B \cup C$, då blir uttrycket $(A \cup Z) \cap (A \cup Z^{c}) = A \cup (Z \cap Z^{c}) = A \cup \emptyset = A$. |
| HT2023 KS2 U2 | Identitetsbevis | Visa att följande alltid gäller för tre mängder $A, B, C$: $A - (B \cap C) = (A - (B \cup C)) \cup (A \cap (B \oplus C)).$ Här är $B \oplus C = (B \cup C) \cap (B \cap C)^{c}$. Venndiagram får inte användas. | Gäller. Metod: beteckna leden $VL$ och $HL$ och arbeta med $HL$; distributiva lagarna och att $(B \cup C)^{c} \subset (B \cap C)^{c}$ ger $A \cap (B \cap C)^{c} = A - (B \cap C)$, som är $VL$. |

| HT2023 KS4 U2a | Kartesisk produkt | Låt $A, B, C$ vara icketomma mängder. Visa att om $A \times B = B \times C$ så gäller $B = A \cap C$. Ledning: $a \in A \land b \in B \Rightarrow (a, b) \in A \times B = B \times C \Rightarrow a \in B \land b \in C$. | Gäller. Metod: visa två inklusioner. $B \subset A \cap C$: för $b \in B$, välj $a \in A$, $c \in C$; $(a, b) \in A \times B = B \times C$ ger $b \in C$ och $(b, c) \in B \times C = A \times B$ ger $b \in A$. $A \cap C \subset B$: visa på liknande sätt, så $B = A \cap C$. |
| HT2023 KS4 U2b | Sanningshaltsutredning | Låt $A, B, C$ vara godtyckliga mängder. Utred om $A - (B - C) = (A - B) \cup (A \cap C).$ gäller för alla mängder; bevisa om ja, annars ge ett motexempel. Venndiagram är inte tillåtna. | Stämmer för alla $A, B, C$. Metod: direkt formelmanipulation: $A \cap (B \cap C^{c})^{c} = A \cap (B^{c} \cup C) = (A \cap B^{c}) \cup (A \cap C) = (A - B) \cup (A \cap C)$ (lösningen skriver ett felaktigt mellansteg $A - (B - C) = (A - B)$). |
| HT2023 Tentamen januari U2 | Sanningshaltsutredning | Med $A \oplus B = (A \cup B) - (A \cap B)$, betrakta två påståenden om godtyckliga $A, B, C$: $A \oplus B \oplus C = (A \cup B \cup C) - (A \cap B \cap C), \qquad A \subset B \Rightarrow (A \cap C) - B = \emptyset.$ Ett gäller för alla mängder, det andra inte; ge en utredning. | Det första gäller inte, det andra gäller. Motexempel för det första: $A = \{1, 2\}$, $B = \{2, 3\}$, $C = \emptyset$ ger vänsterledet $\{1, 3\}$ men högerledet $\{1, 2, 3\}$. Bevis för det andra: $(A \cap C) - B = A \cap C \cap B^{c} \subset B \cap C \cap B^{c}$, som är tomma mängden. |
| HT2023 Fx1 U2 | Sanningshaltsutredning | Låt $A, B, C$ vara vilka mängder som helst; ett påstående är sant, det andra inte: $A \cap (B \cup C) = (A \cap B) \cup (A \cap C) \Leftrightarrow A \subset (B \cup C)$ och $A = B \cup C \Rightarrow (A - B) \cap (A - C) \subset A - (B \cap C)$. Bevisa det sanna och ge tre konkreta mängder för det falska. | Det andra är sant, det första falskt. Bevis: med $A = B \cup C$ blir $(A - B) \cap (A - C)$ lika med $A \cap (B \cup C)^{c} = A \cap A^{c} = \emptyset$, och $\emptyset \subset A - (B \cap C)$ gäller alltid. Motexempel för det första: $A = \{1\}$ och $B = C = \emptyset$ ger vänsterledet sant men $\{1\} \subset \emptyset$ falskt. |
| HT2023 Omtentamen april U2 | Identitetsbevis | Visa att formeln $(A - B) \cup (B - C) \cup (C - A) = (A \cup B \cup C) - (A \cap B \cap C).$ gäller för godtyckliga mängder $A, B, C$. | Gäller. Metod: mängdteoretisk sanningstabell. Inför $p \Leftrightarrow x \in A$, $q \Leftrightarrow x \in B$, $r \Leftrightarrow x \in C$; visa att $x \in VL \Leftrightarrow x \in HL$ genom att båda reducerar till samma logiska uttryck med identiska kolumner (fssssssf). |
| HT2023 Fx2 U2 | Sanningshaltsutredning | Betrakta fyra mängdformler för $A, B, C$: $A \cup (B \cap C) \subset (A \cup B) \cap C, \qquad (A \cup B) \cap C \subset A \cup (B \cap C)$ och $A \cup (B \cap C) = (A \cup B) \cap C, \qquad (A \cup B) \cap C \neq A \cup (B \cap C)$. (a) En är sann för alla mängder; vilken? Bevisa. (b) Ge motexempel för var och en av de andra. | Den sanna är $(A \cup B) \cap C \subset A \cup (B \cap C)$, visas med mängdteoretisk sanningstabell. Motexempel för de tre andra: $A = \{1\}, B = \emptyset, C = \emptyset$ ger $VL = \{1\}$ och $HL = \emptyset$ (fäller de två första); och $A = B = C = \emptyset$ fäller den sista. |
| HT2024 KS1 U2 | Identitetsbevis | Låt $A, B, C$ vara godtyckliga mängder. Visa implikationen $A \subset B \Rightarrow A \cup (B \cap C) = B \cap (A \cup C).$ Venndiagram är inte tillåtna, men mängdteoretisk sanningstabell eller formelmanipulation går bra. | Gäller. Metod: skriv om vänsterledet med distributiva lagen till $(A \cup B) \cap (A \cup C)$; eftersom $A \subset B$ är $A \cup B = B$, så uttrycket blir $B \cap (A \cup C)$, vilket är högerledet. |
| HT2024 KS2 U2 | Identitetsbevis | Låt $A$, $B$ och $C$ vara tre godtyckliga mängder i ett universum $U$. Bevisa identiteten $(A \cup B \cup C) - (A \cap B) = (A - B) \cup (B - A) \cup (C - A) \cup (C - B).$ En sanningstabell måste förklaras i detalj. | Gäller. Metod: DeMorgan ger $(A \cup B \cup C) \cap (A^{c} \cup B^{c})$; distribuera $A^{c} \cup B^{c}$ över $A \cup B \cup C$, stryk led som snittas med sin egen negation, och skriv om med mängddifferens till högerledet. |

| HT2024 KS3 U2a | Potensmängd | Låt $A$ och $B$ vara mängder och $\mathcal{P}(X)$ potensmängden till $X$. Bevisa eller motbevisa för godtyckliga mängder $A, B$: $\mathcal{P}(A \cup B) = \mathcal{P}(A) \cup \mathcal{P}(B).$ | Stämmer inte. Motexempel: $A = \{1, 2\}$, $B = \{3\}$ ger $\mathcal{P}(A) \cup \mathcal{P}(B)$ med 5 element medan $\mathcal{P}(A \cup B) = \mathcal{P}(\{1, 2, 3\})$ har 8 element. Metod: jämför antalet element i leden. |
| HT2024 KS3 U2b | Sanningshaltsutredning | Inför $E \oplus F = (E - F) \cup (F - E), \quad E, F \text{ är mängder}.$ Bevisa eller motbevisa mängdidentiteten $A \cap (B \oplus C) = (A \cap B) \oplus (A \cap C).$ för godtyckliga $A, B, C$. Venndiagram är inte acceptabla. | Identiteten gäller. Metod: arbeta med leden separat. $VL = A \cap (B \oplus C)$ blir $(A \cap B \cap C^{c}) \cup (A \cap C \cap B^{c})$, och högerledet ger efter förenkling samma mängd, så $VL = HL$. |
| HT2024 Tentamen januari U2 | Sanningshaltsutredning | Visa eller motbevisa att det för tre godtyckliga mängder $A$, $B$ och $C$ alltid gäller att $(C \cap A \cap B^{c}) \cup (C \cap B \cap A^{c}) = (C \cap (A \cup B)) - ((A \cap B) - (A^{c} \cap B^{c}))$. Mängdteoretisk sanningstabell måste motiveras fullständigt. | Formeln stämmer. Metod: notera att $(A \cap B) - (A^{c} \cap B^{c})$ blir $(A \cap B)$, så högerledet är $(C \cap (A \cup B)) - (A \cap B)$; distribuera och förenkla tills det ger vänsterledet. |
| HT2024 Fx1 U2 | Kartesisk produkt | Låt $A$, $B$, $C$ och $D$ vara mängder och betrakta $(A \times B) \cup (C \times D) = (A \cup C) \times (B \cup D).$ (a) Visa med fyra konkreta mängder att formeln inte gäller för alla. (b) Rätta formeln genom att lägga till så lite som möjligt, med bara $A, B, C, D$, union, mängddifferens, kryssprodukt och parenteser. | Formeln gäller inte. Motexempel: $A = \{1, 2\}$, $C = \{2, 3\}$, $B = \{a, b\}$, $D = \{b, c\}$ ger $HL = (A \cup C) \times (B \cup D) = \{1, 2, 3\} \times \{a, b, c\}$ (9 par) men vänsterledet 7 par. Rättelse: $(A \times B) \cup (C \times D) \cup ((C - A) \times (B - D)) \cup ((A - C) \times (D - B)) = (A \cup C) \times (B \cup D)$. |
| HT2024 Omtentamen april U2 | Konkret mängdräkning | Låt $U = \{x \in \mathbb{Z} : -10 \leq x \leq 10\}$ och $A_{n} = \{n \cdot k : k \in \mathbb{Z} \land n \cdot k \in U\}$, så $A_{3} = \{-9, -6, -3, 0, 3, 6, 9\}$. Bestäm $(A_{2} - A_{4})^{c} \cap (A_{3} - A_{2}^{c})$. | $\{0\}$. Metod: räkna ut $A_{2} = \{-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10\}$, $A_{4} = \{-8, -4, 0, 4, 8\}$ och $A_{2}^{c}$; då blir $A_{3} - A_{2}^{c} = \{-6, 0, 6\}$ och $(A_{2} - A_{4})^{c} \cap (A_{3} - A_{2}^{c}) = \{0\}$. |
| HT2024 Fx2 U2 | Konkret mängdräkning | Universum är $\mathbb{N}$. Villkor för fyra mängder: (i) $A \cap B \cap C \cap D = \emptyset$, (ii) $(A \cap D) - (B \cup C) = \{2, 3\}$, (iii) $D \subset A \cup B \cup C$, (iv) $B^{c} \cap A \cap C \cap D = \{5\}$, (v) $(B \cap C)^{c} \cap (D - A) = \{1, 6, 4\}$. Avgör om det finns fyra mängder $A, B, C$ och $D$ som uppfyller alla fem; ge i så fall ett exempel och verifiera. | Det finns sådana mängder. Exempel: $A = \{2, 3, 5\}$, $B = \{4, 6\}$, $C = \{1, 5\}$, $D = \{1, 2, 3, 4, 5\}$. Metod: konstruera ett exempel och verifiera vart och ett av de fem villkoren explicit. |
| HT2025 KS1 U2a | Sanningshaltsutredning | Låt $A, B, C$ vara godtyckliga mängder. Bevisa eller motbevisa mängdidentiteten $A \cap ((B \cup C) - (A - (B \cap C))) = A \cap B \cap C.$ Högst en av 2a och 2b får lämnas in. Venndiagram får inte ingå. | Identiteten gäller. Metod: formelmanipulation. $A \cap ((B \cup C) \cap (A \cap (B \cap C)^{c})^{c})$, DeMorgan ger $A \cap (B \cup C) \cap (A^{c} \cup (B \cap C))$, distribuera och förenkla till $A \cap B \cap C$. |
| HT2025 KS1 U2b | Kartesisk produkt | Låt $A, B, C, D$ vara godtyckliga mängder. Visa att vi alltid har $((A - B) \times C) \cup ((A \cap B) \times (C - D)) = (A \times (C - D)) \cup ((A - B) \times (C \cap D)).$ Ledning: visa ekvivalensen $(x, y) \in VL \Leftrightarrow (x, y) \in HL$ i två steg med falluppdelning. | Gäller. Metod: elementargument på parnivå. Antag $(x, y) \in VL$; falluppdela på om $y \in D$ eller $y \in D^{c}$ och visa att paret hamnar i $HL$, och visa sedan den omvända implikationen. |

| HT2025 KS2 U2a | Potensmängd | Låt $\mathcal{P}(S)$ vara potensmängden av $S$. Ett påstående är sant, det andra falskt: för alla mängder $A, B$ gäller $\mathcal{P}(A \cap B) = \mathcal{P}(A) \cap \mathcal{P}(B)$ respektive $\mathcal{P}(A \cup B) = \mathcal{P}(A) \cup \mathcal{P}(B)$. Bevisa det sanna och ge två konkreta mängder som motbevisar det falska. | Det första är sant, det andra falskt. Bevis: $S \in \mathcal{P}(A \cap B)$ gäller precis när $S \subset A \land S \subset B$, dvs när $S \in \mathcal{P}(A) \cap \mathcal{P}(B)$. Motexempel för det andra: $A = \{1\}$, $B = \{2\}$ ger $\mathcal{P}(\{1\}) \cup \mathcal{P}(\{2\})$ med 3 element men potensmängden av unionen har 4. |
| HT2025 KS2 U2b | Identitetsbevis | Låt $A, B, C$ vara godtyckliga mängder. Visa att vi alltid har $(A \cup B) \cap (A \cup C) \cap (B \cup C) = (A \cap B) \cup (A \cap C) \cup (B \cap C).$ | Gäller. Metod: mängdteoretisk sanningstabell med $p, q, r$ för $x \in A$, $x \in B$, $x \in C$; $x \in VL \Leftrightarrow (p \lor q) \land (p \lor r) \land (q \lor r)$ och $x \in HL \Leftrightarrow (p \land q) \lor (p \land r) \lor (q \land r)$ har identiska kolumner, så $VL = HL$. |
| HT2025 Tentamen U2 | Potensmängd | Låt $A, B$ vara mängder. Ett påstående gäller för alla mängder, det andra inte: $A \cup B = A \cap B \Rightarrow A = B, \qquad \mathcal{P}(A - B) = \mathcal{P}(A) - \mathcal{P}(B).$ Bevisa det sanna fristående och ge ett motexempel för det falska. $\mathcal{P}(E)$ är potensmängden av $E$. | Det andra är falskt, det första sant. Motexempel: $A = B = \{1\}$ ger $\mathcal{P}(A) - \mathcal{P}(B)$ lika med $\emptyset$ men $\mathcal{P}(\emptyset) = \{\emptyset\}$, och $\emptyset \neq \{\emptyset\}$. Bevis för det första: visa $A \subset B$ och $B \subset A$, t.ex. $x \in A \Rightarrow x \in A \cup B = A \cap B \subset B$. |
| HT2025 Fx1 U2 | Sanningshaltsutredning | Låt $A, B, C$ vara godtyckliga mängder och bevisa eller motbevisa: $A - (B - C) = (A - B) \cup (A \cap C), \qquad A \subset B \Rightarrow C - B \subset C - A.$ Vid sanningstabell, blanda inte ihop utsaga och mängd; Venndiagram får inte ingå. | Båda är sanna. Den första: $A - (B - C) = A \cap (B \cap C^{c})^{c} = A \cap (B^{c} \cup C) = (A \cap B^{c}) \cup (A \cap C) = (A - B) \cup (A \cap C)$. Den andra följer av kontraposition: $A \subset B$ ger $x \in B^{c} \Rightarrow x \in A^{c}$, så $y \in C - B \Rightarrow y \in C - A$. |
| HT2025 Omtentamen april U2 | Kartesisk produkt | Låt $A, B, C, D$ vara godtyckliga mängder och utred sanningshalten hos de två påståendena: $A \times B - A \times C = A \times (B - C), \qquad A \subset C \land B \subset D \Rightarrow A \times B \subset C \times D.$ Bevisa de sanna; ge motexempel för ett falskt. | Båda är sanna. Den första visas elementvis: $A \times B - A \times C$ blir $\{(x, y) : x \in A \land y \in B - C\} = A \times (B - C)$. Den andra: antag $A \subset C$ och $B \subset D$; för ett par $(x, y)$ i $A \times B$ ger $x \in C$ och $y \in D$, alltså $(x, y) \in C \times D$. |
| HT2025 Fx2 U2 | Sanningshaltsutredning | Avgör om följande gäller för godtyckliga mängder $A, B, C$: $B \subset A \cup C \land B \cap C \subset A \Rightarrow B \subset A.$ Venndiagram får inte användas; vid mängdteoretisk sanningstabell, blanda inte ihop utsagor och mängder. | Formeln gäller generellt. Metod: $B \subset A \cup C$ ger att $B \cap C^{c}$ ligger i $A$ (eftersom $A \cap C^{c} \subset A$); tillsammans med $B \cap C \subset A$ följer $(B \cap C) \cup (B \cap C^{c}) \subset A \cup A = A$, alltså $B \subset A$. |

## Område 3 – Funktioner

**grundläggande område – KS1 (10/11) och tentan.** Uppgifter i underlaget: 56, från 49 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Funktionslag | 12 | 11 | HT2019–HT2025 | 5 |
| Bijektion och invers | 11 | 11 | HT2019–HT2024 | 2 |
| Sammansättning | 11 | 11 | HT2020–HT2025 | 4 |
| Egenskapsbestämning | 10 | 10 | HT2019–HT2025 | 3 |
| Uppräkning | 6 | 6 | HT2019–HT2023 | 0 |
| Mängdbild | 5 | 5 | HT2020–HT2025 | 2 |
| Funktionskontroll | 1 | 1 | HT2021–HT2021 | 0 |

- **Egenskapsbestämning** – en konkret funktion ges; avgör och motivera vilka av injektiv, surjektiv och bijektiv den har.
- **Bijektion och invers** – visa att en given funktion är bijektiv eller inverterbar och ange inversen, eller peka ut vilken av flera funktioner som är bijektiv.
- **Sammansättning** – räkna ut en sammansatt funktion, lös en ekvation med sammansättningar, eller hitta parametrar eller funktioner så att sammansättningen får en viss egenskap.
- **Funktionslag** – bevisa eller motbevisa ett allmänt påstående om funktioner, oftast hur injektiv, surjektiv eller bijektiv bevaras av en sammansättning, utan konkreta tal.
- **Uppräkning** – räkna upp eller räkna antalet funktioner som uppfyller givna villkor.
- **Mängdbild** – bevisa en identitet eller inklusion om bildmängden, kardinaliteter eller karakteristiska funktioner.
- **Funktionskontroll** – avgör om en given mängd av par verkligen är en funktion.

### Vad uppgifterna ber om

Uppgift 3 hör alltid till Funktioner, men alla skrivningar har den inte: den finns i 49 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx1 7 av 7; Fx2 6 av 6; Hemtentamen 1 av 1; KS1 7 av 7; KS4 5 av 5; Komplettering 1 av 1; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: KS2 4 av 7; KS3 5 av 6. (Räknat ur matrisen.) Nästan alla uppgifter kretsar kring de tre egenskaperna injektiv, surjektiv och bijektiv.

- Vanligast: en funktion ges (som formel, som mängd av par, eller styckvis) och du ska avgöra och motivera vilka av injektiv, surjektiv och bijektiv den har (HT2022 KS4 U3a, HT2024 KS3 U3a).
- En vanlig form ber dig visa att en funktion är bijektiv eller inverterbar och ange inversen (HT2024 KS1 U3), eller peka ut vilken av två funktioner som är bijektiv (HT2023 Omtentamen april U3).
- "Fullständiga motiveringar krävs" — det räcker inte att svara, du måste bevisa (HT2022 KS4 U3a).
- Skilj på att bevisa för alla och att ge ett exempel: ett exempel räcker för att motbevisa men aldrig för att bevisa en allmän del (HT2024 KS2 U3).
- Sammansättning återkommer ofta: räkna ut en sammansatt funktion, lös en ekvation med sammansättningar, eller hitta parametrar som gör en sammansättning bijektiv (HT2022 KS2 U3, HT2021 Tentamen januari U3).
- En form ber om ett allmänt bevis om hur en egenskap bevaras av en sammansättning (HT2023 Tentamen januari U3).
- En form ber dig räkna upp alla funktioner som uppfyller givna villkor, ibland med krav på helt rätt svar på alla deluppgifter (HT2023 KS3 U3).
- På KS4-skrivningarna och senare ges ofta två alternativ 3a och 3b där du får lösa högst en; löser du båda rättas ingen (HT2022 KS4 U3a, HT2024 KS3 U3a).
- Kryssuppgift utan motivering, där du bara anger vilka uppsättningar eller funktioner som har en egenskap, med högst ett fel (HT2022 KS1 U3).

**De senaste åren (HT2024–HT2025):** uppgiften ger oftast en eller flera konkreta funktioner och ber dig avgöra injektiv, surjektiv och bijektiv med full motivering (HT2024 Fx2 U3, HT2025 KS1 U3a), eller bevisa ett allmänt påstående om hur egenskaper bevaras av en sammansättning när en av funktionerna är bijektiv (HT2025 KS2 U3b). HT2025 gavs uppgiften som ett val mellan 3a och 3b, där högst en får lösas, på både KS1 och KS2 (HT2025 KS1 U3a, HT2025 KS2 U3a); tidigare KS1 hade en enda uppgift 3. HT2025, som ligger närmast den här terminen, hade egenskapsbestämning och sammansättning på KS1 och ett allmänt funktionslag-bevis på KS2.

### Så löser lösningsförslagen uppgifterna

**Egenskapsbestämning**

1. För injektivitet, anta att två argument ger samma värde och härled att argumenten är lika (HT2022 KS4 U3a, HT2025 KS1 U3a).
2. För surjektivitet, ta ett godtyckligt element i målmängden och hitta ett argument som avbildas på det (HT2020 Tentamen januari U3, HT2022 KS4 U3a).
3. För en reell funktion, använd derivatan: strängt växande ger injektiv, och kontinuerlig som går mot plus och minus oändligheten ger surjektiv (HT2023 KS2 U3, HT2023 Fx1 U3).
4. Motbevisa en egenskap med ett motexempel: två skilda argument med samma värde motbevisar injektiv, ett värde som aldrig antas motbevisar surjektiv (HT2021 KS3 U3, HT2025 Tentamen U3).
5. Bijektiv betyder både injektiv och surjektiv; på en ändlig mängd till sig själv är de tre egenskaperna samma sak (HT2022 KS1 U3).

Fallgropar: full motivering krävs, bara ett svar underkänns (HT2022 KS4 U3a); surjektivitet beror på vald målmängd (HT2024 KS2 U3).

**Bijektion och invers**

1. Lös ekvationen mellan argument och värde för argumentet; går det entydigt är funktionen inverterbar och du har samtidigt inversen (HT2024 KS1 U3, HT2023 Omtentamen april U3).
2. Alternativt visa injektiv och surjektiv var för sig och dra slutsatsen bijektiv (HT2021 KS4 U3b).
3. För en funktion mellan ändliga mängder, jämför antalet element: olika antal gör bijektion omöjlig (HT2019 KS1 U3).
4. Känn igen när en funktion är sin egen invers (HT2023 Omtentamen april U3).

Fallgropar: en funktion kan vara surjektiv utan att vara injektiv och tvärtom, så pröva båda innan du drar slutsatsen bijektiv (HT2022 KS4 U3b).

**Sammansättning**

1. Räkna ut den sammansatta funktionen genom att följa varje element steg för steg, eller sätt in formlerna i varandra (HT2020 KS1 U3, HT2024 Fx2 U3).
2. Vid en ekvation med sammansättningar, skriv ut vänster- och högerledet som uttryck i argumentet och lös (HT2022 KS2 U3, HT2022 KS3 U3).
3. För att hitta parametrar som gör sammansättningen bijektiv, räkna ut den och ställ villkoret, ofta via en determinant som ska vara skild från noll (HT2021 Tentamen januari U3).
4. Visa att en funktion sammansatt med sig själv ett antal gånger blir identiteten, vilket ger inversen direkt (HT2022 Tentamen januari U3).

Fallgropar: sammansättning är inte kommutativ, så två sammansättningar i olika ordning är oftast olika funktioner (HT2025 KS1 U3b).

**Funktionslag**

1. Arbeta med godtyckliga element och definitionerna av injektiv och surjektiv, aldrig med konkreta tal (HT2023 Tentamen januari U3).
2. För att bevisa den sanna av två utsagor, för ett direkt bevis; för att motbevisa den falska, ge konkreta funktioner och mängder (HT2025 KS2 U3a, HT2021 Omtentamen september U3).
3. Vid ekvivalens, visa båda riktningarna, eller visa kontrapositionen i den jobbiga riktningen (HT2021 KS4 U3a).
4. Använd att en funktion som sammansatt med sig själv ger identiteten har en invers, vilket bevisar bijektiv (HT2024 KS3 U3b).

Fallgropar: att det ena påståendet är falskt bevisar inte att det andra är sant, de måste behandlas var för sig (HT2025 KS2 U3a).

**Uppräkning**

1. Avgör vad villkoren låser fast och vilka värden som är fria att välja (HT2023 KS1 U3).
2. Räkna systematiskt upp alla val av de fria värdena (HT2020 KS4 U3a, HT2023 KS4 U3b).
3. Finns inga funktioner av det begärda slaget, motivera varför, ofta med ett argument om antal element (HT2023 KS3 U3).

Fallgropar: ibland krävs helt rätt på alla deluppgifter för godkänt (HT2023 KS3 U3).

**Mängdbild**

1. För en mängdidentitet, visa de två inklusionerna var för sig med elementjakt (HT2020 Fx1 U3, HT2025 Omtentamen april U3).
2. Ta ett godtyckligt element i ena ledet, följ definitionen av bildmängden och härled att det ligger i andra ledet (HT2025 Omtentamen april U3).
3. För en kardinalitet, räkna ut alla funktionsvärden och se hur många olika det blir (HT2023 KS4 U3a).
4. För en karakteristisk funktion, dela upp i fall efter om elementet ligger i mängderna och kontrollera likheten i varje fall (HT2024 Fx1 U3).

Fallgropar: för snitt gäller bara en inklusion i allmänhet, likhet kräver injektivitet (HT2020 Fx1 U3, HT2025 Omtentamen april U3).

**Funktionskontroll**

1. Pröva kravet att varje argument ger exakt ett värde (HT2021 Omtentamen april U3).
2. Hittar du ett argument med två tillåtna värden är mängden ingen funktion; annars lös ut värdet entydigt som uttryck i argumentet (HT2021 Omtentamen april U3).

Fallgropar: du måste säkerställa villkoren innan du löser ut, annars missar du att en kvadratrot kan ge två tecken (HT2021 Omtentamen april U3).

### Formelsamlingen och kapitlet

Formelsamlingen har ett avsnitt för Funktioner. Den skriver definitionerna av funktion (de två kraven), surjektiv, injektiv, bijektiv, invers funktion, identitetsfunktionen och sammansatt funktion, samt två satser: att bijektiv är samma sak som inverterbar, och att en funktion sammansatt med sin invers ger identitetsfunktionen.

Det som uppgifterna och lösningarna behöver men bladet inte ger:

- Själva bevismetoderna: att anta lika värden och härleda lika argument för injektiv, och att konstruera ett argument för surjektiv (HT2022 KS4 U3a).
- Derivatmetoden: strängt växande ger injektiv, kontinuerlig mot oändligheterna ger surjektiv (HT2023 KS2 U3, HT2023 Fx1 U3).
- Att injektiv mellan ändliga mängder tvingar målmängden att ha minst lika många element, och att de tre egenskaperna sammanfaller på en ändlig mängd till sig själv (HT2019 KS4 U3, HT2022 KS1 U3).
- Bildmängden av en delmängd och den inversa bilden, som definieras i uppgiftstexten när de behövs (HT2021 KS4 U3a, HT2023 KS4 U3a).
- Den karakteristiska funktionen för en mängd, som definieras i uppgiften (HT2024 Fx1 U3).
- Aritmetikens fundamentalsats som grund för injektivitet hos en potensprodukt (HT2024 KS3 U3a).

### Uppgifter som återkommer

- Lös ekvationen med en kvadratisk och en linjär funktion sammansatta i båda ordningar: HT2022 KS2 U3, HT2022 Fx2 U3.
- Räkna upp alla injektiva och surjektiva funktioner mellan en tvåelementsmängd och en treelementsmängd: HT2019 Komplettering U3, HT2023 KS3 U3.
- Bevisa att en egenskap hos en sammansättning förs över till en av delfunktionerna: HT2023 Tentamen januari U3, HT2024 KS2 U3, HT2025 KS2 U3b.

### Mönsterlösningar

- **Egenskapsbestämning**: HT2025 KS1 U3a
- **Bijektion och invers**: HT2024 KS1 U3
- **Sammansättning**: HT2024 Fx2 U3
- **Funktionslag**: HT2025 KS2 U3b
- **Uppräkning**: HT2023 KS3 U3
- **Mängdbild**: HT2025 Omtentamen april U3
- **Funktionskontroll**: HT2021 Omtentamen april U3

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS1 U3 | Bijektion och invers | Funktionen $f : A \to B$ ges med $A = \{1, 2, 3, 4\}$, $B = \{a, b, c, d\}$ och $f = \{(1, a), (2, b), (3, c), (4, b)\}$; sätt $C = f(A)$. Det finns ingen bijektiv $h : C \to B$ — varför? Ändra definitionen av $f$ (behåll $f : A \to B$) så att en bijektiv $h : C \to B$ finns, och ange en sådan. | Går ej eftersom bilden blir $\{a, b, c\}$ med 3 element men $B$ har 4, och ingen bijektion finns mellan ändliga mängder med olika antal element. Ändra till $f = \{(1, a), (2, b), (3, c), (4, d)\}$ så blir bilden hela $B$; då duger identiteten $h = \{(a, a), (b, b), (c, c), (d, d)\}$. |
| HT2019 KS4 U3 | Funktionslag | $A, B, C$ ändliga icke-tomma mängder med $f : A \to B$, $g : B \to C$, $h : C \to A$ och $A = \{1, 2, 3, 4\}$. Om alla tre funktionerna är injektiva, visa att $\vert A\vert = \vert B\vert = \vert C\vert = 4$. | Gäller. Injektiv mellan ändliga mängder ger $\vert A\vert \leq \vert B\vert$, $\vert B\vert \leq \vert C\vert$ och $\vert C\vert \leq \vert A\vert$, så alla tre är lika; eftersom $A = \{1, 2, 3, 4\}$ fås $\vert A\vert = \vert B\vert = \vert C\vert = 4$. |
| HT2019 Tentamen januari U3 | Egenskapsbestämning | $A = \{a, b, c\}$, $B = \{1, 2, 3, 4\}$, $C = \{x, y, z\}$, $f = \{(a, 2), (b, 1), (c, 3)\}$ och $g = \{(1, y), (2, x), (3, z), (4, z)\}$. Ange precis vilka egenskaper av injektivitet, surjektivitet och bijektivitet $f$, $g$ och $g \circ f$ har (kryss i svarsformulär). | $f$ injektiv, ej surjektiv ($\vert A\vert = 3 < 4 = \vert B\vert$); $g$ surjektiv, ej injektiv ($\vert B\vert = 4 > 3 = \vert C\vert$); $g \circ f$ blir $\{(a, x), (b, y), (c, z)\}$, bijektiv. Metod: jämför antal element och räkna ut sammansättningen. |
| HT2019 Fx1 U3 | Funktionslag | $f : E \to F$ och $g : F \to G$ givna. Avgör om påståendet $f \text{ är surjektiv och } g \text{ är surjektiv} \Rightarrow g \circ f \text{ är surjektiv.}$ är sant; bevisa det, eller ge tre mängder $E, F, G$ och två funktioner som motexempel. | Sant. Bevis: ta godtyckligt $z \in G$; surjektiviteten hos $g$ ger $y \in F$ med $z = g(y)$, och surjektiviteten hos $f$ ger $x \in E$ med $y = f(x)$, så $z = g(y) = g(f(x))$, vilket visar att $g \circ f$ är surjektiv. |
| HT2019 Hemtentamen april U3 | Uppräkning | $A = \{1, 2, 3\}$, $B = \{a, b, c, d\}$, $C = \{x, y, z\}$ och $g = \{(a, x), (b, y), (c, x), (d, z)\}$. (a) ange en injektiv $f : A \to B$ så att $h = g \circ f : A \to C$ blir bijektiv; (b) en injektiv $f : A \to B$ så att $h$ inte blir bijektiv. | Lösning saknas i underlaget. |
| HT2019 Komplettering U3 | Uppräkning | $A = \{1, 2\}$, $B = \{a, b, c\}$. (a) ange alla injektiva funktioner $f : A \to B$; (b) ange alla surjektiva funktioner $f : B \to A$. | Lösning saknas i underlaget. |
| HT2020 KS1 U3 | Sammansättning | $A = \{1, 2, 3, 4\}$ och funktionerna $f = \{(1, 2), (2, 1), (3, 4), (4, 3)\} \qquad g = \{(1, 2), (2, 3), (3, 4), (4, 1)\}.$ Visa att $h : A \to A$ given av $h = f \circ g \circ f^{-1}$ är en bijektion. | Bijektion. Metod: $f$ är sin egen invers, så $h = f \circ g \circ f$; följ varje element och få $h = \{(1, 4), (2, 1), (3, 2), (4, 3)\}$, som är både injektiv (inga två avbildas lika) och surjektiv. |
| HT2020 KS3 U3 | Bijektion och invers | Funktionen $\phi : \mathbb{R}^{2} \to \mathbb{R}^{2}$ given av $\phi(x, y) = (x + y, x - y)$. Är denna funktion bijektiv? Visa det i så fall, annars visa att den inte är det. | Bijektiv. Metod: bijektiv är samma sak som inverterbar; lös systemet $(u, v) = \phi(x, y)$. Koefficientmatrisen har determinant $-2$, skild från noll, så lösningen är entydig och $\phi$ är bijektiv. (Går även att bara lösa systemet.) |
| HT2020 KS4 U3a | Uppräkning | $A = \{1, 2, 3, 4\}$. Ange alla funktioner $g : A \to A$ som uppfyller både $g(1) = 1$ och $g \circ g = \iota_{A}$. | Fyra stycken: $\iota_{A}$ samt de tre som fixerar 1 och ett element till och parbyter de övriga två: $g_{1} = \{(1, 1), (2, 3), (3, 2), (4, 4)\} \quad g_{2} = \{(1, 1), (2, 4), (3, 3), (4, 2)\} \quad g_{3} = \{(1, 1), (2, 2), (3, 4), (4, 3)\}$. Metod: eftersom $g$ är sin egen invers fixerar den eller parbyter element. |
| HT2020 KS4 U3b | Funktionslag | Bevisa att den enda inverterbara funktionen $f : A \to A$ som uppfyller $f \circ f = f$ är $f = \iota$. | Gäller. Metod: $\iota$ uppfyller kravet; om $f$ är inverterbar och $f \circ f = f$, operera med inversen från vänster: $f^{-1} \circ f \circ f = f^{-1} \circ f$ ger $\iota \circ f = \iota$, dvs $f = \iota$. |
| HT2020 Tentamen januari U3 | Egenskapsbestämning | $M_{2x2}$ är alla 2x2-matriser och spåret $\mathrm{sp} : M_{2x2} \to \mathbb{R}$ ges av $\mathrm{sp} \begin{pmatrix} a & b \\ c & d \end{pmatrix} = a + d.$ (a) Visa att $\mathrm{sp}$ inte är injektiv men är surjektiv. (b) Visa att restriktionen till symmetriska matriser uppfyller $\mathrm{sp}(AB) = \mathrm{sp}(BA)$. | (a) Inte injektiv (två olika matriser med samma spår 2), men surjektiv (en diagonalmatris ger valfritt värde). (b) Med $A = \begin{pmatrix} a & b \\ b & c \end{pmatrix}$ och $B = \begin{pmatrix} d & e \\ e & f \end{pmatrix}$ blir båda spåren $ad + be + be + cf$. Metod: motexempel, explicit värde, uträkning. |
| HT2020 Fx1 U3 | Mängdbild | $f : A \to B$ och $E \subset A$ ger bildmängden $f(E) = \{y \in B : (\exists x \in E : y = f(x))\}$. Om $f$ är injektiv och $E, F \subset A$, visa att $f(E) \cap f(F) = f(E \cap F).$ | Gäller. Metod: visa två inklusioner. $f(E \cap F) \subset f(E) \cap f(F)$ gäller alltid; omvänt, tag $y \in f(E) \cap f(F)$, då finns $x_1 \in E$ och $x_2 \in F$ med $y = f(x_1) = f(x_2)$, och injektiviteten ger $x_1 = x_2$ i $E \cap F$, så $y \in f(E \cap F)$. |
| HT2020 Omtentamen april U3 | Sammansättning | Reellvärda funktioner på hela $\mathbb{R}$ med $f(x) = x^{2} - 1 \qquad g(x) = ax + b$ där $a, b$ är konstanter. Ange alla val av $a, b$ som gör att $f \circ g = g \circ f$. (Ledning: tre val finns.) | Tre val: $a = 1, b = 0 \qquad a = 0, b = \frac{1 - \sqrt{5}}{2} \qquad a = 0, b = \frac{1 + \sqrt{5}}{2}$. Metod: sätt $f(g(x)) = g(f(x))$, utveckla till en polynomekvation och matcha koefficienterna, vilket ger ett ekvationssystem. |
| HT2020 Fx2 U3 | Egenskapsbestämning | $a \in \mathbb{R}$ och $f : \mathbb{R} \to \mathbb{R}$ med $f(x) = ax$. Visa att funktionen är injektiv om och endast om den är surjektiv. | Gäller. Metod: visa båda riktningar. Surjektiv ger ett $x_1$ med $f(x_1) = 1$, alltså $ax_1 = 1 \neq 0$ så $a \neq 0$, vilket ger injektiv. Injektiv ger på liknande sätt $a \neq 0$, och då har $y = ax = f(x)$ alltid lösningen $x = y/a$, dvs surjektiv. |
| HT2021 KS1 U3 | Mängdbild | $E, F$ ändliga mängder med precis ett gemensamt element och $f(E, F) = \vert E \times F\vert - \vert E\vert - \vert F\vert + 1.$ Visa att $f(E, F) = \vert E' \times F'\vert$ där $E' = E - \{x\}$, $F' = F - \{x\}$ och $\{x\} = E \cap F$. | Gäller. Metod: faktorisera. Eftersom $E, F$ har precis ett gemensamt element är $\vert E'\vert = \vert E\vert - 1$ och $\vert F'\vert = \vert F\vert - 1$. Då blir uttrycket $(\vert E\vert - 1) \cdot (\vert F\vert - 1) = \vert E'\vert \cdot \vert F'\vert = \vert E' \times F'\vert$. |
| HT2021 KS3 U3 | Egenskapsbestämning | $I = \{x : 0 \leq x < 1\}$ (ickenegativa reella tal $< 1$) och $f : I \times I \to I$ med $f(x, y) = \frac{x + y}{1 + xy}.$ Är $f$ injektiv? Surjektiv? Bevisa dina påståenden. | Inte injektiv eftersom $f(\frac{1}{4}, \frac{3}{4})$ och $f(\frac{3}{4}, \frac{1}{4})$ är lika men paren olika; surjektiv eftersom $f(z, 0)$ antar varje värde $z \in I$. Metod: motexempel för injektiv, explicit argument för surjektiv. |

| HT2021 KS4 U3a | Funktionslag | Den inversa bilden definieras $f^{-1}(F) = \{x \in A : f(x) \in F\}.$ (även när $f$ inte är inverterbar). Visa att $f : A \to B$ är injektiv om och endast om det för alla $F \subset B$ gäller $\vert F\vert = 1 \Rightarrow \vert f^{-1}(F)\vert \leq 1$. (Högst en av 3a och 3b.) | Gäller (ekvivalens). Metod: visa båda riktningar. Injektiv ger att en enelementsmängd inte kan ha två urbilder. Omvänt via kontraposition: om $f$ inte är injektiv finns skilda $x_{1}, x_{2} \in A$ med $f(x_{1}) = f(x_{2}) = y$, så $\{y\}$ ger $\vert f^{-1}(F)\vert > 1$, ett motexempel. |
| HT2021 KS4 U3b | Bijektion och invers | $f : \mathbb{R}^{3} \to \mathbb{R}^{3}$ uppfyller $f(1, 0, 0) = (0, 1, 0), \quad f(0, 1, 0) = (0, 0, 1), \quad f(0, 0, 1) = (1, 0, 0)$ samt $f(u + v) = f(u) + f(v)$ och $f(au) = af(u)$ för alla vektorer och tal. Visa att $f$ är bijektiv. (Högst en av 3a och 3b.) | Bijektiv. Metod: injektiv via linjäriteten — $f(x_{1}, y_{1}, z_{1}) = f(x_{2}, y_{2}, z_{2})$ ger komponentvis likhet; surjektiv eftersom $f(y, z, x) = (x, y, z)$ för godtycklig vektor, så $f$ är inverterbar och därmed bijektiv. |
| HT2021 Tentamen januari U3 | Sammansättning | Planavbildningen $g$ ges av $g_{1}(x, y) = x + y$ och $g_{2}(x, y) = x - y$, och $f(x, y) = (f_{1}(x, y), f_{2}(x, y)) = (ax + by, bx + ay).$ för reella $a, b$. Finn alla $a, b$ för vilka $h = f \circ g$ är bijektiv. | Bijektiv precis när $\vert a\vert \neq \vert b\vert$. Metod: räkna ut $h = f \circ g$ och skriv den som en matris; determinanten är $-2 \cdot (a^{2} - b^{2})$, och $h$ är bijektiv då determinanten är skild från noll, dvs $a^{2} \neq b^{2}$. |
| HT2021 Fx1 U3 | Funktionslag | $P$ från $\mathbb{R}^{n}$ till $\mathbb{R}^{n}$ är linjär ($P(ax + by) = aP(x) + bP(y)$) och en projektion ($P \circ P = P$). Visa att om $P \neq \iota$ så är $P$ inte injektiv. | Gäller. Metod: eftersom $P \neq \iota$ finns ett $x_{1}$ med $P(x_{1}) \neq x_{1}$; sätt $x_{2} = P(x_{1})$. Då är $x_{1} \neq x_{2}$ men $P(x_{2}) = P(P(x_{1})) = P(x_{1})$, så $P$ är inte injektiv (linjäriteten behövs inte). |
| HT2021 Omtentamen april U3 | Funktionskontroll | Den ena mängden är en funktion, den andra inte; avgör och motivera fullständigt. $E = \{(x, y) \in \mathbb{R}^{2} : (x - 1)^{2} + y^{2} = 1 \land y + 1 > x\}$ och $F = \{(x, y) \in \mathbb{R}^{2} : x = (y - 1)^{2} \land x + 2y \geq 2 \land x \leq 1\}$. | $E$ är ingen funktion: för $x = 1/10$ ger villkoret två $y$-värden ($\sqrt{0.19}$ och $-\sqrt{0.19}$). $F$ är en funktion: villkoren tvingar $y \geq 1$, så $\sqrt{x} = y - 1$ ger entydigt $y = 1 + \sqrt{x}$. Metod: leta argument med två värden; lös annars ut värdet entydigt. |
| HT2021 Fx2 U3 | Bijektion och invers | $\mathbb{N}$ är de positiva heltalen; $i : \mathbb{N} \to \mathbb{N}$ där $i(x)$ är största heltalet högst $\sqrt{x}$ (t.ex. $i(1) = 1$, $i(2) = 1$, $i(4) = 2$), och $f : \mathbb{N} \to \mathbb{N}$ med $f(x) = x^{2}$. Visa att (1) $f$ inte är bijektiv, (2) $i$ inte är bijektiv, (3) $i \circ f$ är bijektiv. | (1) $f$ ej surjektiv (inget $x$ ger $f(x) = 2$). (2) $i$ ej injektiv ($i(1) = i(2) = 1$). (3) $i \circ f(x) = i(x^{2}) = x$, så $i \circ f = \iota_{\mathbb{N}}$, bijektiv. Metod: motexempel för (1) och (2), uträkning för (3). |
| HT2021 Omtentamen september U3 | Funktionslag | $f : A \to B$, $g : B \to C$ och $h$ lika med $g \circ f$. Den ena utsagan är sann, den andra falsk; välj en och bevisa den sanna eller ge motexempel: $g, f \text{ är bijektiva} \Rightarrow h \text{ är bijektiv}$ och $h \text{ är bijektiv} \Rightarrow f \text{ eller } g \text{ är bijektiva}$. | Första sann, andra falsk. Första: $h(x_{1}) = h(x_{2})$ ger via injektivitet $x_{1} = x_{2}$, och surjektiviteten hos $g, f$ ger surjektiv $h$. Motexempel för andra: $f(x) = x^{2}$ och $g(y)$ = heltalsdelen av $\sqrt{y}$ ger $g \circ f = \iota$ bijektiv, men $g$ ej bijektiv ($g(2) = g(3)$). |
| HT2022 KS1 U3 | Egenskapsbestämning | $A = \{1, 2, 3, 4\}$ och $f = \{(1, 2), (2, 1), (3, 4), (4, 3)\} \qquad g = \{(1, 2), (2, 3), (3, 1), (4, 1)\} \qquad h = \{(1, 3), (3, 1), (2, 2), (4, 4)\}.$ Identiteten är $\iota$. (a) Ange vilka av tre uppsättningar sammansättningar som bara består av injektiva funktioner; (b) samma för surjektiva. Högst ett fel, inga motiveringar. | (a) uppsättning 2; (b) uppsättning 2. Metod: på en ändlig mängd till sig själv är injektiv, surjektiv och bijektiv samma sak; $f, h, \iota$ är bijektiva men $g$ inte (antar inte 4), så varje uppsättning med $g$ faller. |
| HT2022 KS2 U3 | Sammansättning | $f : \mathbb{R} \to \mathbb{R}$ och $g : \mathbb{R} \to \mathbb{R}$ med $f(x) = x^{2} + 9 \qquad \text{respektive} \qquad g(x) = x - 9.$ Finn alla $x \in \mathbb{R}$ som uppfyller $(f \circ g)(x) = (g \circ f)(x)$. | $x = 90/18 = 5$. Metod: skriv ut båda leden — $(f \circ g)(x)$ blir $(x - 9)^{2} + 9$ och $(g \circ f)(x)$ blir $x^{2}$ — sätt lika och lös den linjära ekvationen. |
| HT2022 KS3 U3 | Sammansättning | $f : \mathbb{R} \to \mathbb{R}$ och $g : \mathbb{R} \to \mathbb{R}$ med $f(x) = x^{2} + 2a \qquad \text{respektive} \qquad g(x) = 2x + 1$ där $a$ är okänt. Bestäm ett värde på $a$ som gör att ekvationen $f(g(x)) = g(f(x))$ har exakt en lösning. | $a = -1$. Metod: förenkla ekvationen till $(x + 1)^{2} = a + 1$; en ekvation $t^{2} = q$ har exakt en lösning då $q = 0$, så $a + 1 = 0$. |
| HT2022 KS4 U3a | Egenskapsbestämning | $f : \mathbb{Z} \to \mathbb{Z}$ med $f(x) = \begin{cases} x + 1, & \text{om } x \text{ är jämnt} \\ x - 1, & \text{om } x \text{ är udda} \end{cases}.$ Avgör vilka egenskaper av injektivitet, surjektivitet och bijektivitet funktionen har. Fullständiga motiveringar krävs. (Högst en av 3a och 3b.) | Injektiv, surjektiv och därmed bijektiv. Metod: om $f(x_{1}) = f(x_{2})$ måste $x_{1}$ och $x_{2}$ ha samma paritet, och då ger båda fallen $x_{1} = x_{2}$; surjektiv eftersom varje udda $y = 2k + 1$ nås från $2k$ och varje jämnt $y = 2k$ nås från $2k + 1$. |
| HT2022 KS4 U3b | Bijektion och invers | $f : \mathbb{Z} \to \mathbb{Z}$ och $g : \mathbb{Z} \to \mathbb{Z}$ med $f(x) = 3 - x \qquad \text{och} \qquad g(x) = f(x) + f^{-1}(x).$ $f$ är inverterbar; avgör om $g$ är inverterbar och bevisa. (Högst en av 3a och 3b.) | Inte inverterbar. Metod: $f$ är sin egen invers, så $g(x) = f(x) + f^{-1}(x) = 3 - x + 3 - x = 6 - 2x$; $g$ antar bara jämna tal, alltså ej surjektiv, därmed ej bijektiv och ej inverterbar. |
| HT2022 Tentamen januari U3 | Sammansättning | $A = \{1, 2, 3, 4\}$ och $f = \{(1, 2), (2, 3), (3, 4), (4, 1)\}.$ Visa att $f$, $f \circ f$ och $f \circ f \circ f$ är inverterbara och har $f^{-1} = f \circ f \circ f, \qquad (f \circ f)^{-1} = f \circ f, \qquad \text{och} \qquad (f \circ f \circ f)^{-1} = f.$ | Gäller. Metod: visa att $f \circ f \circ f \circ f = \iota$ genom att spåra varje element (t.ex. $(f \circ f \circ f \circ f)(1) = 1$); då följer att $f$, $f \circ f$ och $f \circ f \circ f$ är varandras inverser enligt uppställningen. |
| HT2022 Fx1 U3 | Bijektion och invers | $f(x) = \frac{(x + \vert x\vert)^{2}}{4}$ definierad på $A \subset \mathbb{R}$ med $f : A \to \mathbb{R}^{+}$ ($\mathbb{R}^{+}$ är reella tal $\geq 0$). Finns en största mängd $A$ som är ett intervall där $f$ är inverterbar? Ange i så fall intervallet och inversen. | Ja. Metod: för positiva $x$ blir funktionen $x^{2}$ och för $x \leq 0$ är $f$ noll, så injektivitet kräver högst ett icke-positivt argument; största intervallet är $A = [0, \infty)$ med inversen $f^{-1}(x) = \sqrt{x}$. |
| HT2022 Fx2 U3 | Sammansättning | $f : \mathbb{R} \to \mathbb{R}$ och $g : \mathbb{R} \to \mathbb{R}$ med $f(x) = x^{2} + 9 \qquad \text{respektive} \qquad g(x) = x - 9.$ Finn alla $x \in \mathbb{R}$ som uppfyller $(f \circ g)(x) = (g \circ f)(x)$. | $x = 90/18 = 5$. Metod: samma som HT2022 KS2 U3 — $(f \circ g)(x)$ blir $(x - 9)^{2} + 9$ och $(g \circ f)(x)$ blir $x^{2}$, sätt lika och lös. |
| HT2023 KS1 U3 | Uppräkning | $f$ betecknar funktioner med domän och kodomän $A = \{1, 2, 3, 4\}$. (a) Hur många funktioner $f$ uppfyller $(1, 2) \in f$, $(2, 3) \in f$ och $(3, 1) \in f$? Ange alla och förklara varför det inte finns fler. (b) Vilka är injektiva? (c) Vilka är surjektiva? | Fyra funktioner, som skiljer sig bara i värdet $f(4)$. Endast $\{(1, 2), (2, 3), (3, 1), (4, 4)\}$ är injektiv, och samma funktion är den enda surjektiva (de övriga tre missar värdet 4). Metod: det enda fria valet är $f(4)$. |

| HT2023 KS2 U3 | Egenskapsbestämning | $a$ reellt tal och $f_a : \mathbb{R} \to \mathbb{R}$ med $f_a(x) = x^{3} - 3x, \qquad x > a.$ Vilket är det minsta $a$ för vilket $f_a$ är injektiv? För detta $a$, är $f_a$ surjektiv? Varför, varför inte? | Minsta $a = 1$. Metod: derivatan $f_a'(x) = 3x^{2} - 3$ är positiv för $x > 1$, så funktionen är strängt växande där och injektiv. Inte surjektiv: $f_1$ är växande med $f_1(x) > f_1(1) = -2$ för alla $x > 1$, så t.ex. $-3$ nås aldrig. |
| HT2023 KS3 U3 | Uppräkning | Mängderna $A = \{1, 2\} \quad \text{respektive} \quad B = \{a, b, c\}$. (a) ange alla surjektiva $f : A \to B$; (b) alla injektiva $f : A \to B$; (c) alla surjektiva $g : B \to A$; (d) alla injektiva $g : B \to A$. Helt rätt på alla deluppgifter krävs. | (a) inga (fler element i $B$ än i $A$); (b) sex stycken, t.ex. $f = \{(1, a), (2, b)\}$; (c) sex stycken, t.ex. $g = \{(a, 1), (b, 1), (c, 2)\}$; (d) inga. Metod: räkna upp systematiskt; större kodomän ger inga surjektioner, större domän inga injektioner. |
| HT2023 KS4 U3a | Mängdbild | Bildmängden $f(E) = \{y : y = f(x), x \in E\}$. $A = \{0, 1, 2, 3, 4, 5\}$; för varje $x \in A$ ges $q_x, r_x$ av $x = 3 \cdot q_x + r_x, \quad 0 \leq q_x \leq 1, 0 \leq r_x \leq 2 \qquad (\text{det går enligt divisionsalgoritmen})$ och $f : A \to \mathbb{Z}$ med $f(x) = q_x \cdot r_x$. Visa att $\vert f(A)\vert = 3$. (Högst en av 3a och 3b.) | $\vert f(A)\vert = 3$. Metod: räkna ut alla funktionsvärden; de blir $0, 0, 0, 0, 1, 2$, så bildmängden är $\{0, 1, 2\}$ med tre element. |
| HT2023 KS4 U3b | Uppräkning | $A = \{1, 2, 3, 4\}$, $B = \{a, b, c, d, e\}$, $C = \{x, y, z, w\}$ och $g = \{(a, x), (b, y), (c, z), (d, z), (e, w)\}.$ Med $h = g \circ f$, ange alla funktioner $f$ som uppfyller $f(1) = a$ och $f(2) = b$ för vilka $h$ är bijektiv. (Högst en av 3a och 3b.) | Fyra funktioner: $f = \{(1, a), (2, b), (3, c), (4, e)\}$, $\{(1, a), (2, b), (3, d), (4, e)\}$, $\{(1, a), (2, b), (3, e), (4, c)\}$ och $\{(1, a), (2, b), (3, e), (4, d)\}$. Metod: $f(1)$ och $f(2)$ är låsta, gå igenom valen för $f(3)$ och $f(4)$ som gör $h$ bijektiv. |
| HT2023 Tentamen januari U3 | Funktionslag | $A, B, C$ mängder med $g : B \to C \quad \text{respektive} \quad f : A \to B.$ och $h = g \circ f$. Visa de två påståendena $h \text{ injektiv} \Rightarrow f \text{ injektiv}, \qquad h \text{ surjektiv} \Rightarrow g \text{ surjektiv}.$ | Gäller. Metod: för första, anta $h$ injektiv och $f(x_{1}) = f(x_{2})$; då är $h(x_{1}) = g(y) = h(x_{2})$ så $x_{1} = x_{2}$. För andra, anta $h$ surjektiv; för $z \in C$ finns $x$ med $g(f(x)) = z$, alltså är $g$ surjektiv. |
| HT2023 Fx1 U3 | Bijektion och invers | Funktionerna $f : \mathbb{R} \to \mathbb{R} \text{ given av } f(x) = 8x^{3} + 12x^{2} + 6x + 1$ och $g : \mathbb{Z} \to \mathbb{Z} \text{ given av } g(x) = 8x^{3} + 12x^{2} + 6x + 1.$ Visa att den ena är bijektiv och den andra inte. | $f$ bijektiv, $g$ inte. Metod: $f'(x) = 24x^{2} + 24x + 6$ som är $6(2x + 1)^{2} \geq 0$, så $f$ strängt växande (injektiv) och surjektiv via satsen om mellanliggande värden; $g$ antar bara udda tal ($2 \cdot (4x^{3} + 6x^{2} + 3x) + 1$), ej surjektiv. |
| HT2023 Omtentamen april U3 | Bijektion och invers | $\Omega$ är sanningsvärdena sann och falsk; $f : \Omega \times \Omega \to \Omega \times \Omega \text{ given av } f(p, q) = (p \lor q, p \land q)$ och $g : [0, 1] \to [0, 1] \text{ given av } g(x) = \sqrt{1 - x^{2}}.$ Den ena är en bijektion, den andra inte; avgör vilken, med fullständiga motiveringar. | $f$ ej bijektiv (ej surjektiv — $(\text{falsk}, \text{sann})$ nås aldrig, ty $p \land q = \text{sann}$ kräver $p = q = \text{sann}$); $g$ bijektiv, sin egen invers med $g^{-1}(y) = \sqrt{1 - y^{2}}$. Metod: hitta ett värde som ej antas; konstruera inversen. |
| HT2023 Fx2 U3 | Bijektion och invers | $\Omega = \mathcal{P}(\mathbb{N})$ (alla delmängder till $\mathbb{N}$); för varje $\omega \in \Omega$ ges $g_{\omega} : \Omega \to \Omega \text{ som är definierad genom } g_{\omega}(X) = X \cup \omega.$ Visa att det finns exakt en mängd $\omega$ för vilken $g_{\omega}$ är en bijektion. | Exakt en: $\omega = \emptyset$. Metod: om $\omega \neq \emptyset$ ger både $\omega$ och $\emptyset$ samma bild, så $g_{\omega}$ ej injektiv; för $\omega = \emptyset$ är $g_{\emptyset}(X) = X$, identiteten, en bijektion. |
| HT2024 KS1 U3 | Bijektion och invers | $A = \mathbb{R} - \{a\}$ och $B = \mathbb{R} - \{b\}$ (alla reella tal utom ett vardera); $f : A \to B, f(x) = \frac{x-1}{x+2}.$ Vilka värden måste $a, b$ ha för att $f$ ska vara bijektiv? Ange värdena och bevisa att funktionen är bijektiv. | $a$ är $-2$ och $b = 1$. Metod: $f$ är inte definierad i $x = -2$ (nämnaren noll) och värdet 1 antas aldrig; lös $y = \frac{x-1}{x+2}$ för $x$ och få $x = \frac{1+2y}{1-y}$, dvs inversen $g : B \to A$, så $f$ är bijektiv. |
| HT2024 KS2 U3 | Funktionslag | $f : A \to B$ och $g : B \to C$; antag att $g \circ f$ är surjektiv. Bevisa att $g$ måste vara surjektiv, och ge ett exempel som visar att $f$ inte nödvändigtvis är surjektiv. | Gäller. Metod: för $z \in C$ ger surjektiviteten hos $g \circ f$ ett $x$ med $g(f(x)) = z$, så $g(y) = z$ med $y = f(x)$; alltså är $g$ surjektiv. Exempel där $f$ ej är surjektiv: $A = \{1, 2, 3\}$, $B = \{1, 2, 3, 4\}$, $C = \{1, 2, 3\}$ och $f(x) = x, \quad g(y) = y$. |
| HT2024 KS3 U3a | Egenskapsbestämning | Funktionen $f : \mathbb{N} \times \mathbb{N} \to \mathbb{N}, f(m, n) = 2^{m} \cdot 3^{n}.$ Ge en utredning som fastställer om funktionen är injektiv och/eller surjektiv. (Endast en av 3a och 3b.) | Injektiv men inte surjektiv. Metod: injektiv eftersom $f(m_{1}, n_{1}) = f(m_{2}, n_{2})$ ger samma primtalsfaktorisering, så $(m_{1}, n_{1}) = (m_{2}, n_{2})$ enligt aritmetikens fundamentalsats; inte surjektiv eftersom $2^{m} \cdot 3^{n} = 5$ aldrig nås. |
| HT2024 KS3 U3b | Funktionslag | $f : A \to A$ sådan att $f^{n}(x) = x$ för alla $x \in A$ för något $n \geq 2$ ($f^{n}$ är $f$ sammansatt med sig själv $n$ gånger). Bevisa eller motbevisa att $f$ måste vara en bijektion. (Endast en av 3a och 3b.) | Måste vara bijektion. Metod: sätt $g = f^{n-1}$ (definierad eftersom $n \geq 2$); då gäller $f(g(x)) = g(f(x)) = x$, så $g$ är inversen till $f$, och en inverterbar funktion är bijektiv. |
| HT2024 Tentamen januari U3 | Sammansättning | $\mathbb{Z}_{\geq 0}$ är de ickenegativa heltalen; $f, g : \mathbb{Z} \to \mathbb{Z}$ med $f(x) = 2x, \quad g(x) = x^{2} + 1.$ Bilda $q : \mathbb{Z}_{\geq 0} \to \mathbb{N}$ genom $q(x) = h(f(x), g(x))$ där $h : \mathbb{Z}^{2} \to \mathbb{R}$. Finn två olika $h$ så att $q$ blir bijektiv. | Två val: $h(x, y) = \sqrt{x + y}$ och $h(x, y) = x/2 + 1$ ger båda $q(x)$ lika med $x + 1$, en bijektion. Metod: räkna ut $q$ och kräv bijektion från $\mathbb{Z}_{\geq 0}$ till $\mathbb{N}$. |
| HT2024 Fx1 U3 | Mängdbild | $U$ är universum; den karakteristiska funktionen $\chi_{A}(x) = \begin{cases} 1 & \text{om } x \in A, \\ 0 & \text{om } x \notin A. \end{cases}$ Visa att $\chi_{A \cup B}(x) = 1 - (1 - \chi_{A}(x))(1 - \chi_{B}(x))$ för alla mängder $A, B \subset U$ och alla $x \in U$. | Gäller. Metod: värdena beror bara på om $x$ ligger i $A$ respektive $B$, så kontrollera likheten i de fyra fallen (i båda, i ena, i andra, i ingen); i varje fall blir leden lika. |
| HT2024 Omtentamen april U3 | Bijektion och invers | $n$ ett heltal $\geq 2$; $N = \{0, 1, 2, 3, \ldots, n\}$ och $M = \{a_{1}, a_{2}, a_{3}, \ldots, a_{n}\}$ ($n$ olika element), och $\omega : \mathcal{P}(M) \to N$ med $\omega(X) = \vert X\vert$. Avgör om $\omega$ är bijektiv; om inte, begränsa antingen målmängden eller definitionsmängden (inte båda) så att $\omega$ blir bijektiv. | Inte bijektiv. Metod: $\omega$ är surjektiv (varje $k \in N$ nås) men inte injektiv ($\omega(\{a_{1}\}) = \omega(\{a_{2}\}) = 1$). Begränsa definitionsmängden till en kedja av delmängder, så blir $\omega$ injektiv och därmed bijektiv. |
| HT2024 Fx2 U3 | Sammansättning | $A = \{a, b, c, d\}$, $B = \{1, 2, 3, 4, 5, 6\}$; $f = \{(a, 1), (b, 3), (c, 5), (d, 4)\}$ och $g = \{(1, b), (2, b), (3, d), (4, c), (5, a), (6, d)\}$. Med $h = f \circ g \circ f$ och $k = g \circ f \circ g$, ange definitions- och målmängd för $h$, $k$ och $k \circ h$ samt avgör om de är injektiva, surjektiva eller bijektiva. | $h : A \to B$ injektiv men ej surjektiv; $k : B \to A$ surjektiv men ej injektiv; $k \circ h : A \to A$ bijektiv. Metod: räkna ut varje sammansättning element för element — $h = \{(a, 3), (b, 4), (c, 1), (d, 5)\}$, $k = \{(1, d), (2, d), (3, c), (4, a), (5, b), (6, c)\}$, $k \circ h = \{(a, c), (b, a), (c, d), (d, b)\}$ — och läs av egenskaperna. |

| HT2025 KS1 U3a | Egenskapsbestämning | Funktionen $g : \mathbb{Z} \to \mathbb{Z}$ definierad av $g(n) = (-1)^{n}n$. Ge en fullständig utredning av vilka egenskaper av injektivitet, surjektivitet och bijektivitet funktionen har. (Högst en av 3a och 3b.) | Bijektiv (både injektiv och surjektiv). Metod: injektiv eftersom $g(n_{1}) = g(n_{2})$ tvingar samma paritet och då $n_{1} = n_{2}$; surjektiv eftersom varje udda $y$ nås som $g(-y)$ och varje jämnt $y$ som $g(y)$. |
| HT2025 KS1 U3b | Sammansättning | $f : \mathbb{R} \to \mathbb{R}$ och $g : \mathbb{R} \to \mathbb{R}$ med $f(x) = 2x + 1 \quad \text{respektive} \quad g(x) = x^{3}.$ (a) Visa att $f \circ g \neq g \circ f$. (b) Vilka av $f, g, g \circ f, f \circ g$ är bijektiva? Bevisa ditt påstående. | (a) Olika: $(f \circ g)(1)$ blir 3 men $(g \circ f)(1)$ blir 27. (b) Alla fyra är bijektiva, eftersom $f$ och $g$ är kontinuerliga, strängt växande och går mot $\pm\infty$, vilket förs över till sammansättningarna. |
| HT2025 KS2 U3a | Funktionslag | $f : A \to B$ och $g : B \to C$. Ett påstående är sant, det andra falskt: (1) om $f, g$ båda är surjektiva så är $g \circ f$ surjektiv; (2) om $f, g$ båda är surjektiva så är $g \circ f$ injektiv. Bevisa det sanna och ge ett konkret motexempel till det falska. (Högst en av 3a och 3b.) | (1) sant, (2) falskt. Metod: motexempel för (2): $A = \{a, b\}$, $B = \{c\}$, $C = \{d\}$, $f(a) = f(b) = c$, $g(c) = d$ ger $g \circ f$ ej injektiv. Bevis för (1): för $z \in C$ ger surjektiviteten hos $g$ ett $y$ med $g(y) = z$ och hos $f$ ett $x$ med $f(x) = y$, så $g(f(x)) = g(y) = z$. |
| HT2025 KS2 U3b | Funktionslag | $f : A \to B$ är en bijektion och $g : B \to C$ en funktion. Visa att (a) $g \circ f$ är injektiv om och endast om $g$ är injektiv, (b) $g \circ f$ är surjektiv om och endast om $g$ är surjektiv. (Högst en av 3a och 3b.) | Gäller. Metod: utnyttja att $f$ är bijektiv. (a) om $g \circ f$ är injektiv och $g(y_1) = g(y_2)$, skriv $y_1 = f(x_1)$ och $y_2 = f(x_2)$ (surjektivitet) och få $x_1 = x_2$, alltså $y_1 = y_2$; omvänt följer direkt. (b) samma idé med surjektivitet. |
| HT2025 Tentamen U3 | Egenskapsbestämning | Funktionen $f : \mathbb{R} \to \mathbb{R}$ genom $f(x) = e^{x^{2}}$. (a) Ange funktionens värdemängd. (b) Visa att den inte är injektiv. (c) Ange en maximal mängd $A \subset \mathbb{R}$ så att restriktionen av $f$ till $A$ är injektiv. | (a) Värdemängden är $\{y \in \mathbb{R} : y \geq 1\}$. (b) Inte injektiv: $f(-1) = e^{(-1)^{2}} = e^{1^{2}} = f(1)$ men $-1 \neq 1$. (c) Maximal injektiv mängd: $A = \{x \in \mathbb{R} : x \geq 0\}$. Metod: läs av värdemängden, ge ett motexempel, välj alla ickenegativa tal. |
| HT2025 Fx1 U3 | Funktionslag | $A, B$ godtyckliga mängder och $f : A \to B$ respektive $g : B \to A$. Om $f \circ g \circ f = f$, måste vi då alltid ha $f \circ g = \iota$? Motivera ditt svar fullständigt. | Nej. Motexempel: $A = \{1\}$, $B = \{1, 2\}$, $f(1) = 1, \quad g(1) = g(2) = 1$. Då är $f \circ g \circ f = f$ (bara ett element), men $f \circ g = \iota$ gäller inte eftersom $g(1) = g(2) = 1$ men $2 \neq 1$. Metod: konstruera ett litet motexempel. |
| HT2025 Omtentamen april U3 | Mängdbild | För $f : E \to F$ gäller notationen $f(X) = \{y \in F : y = f(x), x \in X\}$. Låt $f : A \to B$ och $X, Y \subseteq A$. (a) Visa att $f(X \cup Y) = f(X) \cup f(Y)$. (b) Visa att $f(X \cap Y) \subset f(X) \cap f(Y)$ och ge ett exempel där $f(X \cap Y) \neq f(X) \cap f(Y)$. | Gäller. Metod: (a) två inklusioner via elementjakt — $y \in f(X \cup Y)$ ger ett $x \in X \cup Y$ med $f(x) = y$, så $y \in f(X) \cup f(Y)$, och omvänt. (b) samma ger inklusionen; exempel på olikhet: $f(x) = x^{2}$, $X = [-1, 0]$, $Y = [0, 1]$ ger $f(X \cap Y) = \{0\}$ men $f(X) \cap f(Y) = [0, 1]$. |
| HT2025 Fx2 U3 | Sammansättning | $A = \{a, b, c, d\}$ och $f = \{(a, a), (b, c), (c, b), (d, d)\}, \quad g = \{(a, d), (b, b), (c, c), (d, a)\}, \quad h = \{(a, b), (b, c), (c, d), (d, c)\}.$ (alla med domän och kodomän $A$). Vilka av $f \circ g \circ f, \quad f \circ h \circ f, \quad g \circ f \circ g, \quad g \circ h \circ g.$ är inverterbara? Ange inverserna där de finns, motivera annars. | $f \circ g \circ f$ och $g \circ f \circ g$ är inverterbara (var och en är sin egen invers, byter bara plats på två element); $f \circ h \circ f$ och $g \circ h \circ g$ är inte inverterbara. Metod: räkna ut varje sammansättning; $f \circ h \circ f$ har en bildmängd med 3 element, så den är ej surjektiv och ej inverterbar. |

## Område 4 – Talteori

**grundläggande område – KS2 (30/11) och tentan.** Uppgifter i underlaget: 39, från 39 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Kongruensekvation | 14 | 14 | HT2019–HT2025 | 3 |
| Delbarhetsbevis | 7 | 7 | HT2019–HT2025 | 4 |
| gcd och allmän delbarhet | 5 | 5 | HT2020–HT2024 | 2 |
| Bézout och relativt prima | 4 | 4 | HT2020–HT2024 | 1 |
| Kongruensbevis | 3 | 3 | HT2021–HT2023 | 0 |
| Restklassgenomgång | 3 | 3 | HT2020–HT2025 | 1 |
| Sant eller falskt | 3 | 3 | HT2021–HT2023 | 0 |

- **Kongruensekvation** – lös en linjär kongruens av formen ax ≡ b (mod m) genom att finna den multiplikativa inversen med Euklides utvidgade algoritm.
- **Delbarhetsbevis** – bevisa att ett uttryck är delbart med ett visst tal, eller uppfyller en kongruens, för alla heltal av ett slag.
- **Kongruensbevis** – bevisa en kongruens eller delbarhet genom att räkna med kongruenser: faktorisera, reducera modulo m och använd att ett primtal som delar en produkt delar en faktor.
- **Restklassgenomgång** – avgör om en kongruens har lösning, eller vilka lösningarna är, genom att pröva alla restklasser (fall).
- **Bézout och relativt prima** – använd att gcd är 1 precis när det finns heltal x, y med ax + by = 1, för att bevisa relativ primalitet, delbarhet eller surjektivitet.
- **gcd och allmän delbarhet** – beräkna största gemensamma delaren konkret, eller bevisa en allmän sats om gcd, delbarhet eller primtal.
- **Sant eller falskt** – avgör och bevisa eller motbevisa ett eller flera talteoretiska påståenden.

### Vad uppgifterna ber om

Uppgift 4 hör alltid till Talteori, men alla skrivningar har den inte: den finns i 39 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx2 6 av 6; Hemtentamen 1 av 1; KS2 7 av 7; KS4 5 av 5; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: Fx1 6 av 7; KS3 1 av 6. Aldrig: KS1 0 av 7; Komplettering 0 av 1. (Räknat ur matrisen.)

- Vanligast: finn den multiplikativa inversen till ett tal modulo ett annat med Euklides utvidgade algoritm och lös sedan en linjär kongruens (HT2022 KS4 U4, HT2024 Fx1 U4).
- En stor grupp ber dig bevisa att ett tal delar ett uttryck för alla heltal, ofta genom faktorisering (HT2019 KS4 U4, HT2024 KS3 U4).
- "Alla tal i svaren ska vara reducerade modulo m": svaret ska anges som en rest, inte som en godtycklig lösning (HT2019 KS2 U4, HT2024 Fx1 U4).
- Ett bevis krävs, inte bara ett svar: uppgiften säger rakt ut "Bevis!" eller "Visa att" (HT2025 Tentamen U4, HT2024 Fx2 U4).
- En form ger två påståenden där ett är sant och ett falskt; du ska bevisa det sanna och motbevisa det falska med ett motexempel (HT2021 KS4 U4, HT2022 Fx1 U4).
- En enstaka uppgift frågar om ett påstående är sant eller falskt och kräver ett bevis för svaret (HT2023 Fx1 U4).
- Ledningar är vanliga och pekar ofta ut metoden, till exempel att dela upp i fall efter rest modulo ett tal (HT2022 Tentamen januari U4, HT2023 Tentamen januari U4).
- Vissa uppgifter har flera delar (a), (b), (c) som alla ska lösas (HT2024 KS2 U4).

**De senaste åren (HT2024–HT2025):** kongruensekvationen som löses med multiplikativ invers och Euklides utvidgade algoritm är den klart vanligaste typen över alla år, men de två senaste KS2-skrivningarna såg andra former: HT2024 KS2 U4 var en konkret gcd-beräkning med Euklides algoritm i tre delar, och HT2025 KS2 U4 frågade om en kongruens har någon lösning och skulle besvaras genom att pröva alla restklasser. Delbarhetsbevis för alla heltal var den vanligaste typen de två åren och kom på KS3, tentan och båda Fx-skrivningarna (HT2024 KS3 U4, HT2025 Tentamen U4, HT2025 Fx1 U4, HT2025 Fx2 U4); kongruensekvationen kom på HT2024 Fx1 U4, HT2024 Omtentamen april U4 och HT2025 Omtentamen april U4. Eftersom KS2 examinerar kapitlet den här terminen är HT2024 KS2 U4 och HT2025 KS2 U4 de närmaste ledtrådarna till formen.

### Så löser lösningsförslagen uppgifterna

**Kongruensekvation**

1. Kör Euklides utvidgade algoritm: upprepa divisionsalgoritmen tills resten blir 1 (HT2019 KS2 U4, HT2024 Fx1 U4).
2. Gå baklänges genom likheterna och skriv 1 som en kombination av de två talen; koefficienten framför det tal du inverterar är den multiplikativa inversen (HT2020 Fx1 U4, HT2023 KS4 U4).
3. Reducera gärna högerledet modulo m först så att talen blir mindre (HT2021 KS2 U4, HT2025 Omtentamen april U4).
4. Multiplicera båda leden med inversen och reducera svaret modulo m (HT2019 Tentamen januari U4, HT2022 KS4 U4).
5. Om inversen blir negativ, addera m så att resten hamnar mellan 0 och m minus 1 (HT2023 KS4 U4, HT2024 Fx1 U4).

Fallgropar: en delbarhetsuppgift kan skrivas om till en kongruens först (HT2024 Omtentamen april U4); två kongruenser kan sakna gemensam lösning fast var och en är lösbar (HT2023 Fx2 U4); RSA-dekrypteringstalet är just en multiplikativ invers (HT2021 Fx1 U4).

**Delbarhetsbevis**

1. Faktorisera uttrycket så att det blir en produkt av på varandra följande tal (HT2019 KS4 U4, HT2024 KS3 U4).
2. Bland tre på varandra följande tal är ett delbart med 2 och ett med 3, så produkten är delbar med båda (HT2019 KS4 U4, HT2025 Tentamen U4).
3. Är ett tal udda, skriv det som 2k + 1 och kvadrera; då syns delbarheten med 4 eller 8 (HT2023 Omtentamen april U4, HT2025 Fx1 U4).
4. Visa delbarhet med två relativt prima tal var för sig; då följer delbarhet med deras produkt (HT2020 KS4 U4, HT2025 Fx2 U4).

Fallgropar: påståendet ska gälla för alla heltal, även negativa (HT2019 KS4 U4); ett motexempel räcker aldrig för att bevisa en allmän del.

**Kongruensbevis**

1. Skriv om delbarheten som en kongruens modulo talet (HT2023 Tentamen januari U4, HT2021 Fx2 U4).
2. Faktorisera uttrycket, till exempel med konjugatregeln (HT2023 KS2 U4, HT2023 Tentamen januari U4).
3. Är modulen ett primtal och delar en produkt, så delar den en av faktorerna; dela upp i de fallen (HT2023 KS2 U4, HT2023 Tentamen januari U4).
4. För en delbarhetsregel, skriv talet i sitt positionsvärde och reducera modulo talet (HT2021 Fx2 U4).

Fallgropar: steget att ett primtal som delar en produkt delar en faktor gäller bara för primtal (HT2023 Tentamen januari U4).

**Restklassgenomgång**

1. Bestäm vilka restklasser som är möjliga modulo talet (HT2020 Tentamen januari U4, HT2025 KS2 U4).
2. Räkna ut vad uttrycket blir i varje restklass; värdet är samma för alla tal i klassen (HT2025 KS2 U4).
3. Dra slutsatsen: finns den sökta resten i någon klass finns lösning, annars inte (HT2025 KS2 U4, HT2022 Tentamen januari U4).
4. För ett motsägelsebevis, visa att varje fall leder till en motsägelse (HT2022 Tentamen januari U4).

Fallgropar: du måste täcka alla restklasser, annars är genomgången ofullständig (HT2020 Tentamen januari U4).

**Bézout och relativt prima**

1. Två tal är relativt prima precis när det finns heltal x, y med ax + by = 1; räkna som i Euklides utvidgade algoritm för att hitta dem (HT2022 Fx2 U4).
2. Använd Bézouts sats: eftersom talen är relativt prima finns en sådan kombination som blir 1 (HT2020 Omtentamen april U4, HT2024 Fx2 U4).
3. Ur ax + by = 1 får du en multiplikativ invers och kan förkorta bort en faktor i en kongruens (HT2024 Fx2 U4).
4. Om a och b är relativt prima och a delar bc, så delar a talet c (HT2022 KS2 U4).

Fallgropar: slutsatsen att a delar c ur att a delar bc kräver att a och b är relativt prima (HT2022 KS2 U4).

**gcd och allmän delbarhet**

1. För en konkret gcd, kör Euklides algoritm med upprepad division; sista nollskilda resten är gcd (HT2024 KS2 U4).
2. Gå baklänges för att skriva gcd som en linjärkombination av talen (HT2024 KS2 U4).
3. För en gcd-identitet, visa att de två paren har exakt samma gemensamma delare; då har de samma största gemensamma delare (HT2021 Tentamen januari U4).
4. Härled delbarhet ur talens faktorer och om de är jämna eller udda (HT2020 Fx2 U4).
5. För ett motsägelsebevis, anta motsatsen och härled en omöjlig delbarhet (HT2021 Omtentamen april U4).
6. För ett direkt bevis, sätt in det konkreta tal som en ledning anger, använd förutsättningen för att få en delbarhet och kläm fast gcd mellan två olikheter (HT2024 Tentamen januari U4).

Fallgropar: att visa en riktning av en identitet räcker inte, båda riktningarna av delbarheten behövs (HT2021 Tentamen januari U4).

**Sant eller falskt**

1. Avgör först vilket påstående som är sant och vilket som är falskt (HT2021 KS4 U4, HT2022 Fx1 U4).
2. Bevisa det sanna direkt med kongruensräkning eller algebra (HT2022 Fx1 U4).
3. Motbevisa det falska med ett konkret motexempel i heltal (HT2022 Fx1 U4, HT2021 KS4 U4).
4. För ett ensamt påstående, testa det minsta fallet; håller det inte är påståendet falskt (HT2023 Fx1 U4).

Fallgropar: att det ena påståendet är falskt bevisar inte att det andra är sant; behandla dem var för sig (HT2021 KS4 U4).

### Formelsamlingen och kapitlet

Formelsamlingen har en egen sektion "4 Inledande talteori". Den skriver definitionerna av delbarhet och kongruens, lagarna för kongruensräkning (addition, multiplikation och potens), divisionsalgoritmen, Bezouts sats och Euklides algoritm steg för steg.

Det som uppgifterna och lösningarna behöver men bladet inte ger:

- Begreppet multiplikativ invers modulo m: namnet och hur man räknar fram den finns inte, fast nästan alla kongruensekvationer bygger på den (HT2019 KS2 U4, HT2022 KS4 U4).
- Den utvidgade (baklänges-)varianten av Euklides algoritm som ger själva linjärkombinationen: bladet ger bara gcd-varianten och Bezouts existens, inte hur man räknar fram x och y (HT2024 KS2 U4).
- Att ett primtal som delar en produkt delar en av faktorerna (ges som ledning i HT2023 KS2 U4, HT2023 Tentamen januari U4).
- Att delbarhet med två relativt prima tal ger delbarhet med deras produkt: står inte som egen sats, men används ofta (HT2020 KS4 U4, HT2025 Fx2 U4).
- Standardgreppen att faktorisera $n^{3} - n$ till tre på varandra följande tal och att skriva ett udda tal som 2k + 1 (HT2019 KS4 U4, HT2023 Omtentamen april U4).
- Algebraiska omskrivningar som konjugatregeln förutsätts kända (HT2023 KS2 U4).

### Uppgifter som återkommer

- Finn den multiplikativa inversen med Euklides utvidgade algoritm och lös en linjär kongruens, med bara talen bytta: HT2019 KS2 U4, HT2019 Tentamen januari U4, HT2019 Hemtentamen april U4, HT2020 KS2 U4, HT2020 Fx1 U4, HT2021 KS2 U4, HT2021 Omtentamen september U4, HT2022 KS4 U4, HT2023 KS4 U4, HT2024 Fx1 U4, HT2025 Omtentamen april U4
- Visa att 6 delar $n^{3} - n$ (eller samma sak skrivet som en kongruens modulo 6), nästan ordagrant: HT2019 KS4 U4, HT2025 Tentamen U4
- Ett sant och ett falskt påstående om kongruenser som ska bevisas och motbevisas: HT2021 KS4 U4, HT2022 Fx1 U4

### Mönsterlösningar

- **Kongruensekvation**: HT2025 Omtentamen april U4
- **Delbarhetsbevis**: HT2025 Fx2 U4
- **Kongruensbevis**: HT2023 Tentamen januari U4
- **Restklassgenomgång**: HT2025 KS2 U4
- **Bézout och relativt prima**: HT2024 Fx2 U4
- **gcd och allmän delbarhet**: HT2024 KS2 U4
- **Sant eller falskt**: HT2022 Fx1 U4

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS2 U4 | Kongruensekvation | Finn med Euklides algoritm den multiplikativa inversen modulo 19 för 17 och alla heltal $x$ som uppfyller $17 \cdot x \equiv 22 \pmod{19}$. Alla tal reducerade modulo 19. | Invers 9; $x \equiv 8 \pmod{19}$. Euklides ger $9 \cdot 17 \equiv 1 \pmod{19}$; efter att $22 \equiv 3$ reducerats multipliceras båda led med 9. |
| HT2019 KS4 U4 | Delbarhetsbevis | Visa att $6 \mid n^{3} - n$ för alla heltal $n$ (även negativa); induktion behövs inte. | Gäller. Faktorisera $n^{3} - n$ till $(n-1) \cdot n \cdot (n+1)$, tre på varandra följande tal som är delbara med 2 respektive 3; då 2 och 3 är relativt prima delar $2 \cdot 3 = 6$ talet. |
| HT2019 Tentamen januari U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen av 21 modulo 23 och alla heltal $x$ som uppfyller $21x \equiv 5 \pmod{23}$. Svar reducerat modulo 23. | Invers 11; $x \equiv 9 \pmod{23}$. Euklides ger $11 \cdot 21 \equiv 1 \pmod{23}$; multiplicera båda led med 11. |
| HT2019 Hemtentamen april U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen av 5 modulo 32 och alla heltal $x$ som uppfyller $5x \equiv 21 \pmod{32}$. Svar reducerat modulo 32. | Lösning saknas i underlaget. |
| HT2020 KS2 U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm alla heltal $x$ som uppfyller $38x \equiv 56 \pmod{101}$. Reducera svaret modulo 101. | Invers 8; $x \equiv 44 \pmod{101}$. Euklides ger $8 \cdot 38 \equiv 1 \pmod{101}$; multiplicera. Tryckfel i ett mellansteg ($2 \cdot 28$ ska vara $2 \cdot 38$), men svaret är rätt. |
| HT2020 KS4 U4 | Delbarhetsbevis | Om talet $n$ är udda, bevisa att $24 \mid n^{3} - n$. | Gäller. Skriv $n = 2k + 1$; då blir uttrycket $4k(k + 1)n$ som är delbart med 8, och som produkt av tre på varandra följande tal delbart med 3; eftersom 8 och 3 är relativt prima följer 24. |
| HT2020 Tentamen januari U4 | Restklassgenomgång | Om $n$ inte är delbart med 7, visa att $n^{6} \equiv 1 \pmod{7}$. | Gäller. Dela upp i de sex restklasserna $n \equiv 1$ till $n \equiv 6$ modulo 7; i varje fall blir sjätte potensen 1, t.ex. $n \equiv 2 \Rightarrow n^{6} \equiv 2^{6} \equiv 64 \equiv 1$. |
| HT2020 Fx1 U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm alla heltal $x$ som uppfyller $19x \equiv 17 \pmod{34}$. Reducera svaret modulo 34. | Invers 9; $x \equiv 17 \pmod{34}$. Euklides ger inversen 9; multiplikation ger svaret eftersom $9 \cdot 17 \equiv 17 \pmod{34}$. |

| HT2020 Omtentamen april U4 | Bézout och relativt prima | Betrakta $g : \mathbb{Z} \times \mathbb{Z} \to \mathbb{Z}$ given av $g(n, m) = 2n + 3m$. Visa att funktionen är surjektiv men inte injektiv. | Surjektiv men inte injektiv. Surjektiv med Bézout: då 2 och 3 är relativt prima finns $m, n$ med $2n + 3m = 1$, alltså $g(ny, my) = y$ för godtyckligt $y$. Inte injektiv eftersom $g(2, -1)$ och $g(-1, 1)$ båda blir 1 trots olika argument. |
| HT2020 Fx2 U4 | gcd och allmän delbarhet | Antag att $\gcd(a, 4) = \gcd(b, 4) = 2$. Beräkna $\gcd(a + b, 4)$. Ledning: $\gcd(a, 4) = 2$ betyder $2 \mid a$ men $2^{2} \nmid a$. | Svar: $\gcd(a + b, 4)$ blir 4. Skriv $a = 2k_1$ och $b = 2k_2$ med $k_1, k_2$ udda; då är $a + b = 2k_1 + 2k_2 = 2(k_1 + k_2)$ delbart med 4 eftersom summan av två udda tal är jämn. |
| HT2021 KS2 U4 | Kongruensekvation | Finn alla heltal $x$ som uppfyller kongruensen $11x \equiv 73 \pmod{13}$. Reducera svaret modulo 13. | Invers 6; $x \equiv 9 \pmod{13}$. Euklides ger $6 \cdot 11 \equiv 1 \pmod{13}$; reducera $73 \equiv 8$ och multiplicera. |
| HT2021 KS4 U4 | Sant eller falskt | Ett sant och ett falskt påstående — bevisa det sanna, motbevisa det falska. (1) Om $(a + b)^{2}$ är udda så är både $a^{2}$ och $b^{2}$ udda. (2) Om $a \not\equiv 0 \pmod{2}$ och $a \not\equiv 0 \pmod{3}$ så gäller $a \not\equiv 1 \pmod{6} \Rightarrow a \equiv 5 \pmod{6}$. | Påstående 1 falskt, påstående 2 sant. (1) motbevisas med $(a + b)^{2} = a^{2} + 2ab + b^{2} \equiv a^{2} + b^{2} \pmod{2}$: vore båda udda blir summan jämn, motsägelse. (2) fallanalys modulo 6 ger kvar $a \equiv 1 \pmod{6}$ eller $a \equiv 5 \pmod{6}$, vilket är just implikationen. |
| HT2021 Tentamen januari U4 | gcd och allmän delbarhet | Visa, för alla heltal $a, b, c$, att $\gcd(a, b) = \gcd(a + bc, a + b(c - 1))$. | Gäller. Visa att ett tal $d$ är gemensam delare till $a, b$ precis när det är gemensam delare till $a + bc$ och $a + b(c - 1)$ (båda riktningar); alltså sammanfaller de största gemensamma delarna. |
| HT2021 Fx1 U4 | Kongruensekvation | RSA: välj primtal $p, q$, bilda $\phi = (p - 1)(q - 1)$, välj $e, d$ med $ed \equiv 1 \pmod{\phi}$. Ange minsta $d > 1$ om $p = 5$, $q = 11$ och $e = 7$. | Svar: $d = 23$. Med $p = 5$, $q = 11$ blir $\phi = (p - 1)(q - 1) = 4 \cdot 10 = 40$; sök multiplikativ invers till 7 modulo 40 med Euklides, vilket ger $23 \cdot 7 \equiv 1 \pmod{40}$. |
| HT2021 Omtentamen april U4 | gcd och allmän delbarhet | Låt $n$ vara ett positivt heltal och $p$ ett primtal med $p \mid (n + 1)! + 1$. Visa att $p > n$. | Gäller. Motsägelsebevis: anta $p \leq n$; då är $p$ en faktor i $(n + 1)!$, så $p \mid (n + 1)!$, vilket motsäger $p \mid (n + 1)! + 1$. Alltså $p > n$. |
| HT2021 Fx2 U4 | Kongruensbevis | Låt $a, b, c$ vara siffror i ett tresiffrigt tal $abc$ ($1 \leq a \leq 9$, $0 \leq b \leq 9$, $0 \leq c \leq 9$). Visa att $11 \mid abc \Leftrightarrow 11 \mid a - b + c$. | Gäller. Skriv talet $abc$ som $a \cdot 100 + b \cdot 10 + c$ och reducera modulo 11; det blir kongruent med $a - b + c$, så de två delbarheterna är ekvivalenta. |

| HT2021 Omtentamen september U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen till 15 modulo 17 och alla heltal $x$ som uppfyller $15x \equiv 8 \pmod{17}$. | Invers 8; $x \equiv 13 \pmod{17}$. Euklides ger $8 \cdot 15 \equiv 1 \pmod{17}$; multiplicera båda led med 8 och reducera modulo 17. |
| HT2022 KS2 U4 | Bézout och relativt prima | $a, b$ är relativt prima heltal med $a + b = 1$, och $xa + yb = 1$ för några heltal $x, y$. Visa att $a \mid y - 1$ och $b \mid x - 1$. | Gäller. Subtrahera $a + b = 1$ från $xa + yb = 1$: $(x - 1)a = -(y - 1)b$, så $a \mid (y - 1)b$ och $b \mid (x - 1)a$; då $a, b$ är relativt prima följer $a \mid y - 1$ och $b \mid x - 1$. |
| HT2022 KS4 U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen av 14 modulo 17 och alla heltal $x$ som uppfyller $14x \equiv 3 \pmod{17}$. Svar reducerat modulo 17. | Invers $-6$ (dvs $17 - 6 = 11$); $x \equiv 16 \pmod{17}$. Euklides utvidgade algoritm ger inversen, sedan multiplikation med 11 och reduktion modulo 17. |
| HT2022 Tentamen januari U4 | Restklassgenomgång | Visa att det inte finns några heltal $x, y$ som uppfyller $3x^{2} + 2 = y^{2}$. Ledning: anta en lösning och gå igenom fallen $y \equiv 0 \pmod{3}$, $y \equiv 1 \pmod{3}$, $y \equiv 2 \pmod{3}$. | Gäller (inga sådana heltal finns). Motsägelsebevis: $3x^{2} \equiv 0 \pmod{3}$ ger $y^{2} \equiv 2 \pmod{3}$, men $y \equiv 0$ ger $y^{2} \equiv 0$, $y \equiv 1$ ger $y^{2} \equiv 1$ och $y \equiv 2$ ger $y^{2} \equiv 4 \equiv 1$, aldrig 2. |
| HT2022 Fx1 U4 | Sant eller falskt | För heltal $a, b, n > 1$: ett av påståendena $a \equiv b \pmod{n} \Rightarrow a^{2} \equiv b^{2} \pmod{n}$ och $a^{2} \equiv b^{2} \pmod{n} \Rightarrow a \equiv b \pmod{n}$ är sant, det andra falskt. Bevisa det sanna, motbevisa det falska. | Första sant, andra falskt. Sant: $n \mid a - b \Rightarrow n \mid (a - b)(a + b)$, dvs $a^{2} \equiv b^{2} \pmod{n}$. Motexempel för det andra: $a = 1$, $b = -1$, $n = 3$ ger $a^{2} = b^{2}$ men inte $1 \equiv -1 \pmod{3}$. |
| HT2022 Fx2 U4 | Bézout och relativt prima | Låt $n$ vara ett godtyckligt heltal. Visa att talen $13n + 4$ och $3n + 1$ är relativt prima. Ledning: finn $x, y$ med $x \cdot (13n + 4) + y \cdot (3n + 1) = 1$ ungefär som i Euklides utvidgade algoritm. | Gäller (relativt prima). Räkna som Euklides: $13n + 4 = 4 \cdot (3n + 1) + n$, bakåtsubstitution ger att $13 \cdot (3n + 1) - 3 \cdot (13n + 4)$ blir 1, alltså $\gcd(13n + 4, 3n + 1) = 1$. |
| HT2023 KS2 U4 | Kongruensbevis | Låt $a, b$ vara heltal med $a^{2} \equiv b^{2} \pmod{p}$ för ett primtal $p$. Visa att $a \equiv b \pmod{p}$ eller $a \equiv -b \pmod{p}$. Ledning: om primtalet $p$ delar en produkt $mn$ så $p \mid m$ eller $p \mid n$. | Gäller. Konjugatregeln: $a^{2} - b^{2} \equiv 0 \pmod{p}$, dvs $(a + b)(a - b) \equiv 0 \pmod{p}$, så $p \mid (a + b)(a - b)$; då $p$ är primtal följer $p \mid a + b$ eller $p \mid a - b$, dvs $a \equiv b \pmod{p}$ eller $a \equiv -b \pmod{p}$. |
| HT2023 KS4 U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen till 11 modulo 14 och alla heltal $x$ som uppfyller $11x \equiv 8 \pmod{14}$. | Invers 9; $x \equiv 2 \pmod{14}$. Euklides ger $4 \cdot 14 - 5 \cdot 11$ lika med 1, så $-5 \cdot 11 \equiv 1 \pmod{14}$, dvs $9 \cdot 11 \equiv 1 \pmod{14}$; multiplikation ger $x \equiv 72 \pmod{14}$, reducerat $x \equiv 2 \pmod{14}$. |
| HT2023 Tentamen januari U4 | Kongruensbevis | Finn alla heltal $x$ som uppfyller $7 \mid 6x^{2}+5x+1$. Ledning: arbeta modulo 7, $6x^{2}+5x+1 \equiv -x^{2}+5x-6 \pmod{7}$, och om $7 \mid ab$ så $7 \mid a$ eller $7 \mid b$. | $x \equiv 2 \pmod{7}$ eller $x \equiv 3 \pmod{7}$. Reducera och faktorisera modulo 7: $(x-2)(x-3) \equiv 0 \pmod{7}$; då 7 är primtal delar 7 en faktor, så $7 \mid x-2$ eller $7 \mid x-3$. |
| HT2023 Fx1 U4 | Sant eller falskt | Påstående: för alla primtal $p$ finns ett primtal $q$ (som kan bero av $p$) så att $10 \mid p^{2} + q^{2}$. Är det sant eller falskt? Ge ett bevis. | Falskt. Motexempel $p = 2$: med $q = 2$ fås $10 \mid 8$ vilket är falskt; för udda $q$ är $2^{2} + q^{2}$ udda, så $10 \mid 2^{2} + q^{2}$ kan inte gälla. Alltså finns inget sådant $q$ ens för $p = 2$. |
| HT2023 Omtentamen april U4 | Delbarhetsbevis | Låt $p$ vara ett godtyckligt primtal större än 2. Visa att $p^{2} \equiv 1 \pmod{8}$. | Gäller. $p$ är udda, skriv $p = 2k + 1$; då $p^{2} = 4k(k + 1) + 1 \equiv 1 \pmod{8}$ eftersom $k(k + 1)$ är jämnt så $4k(k + 1)$ är delbart med 8. |
| HT2023 Fx2 U4 | Kongruensekvation | Betrakta $4x \equiv 1 \pmod{9}$ och $8x \equiv 6 \pmod{18}$. Finn alla $x$ som löser var och en för sig, och visa att inget heltal $x$ löser båda. | $4x \equiv 1 \pmod{9}$: $x \equiv 7 \pmod{9}$. Den andra blir $4x \equiv 3 \pmod{9}$, dvs $x \equiv 3 \pmod{9}$. Ingen gemensam lösning: annars $1 \equiv 4x \equiv 3 \pmod{9}$, motsägelse. Invers till 4 modulo 9 är 7 (dvs $-2 + 9 = 7$). |
| HT2024 KS2 U4 | gcd och allmän delbarhet | Låt $a = 120$, $b = 45$. (a) Finn $\gcd(a, b)$ med Euklides algoritm. (b) Uttryck $\gcd(a, b)$ som $ax + by$. (c) Avgör om det finns heltal $k$ med $120k \equiv 90 \pmod{45}$, och finn i så fall minsta positiva $k$. | (a) $\gcd(120, 45)$ är 15 ($120 = 2 \cdot 45 + 30$, $45 = 1 \cdot 30 + 15$, $30 = 2 \cdot 15 + 0$). (b) $15 = x \cdot 120 + y \cdot 45$ med $x = -1$, $y = 3$ (dvs $3 \cdot 45 - 1 \cdot 120$). (c) Ja; kongruensen blir $15k \equiv 0 \pmod{45}$, minsta positiva $k$ är 3. |
| HT2024 KS3 U4 | Delbarhetsbevis | Visa att $n(4n^{2} - 1)$ alltid är delbart med 3 för alla heltal $n$. | Gäller. Modulo 3: $n(4n^{2} - 1) = n(2n - 1)(2n + 1)$ är kongruent med $(n - 1)n(n + 1)$, tre på varandra följande tal där ett är delbart med 3. (Alternativt: fallen $n = 3k$, $n = 3k + 1$, $n = 3k + 2$.) |
| HT2024 Tentamen januari U4 | gcd och allmän delbarhet | Låt $a, b$ vara positiva heltal. Visa att om $a \mid n \land b \mid n \Rightarrow ab \mid n$ för alla heltal $n$, så gäller $GCD(a, b) = 1$. Ledning: betrakta $n = \frac{ab}{GCD(a, b)}$. | Gäller. Sätt $n = \frac{ab}{GCD(a, b)}$, delbart med både $a$ och $b$; förutsättningen ger $ab \mid n$, alltså $ab \leq \frac{ab}{GCD(a, b)}$, men också $ab \geq \frac{ab}{GCD(a, b)}$, så $GCD(a, b) = 1$. |
| HT2024 Fx1 U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen till 11 modulo 25 och alla heltal $x$ som uppfyller $11x \equiv 9 \pmod{25}$. Svar reducerat modulo 25. | Invers $25 - 9 = 16$; $x \equiv 19 \pmod{25}$. Euklides ger $4 \cdot 25 - 9 \cdot 11$ lika med 1, så $-9 \cdot 11 \equiv 1 \pmod{25}$; multiplikation ger $1 \cdot x \equiv -81 \pmod{25}$, dvs $x \equiv 19 \pmod{25}$. |
| HT2024 Omtentamen april U4 | Kongruensekvation | Bestäm alla heltal $x$ sådana att $101x + 13$ är delbart med 24. Svar reducerat modulo 24. | $x \equiv 7 \pmod{24}$. Skriv om som $101x + 13 \equiv 0 \pmod{24}$, dvs $5x \equiv 11 \pmod{24}$; Euklides ger $5 \cdot 5 - 1 \cdot 24$ lika med 1, så inversen till 5 är 5, och $1 \cdot x \equiv 55 \pmod{24}$ ger svaret. |
| HT2024 Fx2 U4 | Bézout och relativt prima | Låt $a, b, c, n \in \mathbb{Z}$. Bevisa att om $ac \equiv bc \pmod{n}$ och $\gcd(c, n) = 1$, så följer $a \equiv b \pmod{n}$ (annulleringslagen). | Gäller. Då $\gcd(c, n) = 1$ finns heltal $x, y$ med $xc + yn = 1$, så $xc \equiv 1 \pmod{n}$ ($x$ är invers till $c$); multiplicera $ac \equiv bc$ med $x$ och få $a \equiv b \pmod{n}$. |
| HT2025 KS2 U4 | Restklassgenomgång | Har kongruensen $4x^{2} \equiv 3 \pmod{5}$ någon lösning $x \in \mathbb{Z}$? Bevisa ditt påstående. | Nej, ingen lösning. Pröva alla restklasser $x = 0, 1, 2, 3, 4$: t.ex. $4 \cdot 2^{2} = 16 \equiv 1 \pmod{5}$. Möjliga rester är bara 0, 1 och 4, aldrig 3. |
| HT2025 Tentamen U4 | Delbarhetsbevis | Gäller det alltid att $n^{3} \equiv n \pmod{6}$ för alla heltal $n$? Bevis! | Gäller. $n^{3} - n = n(n^{2} - 1) = (n - 1)n(n + 1)$, tre på varandra följande tal, så $2 \mid n^{3} - n$ och $3 \mid n^{3} - n$; då 2 och 3 är relativt prima är talet delbart med 6, dvs $n^{3} \equiv n \pmod{6}$. |
| HT2025 Fx1 U4 | Delbarhetsbevis | Visa att för alla udda heltal $x$ gäller $x^{2} \equiv 1 \pmod{4}$. Dra slutsatsen att ett heltal på formen $4k+3$ aldrig kan skrivas som $x^{2}+y^{2}$ för två heltal $x, y$. | Gäller. $x = 2k + 1$ ger $4(k^{2} + k) + 1 \equiv 1 \pmod{4}$. Motsägelsebevis i fyra fall efter pariteten på $x, y$: $x^{2} + y^{2}$ blir kongruent med 0, 1 eller 2 modulo 4, alltså aldrig på formen $4k + 3$. |
| HT2025 Omtentamen april U4 | Kongruensekvation | Finn med Euklides utvidgade algoritm den multiplikativa inversen till $23 \pmod{17}$ och alla heltal som uppfyller $23x \equiv 337 \pmod{17}$. | Invers 3; $x \equiv 8 \pmod{17}$. Euklides ger $3 \cdot 23 - 4 \cdot 17$ lika med 1; reducera till $6x \equiv 14 \pmod{17}$ och multiplicera med 3: $1 \cdot x \equiv 42 \pmod{17}$. |
| HT2025 Fx2 U4 | Delbarhetsbevis | Låt $p$ vara ett primtal större än 3. Visa att $p^{2} - 1$ är delbart med 24. Ledning: visa delbarhet med 3 respektive 8 och motivera att delbarhet med 24 följer. | Gäller. $p^{2} - 1 = (p - 1)(p + 1)$. Med 3: $p \not\equiv 0 \pmod{3}$, så $p \equiv 1$ eller $2$ ger $3 \mid (p - 1)(p + 1)$. Med 8: $p$ udda ger två på varandra följande jämna tal med faktorerna 4 och 2. Då $\gcd(8, 3) = 1$ följer $24 \mid (p - 1)(p + 1)$, dvs $p^{2} - 1$ är delbart med 24. |

## Område 7 – Grafteori

**grundläggande område – KS2 (30/11) och tentan.** Uppgifter i underlaget: 39, från 39 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Kortaste väg | 13 | 13 | HT2019–HT2025 | 3 |
| Uppspännande träd | 9 | 9 | HT2019–HT2024 | 1 |
| Euler och Hamilton | 6 | 6 | HT2020–HT2025 | 3 |
| Gradtal och handskakning | 5 | 5 | HT2019–HT2025 | 1 |
| Trädbevis | 3 | 3 | HT2019–HT2025 | 1 |
| Isomorfi och delgraf | 3 | 3 | HT2021–HT2024 | 1 |

- **Kortaste väg** – hitta billigaste vägen mellan två hörn, oftast med Dijkstras algoritm och alla kandidatetiketter, eller välj kantvikter så att de kortaste vägarna får en viss egenskap.
- **Uppspännande träd** – hitta, räkna eller parametrisera ett minsta uppspännande träd med Kruskals eller Prims algoritm, eller använd att ett uppspännande träd har en kant färre än antalet hörn.
- **Euler och Hamilton** – avgör om en graf är eulersk och/eller hamiltonsk och motivera fullständigt.
- **Gradtal och handskakning** – använd att summan av gradtalen är dubbla antalet kanter: avgör gradtalssekvenser, bevisa jämnhet eller räkna kanter.
- **Trädbevis** – bevisa en egenskap hos träd eller cykelfria grafer, som antal löv eller förhållandet mellan hörn och kanter.
- **Isomorfi och delgraf** – avgör eller visa om två grafer är isomorfa, hitta största gemensamma delgraf, eller rita en graf med givna delgrafer.

### Vad uppgifterna ber om

Uppgift 7 hör alltid till Grafteori, men alla skrivningar har den inte: den finns i 39 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx1 7 av 7; Fx2 6 av 6; Hemtentamen 1 av 1; KS3 6 av 6; KS4 5 av 5; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: KS2 1 av 7. Aldrig: KS1 0 av 7; Komplettering 0 av 1. (Räknat ur matrisen.) Vanligast är kortaste väg med Dijkstra, och varje år sedan HT2019 har minst en sittning en sådan uppgift.

- En Dijkstra-uppgift kräver att alla hörn får etiketter, att alla kandidatetiketter redovisas i varje steg och att vägen och dess kostnad anges (HT2019 KS3 U7, HT2021 KS4 U7).
- Ett minsta uppspännande träd ska anges tillsammans med sin vikt, och varje delsteg i algoritmen ska redovisas (HT2020 KS4 U7, HT2022 KS4 U7); ibland behöver man inte redovisa alla detaljer (HT2021 Omtentamen september U7).
- Euler- och Hamiltonuppgifter kräver fullständig motivering, både när en krets eller cykel finns och när man måste visa att ingen finns (HT2023 Tentamen januari U7, HT2020 Omtentamen april U7).
- För en isomorfiuppgift räcker det inte att säga att ett par inte är isomorft för att det andra är det; oberoende utredningar krävs i båda fallen (HT2024 Fx1 U7).
- En konstruktionsuppgift ber dig rita en graf med givna egenskaper och tydligt märka ut de delgrafer som krävs, med en skiss per krav (HT2021 Tentamen januari U7).
- En kryssuppgift med sant/falskt ger inga motiveringar men kräver allt rätt för godkänt (HT2025 Fx2 U7).
- Gradtalsuppgifter ber dig avgöra om en talföljd kan vara en gradtalssekvens och motivera varför eller varför inte (HT2025 Fx1 U7, HT2019 KS4 U7).
- Flera uppgifter inför vikter som obekanta och ber dig välja dem så att grafen får en viss egenskap, som flera lika kortaste vägar eller två olika minsta uppspännande träd (HT2020 Fx2 U7, HT2022 Tentamen januari U7).

**De senaste åren (HT2024–HT2025):** På kontrollskrivningarna har uppgiften varit kortaste väg med Dijkstra (HT2025 KS2 U7, HT2024 KS3 U7). På tentorna har den varit Euler och Hamilton (HT2025 Tentamen U7, HT2024 Tentamen januari U7). På Fx-skrivningarna har det handlat om gradtal och handskakning (HT2025 Fx1 U7), grafisomorfi (HT2024 Fx1 U7), minsta uppspännande träd med Prim (HT2024 Fx2 U7) och Euler och Hamilton (HT2025 Fx2 U7). På omtentorna har det bland annat varit trädbevis (HT2025 Omtentamen april U7). HT2025, som ligger närmast den här terminen, hade Dijkstra på KS2, och på den här terminen examineras grafteori på KS2 den 30 november.

### Så löser lösningsförslagen uppgifterna

**Kortaste väg**

1. Ge starthörnet etikett 0 och lista för varje grannhörn utan etikett en kandidatetikett med föregångare och sammanlagd kostnad (HT2020 KS3 U7, HT2025 KS2 U7).
2. Välj i varje steg den billigaste kandidatetiketten och gör den till hörnets fasta etikett (HT2022 KS3 U7, HT2023 KS4 U7).
3. Fortsätt tills sluthörnet fått etikett; flera kandidater kan bli etiketter samtidigt när de är lika billiga (HT2021 KS4 U7, HT2025 KS2 U7).
4. Läs vägen baklänges från sluthörnets etikett via föregångarna, och läs kostnaden direkt i sluthörnets etikett (HT2024 KS3 U7, HT2022 KS3 U7).
5. När vikter är obekanta: skriv varje cykelfri väg som en summa av vikter, sätt summorna lika med det önskade värdet och lös ekvationerna (HT2020 Fx2 U7, HT2023 Fx2 U7).

Fallgropar: en kandidatetikett kan bytas mot en billigare i ett senare steg innan den blir fast (HT2020 KS3 U7); flera hörn kan få lika billiga etiketter, så fler än en väg kan vara kortast (HT2021 Fx2 U7, HT2023 Fx2 U7).

**Uppspännande träd**

1. Sortera kanterna efter vikt och lägg till dem från den billigaste, en i taget (HT2022 KS4 U7, HT2022 Fx1 U7).
2. Hoppa över en kant om den skulle skapa en cykel (HT2021 Omtentamen september U7, HT2022 Fx1 U7).
3. Sluta när trädet har en kant färre än antalet hörn, dvs binder samman alla hörn (HT2020 KS4 U7, HT2022 KS4 U7).
4. Summera de valda kanternas vikter för att få trädets vikt (HT2020 KS4 U7, HT2022 KS4 U7).
5. För att räkna alla minsta uppspännande träd: hitta var det finns flera lika billiga kanter att välja mellan och multiplicera antalet oberoende val (HT2019 Tentamen januari U7, HT2022 Fx1 U7).
6. När en vikt är en parameter: dela upp i fall efter om parametern är liten nog att komma med i det billigaste valet (HT2023 KS3 U7).

Fallgropar: uppgiften kan kräva en bestämd algoritm, Prims i stället för Kruskals, så läs vad som efterfrågas (HT2024 Fx2 U7); att ett uppspännande träd har en kant färre än antalet hörn avgör när man är klar (HT2020 Fx1 U7).

**Euler och Hamilton**

1. En graf är eulersk precis när alla hörn har jämnt gradtal; räkna gradtalen och kontrollera (HT2023 Tentamen januari U7, HT2024 Tentamen januari U7).
2. Visa att en graf är hamiltonsk genom att ange en konkret hamiltoncykel, t.ex. genom att gå yttervarvet (HT2024 Tentamen januari U7, HT2023 Tentamen januari U7).
3. Visa att ingen hamiltoncykel finns med ett motsägelsebevis: anta en cykel, följ de tvingade kanterna och visa att något hörn måste besökas två gånger eller missas (HT2020 Omtentamen april U7, HT2023 Tentamen januari U7).
4. När ett påstående ska motbevisas, ge en konkret graf som motexempel, ofta en komplett graf (HT2025 Tentamen U7).

Fallgropar: eulersk kräver att grafen är sammanhängande (HT2025 Fx2 U7); en graf kan vara både eulersk och hamiltonsk utan att bestå av precis en cykel (HT2025 Tentamen U7).

**Gradtal och handskakning**

1. Använd att summan av alla gradtal är lika med dubbla antalet kanter (HT2025 Fx1 U7, HT2023 Fx1 U7).
2. Därför måste gradtalssumman vara jämn; en talföljd med udda summa kan inte vara en gradtalssekvens (HT2025 Fx1 U7, HT2019 KS4 U7).
3. Antalet udda hörn måste vara jämnt, annars finns ingen graf eller pseudograf (HT2019 KS4 U7).
4. Lös ut antalet kanter ur gradtalssumman när alla gradtal är kända (HT2023 Fx1 U7).
5. En enkel graf har som mest lika många kanter som den kompletta grafen, dvs antalet par av hörn (HT2021 Omtentamen april U7).

Fallgropar: skilj på graf och pseudograf — en pseudograf tillåter dubbelkanter och öglor, så fler gradtalssekvenser är möjliga (HT2019 KS4 U7).

**Trädbevis**

1. Anta motsatsen av det som ska bevisas (HT2019 Fx1 U7).
2. Utnyttja att ett träd saknar cykler: följ en väg av hörn och notera att inget hörn får upprepas (HT2019 Fx1 U7, HT2025 Omtentamen april U7).
3. Eftersom grafen är ändlig måste en väg utan upprepade hörn sluta i ett löv, annars uppstår en cykel (HT2025 Omtentamen april U7, HT2019 Fx1 U7).
4. Motbevisa ett allmänt påstående med en liten konkret graf som motexempel (HT2020 Tentamen januari U7).

Fallgropar: fler hörn än kanter garanterar inte att grafen saknar cykler (HT2020 Tentamen januari U7).

**Isomorfi och delgraf**

1. För att visa isomorfi, namnge hörnen i båda graferna och ange en bijektion som bevarar kanterna (HT2024 Fx1 U7, HT2021 KS3 U7).
2. För att visa att två grafer inte är isomorfa, peka ut en egenskap som skiljer dem, t.ex. hur många hörn som har ett visst gradtal eller hur grannarna till de högradiga hörnen ser ut (HT2024 Fx1 U7).
3. För största gemensamma delgraf, ta bort så få kanter som möjligt ur båda graferna tills de blir isomorfa, och behåll alla hörn (HT2021 KS3 U7).
4. För en konstruktionsuppgift, utgå från en känd graf och ta bort kanter tills alla krav är uppfyllda (HT2021 Tentamen januari U7).

Fallgropar: lika gradtalssekvens räcker inte för isomorfi — två grafer kan ha samma gradtal men ändå vara olika (HT2025 Fx1 U7, HT2024 Fx1 U7).

### Formelsamlingen och kapitlet

Formelsamlingen har ett avsnitt "7 Grafteori". Under *Satser* skriver den ut Eulers sats (gradtalssumman lika med dubbla antalet kanter), Dijkstras algoritm, Prims algoritm och Kruskals algoritm. Rubriken *Definitioner* står tom.

Det uppgifterna och lösningarna behöver men som arket inte ger:

- Grundbegreppen definieras inte (rubriken Definitioner är tom): träd, löv, cykel, krets, sammanhängande, delgraf och isomorfi. Löv behövs i HT2019 Fx1 U7, delgraf och isomorfi i HT2021 KS3 U7.
- Vad en komplett graf $K_n$ och en komplett tvådelad graf $K_{3,2}$ är, och att $K_n$ har $\frac{n(n-1)}{2}$ kanter. Används i HT2021 Tentamen januari U7, HT2020 Fx1 U7 och HT2021 Omtentamen april U7.
- Att ett uppspännande träd har en kant färre än antalet hörn (kanter = hörn − 1). Avgör när man är klar i HT2020 KS4 U7 och HT2022 KS4 U7.
- Satsen att en (pseudo)graf är eulersk precis när alla hörn har jämnt gradtal. Arkets "Eulers sats" är gradtalssumman, inte detta kriterium. Används i HT2023 Tentamen januari U7 och HT2024 Tentamen januari U7.
- Vad eulersk och hamiltonsk betyder, och metoden att visa att ingen hamiltoncykel finns med ett motsägelsebevis. Används i HT2020 Omtentamen april U7 och HT2023 Tentamen januari U7.
- Att samma gradtalssekvens inte räcker för att två grafer ska vara isomorfa. Används i HT2024 Fx1 U7 och HT2025 Fx1 U7.

### Uppgifter som återkommer

- Dijkstras algoritm, billigaste vägen mellan två givna hörn med alla kandidatetiketter redovisade: HT2019 KS3 U7, HT2019 Hemtentamen april U7, HT2020 KS3 U7, HT2021 KS4 U7, HT2021 Fx2 U7, HT2022 KS3 U7, HT2022 Fx2 U7, HT2023 KS4 U7, HT2024 KS3 U7, HT2024 Omtentamen april U7, HT2025 KS2 U7
- Minsta uppspännande träd, ange vikten och redovisa delstegen: HT2020 KS4 U7, HT2021 Omtentamen september U7, HT2022 KS4 U7
- Minsta uppspännande träd där en eller flera kantvikter är parametrar: HT2020 Fx2 U7, HT2022 Fx1 U7, HT2022 Tentamen januari U7, HT2023 KS3 U7
- Avgör om en talföljd kan vara en gradtalssekvens med handskakningslemmat: HT2019 KS4 U7, HT2023 Fx1 U7, HT2025 Fx1 U7

### Mönsterlösningar

- **Kortaste väg**: HT2025 KS2 U7
- **Uppspännande träd**: HT2022 KS4 U7
- **Euler och Hamilton**: HT2023 Tentamen januari U7
- **Gradtal och handskakning**: HT2025 Fx1 U7
- **Trädbevis**: HT2025 Omtentamen april U7
- **Isomorfi och delgraf**: HT2024 Fx1 U7

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS3 U7 | Kortaste väg | Dijkstras algoritm: minimal väg från $A$ till $Z$, redovisa alla steg och alla kandidatetiketter, alla hörn ska ha etiketter, ange vägen och dess kostnad. Graf: 11 hörn ($A$–$Z$), 18 viktade kanter. | Väg $A \to B \to E \to F \to C \to H \to J \to Z$, kostnad 11 (avläses i $Z$:s etikett). Metod: Dijkstra steg för steg. |
| HT2019 KS4 U7 | Gradtal och handskakning | Fyra sekvenser $1, 2, 3 \qquad 1, 2, 3, 1 \qquad 1, 2, 3, 2, 1 \qquad 1, 1, 3, 2, 1.$ (a) Vilka två kan inte vara gradtalssekvenser till grafer/pseudografer och varför? (b) Rita trädet respektive pseudografen för de andra två. | (a) De två mittersta ($1,2,3,1$ och $1,2,3,2,1$) kan inte — udda antal udda tal (tre udda), och antalet udda hörn måste vara jämnt. (b) $1,2,3$ → pseudograf (dubbelkant); $1,1,3,2,1$ → träd. |
| HT2019 Tentamen januari U7 | Uppspännande träd | Finn alla minimala uppspännande träd och ange deras totala vikter; inga motiveringar men ange tydligt alla. Graf: 12 hörn ($a$–$l$), 15 viktade kanter. | 4 olika minimala uppspännande träd, var och en med vikt 32. Metod: tvingade kanter plus multiplikationsprincipen ($2 \cdot 2 = 4$ oberoende val). |
| HT2019 Fx1 U7 | Trädbevis | Bevisa att om ett träd har ett löv så måste det ha ett löv till. Ledning: antag motsatsen (bara ett löv), vad gäller då för övriga hörns gradtal? | Motsägelsebevis: ett enda löv ⇒ alla andra hörn har grad $\geq 2$ ⇒ en oändlig hörnföljd byggs i en ändlig graf ⇒ ett hörn upprepas ⇒ cykel, vilket ett träd inte får ha. |
| HT2019 Hemtentamen april U7 | Kortaste väg | Dijkstras algoritm: kortaste vägen från $A$ till $Z$, alla hörn ska förses med etiketter, alla kandidatetiketter och kostnaden ska redovisas. Graf: 12 hörn ($A$–$Z$), 22 viktade kanter. | Lösning saknas i underlaget. |
| HT2020 KS3 U7 | Kortaste väg | Dijkstras algoritm: billigaste vägen från $A$ till $Z$, alla hörn får etiketter, redovisa alla kandidatetiketter. Graf: 11 hörn ($A$–$Z$), 20 viktade kanter. | Väg $A - B - D - F - G - J - Z$, kostnad 15. Metod: Dijkstra i 10 steg. (Kanten $D$–$G$ är osäkert avläst men ingår inte i svaret.) |
| HT2020 KS4 U7 | Uppspännande träd | Finn ett minsta uppspännande träd och ange dess vikt. Graf: 11 hörn ($A$–$Z$), 20 viktade kanter (samma graf som KS3). | Minsta uppspännande träd med vikt 21. Metod: addera kanter i växande vikt utan att skapa cykler; trädet har $11 - 1 = 10$ kanter. |
| HT2020 Tentamen januari U7 | Trädbevis | För alla grafer gäller: om $G$ saknar cykel så är antalet hörn större än antalet kanter. Gäller omvändningen (fler hörn än kanter ⇒ ingen cykel)? Bevisa ditt påstående. | Nej. Motexempel: en 3-cykel plus ett isolerat hörn — 4 hörn, 3 kanter (fler hörn än kanter) men ändå en cykel. |

| HT2020 Fx1 U7 | Uppspännande träd | Låt $G = (V, E)$ vara den fullständiga grafen med $n$ hörn. Bestäm antalet kanter som ska tas bort för att få ett uppspännande träd. | Svar: $\frac{(n - 1)(n - 2)}{2}$. Metod: den fullständiga grafen har $\frac{n(n-1)}{2}$ kanter, ett uppspännande träd har $n - 1$ kanter; subtrahera. |
| HT2020 Omtentamen april U7 | Euler och Hamilton | Tre grafer; ange för varje om den har en hamiltoncykel (ange cykeln, annars motivera att ingen finns). Graf 1: 6 hörn ($A,B,C,a,b,c$), 9 kanter. Graf 2: 5 hörn ($A,B,C,D,E$), 6 kanter. Graf 3: 5 hörn ($x,a,b,c,y$), 6 kanter. | Graf 1: hamiltoncykel $AabcCBA$. Graf 2: ingen — de enda cyklerna genom $C$ ($CABC$, $CDEC$ m.fl.) täcker inte alla hörn. Graf 3: ingen — motsägelse: varje cykel genom $x$ tvingar ett hörn att missas. |
| HT2020 Fx2 U7 | Kortaste väg | Graf 6 hörn, 8 kanter med vikter $1, 2, 3, 4, x, y, z, w$ (positiva heltal). (a) Välj $x, y, z, w$ så att det finns fyra alternativa kortaste vägar $A$–$F$ med gemensam kostnad 10. (b) Ange ett minsta uppspännande träd och dess vikt för de värdena. | (a) $x = 4, y = 6, z = 9, w = 7$ — sätt de fyra cykelfria vägarnas summor lika med 10 och lös. (b) Minsta uppspännande träd $\{AB, BC, DE, EF, AD\}$, vikt 14. |
| HT2021 KS3 U7 | Isomorfi och delgraf | Två grafer med 10 hörn vardera ($a$–$j$ och $a'$–$j'$). Ange en graf $G$ som är delgraf av båda och så stor som möjligt (varje gemensam delgraf är delgraf av $G$). Detaljerat resonemang räcker, inget formellt bevis. | Behåll alla hörn och ta bort minsta antal kanter ur båda tills de blir isomorfa; isomorfin $\phi$ anges explicit hörn för hörn. Metod: största gemensamma delgraf genom kantborttagning. |
| HT2021 KS4 U7 | Kortaste väg | Dijkstras algoritm: billigaste vägen från $A$ till $Z$, ange alla etiketter och alla kandidatetiketter i varje delsteg. Graf: 13 hörn ($A$–$L$, $Z$), 21 viktade kanter. | Väg $A \to C \to D \to G \to J \to L \to Z$, kostnad 13. Anmärkning: flera etiketter kunde väljas samtidigt i stegen 2, 3 och 5. |
| HT2021 Tentamen januari U7 | Isomorfi och delgraf | Rita en graf som är (1) sammanhängande, (2) har en delgraf isomorf med $K_{3}$, (3) har en delgraf isomorf med $K_{3,2}$, (4) har max 5 hörn och max 8 kanter. Ange delgraferna för krav 2 och 3 med två skisser. | Utgå från $K_{5}$ (5 hörn, 10 kanter) och ta bort 2 kanter så att alla fyra kraven uppfylls. Metod: konstruktion genom kantborttagning, delgraferna utpekade i var sin skiss. |
| HT2021 Fx1 U7 | Gradtal och handskakning | En plan graf $G$ och dess duala graf $G'$ (ett nytt hörn i varje delyta, en korsande kant per kant i $G$). Visa att summan av gradtalen i $G'$ och summan av gradtalen i $G$ alltid är lika. | $G$ och $G'$ har lika antal kanter per konstruktion; Eulers sats ger att gradtalssumman är dubbla antalet kanter, så båda summorna är lika. |
| HT2021 Omtentamen april U7 | Gradtal och handskakning | Låt $G = (V, E)$ vara en graf. Visa att $2\vert E\vert \leq \vert V\vert^{2} - \vert V\vert$. Ledning: en graf har högst en kant mellan två hörn och inga öglor. | Den kompletta grafen $K_n$ har $n \cdot (n - 1)/2$ kanter, alltså $\binom{n}{2}$ — en övre gräns — vilket ger $2\vert E\vert \leq \vert V\vert \cdot (\vert V\vert - 1)$, det sökta. |

| HT2021 Fx2 U7 | Kortaste väg | (a) Dijkstras algoritm: kortaste vägen mellan $A$ och $Z$, redovisa samtliga steg och kandidatetiketter. (b) Finns mer än ett alternativ till kortaste väg? Ange i så fall ett. Graf: 12 hörn ($A$–$Z$), 16 viktade kanter. | (a) $A \to G \to H \to I \to J \to K \to Z$, kostnad 9. (b) Ja: $A \to B \to C \to D \to E \to F \to Z$, också kostnad 9. |
| HT2021 Omtentamen september U7 | Uppspännande träd | Finn ett minsta uppspännande träd och ange dess vikt (alla detaljer behövs inte). Graf: 10 hörn (triangulärt gallernät), 18 kanter där vikterna är talen 1–18. | Minsta uppspännande träd med total vikt $1 + 2 + 4 + 5 + 7 + 10 + 11 + 13 + 15 = 68$. Metod: välj kanter i växande vikt, hoppa över de som skapar cykel. |
| HT2022 KS3 U7 | Kortaste väg | Dijkstras algoritm: billigaste vägen mellan $A$ och $Z$, driv tills alla hörn får etiketter, redovisa alla kandidatetiketter och den slutliga kostnaden. Graf: 16 hörn ($A$–$Z$, 4×4-rutnät), 22 viktade kanter. | Väg $A \to B \to C \to G \to J \to N \to O \to Z$, vikt 13. |
| HT2022 KS4 U7 | Uppspännande träd | Finn ett minsta uppspännande träd, redovisa varje delsteg, ange trädets vikt. Graf: 16 hörn ($A$–$Z$, 4×4-rutnät), 22 viktade kanter (samma graf som KS3). | Minsta uppspännande träd med 15 kanter, vikt $1+1+1+1+1+2+2+2+2+2+3+3+3+3+5 = 32$. Metod: addera kanter i växande vikt och undvik cykler (Kruskals typ). |
| HT2022 Tentamen januari U7 | Uppspännande träd | Stege-graf, 8 hörn, 10 kanter; tre kanter har vikter $a, b, c \in \{1, 2, 3, 4, 5\}$. Finns värden så att grafen har två olika minsta uppspännande träd som samtidigt uppfyller $a > b > c$? Ange värdena, de två träden och vikten. | Ja: $a = 4$, $b = 3$ och $c = 1$. Det finns då två minsta uppspännande träd (en av två kvarvarande vikt-3-kanter läggs till), båda med vikt 13. Metod: testa sig fram. |
| HT2022 Fx1 U7 | Uppspännande träd | Kvadrat med sidorna märkta $1, 2, 3, 4$ och en diagonal märkt $x$. Finn funktionen $f : \{1, 2, 3, 4\} \to \mathbb{Z}$ där $f(x) = \text{antal minsta uppspännande träd i grafen ovan.}$ | $f(1) = 1$, $f(2) = 2$, $f(3) = 1$, $f(4) = 1$. Metod: Kruskals algoritm för varje värde på $x$. |
| HT2022 Fx2 U7 | Kortaste väg | Dijkstras algoritm från $A$: redovisa alla kandidatetiketter och valda etiketter i varje steg; ange kortaste vägen $A$–$Y$ och $A$–$X$ med kostnader. Graf: 10 hörn, 16 viktade kanter. | $A \to C \to E \to H \to Y$, kostnad 10; $A \to C \to E \to H \to Y \to X$, kostnad 12. |
| HT2023 KS3 U7 | Uppspännande träd | Två fyrkanter förbundna med en kant (vikt 4); 8 hörn, 9 kanter, två kantvikter $x, y$ (positiva heltal). Definiera $m(x, y)$ som vikten av ett minsta uppspännande träd. Finn $m$ och ange dess värdemängd. | Värdemängd $\{12, 13, 14, 15, 16\}$. Metod: kanten med vikt 4 är tvingad; varje sidocykel bidrar med 6 om parametern $\geq 3$, annars $3 +$ parametern. |

| HT2023 KS4 U7 | Kortaste väg | Dijkstras algoritm från $A$: driv tills alla hörn får etiketter, redovisa alla kandidatetiketter; ange en billigaste väg $A$–$Z$ och dess kostnad. Graf: 12 hörn ($A$–$K$, $Z$), 20 viktade kanter. | Väg $A \to B \to C \to D \to E \to G \to H \to Z$, kostnad 12. |
| HT2023 Tentamen januari U7 | Euler och Hamilton | Tre pseudografer $G_1$, $G_2$, $G_3$: en är både eulersk och hamiltonsk, en endast hamiltonsk, en endast eulersk. Fullständig motivering per graf. $G_1$: 6 hörn, 10 kanter; $G_2$: 5 hörn, 8 kanter; $G_3$: 5 hörn, 7 kanter (kanterna märkta $a, b, c\ldots$). | Gradtal $G_1 : 2, 2, 4, 4, 4, 4$ och $G_3 : 2, 2, 4, 4$ (tryckt så, men figurens fem hörn har gradtalen 2, 2, 2, 4, 4 — lösningen tappar en tvåa; alla är jämna) ⇒ eulerska; $G_2 : 2, 3, 3, 4, 4$ ⇒ ej eulersk. Hamiltoncykler $aeijfba$ ($G_1$), $aehfba$ ($G_2$); $G_3$ ej hamiltonsk (motsägelse). Alltså $G_1$ både, $G_2$ endast hamiltonsk, $G_3$ endast eulersk. |
| HT2023 Fx1 U7 | Gradtal och handskakning | En AI-genererad fråga: "graf med 7 hörn, alla med grad 3 — minsta antal kanter?" Vad är det matematiska problemet? Lös sedan: graf med 6 hörn, alla med grad 3 — minsta antal kanter? | Problemet: 7 hörn med grad 3 ger gradtalssumma $21$ (udda) $= 2\vert E\vert$ (jämnt), motsägelse mot Eulers sats. För 6 hörn blir summan 18, alltså $18/2 = 9$ kanter (minst 9). |
| HT2023 Omtentamen april U7 | Euler och Hamilton | Låt $G$ ha $n$ hörn och $m$ kanter. Visa att om graden av varje hörn är $(n - 1)$ så är $G$ hamiltonsk. Ledning: $\binom{n}{2} = \frac{n(n-1)}{2}$. | Eftersom varje hörn har grad $n - 1$ blir $2\vert E\vert$ lika med $n(n - 1)$, alltså $\vert E\vert = \frac{n(n-1)}{2} = \binom{n}{2}$ ⇒ en kant mellan varje par ⇒ $G$ är komplett ⇒ hörnen kan radas upp till en hamiltoncykel. |
| HT2023 Fx2 U7 | Kortaste väg | Graf 9 hörn ($A$–$H$, $Z$), 17 kanter; kanten $Z$–$H$ har vikt $w$ (positivt heltal). Ange ett $w$ så att grafen har precis två kortaste vägar $A$–$Z$; ange vägarna och deras kostnader, full motivering (Dijkstra). | $w = 1$. Vägar $A \to B \to E \to Z$ och $A \to C \to G \to H \to Z$, båda längd 7. Metod: Dijkstra avbryts och $w$ väljs så att $Z$ får två lika kandidatetiketter. |
| HT2024 KS3 U7 | Kortaste väg | Dijkstras algoritm: billigaste vägen från $A$ till $H$, redovisa samtliga kandidatetiketter i alla steg, ange vägens kostnad. Graf: 8 hörn ($A$–$H$), 12 viktade kanter. | Väg $A-B-E-G-D-F-H$, kostnad 16 (läses baklänges ur etiketterna). |
| HT2024 Tentamen januari U7 | Euler och Hamilton | Två grafer (en utvecklad tetraeder, en utvecklad kub). Är graferna eulerska och/eller hamiltonska? Motivera. Graf 1: 14 hörn ($a$–$n$), 19 kanter; Graf 2: 6 hörn ($o$–$t$), 9 kanter. | Graf 1: ej eulersk (udda hörn $l$ och $k$), hamiltonsk (cykel $abefjilnmkhgcd$). Graf 2: eulersk (alla hörn jämna), hamiltonsk (cykel $opqstr$). Metod: eulersk via jämna gradtal, hamiltonsk via "yttervarvet". |
| HT2024 Fx1 U7 | Isomorfi och delgraf | Två par grafer (A och B); 5 hörn vardera i par A, 8 hörn vardera i par B. I ett par är graferna isomorfa, i andra inte. Ange en isomorfi för det isomorfa paret; visa oberoende att det andra paret inte är isomorft. | Par A är isomorfa: bijektionen $\varphi(a_i) = b_i$ bevarar alla kanter. Par B är inte isomorfa: i vänstra grafen är inget hörn granne till båda grad-4-hörnen, i högra finns två sådana. |

| HT2024 Omtentamen april U7 | Kortaste väg | Dijkstras algoritm: kortaste vägen från $B$ till $L$, redovisa alla nödvändiga kandidatetiketter i varje steg och markera tydligt vilka som väljs. Graf: 12 hörn ($A$–$L$), 17 viktade kanter. | Väg $B-E-I-J-K-L$, värde 45 (läses baklänges ur etiketterna). |
| HT2024 Fx2 U7 | Uppspännande träd | Lägg till en kant med vikt 8 till grafen så att den blir eulersk (motivera eulerskheten); använd sedan Prims algoritm för att bestämma ett minimalt uppspännande träd. Graf: 11 hörn ($A$–$K$), 14 viktade kanter. | Lösning saknas i underlaget. |
| HT2025 KS2 U7 | Kortaste väg | Dijkstras algoritm: billigaste vägen från $A$ till $X$, ange i alla steg samtliga kandidatetiketter, alla hörn får etiketter, ange kostnaden. Graf: 13 hörn ($A$–$L$, $X$), 24 viktade kanter. | Väg $A \to D \to C \to F \to I \to J \to K \to X$, kostnad 20. Flera etiketter kunde väljas samtidigt i stegen 1, 5 och 7 (i steg 5 samtliga kandidater). |
| HT2025 Tentamen U7 | Euler och Hamilton | En graf "består av precis en cykel" $h_{1}k_{1}h_{2}k_{2} \ldots k_{n-1}h_{n}k_{n}h_{1}$. Påstående 1: en sådan graf är både hamiltonsk och eulersk (sant). Påstående 2: om en graf är både hamiltonsk och eulersk består den av precis en cykel (falskt). Bevisa 1 och ge ett motexempel till 2. | 1: cykeln besöker varje hörn och varje kant exakt en gång ⇒ den är både hamiltoncykel och eulercykel. 2: motexempel $K_{5}$ (eulersk, grad 4; hamiltonsk) som inte är en enda cykel. (Lösningen växlar inkonsekvent mellan $K_{5}$ och $K_{4}$.) |
| HT2025 Fx1 U7 | Gradtal och handskakning | (a) Ange två grafer med mer än 6 hörn med samma gradtalssekvens men ej isomorfa, motivera översiktligt. (b) Bevisa att summan av alla hörnens gradtal är jämn. (c) Kan $(4, 2, 2, 1, 1, 1)$ vara en gradtalssekvens? Varför/varför inte? | (a) Exempel ges (hänvisar till kapitel 7). (b) $\sum_{v \in V} deg(v)$ är lika med $2\vert E\vert$, alltså jämnt. (c) Nej: summan $4 + 2 + 2 + 1 + 1 + 1 = 11$ är udda. |
| HT2025 Omtentamen april U7 | Trädbevis | Bevisa att ett träd som har ett hörn av grad 3 har minst 3 löv (hörn av grad 1). | Hörnet $v$ med grad 3 ger tre vägar som inte skär varandra; var och en måste (ändlig graf utan cykler) sluta i ett löv, alltså finns minst 3 löv. |
| HT2025 Fx2 U7 | Euler och Hamilton | Kryss sant/falskt (alla rätt krävs för godkänt): (1) $G$ kan vara ett träd (>1 hörn) som saknar löv; (2) $G$ kan samtidigt vara eulersk och icke sammanhängande; (3) $G$ kan inte vara samtidigt eulersk och hamiltonsk; (4) summan av gradtalen kan bli vilket positivt heltal som helst. | Alla falska. (1) ett träd måste ha ett löv; (2) eulersk kräver sammanhängande; (3) $K_{3}$ är både eulersk och hamiltonsk; (4) gradtalssumman är alltid jämn. |

## Område 8 – Kombinatorik

**grundläggande område – KS2 (30/11) och tentan.** Uppgifter i underlaget: 39, från 39 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Urval och räkneprinciper | 9 | 9 | HT2020–HT2024 | 2 |
| Inklusion och exklusion | 7 | 7 | HT2019–HT2025 | 2 |
| Anagram och omordning | 6 | 6 | HT2019–HT2024 | 2 |
| Kulor i urnor och fördelning | 6 | 6 | HT2019–HT2024 | 1 |
| Binomialidentitet och bevis | 6 | 6 | HT2019–HT2025 | 1 |
| Binomialutveckling och konstantterm | 5 | 5 | HT2021–HT2025 | 2 |

- **Anagram och omordning** – räkna hur många ord eller följder man kan bilda av givna bokstäver eller symboler, ofta med upprepningar.
- **Kulor i urnor och fördelning** – fördela identiska eller olika objekt i urnor eller grupper, oftast med formeln för oordnat urval med återläggning.
- **Urval och räkneprinciper** – välj ut ett antal objekt och kombinera med multiplikations- och additionsprincipen, gärna med falluppdelning eller komplement.
- **Inklusion och exklusion** – räkna antal element i en union av mängder, eller visa att en given uppsättning mängdstorlekar är omöjlig.
- **Binomialutveckling och konstantterm** – utveckla ett uttryck med binomialsatsen och hitta konstanttermen eller en viss koefficient.
- **Binomialidentitet och bevis** – bevisa en summaformel med binomialtal, algebraiskt eller med ett kombinatoriskt resonemang.

### Vad uppgifterna ber om

Uppgift 8 hör alltid till Kombinatorik, men alla skrivningar har den inte: den finns i 39 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Fx1 7 av 7; Fx2 6 av 6; Hemtentamen 1 av 1; KS3 6 av 6; KS4 5 av 5; Omtentamen 6 av 6; Tentamen 7 av 7. Ibland: KS2 1 av 7. Aldrig: KS1 0 av 7; Komplettering 0 av 1. (Räknat ur matrisen.) Formen växlar mycket mellan sittningarna, mer än i något annat kapitel.

- Venndiagram får inte användas i en inlämnad lösning, även om de är tillåtna i privata anteckningar (HT2020 Fx1 U8, HT2023 Omtentamen april U8).
- En rå uppräkning räcker inte; du måste redovisa ett systematiskt resonemang som ger antalet (HT2020 KS3 U8).
- Flera uppgifter kräver uttryckligen fullständig motivering, inte bara ett svar (HT2023 Fx1 U8).
- En "visa att"-uppgift kräver ett riktigt bevis av hela likheten eller olikheten, inte en kontroll av ett enda fall (HT2019 KS4 U8, HT2021 Fx1 U8).
- När talen blir stora ber uppgiften om ett uttryck man kan knappa in på miniräknare, inte ett slutligt tal (HT2024 Tentamen januari U8, HT2024 Omtentamen april U8).
- Ibland ska svaret tvärtom inte innehålla binomialkoefficienter utan förenklas till ett taluttryck (HT2024 Fx1 U8).
- En konstanttermsuppgift vill ha ett motiverat ja eller nej: finns termen, och varför eller varför inte (HT2023 KS3 U8, HT2025 Fx2 U8).
- Några uppgifter ger en ledning som pekar ut metoden (bokstavsföljd av U och H, falluppdelning, val av a och b) och den ska följas (HT2020 Fx2 U8, HT2022 Fx2 U8).

**De senaste åren (HT2024–HT2025):** HT2024 hade omordning av bokstäver på KS3 (PULVER och KOFTA) och på Fx1 (ANANASSALLAD), en fördelningsuppgift på tentan (42 personer på tre båtar) och urvalsuppgifter på Omtentamen april och Fx2. HT2025, som ligger närmast den här terminen, gick över till inklusion och exklusion på både KS2 och tentan, och till binomialutveckling och binomialbevis på Fx-skrivningarna. På den här terminen examineras kombinatorik på KS2 den 30 november, och HT2025 KS2 var en inklusion–exklusionsuppgift.

### Så löser lösningsförslagen uppgifterna

**Anagram och omordning**

1. Räkna omordningarna som en process i steg: placera först den ena bokstavssorten, sedan nästa, och så vidare (HT2019 KS3 U8, HT2020 Tentamen januari U8).
2. För varje sort med flera lika bokstäver, välj deras platser med ett binomialtal; en ensam bokstav har så många platser som återstår (HT2019 KS3 U8).
3. Multiplicera stegen med multiplikationsprincipen till totala antalet omordningar (HT2019 KS3 U8, HT2024 KS3 U8).
4. Vid ett förbud (får inte börja med 0): räkna alla omordningar och dra bort de förbjudna (HT2020 Tentamen januari U8).
5. Vid "inga två lika intill varandra": ordna först de övriga bokstäverna, räkna luckorna mellan dem, och välj platser för de lika bokstäverna bland luckorna (HT2024 Fx1 U8).
6. När bokstäver först ska väljas och sedan ordnas: dela upp i fall efter hur många som tas från varje ord, välj med binomialtal, och multiplicera med antalet ordningar (HT2024 KS3 U8).

Fallgropar: en bokstav som förekommer flera gånger får inte räknas som om alla vore olika, då blir antalet för stort (HT2024 Fx2 U8); ett sexsiffrigt tal får inte börja med 0, så de fallen måste bort (HT2020 Tentamen januari U8).

**Kulor i urnor och fördelning**

1. Se fördelningen som en process i oberoende steg, ett steg per färg eller sort (HT2021 KS4 U8, HT2023 KS4 U8).
2. Antal sätt att lägga k identiska kulor i n urnor utan övre gräns är $\binom{n + k - 1}{k}$ (HT2019 Fx1 U8, HT2023 KS4 U8).
3. Vid villkoret minst en kula i varje urna: lägg först en i varje (ett sätt), och fördela sedan de kvarvarande fritt med samma formel (HT2021 Omtentamen september U8, HT2023 KS4 U8).
4. Multiplicera stegens antal med multiplikationsprincipen till totalsvaret (HT2021 KS4 U8, HT2023 KS4 U8).
5. När urnorna är få eller villkoren krångliga, räkna i stället upp fallen direkt och addera (HT2023 Fx1 U8, HT2019 Fx1 U8).
6. För att dela en mängd personer i grupper med storleksgräns: dela upp i fall efter gruppstorlekarna och välj delmängderna med binomialtal (HT2024 Tentamen januari U8).

Fallgropar: skilj på "urnorna är olika" och "bara antalen räknas" — samma fördelning kan ge olika svar (HT2024 Tentamen januari U8); formeln $\binom{n + k - 1}{k}$ gäller identiska kulor, inte olika (HT2023 KS4 U8).

**Urval och räkneprinciper**

1. Dela upp i de fall som uppfyller villkoret och addera fallen med additionsprincipen (HT2022 KS3 U8, HT2020 KS3 U8).
2. Inom ett fall, välj varje delmängd med ett binomialtal och multiplicera stegen med multiplikationsprincipen (HT2022 KS3 U8, HT2024 Omtentamen april U8).
3. Ett "välj k av n"-steg där ordning inte spelar roll ger $\binom{n}{k}$; spelar ordningen roll blir det i stället en produkt eller $n!$ (HT2022 Fx1 U8, HT2022 KS4 U8).
4. När det är lättare att räkna motsatsen: ta alla möjligheter och dra bort de förbjudna (HT2023 Fx2 U8).
5. Vid heltalslösningar till en ekvation: begränsa variablernas möjliga värden, dela upp i fall och räkna lösningarna i varje fall (HT2022 Tentamen januari U8).
6. Räkna ut varje binomialtal och fallsumma och addera till slut (HT2024 Omtentamen april U8, HT2022 KS3 U8).

Fallgropar: dubbelräkna inte — "två olikfärgade kulor" ska räknas som konkreta par, inte som tre färgpar (HT2023 Fx2 U8); kontrollera vilka fall som verkligen är möjliga innan du räknar (HT2022 KS3 U8).

**Inklusion och exklusion**

1. Inför en mängd för varje egenskap och skriv det sökta antalet som storleken av en union eller ett snitt (HT2019 Tentamen januari U8, HT2020 Omtentamen april U8).
2. Använd formeln $\vert A \cup B \vert = \vert A \vert + \vert B \vert - \vert A \cap B \vert$, eller tre-mängdsvarianten (HT2021 Tentamen januari U8, HT2020 Fx1 U8).
3. För "delbara med d i talen 1 till N": antalet är heltalsdivisionen av N med d, och snittet av två delbarheter svarar mot delbarhet med produkten när talen är relativt prima (HT2019 Tentamen januari U8, HT2025 KS2 U8).
4. Sätt in de kända storlekarna och lös ut den sökta (HT2020 Omtentamen april U8, HT2020 Fx1 U8).
5. För en omöjlighet: räkna fram alla storlekar ur villkoren, sätt in i formeln och visa att resultatet motsäger en given uppgift (HT2023 Omtentamen april U8).
6. För "minst ett av varje slag": ta totala antalet delmängder minus de som saknar ena slaget minus de som saknar andra, plus den som saknar båda (HT2025 Tentamen U8).

Fallgropar: Venndiagram får inte stå i den inlämnade lösningen, räkna med formeln i stället (HT2020 Fx1 U8, HT2023 Omtentamen april U8); glöm inte att lägga tillbaka snittet som annars dras bort två gånger (HT2025 Tentamen U8).

**Binomialutveckling och konstantterm**

1. Utveckla uttrycket med binomialsatsen och samla ihop x-potensen i en allmän term (HT2021 KS3 U8, HT2023 KS3 U8).
2. Skriv exponenten för x som ett uttryck i summationsindexet k (HT2023 KS3 U8, HT2025 Fx2 U8).
3. En konstantterm finns precis när den exponenten kan bli noll för ett heltal k i intervallet (HT2021 Fx2 U8, HT2025 Omtentamen april U8).
4. För en viss koefficient: lös exponentekvationen för k och sätt in det k-värdet i den allmänna termen (HT2023 KS3 U8).
5. Om exponentekvationen saknar heltalslösning finns ingen sådan term — säg det och motivera varför (HT2021 Fx2 U8, HT2025 Fx2 U8).

Fallgropar: k måste vara ett heltal mellan 0 och exponenten, annars är termen inte med (HT2023 KS3 U8); håll reda på tecken och tvåpotenser när koefficienten räknas ut (HT2021 KS3 U8).

**Binomialidentitet och bevis**

1. Utgå från binomialsatsen $(a + b)^{n} = \sum_{k=0}^{n} \binom{n}{k} a^{n-k} b^{k}$ och välj a och b som passar den sökta summan (HT2019 KS4 U8, HT2021 Omtentamen april U8).
2. För att dela en summa i udda och jämna termer, sätt a och b till 1 och −1 så att tecknen växlar (HT2021 Omtentamen april U8).
3. Använd den givna identiteten $\sum_{k=0}^{n} \binom{n}{k} = 2^{n}$ som känd utgångspunkt (HT2021 Omtentamen april U8, HT2022 Fx2 U8).
4. För en algebraisk identitet, arbeta med en ekvivalenskedja tills båda led är lika, och utnyttja att $\binom{n}{k}$ är $\frac{n!}{(n - k)!k!}$ (HT2022 Fx2 U8, HT2021 Fx1 U8).
5. För ett kombinatoriskt bevis, räkna samma mängd på två sätt: ett sätt som ger vänsterledet, ett som ger högerledet (HT2025 Fx1 U8).
6. För en olikhet, visa att följden av binomialtal växer genom att jämföra två grannar (HT2021 Fx1 U8).

Fallgropar: ett bevis får inte bara kontrollera ett exempel, hela likheten ska visas allmänt (HT2021 Fx1 U8); i en ekvivalenskedja måste varje steg gå att vända, annars är det inget bevis (HT2022 Fx2 U8).

### Formelsamlingen och kapitlet

Formelsamlingen har en egen sektion "8 Kombinatorik". Den skriver definitionerna av fakultet, permutationer $P(n, k)$, binomialtal och multinomialtal, formeln för inklusion och exklusion (två och tre mängder), en tabell för urval (ordnat/oordnat, med/utan återläggning), binomialsatsen och Pascals formel.

Det som uppgifterna och lösningarna behöver men bladet inte ger:

- Multiplikationsprincipen och additionsprincipen som namngivna regler: de bär nästan varje lösning men står inte på bladet (HT2019 KS3 U8, HT2020 KS3 U8).
- Komplementgreppet, att räkna alla möjligheter och dra bort de förbjudna: används ofta men nämns inte (HT2020 Tentamen januari U8, HT2025 Tentamen U8).
- Greppet "lägg först en i varje urna, fördela sedan resten" vid villkoret minst en i varje: bladet ger formeln men inte knepet (HT2021 Omtentamen september U8, HT2023 KS4 U8).
- Luckmetoden för "inga två lika intill varandra": ordna de övriga först och välj platser bland luckorna (HT2024 Fx1 U8).
- Att antalet multiplar av d i talen 1 till N fås med heltalsdivision av N med d: inte utskrivet, fast det är kärnan i delbarhetsuppgifterna (HT2019 Tentamen januari U8, HT2025 KS2 U8).
- Falluppdelning som bevis- och räknemetod: en standardmetod som bladet inte kan ge (HT2020 KS3 U8, HT2022 Tentamen januari U8).
- Identiteten $\sum_{k=0}^{n} \binom{n}{k} = 2^{n}$: följer ur binomialsatsen men står inte med; den ges ibland i uppgiftstexten (HT2022 Fx2 U8, HT2023 Tentamen januari U8).

### Uppgifter som återkommer

- Bilda ord eller följder av bokstäverna i ett givet ord, med upprepade bokstäver: HT2019 KS3 U8, HT2019 Hemtentamen april U8, HT2024 KS3 U8, HT2024 Fx1 U8
- Finns en konstantterm i binomialutvecklingen av ett uttryck (och vad är en viss koefficient): HT2021 KS3 U8, HT2021 Fx2 U8, HT2023 KS3 U8, HT2025 Omtentamen april U8, HT2025 Fx2 U8
- Hur många tal i talen 1 till N är delbara med a eller b, eller relativt prima med N: HT2019 Tentamen januari U8, HT2021 Tentamen januari U8, HT2025 KS2 U8
- Placera identiska kulor i urnor med minst en i varje urna: HT2021 Omtentamen september U8, HT2023 KS4 U8
- Bevisa en summaformel med binomialtal genom att välja a och b i binomialsatsen: HT2019 KS4 U8, HT2021 Omtentamen april U8, HT2023 Tentamen januari U8

### Mönsterlösningar

- **Anagram och omordning**: HT2024 KS3 U8
- **Kulor i urnor och fördelning**: HT2023 KS4 U8
- **Urval och räkneprinciper**: HT2024 Omtentamen april U8
- **Inklusion och exklusion**: HT2025 Tentamen U8
- **Binomialutveckling och konstantterm**: HT2025 Fx2 U8
- **Binomialidentitet och bevis**: HT2025 Fx1 U8

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS3 U8 | Anagram och omordning | Ordet STÅNGISEN: hur många sinsemellan olika bokstavsföljder kan bildas med bokstäverna i ordet? (Nio bokstäver, S och N förekommer två gånger.) | Svar: $9 \cdot 8 \cdot 7 \cdot 6 \cdot 5 \cdot 3 \cdot 2$. Process i 7 steg: placera de två S med $\binom{9}{2}$, de två N med $\binom{7}{2}$, sedan T, Å, G, I, E en i taget; multiplikationsprincipen ger produkten. |
| HT2019 KS4 U8 | Binomialidentitet och bevis | Visa att för alla $n = 1, 2, \ldots$ gäller $\sum_{k=0}^{n} \left(\frac{2}{3}\right)^{k} \cdot \binom{n}{k} = \left(\frac{5}{3}\right)^{n}$. | Gäller. Skriv summan som $\sum_{k=0}^{n} \binom{n}{k} \cdot \left(\frac{2}{3}\right)^{k} \cdot 1^{n-k}$, som enligt binomialsatsen är utvecklingen av $\left(\frac{2}{3} + 1\right)^{n}$, som är precis $\left(\frac{5}{3}\right)^{n}$. |
| HT2019 Tentamen januari U8 | Inklusion och exklusion | Använd principen om inklusion och exklusion för att finna antal tal i $\{1, 2, \ldots, 10000\}$ som är delbara med 3 eller 10 (eller bådadera). | Svar: 4000. $\vert A \vert = 3333$ multiplar av 3, $\vert B \vert = 1000$ multiplar av 10 (heltalsdivision), snittet $\vert A \cap B \vert = 333$ multiplar av 30; $3333 + 1000 - 333 = 4000$. |
| HT2019 Fx1 U8 | Kulor i urnor och fördelning | Tre kulor (en röd, två blåa) placeras i tre urnor $U_{1}$, $U_{2}$, $U_{3}$; kulor med samma färg skiljs inte åt och valfritt antal får ligga i varje urna. På hur många sätt? | Svar: 18. Två steg: de två blåa på $\binom{4}{2} = \frac{4 \cdot 3}{2 \cdot 1} = 6$ sätt, den röda på 3 sätt; multiplikationsprincipen ger $6 \cdot 3 = 18$. |
| HT2019 Hemtentamen april U8 | Anagram och omordning | Ordet KOMBINATORIK: på hur många olika sätt kan vi omordna bokstäverna i ordet och bilda olika ord? (Så kallade anagram.) | Lösning saknas i underlaget. |
| HT2020 KS3 U8 | Urval och räkneprinciper | Hur många representationer av ickenegativa heltal med fyra eller färre siffror finns där minst en siffra är 0 och representationen bara innehåller siffrorna 0, 1, 2 eller 3? (Rå uppräkning räcker inte, systematiskt resonemang krävs.) | Svar: 136. Falluppdelning efter antal siffror (1, 2, 3, 4); i varje fall räknas alla minus de utan nolla, t.ex. 3 siffror ger $48 - 27 = 21$ och 4 siffror $192 - 81 = 111$; additionsprincipen ger $1 + 3 + 21 + 111 = 136$. |
| HT2020 KS4 U8 | Urval och räkneprinciper | 5 studenter ska arbeta med problem $A$ och $B$; precis 4 ska arbeta med $A$ och precis 3 med $B$. En student får ta båda problemen eller inget. Hur många arbetsfördelningar finns? | Svar: 50. Välj den enda som inte arbetar med $A$ (5 sätt) och de två som inte arbetar med $B$ ($\binom{5}{2} = 10$ sätt); multiplikationsprincipen ger $5 \cdot 10 = 50$. |
| HT2020 Tentamen januari U8 | Anagram och omordning | Hur många sexsiffriga tal kan bildas med siffrorna 0, 0, 1, 1, 2 och 2? (Ett sexsiffrigt tal kan inte starta med 0.) | Svar: 60. Räkna $M - N$: alla omordningar $M = 15 \cdot 6 \cdot 1 = 90$ (nollor $\binom{6}{2} = 15$, ettor $\binom{4}{2} = 6$, tvåor $\binom{2}{2} = 1$), de som börjar med 0 är $N = 1 \cdot 5 \cdot 6 \cdot 1 = 30$; svaret $90 - 30 = 60$. |

| HT2020 Fx1 U8 | Inklusion och exklusion | Mängderna $A, B, C$ har samma antal element, $\vert A \cup B \cup C \vert = 6$, $\vert A \cap B \vert = \vert B \cap C \vert = \vert A \cap C \vert = 1$ och inget element ligger i alla tre. Beräkna antalet element i $A$. (Venndiagram får inte användas.) | Svar: $\vert A \vert = 3$. Inklusion–exklusion för tre mängder med $\vert A \vert = \vert B \vert = \vert C \vert$ ger $6 = 3\vert A \vert - 3$, alltså $\vert A \vert = 3$. |
| HT2020 Omtentamen april U8 | Inklusion och exklusion | 12 bilar har egenskaperna gammal, röd, elbil. Ingen bil är både elbil och gammal. 5 är gamla, 5 röda, 5 elbilar, och det finns bara en röd elbil. Hur många gamla röda bilar finns det? | Svar: 2. Med $\vert G \vert = \vert R \vert = \vert E \vert = 5$, $\vert E \cap R \vert = 1$, $\vert G \cap E \vert = \vert G \cap R \cap E \vert = 0$ och $\vert G \cup R \cup E \vert = 12$ ger inklusion–exklusion $\vert G \cap R \vert = 2$. |
| HT2020 Fx2 U8 | Anagram och omordning | Rutnät $4 \times 4$: gå från nedre vänstra till övre högra rutan med bara steg upp eller till höger. (a) Antal olika sekvenser. (b) Generalisera till ett rutnät $n \times m$. Ledning: se sekvensen som en bokstavsföljd $UUHHUH\ldots$. | Svar: (a) $\binom{6}{3} = \frac{6 \cdot 5 \cdot 4}{3 \cdot 2 \cdot 1} = 20$ — en väg är 6 symboler, 3 H och 3 U, och man väljer de 3 platserna för U. (b) $\binom{m + n - 2}{n - 1}$, där $n - 1$ platser för H väljs av $m - 1 + n - 1$. |
| HT2021 KS3 U8 | Binomialutveckling och konstantterm | Betrakta $16 \left( x^{2} - \frac{1}{2x^{3}} \right)^{n}$. Ange ett heltal $n > 0$ för vilket konstanttermen i uttrycket är ett heltal skilt från noll. | Svar: $n = 5$. Binomialsatsen ger en term med $x^{5k - 3n}$; konstantterm kräver $5k = 3n$, så $n$ delbart med 5. Med $n = 5$, $k = 3$ blir konstanttermen $\binom{5}{3} \cdot 2^{4+3-5}$ ett heltal skilt från noll (lösningen beräknar det till 40). |
| HT2021 KS4 U8 | Kulor i urnor och fördelning | Tre urnor; placera en gul kula, tre identiska blå och tre identiska röda kulor. Regler: (1) den gula får läggas var som helst; (2) ingen urna får innehålla både blåa och röda kulor. Beräkna antalet sätt. | Svar: 540. Lösningsförslaget räknar i stället med tre gula kulor: de gula på $\binom{5}{2}$ sätt (i lösningen angivet 30) och de blå/röda via inklusion–exklusion $12 + 12 - 6 = 18$, så $30 \cdot 18 = 540$. Uppgifts- och lösningstext är oense om antalet gula kulor. |
| HT2021 Tentamen januari U8 | Inklusion och exklusion | Låt $\Omega = \{1, 2, 3, \dots, 1000\}$. Beräkna antalet element i $M = \{x \in \Omega : \gcd(x, 999) = 1\}$. | Svar: 649. Primfaktorisera $999 = 3^{3} \cdot 37$; $M = \Omega - (D_{3} \cup D_{37})$. Inklusion–exklusion ger $333 + 27 - 9 = 351$ (heltalsdivision), så $1000 - 351 = 649$. |
| HT2021 Fx1 U8 | Binomialidentitet och bevis | Låt $n > 0$ vara ett heltal. Visa algebraiskt (inte med kombinatoriskt resonemang) att för alla heltal $0 \leq k < n$ gäller $\binom{2n}{k} < \binom{2n}{n}$. Ledning: visa $\binom{2n}{k} < \binom{2n}{k + 1}$. | Gäller. Ekvivalenskedja: $\binom{2n}{k} < \binom{2n}{k + 1}$, som leder till $\frac{k + 1}{2n - k} < 1$, dvs $k < n$. Alltså växer $\binom{2n}{k}$ så länge $k < n$, så $\binom{2n}{k} < \binom{2n}{n}$. |
| HT2021 Omtentamen april U8 | Binomialidentitet och bevis | Låt $n > 0$ vara ett heltal. Visa att $\sum_{0 \leq k \leq n,\ k\ \text{udda}} \binom{n}{k} = \sum_{0 \leq k \leq n,\ k\ \text{jämnt}} \binom{n}{k} = 2^{n-1}$. Ledning: binomialutvecklingen av $(a + b)^{n}$ med lämpliga $a, b$. | Gäller. Sätt $a = 1$, $b = -1$: då är $(1 - 1)^{n}$ noll, och binomialutvecklingen $\sum_{k=0}^{n} \binom{n}{k} 1^{n-k} (-1)^{k}$ delas i jämna och udda $k$, så de två summorna är lika. Eftersom de tillsammans är $2^{n}$ blir var och en $2^{n-1}$. |

| HT2021 Fx2 U8 | Binomialutveckling och konstantterm | Låt $p$ vara ett primtal $> 2$. För vilka värden på det positiva heltalet $a$ saknar binomialutvecklingen av $\left(x^{a} + \frac{1}{x^{a}}\right)^{p}$ konstantterm? | Svar: för alla $a$. Binomialsatsen ger termer $x^{a(p - 2k)}$; konstantterm kräver $a(p - 2k) = 0$, dvs $p = 2k$, vilket är omöjligt eftersom $p$ är udda. Alltså saknas konstantterm för varje positivt heltal $a$. |
| HT2021 Omtentamen september U8 | Kulor i urnor och fördelning | Sju sorters kakor serveras; man äter precis 10 kakor och vill ha minst en av alla sju sorter. Ordningen spelar ingen roll. På hur många sätt? | Svar: 84. Modellera som 10 identiska kulor i 7 urnor med minst en per urna: lägg först en i varje (1 sätt), fördela sedan de $k = 3$ kvar i $n = 7$ urnor på $\binom{3 + 7 - 1}{3} = \binom{9}{3}$ sätt, vilket är 84. |
| HT2022 KS3 U8 | Urval och räkneprinciper | En samling med 5 män och 4 kvinnor. På hur många sätt kan man välja en styrelse av 5 personer där antalet kvinnor är större än antalet män? | Svar: 45. Fler kvinnor än män ger två fall: 3 kvinnor + 2 män eller 4 kvinnor + 1 man (5 kvinnor går inte, bara 4 finns). $\binom{4}{3} \cdot \binom{5}{2}$ ger 40 och $\binom{4}{4} \cdot \binom{5}{1} = 1 \cdot 5 = 5$; additionsprincipen ger $40 + 5 = 45$. |
| HT2022 KS4 U8 | Urval och räkneprinciper | På hur många sätt kan fyra olika sexsidiga tärningar kastas så att utfallet blir en stege, dvs något av $1, 2, 3, 4$, $2, 3, 4, 5$ eller $3, 4, 5, 6$? (Tärningarna är olika, så vilken tärning som ger vilket värde räknas.) | Svar: 72. Tre sorters stege, var och en är en omordning av fyra olika värden på fyra olika tärningar, $4! = 24$; multiplikationsprincipen ger $3 \cdot 24 = 72$. |
| HT2022 Tentamen januari U8 | Urval och räkneprinciper | Visa att $\vert\{(x_{1}, x_{2}, x_{3}) : 4x_{1} + 4x_{2} + 11x_{3} = 27, x_{1} \geq 0, x_{1} \in \mathbb{Z}, x_{2} \geq 0, x_{2} \in \mathbb{Z}, x_{3} \geq 0, x_{3} \in \mathbb{Z}\}\vert = 5$. | Gäller. $11x_{3} \leq 27$ ger $0 \leq x_{3} \leq 2$; $x_{3} = 0$ och $x_{3} = 2$ ger ingen lösning (27 och 5 ej delbara med 4). $x_{3} = 1$ ger $x_{1} + x_{2} = 4$ med 5 lösningar $\{(0, 4, 1), (1, 3, 1), (2, 2, 1), (3, 1, 1), (4, 0, 1)\}$. |
| HT2022 Fx1 U8 | Urval och räkneprinciper | Ett kombinationslås har en fyrsiffrig kod där ingen siffra förekommer två gånger. Hur många sådana koder finns som säkert innehåller siffrorna 1 och 9? | Svar: $4 \cdot 7 \cdot 4!$. Steg 1: välj de två övriga siffrorna ur $\{0, 2, 3, 4, 5, 6, 7, 8\}$ på $\binom{8}{2} = 8 \cdot 7/2$ sätt. Steg 2: ordna de fyra siffrorna på $4!$ sätt. Multiplikationsprincipen ger $4 \cdot 7 \cdot 4!$. |
| HT2022 Fx2 U8 | Binomialidentitet och bevis | Med $\sum_{k=0}^{n} \binom{n}{k} = 2^{n}$ given, visa att $\sum_{k=0}^{n} \frac{1}{k + 1} \binom{n}{k} = \frac{2^{n+1} - 1}{n + 1}$. Ledning: $n - k = (n+1) - (k+1)$. | Gäller. Ekvivalenskedja: förläng med $(n + 1)$ så att varje term blir $\binom{n + 1}{k + 1}$; med index $j = k + 1$ blir summan $\sum_{j=1}^{n+1} \binom{n+1}{j} = 2^{n+1} - 1$, sant eftersom $\sum_{j=0}^{n+1}\binom{n+1}{j} = 2^{n+1}$. |
| HT2023 KS3 U8 | Binomialutveckling och konstantterm | Studera binomialutvecklingen av $\left(\frac{x^{2}}{2} + \frac{2}{x^{3}}\right)^{17}$. (a) Finns någon konstantterm som inte är noll? Varför varför inte? (b) Räkna ut koefficienten framför $x^{9}$ (får anges med binomialkoefficienter). | Svar: (a) Nej — termerna har exponent $5k - 51$, och $5k - 51 = 0$ ger $k = 51/5$ som inte är heltal. (b) $5k - 51 = 9$ ger $k = 12$, så koefficienten är $\binom{17}{12} \cdot 2^{17-24} = \frac{1}{128} \binom{17}{12}$. |

| HT2023 KS4 U8 | Kulor i urnor och fördelning | Tre urnor, 6 identiska blå och 3 identiska gula kulor; valfritt antal per urna. På hur många sätt kan alla 9 kulor fördelas om varje urna ska ha minst en blå kula? | Svar: 100. Steg 1: en blå i varje urna (1 sätt). Steg 2: de 3 kvarvarande blå i 3 urnor på $\binom{3 + 3 - 1}{3} = \binom{5}{3}$ sätt, dvs 10. Steg 3: de 3 gula på lika många, $\binom{5}{3}$, sätt. Multiplikationsprincipen ger $1 \cdot 10 \cdot 10 = 100$. |
| HT2023 Tentamen januari U8 | Binomialidentitet och bevis | Binomialsatsen och $\sum_{k=0}^{n} \binom{n}{k}$ (som är $2^{n}$) ges. Generalisera och beräkna summan av alla koefficienter framför $x^{k}y^{n-k}$-termerna i utvecklingen av $(ax + by)^{n}$. | Svar: $(a + b)^{n}$. Binomialsatsen ger utvecklingen $\sum_{k=0}^{n} \binom{n}{k} a^{k}b^{n-k}x^{k}y^{n-k}$, så koefficientsumman $\sum_{k=0}^{n} \binom{n}{k} a^{k}b^{n-k}$ är utvecklingen av $(a + b)^{n}$ (blir $2^{n}$ då $a = b = 1$). |
| HT2023 Fx1 U8 | Kulor i urnor och fördelning | Två urnor $U_{1}, U_{2}$, tre likadana vita och två likadana svarta kulor. Steg 1: kasta bort två slumpmässiga kulor. Steg 2: lägg de återstående tre i urnorna utan krav. På hur många sätt kan processen sluta? Fullständig motivering krävs. | Svar: 16. Steg 1 ger tre fall för de kvarvarande: två svarta + en vit, två vita + en svart, eller tre vita. Fallet tre vita ger 4 fördelningar, de två tvåfärgade fallen 6 vardera; additionsprincipen ger $6 + 6 + 4 = 16$. |
| HT2023 Omtentamen april U8 | Inklusion och exklusion | 45 sportintresserade personer, tre sporter $A, B, C$. Visa att detta är omöjligt: (1) för varje sport är antalet som bara gillar just den 10; (2) för varje par är antalet som bara gillar de två 5; (3) antalet som gillar alla tre är 5. (Venndiagram ej i lösningen.) | Omöjligt. Partition ger $10 + 5 + 5 + 5 = 25$, så $\vert A \vert = \vert B \vert = \vert C \vert = 25$, parvisa snitt 10 och trippelsnittet 5. Inklusion–exklusion ger $25 + 25 + 25 - 10 - 10 - 10 + 5 = 50$, mot givna $\vert A \cup B \cup C \vert = 45$, en motsägelse. |
| HT2023 Fx2 U8 | Urval och räkneprinciper | En urna med 5 blå, 4 gula och 3 röda kulor. På hur många sätt kan man välja två olikfärgade kulor (utan återläggning)? Alla kulor ses som olika, så svaret "3 sätt" är fel. | Svar: 47. Komplement: alla par minus de enfärgade, $\binom{12}{2} - \binom{5}{2} - \binom{4}{2} - \binom{3}{2}$, vilket är $66 - 10 - 6 - 3 = 47$. (Lösningen skriver på ett ställe $\binom{4}{3}$ men räknar med $\binom{4}{2}$.) |
| HT2024 KS3 U8 | Anagram och omordning | På hur många sätt kan man bilda ett ord med precis fyra bokstäver av bokstäverna i PULVER och KOFTA, om minst en bokstav från varje ord måste ingå? (Ord i matematisk mening, ABC och ACB är olika.) | Svar: 7440. Tre fall efter fördelning (1+3, 2+2, 3+1): $\binom{6}{1} \cdot \binom{5}{3}$, $\binom{6}{2} \cdot \binom{5}{2}$ och $\binom{6}{3} \cdot \binom{5}{1}$ ger $60 + 150 + 100 = 310$ val av bokstäver; varje val ger fyra olika bokstäver, $4! = 24$ ord; $310 \cdot 24 = 7440$. |
| HT2024 Tentamen januari U8 | Kulor i urnor och fördelning | 42 personer fördelas på tre båtar som rymmer högst 15 var. (a) Personer är unika men vilken båt spelar ingen roll (bara vilka som åker ihop). (b) Båtarna är olika men bara antalet per båt räknas. På hur många sätt? Svar får anges som uttryck. | Svar: (a) $\binom{42}{15} \cdot \binom{27}{15} + \binom{42}{15} \cdot \binom{27}{14} + \binom{42}{14} \cdot \binom{28}{14}$, summa över storleksfallen 15, 15, 12 / 15, 14, 13 / 14, 14, 14. (b) $3 + 6 + 1 = 10$, antal sätt att ge storleksmönstren till olika båtar. |
| HT2024 Fx1 U8 | Anagram och omordning | Hur många ord kan bildas av bokstäverna i ANANASSALLAD om inga två A får stå bredvid varandra? (5 A, 2 N, 2 S, 2 L, 1 D.) Svar som taluttryck, inte med binomialkoefficienter. | Svar: 35280. Ordna först de icke-A-bokstäverna: $\frac{(2 + 2 + 2 + 1)!}{2!2!2!1!} = \frac{7!}{8} = 7 \cdot 6 \cdot 5 \cdot 3 = 630$ sätt. Det ger 8 luckor för de 5 A, valda på $\binom{8}{5} = \frac{8!}{5!3!} = \frac{8 \cdot 7 \cdot 6}{3 \cdot 2} = 8 \cdot 7 = 56$ sätt. Multiplikationsprincipen ger $630 \cdot 56 = 35\,280$. |

| HT2024 Omtentamen april U8 | Urval och räkneprinciper | Tre organisationer $A$ (4 personer), $B$ (7), $C$ (7) slås ihop till $D$ vars ledning har 11 personer valda ur de gamla ledningarna, med minst 3 från varje organisation. På hur många sätt kan ledningen väljas? | Svar: 13230. Möjliga $(a, b, c)$ med $3 \leq a \leq 4$, $3 \leq b \leq 7$, $3 \leq c \leq 7$, $a + b + c = 11$: $(4, 4, 3)$, $(4, 3, 4)$, $(3, 4, 4)$, $(3, 5, 3)$, $(3, 3, 5)$. Binomialtal per fall ger $1225 + 1225 + 4900 + 2940 + 2940 = 13230$. |
| HT2024 Fx2 U8 | Urval och räkneprinciper | Ordet MATEMATIK har 9 bokstäver (6 olika, varav 3 dubletter: 2M, 2A, 2T, 1E, 1I, 1K). På hur många olika oordnade sätt kan man välja ut 5 av de 9 bokstäverna? | Svar: 48. Tre fall: alla fem olika (välj bort en av 6) ger 6; en dublett + tre olika ger $\binom{5}{3} = \frac{5!}{3!2!} = 10$ och $3 \cdot 10 = 30$; två dubletter + en ger $3 \cdot 4 = 12$. Additionsprincipen ger $6 + 30 + 12 = 48$. |
| HT2025 KS2 U8 | Inklusion och exklusion | Hur många av de jämna heltalen mellan 1 och 10000 är delbara med 3 eller 5? (10000 ingår.) | Svar: 2333. De jämna talen är $\{2 \cdot k : k = 1, 2, \ldots, 5000\}$, delbara med 3 eller 5 precis när $k$ är det. I $\{1, 2, \ldots, 5000\}$: $\vert A \vert = 5000/3 = 1666$, $\vert B \vert = 5000/5 = 1000$, $\vert A \cap B \vert = 5000/15 = 333$; $\vert A \cup B \vert = 1666 + 1000 - 333 = 2333$. |
| HT2025 Tentamen U8 | Inklusion och exklusion | Hur många delmängder av $A = \{1, 2, \ldots, 10\}$ innehåller minst ett udda tal och minst ett jämnt tal? | Svar: 961. Totalt $2^{10} = 1024$ delmängder; de utan udda tal är $2^{5} = 32$, de utan jämnt tal $2^{5} = 32$, den utan båda (tomma mängden) 1. Inklusion–exklusion: $1024 - 32 - 32 + 1 = 961$. |
| HT2025 Fx1 U8 | Binomialidentitet och bevis | Visa formeln $\sum_{k=0}^{n} \binom{n}{k} \binom{n}{n - k} = \binom{2n}{n}$. Ledning: antal sätt att välja $n$ element ur $2n$, delat i två mängder med $n$ vardera. | Gäller. Kombinatoriskt bevis: $\binom{2n}{n}$ är antalet sätt att välja $n$ element ur en mängd med $2n$. Dela mängden i $E$ och $F$ med $n$ vardera; välj $k$ ur $E$ och $n - k$ ur $F$ på $\binom{n}{k}\binom{n}{n - k}$ sätt och summera över $k = 0, 1, \ldots, n$. |
| HT2025 Omtentamen april U8 | Binomialutveckling och konstantterm | Låt $m$ vara ett positivt heltal och $f(x) = \left( x + \frac{1}{x^{2}} \right)^{2m}$. Visa att om binomialutvecklingen innehåller en konstant term så finns ett primtal $p$ med $p \mid m$, och ange primtalet. | Svar: primtalet är 3. Binomialsatsen ger termer $x^{2m - 3k}$; en konstant term kräver att exponenten $2m - 3k$ blir noll, vilket enligt lösningen bara kan ske om $m$ är delbart med 3. Det sökta primtalet är alltså 3. |
| HT2025 Fx2 U8 | Binomialutveckling och konstantterm | Betrakta $\left(x^{2} - \frac{1}{\sqrt{x}}\right)^{12}$. (a) Finns någon konstant term? (b) Finns någon term av typen $C\sqrt{x}$? Motivera fullständigt. | Svar: (a) Nej — termerna har exponent $24 - 5k/2$, och $24 - 5k/2 = 0$ ger $k = 48/5$ som inte är heltal. (b) Nej — $24 - 5k/2 = 1/2$ ger $k = 47/5$ som inte heller är heltal. |

## Område 5 – Relationer

**avancerat område – bara tentan, sätter betyget.** Uppgifter i underlaget: 36, från 33 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Egenskapsutredning | 19 | 19 | HT2019–HT2025 | 2 |
| Ekvivalensbevis | 5 | 5 | HT2020–HT2024 | 1 |
| Allmänt resonemang | 5 | 5 | HT2019–HT2024 | 2 |
| Ekvivalensklasser | 4 | 4 | HT2021–HT2022 | 0 |
| Partiell ordning | 2 | 2 | HT2023–HT2025 | 1 |
| Relation som funktion | 1 | 1 | HT2020–HT2020 | 0 |

- **Egenskapsutredning** – utred vilka av reflexivitet, symmetri, antisymmetri och transitivitet en given relation har, med bevis eller motexempel.
- **Ekvivalensbevis** – visa att en relation är en ekvivalensrelation, alltså reflexiv, symmetrisk och transitiv.
- **Ekvivalensklasser** – ta fram och beskriv ekvivalensklasserna till en ekvivalensrelation.
- **Partiell ordning** – avgör och bevisa om en relation är en partiell ordningsrelation.
- **Relation som funktion** – avgör vilka relationer som också kan uppfattas som funktioner och ange definitionsmängden.
- **Allmänt resonemang** – bevisa eller konstruera utifrån relationers egenskaper i allmänhet, utan konkreta tal.

### Vad uppgifterna ber om

Uppgiften heter alltid "Relationer" och är uppgift 5 på sittningen. En relation $\mathcal{R}$ definieras på en mängd (oftast $\mathbb{Z}$, en restklassmängd, $\mathbb{R}^{2}$, matriser eller linjer) och du ska utreda den.

- Vanligaste frågan: utred vilka av egenskaperna reflexivitet, symmetri, antisymmetri och transitivitet relationen har (HT2019 KS2 U5).
- Kravet på ett fullständigt svar: har relationen egenskapen ska du bevisa det, saknar den egenskapen ska du bevisa det med motexempel (HT2019 KS2 U5).
- Ibland ska du i stället visa att relationen är en ekvivalensrelation (HT2020 KS1 U5), eller bevisa att den inte är det (HT2021 Fx1 U5).
- Ibland ska du dessutom ta fram ekvivalensklasserna (HT2021 KS4 U5a); för klasser i planet krävs en skiss för godkänt (HT2021 KS2 U5).
- Skriv fullständiga utsagor och blanda inte ihop utsagor med tal: skriv inte $x \cdot y \Leftrightarrow \ldots$ eftersom $x \cdot y$ är ett tal (HT2019 KS4 U5).
- Motexempel måste redovisas med uträkning, annars underkänt (HT2024 Omtentamen april U5); räkningar måste redovisas på tentamen (HT2025 Tentamen U5).
- Är relationen explicit given som en mängd par behövs inga beräkningar (HT2019 Fx1 U5a).
- Står det "Lös högst en av 5a och 5b" rättas ingen om du löser båda (HT2021 KS4 U5b).

**De senaste åren (HT2024–HT2025):** en konkret relation ges på $\mathbb{Z}$ eller $\mathbb{N} \times \mathbb{N}$ och du ska göra en full utredning av de fyra egenskaperna (HT2024 Omtentamen april U5, HT2025 Tentamen U5). Delbarhet dyker upp i två skepnader: utred sanningshalten i om delbarhet är en partiell ordningsrelation (HT2025 Omtentamen april U5), eller bevisa att infimum finns och är lika med GCD i delbarhetsordningen (HT2024 Tentamen januari U5). Även en fråga om hur många relationer som har alla fyra egenskaperna förekommer (HT2024 KS2 U5).

### Så löser lösningsförslagen uppgifterna

**Egenskapsutredning**

1. Skriv upp vad varje egenskap kräver som en utsaga om alla element: reflexiv $x\mathcal{R}x$, symmetrisk $x\mathcal{R}y \Rightarrow y\mathcal{R}x$, antisymmetrisk $x\mathcal{R}y \land y\mathcal{R}x \Rightarrow x = y$, transitiv $x\mathcal{R}y \land y\mathcal{R}z \Rightarrow x\mathcal{R}z$ (HT2019 Tentamen januari U5, HT2023 KS4 U5).
2. För att bevisa en egenskap: ta godtyckliga element och härled kravet ur relationens definition, gärna med en kedja av ekvivalenser (HT2019 KS2 U5, HT2023 KS4 U5).
3. För att motbevisa en egenskap: välj konkreta tal och räkna ut att förledet gäller men inte efterledet (HT2019 KS2 U5, HT2020 KS4 U5a).
4. Behandla de fyra egenskaperna var för sig och svara ja eller nej för var och en (HT2019 KS4 U5, HT2024 Omtentamen april U5).

Fallgropar: skriv fullständiga utsagor, inte $x \cdot y \Leftrightarrow \ldots$ eftersom $x \cdot y$ är ett tal (HT2019 KS4 U5); ett motexempel måste räknas igenom, inte bara nämnas (HT2024 Omtentamen april U5).

**Ekvivalensbevis**

1. Visa de tre egenskaper som definierar en ekvivalensrelation: reflexiv, symmetrisk och transitiv (HT2020 KS1 U5, HT2024 KS3 U5).
2. Skriv först om relationens definition till en enklare likvärdig form om det går, t.ex. känn igen en kongruensrelation (HT2020 KS2 U5, HT2021 Fx2 U5).
3. Reflexivitet: visa $x\mathcal{R}x$ för ett godtyckligt $x$ direkt ur definitionen (HT2020 KS1 U5).
4. Symmetri och transitivitet: anta förledet för godtyckliga element och härled efterledet (HT2020 KS1 U5, HT2024 KS3 U5).

Fallgropar: en ekvivalensrelation kräver inte antisymmetri; en kongruensrelation modulo $n$ är alltid en ekvivalensrelation (HT2021 Fx2 U5); för att motbevisa ekvivalens räcker det att fälla en av de tre egenskaperna (HT2021 Fx1 U5).

**Ekvivalensklasser**

1. Visa först att relationen är en ekvivalensrelation (HT2021 KS2 U5, HT2022 KS4 U5).
2. Skriv ekvivalensklassen till $x$ som mängden av alla $y$ med $y\mathcal{R}x$ och förenkla villkoret (HT2022 KS4 U5, HT2021 KS2 U5).
3. På en ändlig mängd: pröva vilka element som är relaterade och gruppera dem (HT2021 KS4 U5a, HT2021 Fx2 U5).
4. Kontrollera att klasserna tillsammans täcker hela mängden (HT2021 Fx2 U5).

Fallgrop: för klasser i planet krävs en skiss för godkänt (HT2021 KS2 U5).

**Partiell ordning**

1. En partiell ordningsrelation är reflexiv, antisymmetrisk och transitiv; visa de tre (symmetri ingår inte) (HT2025 Omtentamen april U5, HT2023 Omtentamen april U5).
2. Var noga med grundmängden: delbarhet är en partiell ordning på $\mathbb{N}$ men inte på $\mathbb{Z}$, där antisymmetrin faller för $1$ och $-1$ (HT2025 Omtentamen april U5).
3. För att motbevisa: ge ett motexempel mot en av de tre egenskaperna (HT2025 Omtentamen april U5, HT2023 Omtentamen april U5).

Fallgrop: en relation kan vara varken ekvivalensrelation eller partiell ordning (HT2023 Omtentamen april U5).

**Relation som funktion**

1. En relation är en funktion om varje $x$ ger exakt ett $y$ (HT2020 Fx1 U5).
2. Motbevisa funktion: ge två par $(x_1, y)$ och $(x_2, y)$, eller samma $x$ med två olika $y$, som bryter kravet (HT2020 Fx1 U5).
3. För de som är funktioner: ange största möjliga definitionsmängd $A$ (HT2020 Fx1 U5).

Fallgrop: kom ihåg att du bara arbetar med heltal (HT2020 Fx1 U5).

**Allmänt resonemang**

1. Utgå enbart från definitionerna av egenskaperna, inte från konkreta tal (HT2020 Fx2 U5, HT2024 KS2 U5).
2. För "hur många / vilka relationer": visa både att din kandidat har egenskaperna och att ingen annan relation kan ha dem (HT2024 KS2 U5).
3. För "finns det en till": ge ett konkret exempel med tillhörande mängd om svaret är ja (HT2019 Fx1 U5b).

Fallgrop: den enda relationen på en mängd som har alla fyra egenskaperna är likhetsrelationen (HT2024 KS2 U5).

### Formelsamlingen och kapitlet

Formelsamlingen har ingen egen avdelning för relationer; den täcker bara kapitel 1, 2, 3, 4, 7 och 8. Allt nedan måste du alltså kunna själv:

- Definitionerna av reflexiv, symmetrisk, antisymmetrisk och transitiv som utsagor om alla element (HT2019 KS2 U5).
- Att en ekvivalensrelation är reflexiv, symmetrisk och transitiv (HT2020 KS1 U5).
- Att en partiell ordningsrelation är reflexiv, antisymmetrisk och transitiv (HT2025 Omtentamen april U5).
- Att en ekvivalensklass till $x$ är mängden av alla $y$ med $y\mathcal{R}x$ (HT2022 KS4 U5).
- Knepet att en implikation med falskt förled är sann, så en egenskap kan gälla "tomt" (HT2022 Tentamen januari U5).
- Att en kongruensrelation modulo $n$ är en ekvivalensrelation (HT2021 Fx2 U5).

### Uppgifter som återkommer

- Ekvivalensrelation inducerad av en funktion, $x\mathcal{R}y \Leftrightarrow f(x) = f(y)$: HT2022 KS4 U5, HT2024 KS3 U5.
- Relation på $\mathbb{Z}$ byggd på $x^{2} + y^{2}$ jämnt eller udda: HT2019 Tentamen januari U5, HT2019 Hemtentamen april U5, HT2019 Komplettering U5.

### Mönsterlösningar

- **Egenskapsutredning**: HT2023 KS4 U5
- **Ekvivalensbevis**: HT2024 KS3 U5
- **Ekvivalensklasser**: HT2022 KS4 U5
- **Partiell ordning**: HT2025 Omtentamen april U5
- **Relation som funktion**: HT2020 Fx1 U5
- **Allmänt resonemang**: HT2024 KS2 U5

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS2 U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow (x - 1) \cdot (y - 1) \text{ är ett jämnt tal.}$ Utred reflexivitet, symmetri, antisymmetri och transitivitet, med bevis eller logisk motsats. | Inte reflexiv ($x = 2$ ger en udda produkt), symmetrisk (produkten ändras inte av ordningen), inte antisymmetrisk ($1\mathcal{R}2$ och $2\mathcal{R}1$ men $1 \neq 2$), inte transitiv (samma par ger $1\mathcal{R}2$ och $2\mathcal{R}1$ men inte $1\mathcal{R}1$). Metod: ekvivalenskedja för bevis, konkreta tal för motexempel. |
| HT2019 KS4 U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x \cdot y \equiv 1 \pmod{3}.$ Vilka av reflexivitet, symmetri, antisymmetri, transitivitet har den? | Inte reflexiv ($3 \cdot 3 \equiv 0$ visar att $x = 3$ saknar $x\mathcal{R}x$), symmetrisk (produkten ändras inte av ordningen), inte antisymmetrisk (för $x = 1$ och $y = 4$ gäller båda hållen men $1 \neq 4$), transitiv (fallanalys modulo 3). |
| HT2019 Tentamen januari U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x^{2} + y^{2} \text{ är ett jämnt tal.}$ Utred reflexivitet, symmetri och antisymmetri (transitivitet bortses från). | Reflexiv ($2x^{2}$ är alltid jämnt), symmetrisk (summan ändras inte av ordningen), inte antisymmetrisk (talen 3 och 1 ger jämn summa men är olika). |
| HT2019 Fx1 U5a | Egenskapsutredning | På $A = \{1, 2, 3\}$: $\mathcal{R} = \{(1, 1), (2, 2), (3, 3), (1, 2), (2, 3), (3, 1)\}.$ Utred reflexivitet, symmetri och antisymmetri (inga beräkningar behövs). | Reflexiv (alla par $(a, a)$ ingår), inte symmetrisk ($1\mathcal{R}2$ men inte $2\mathcal{R}1$), antisymmetrisk (för $x \neq y$ ligger bara ett av paren i relationen, så förledet är falskt). Metod: avläs paren direkt. |
| HT2019 Fx1 U5b | Allmänt resonemang | $A$ icketom, $\mathcal{R}$ en relation på $A$. Finns någon relation utom den tomma som är icke-reflexiv, symmetrisk och antisymmetrisk? Ge exempel (JA) eller bevisa (NEJ). | Ja. Ta $A = \{1, 2, 3\}$ och $\mathcal{R} = \{(1, 1), (2, 2)\}$: icke-reflexiv (saknar $(3, 3)$), symmetrisk och antisymmetrisk (relaterade par har alltid samma element). Metod: konstruera ett konkret exempel. |
| HT2019 Hemtentamen april U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x^{2} + y^{2} \text{ är ett udda tal eller } y < 0.$ Ge fullständig utredning av reflexivitet, symmetri, antisymmetri och transitivitet. | Lösning saknas i underlaget. |
| HT2019 Komplettering U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x^{2} + y^{2} \text{ är ett udda tal eller } x \cdot y < 0.$ Ge fullständig utredning av reflexivitet, symmetri, antisymmetri och transitivitet. | Lösning saknas i underlaget. |
| HT2020 KS1 U5 | Ekvivalensbevis | $U$ = alla kvadratiska matriser med $n$ rader, $I$ = de inverterbara. $A\mathcal{R}B \Leftrightarrow \exists P \in I : A = PBP^{-1}.$ Visa att $\mathcal{R}$ är en ekvivalensrelation. Ledning: $(QR)^{-1} = R^{-1}Q^{-1}$. | Ekvivalensrelation. Reflexiv (ty $A = E \cdot A \cdot E^{-1}$), symmetrisk (ur definitionen fås $B = P^{-1}A(P^{-1})^{-1}$), transitiv (kompositionen ger $A = (QR) \cdot C \cdot (QR)^{-1}$). |

| HT2020 KS2 U5 | Ekvivalensbevis | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow (x + 1)^{2} \equiv (y - 1)^{2} \pmod{2}.$ Är den en ekvivalensrelation? Bevisa. | Ja, ekvivalensrelation; den är i själva verket kongruensrelationen $x \equiv y \pmod{2}$. Tre lösningar visas: algebraisk omskrivning, en tabell över kvadrater i $\mathbb{Z}_{2}$, och direkt bevis av reflexivitet, symmetri och transitivitet ur definitionen. |
| HT2020 KS4 U5a | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x \equiv y^{2} + 3 \pmod{4}.$ Visa att den inte är reflexiv, inte symmetrisk, inte antisymmetrisk och inte transitiv. | Ingen av de fyra. Motexempel: ej reflexiv (för $x = 1$ och $y = 1$); ej symmetrisk (vi har inte $1\mathcal{R}4$ åt båda håll); ej antisymmetrisk ($3\mathcal{R}4$ och $4\mathcal{R}3$ men $3 \neq 4$); ej transitiv ($3\mathcal{R}4$ och $4\mathcal{R}3$ men inte $3\mathcal{R}3$). |
| HT2020 KS4 U5b | Ekvivalensbevis | $U = \{(x, y) : x, y \in \mathbb{R}\}.$ Relationen ges av $u\mathcal{R}v \Leftrightarrow (u + v) \cdot (u - v) = 0$ där $\cdot$ är skalärprodukten. Visa att $\mathcal{R}$ är en ekvivalensrelation. | Ekvivalensrelation. Metod: skriv om till $\vert u\vert^{2} - \vert v\vert^{2} = 0$, dvs $\vert u\vert = \vert v\vert$ — relaterade betyder lika längd. Reflexiv, symmetrisk och transitiv följer direkt av att "samma längd" har de egenskaperna. |
| HT2020 Tentamen januari U5 | Egenskapsutredning | $A$ = alla vektorer i $\mathbb{R}^{2}$ utom nollvektorn, $u \mathcal{R} v \Leftrightarrow u \cdot v \neq 0.$ (a) reflexiv? (b) symmetrisk? (c) transitiv? (d) ekvivalensrelation? | (a) reflexiv (ty $u \cdot u = x^{2} + y^{2} > 0$); (b) symmetrisk (ty $u \cdot v = v \cdot u$); (c) inte transitiv (välj $u = (0, 1)$, $v = (1, 1)$, $w = (1, 0)$: då gäller $u \mathcal{R} v$ och $v \mathcal{R} w$ men $u \cdot w$ blir 0); (d) inte ekvivalensrelation, eftersom transitivitet saknas. |
| HT2020 Fx1 U5 | Relation som funktion | Relationer $\mathcal{R}$ från $\mathbb{Z}$ till $\mathbb{Z}$: (a) $xy = 1$, (b) $xy = 0$, (c) $x + y = 1$, (d) $x + y \neq 1$, (e) $x^{2} = y^{2}$. Vilka kan uppfattas som funktioner från en delmängd $A \subset \mathbb{Z}$ till $\mathbb{Z}$? Ange definitionsmängden, annars motexempel. | (a) funktion, definierad bara för $x = \pm 1$ (via $y = 1/x$); (b) ej funktion ($(2, 0)$ och $(1, 0)$); (c) funktion $y = f(x) = 1 - x$ för alla heltal; (d) ej funktion ($(1, 1)$ och $(2, 1)$); (e) ej funktion ($(1, 1)$ och $(-1, 1)$). |
| HT2020 Omtentamen april U5 | Egenskapsutredning | $S$ = alla räta linjer i planet, $l_{1}\mathcal{R}l_{2}$ om och endast om linjerna är ortogonala (riktningsvektorernas skalärprodukt är 0). Utred reflexivitet, transitivitet, symmetri och antisymmetri utifrån riktningsvektorerna. | Inte reflexiv (en linje är inte ortogonal mot sig själv; $v_{1} \cdot v_{1} = 0$ skulle kräva nollvektor), symmetrisk ($v_{1} \cdot v_{2} = 0$ ger samma åt andra hållet), inte antisymmetrisk (linjerna $y = x$ och $y = -x$ är ortogonala men olika), inte transitiv (välj $l_{3} = l_{1}$). |
| HT2020 Fx2 U5 | Allmänt resonemang | En relation kallas *Euklidisk* om $\forall x, y, z \in A : x\mathcal{R}y \land x\mathcal{R}z \Rightarrow y\mathcal{R}z.$ Visa att en euklidisk relation som är reflexiv också är en ekvivalensrelation. | Bevis. Symmetri: ur $x\mathcal{R}y$ och (reflexivt) $x\mathcal{R}x$ ger euklidisk egenskap $y\mathcal{R}x$. Transitivitet: ur $x\mathcal{R}y \land y\mathcal{R}z$ ges via symmetrin $y\mathcal{R}x$, och euklidisk egenskap ger $x\mathcal{R}z$. Reflexiviteten var given. |
| HT2021 KS1 U5 | Ekvivalensbevis | På $\mathbb{Z}_{2}$ (klasser skrivna som tal utan överstreck): $x\mathcal{R}y \Leftrightarrow x^{2} = y^{2} \lor (x + 1)^{2} = y^{2}.$ Bevisa att $\mathcal{R}$ är en ekvivalensrelation. | Ekvivalensrelation. Reflexiv ($x^{2} = x^{2}$), symmetrisk (lång ekvivalenskedja i $\mathbb{Z}_{2}$), transitiv (fallanalys). Enklare syn: i $\mathbb{Z}_{2}$ blir villkoret en tautologi, så alla element är relaterade och det blir en enda ekvivalensklass. |

| HT2021 KS2 U5 | Ekvivalensklasser | $A = \{(x, y) \in \mathbb{R}^{2} : x > 0\}$, $(x_{1}, y_{1})\mathcal{R}(x_{2}, y_{2}) \Leftrightarrow \frac{y_{1}}{x_{1}} = \frac{y_{2}}{x_{2}}.$ (a) Visa ekvivalensrelation. (b) Beskriv klasserna till $(1, 1)$ och $(2, 1)$ och rita figur. | (a) ekvivalensrelation; reflexivitet, symmetri och transitivitet följer direkt av att likhet mellan bråk har de egenskaperna. (b) klassen till $(1, 1)$ är linjen $y = x$ med $x > 0$; klassen till $(2, 1)$ är linjen $y = x/2$ med $x > 0$. En skiss krävs för godkänt. |
| HT2021 KS4 U5a | Ekvivalensklasser | På $\mathbb{Z}_{3} = \{\overline{0}, \overline{1}, \overline{2}\}$: $x\mathcal{R}y \Leftrightarrow x^{2} - y = y^{2} - x.$ Visa att $\mathcal{R}$ är en ekvivalensrelation och ta fram klasserna. (Löses högst en av 5a och 5b.) | Ekvivalensrelation. Metod: skriv om till $x^{2} + x = y^{2} + y$, då syns symmetri och transitivitet direkt. Klasser (räkna mod 3): $\{\overline{0}, \overline{2}\}$ och $\{\overline{1}\}$. |
| HT2021 KS4 U5b | Egenskapsutredning | På $\mathbb{Z}$: $a\mathcal{R}b \Leftrightarrow \exists k \in \mathbb{Z} : a + k^{2} = b.$ Utred reflexivitet, symmetri, antisymmetri och transitivitet. (Löses högst en av 5a och 5b.) | Reflexiv (ty $a + 0^{2} = a$), inte symmetrisk ($0\mathcal{R}1$ men inte $1\mathcal{R}0$), antisymmetrisk (ur $a\mathcal{R}b \land b\mathcal{R}a$ fås $k^{2} + k'^{2} = 0$ så $k = k' = 0$ och $a = b$), inte transitiv ($0\mathcal{R}1$ och $1\mathcal{R}2$ men inte $0\mathcal{R}2$, ty $k^{2} = 2$ saknar lösning). |
| HT2021 Tentamen januari U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x \equiv y \pmod{2} \lor x \equiv y \pmod{3}.$ Utred reflexivitet, symmetri, antisymmetri och transitivitet. | Reflexiv och symmetrisk (ärvs från kongruensrelationerna), inte antisymmetrisk ($2\mathcal{R}4$ och $4\mathcal{R}2$, $2 \neq 4$), inte transitiv ($2\mathcal{R}4$ via mod 2 och $4\mathcal{R}7$ via mod 3, men inte $2\mathcal{R}7$). |
| HT2021 Fx1 U5 | Allmänt resonemang | $A$ = alla positiva heltal, $a\mathcal{R}b \Leftrightarrow a \mid b^{2} \land b \mid a^{2}.$ Bevisa att $\mathcal{R}$ *inte* är en ekvivalensrelation. | Inte ekvivalensrelation. Relationen är reflexiv och symmetrisk, men transitiviteten faller: med $a = 2$, $b = 4$, $c = 8$ gäller $a\mathcal{R}b$ och $b\mathcal{R}c$ men inte $a\mathcal{R}c$ (ty $8 \nmid 2^{2}$). Metod: fäll en av de tre egenskaperna. |
| HT2021 Omtentamen april U5 | Egenskapsutredning | $A = \{x \in \mathbb{R} : 0 < x < 1\}$, $x\mathcal{R}y \Leftrightarrow \exists n \in \mathbb{N} : \left\vert \frac{1}{x} - \frac{1}{y} \right\vert > n.$ Här är $\mathbb{N} = \{1, 2, 3, \ldots\}$. Utred reflexivitet, symmetri och transitivitet. | Inte reflexiv (beloppet blir 0, aldrig större än något $n$), symmetrisk (beloppet är symmetriskt i $x$ och $y$), inte transitiv (välj $x = 0.1$, $y = 0.2$, $z = 0.1$: $x\mathcal{R}y$ och $y\mathcal{R}z$ men inte $x\mathcal{R}z$ ty $x = z$). |
| HT2021 Fx2 U5 | Ekvivalensklasser | $A = \{1, 2, 4, 5, 8, 11, 13, 17\}$, $x\mathcal{R}y \Leftrightarrow 3 \mid x + 2y.$ Visa att $\mathcal{R}$ är en ekvivalensrelation på $A$ och ta fram klasserna. | Ekvivalensrelation (den är kongruens modulo 3, eftersom villkoret är ekvivalent med $x \equiv y \pmod{3}$). Metod: visa reflexivitet, symmetri och transitivitet, pröva sedan vilka tal som är relaterade. Klasser: $\{1, 4, 13\}$ och $\{2, 5, 8, 11, 17\}$. |
| HT2022 KS2 U5 | Egenskapsutredning | $A$ = alla positiva heltal, $x\mathcal{R}y \Leftrightarrow 2 \mid y/x \lor 2 \mid x/y.$ (Kvoten måste vara heltal, annars falsk.) Utred reflexivitet, symmetri och transitivitet (ej antisymmetri). | Inte reflexiv ($x\mathcal{R}x$ kräver $2 \mid 1$, som är falskt för alla $x$), symmetrisk (disjunktionen är symmetrisk i $x$ och $y$), inte transitiv ($x = 1$, $y = 2$, $z = 1$ ger $1\mathcal{R}2$ och $2\mathcal{R}1$ men inte $1\mathcal{R}1$). |

| HT2022 KS4 U5 | Ekvivalensklasser | $f : A \to B$ en funktion; relationen på $A$ ges av $x \mathcal{R} y \Leftrightarrow f(x) = f(y).$ (a) Visa ekvivalensrelation. (b) Ange klasserna om $A = B = \mathbb{Z}$ och $f(x) = x^{2}$. | (a) ekvivalensrelation; reflexivitet, symmetri och transitivitet ärvs direkt från likhet av funktionsvärden. (b) $x^{2} = y^{2} \Leftrightarrow \vert x\vert = \vert y\vert$, så klasserna är $\overline{x} = \{x, -x\}$: $\{0\}, \{-1, 1\}, \{-2, 2\}, \{-3, 3\}, \ldots$ |
| HT2022 Tentamen januari U5 | Egenskapsutredning | $A = \{1, 2, 4, 8, \ldots\} = \{2^{k} : k = 0, 1, 2, 3, \ldots\}$, $x\mathcal{R}y \Leftrightarrow x - y = 4^{n}, \text{ för något } n \in \mathbb{Z}, n \geq 0.$ Visa att den inte är reflexiv eller symmetrisk men är antisymmetrisk och transitiv. | Inte reflexiv och inte symmetrisk (relaterade tal kräver att det ena är strikt större, så aldrig relaterad till sig själv och aldrig åt båda håll). Antisymmetrisk och transitiv gäller "tomt": de enda relaterade paren är två på varandra följande potenser av 2 där den mindre är en jämn potens, så förleden kan aldrig uppfyllas och implikationerna blir därmed sanna. |
| HT2023 KS2 U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x \mid y \lor x + y = 1.$ Visa att $\mathcal{R}$ är reflexiv men inte symmetrisk, inte antisymmetrisk och inte transitiv. | Reflexiv ($x \mid x$), inte symmetrisk ($x = 1$ och $y = 2$: $1 \mid 2$ gäller men inte åt andra hållet), inte antisymmetrisk ($x = 1$ och $y = -1$: båda håll via delbarhet men talen olika), inte transitiv ($x = 2, y = -1, z = 3$: förleden gäller, bl.a. $2 + -1 = 1$, men inte $x\mathcal{R}z$). |
| HT2023 KS4 U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x^{2} + y^{2} = 2xy + y - x.$ Utred reflexivitet, symmetri, antisymmetri och transitivitet. | Reflexiv ($2x^{2} = 2x^{2}$), inte symmetrisk ($0\mathcal{R}1$ men inte $1\mathcal{R}0$), antisymmetrisk (ur $x\mathcal{R}y \land y\mathcal{R}x$ fås $y - x = x - y$, dvs $x = y$), inte transitiv ($0\mathcal{R}1$ och $1\mathcal{R}2$ men inte $0\mathcal{R}2$). |
| HT2023 Tentamen januari U5 | Egenskapsutredning | $\mathbb{R}^{+}$ = positiva reella tal, $x\mathcal{R}y \Leftrightarrow x + y = xy.$ Utred reflexivitet, symmetri, antisymmetri och transitivitet. | Endast symmetrisk ($x + y = xy$ är symmetriskt i $x$ och $y$). Inte reflexiv ($x = 1$ kan aldrig relateras), inte antisymmetrisk (med $x = 3$ och $y = 3/2$ gäller båda håll men talen är olika), inte transitiv (välj $x = 3, y = 3/2, z = 3$: förleden gäller men inte $x\mathcal{R}z$, ty $6 = 9$ är falskt). |
| HT2023 Omtentamen april U5 | Partiell ordning | $A = \{1, 2, 3, 4\}$, $\mathcal{R} = \{(1, 1), (2, 2), (3, 3), (4, 4), (1, 2), (2, 3), (3, 4)\}.$ Utred de fyra egenskaperna och ange om relationen är ekvivalensrelation eller partiell ordningsrelation. | Reflexiv (alla $x\mathcal{R}x$ gäller, från $1\mathcal{R}1$ till $4\mathcal{R}4$), inte symmetrisk ($2\mathcal{R}3$ men inte $3\mathcal{R}2$), antisymmetrisk (bara $x = y$ ger båda håll), inte transitiv ($1\mathcal{R}2$ och $2\mathcal{R}3$ men inte $1\mathcal{R}3$). Alltså varken ekvivalensrelation eller partiell ordningsrelation, eftersom transitivitet saknas. |
| HT2024 KS2 U5 | Allmänt resonemang | $\Omega = \{1, 2, 3, 4, 5\}$. Hur många relationer på $\Omega$ är reflexiva, symmetriska, anti-symmetriska och transitiva? Ange dem och visa varför precis dessa. | Exakt en: likhetsrelationen $\mathcal{R} = \{(1, 1), (2, 2), (3, 3), (4, 4), (5, 5)\}$. Metod: symmetri och antisymmetri tillsammans ger $x\mathcal{R}y \Rightarrow x = y$, och reflexivitet ger $x = y \Rightarrow x\mathcal{R}y$, så $x = y \Leftrightarrow x\mathcal{R}y$. |
| HT2024 KS3 U5 | Ekvivalensbevis | $f : A \to B$ (ändliga mängder) inducerar en partition $\mathcal{P}_{f}$: $x, y$ i samma del om $f(x) = f(y)$. Relationen ges av $x\mathcal{R}y \Leftrightarrow x \text{ och } y \text{ är i samma del av } \mathcal{P}_{f}$. Visa ekvivalensrelation och beskriv klasserna. | Ekvivalensrelation. Villkoret är $x\mathcal{R}y \Leftrightarrow f(x) = f(y)$; reflexivitet, symmetri och transitivitet ärvs direkt från likhet. Klasserna samlar alla element i $A$ med samma funktionsvärde. |

| HT2024 Tentamen januari U5 | Allmänt resonemang | $A$ partiellt ordnad under $\leq$; $c$ kallas infimum av $a, b$ om $c \leq a$ och $c \leq b$ och $d \leq a \quad \land \quad d \leq b \quad \Rightarrow \quad d \leq c$. Visa att om $A$ = positiva heltal och $x \leq y \Leftrightarrow x \mid y$ så existerar $inf(a, b)$ och $inf(a, b) = GCD(a, b)$. | Bevis. $GCD(a, b) \mid a$ och $GCD(a, b) \mid b$. Om $d \mid a$ och $d \mid b$ ger primtalsfaktoriseringarna $\delta_{j} \leq \alpha_{j}$ och $\delta_{j} \leq \beta_{j}$, alltså $\delta_{j} \leq min(\alpha_{j}, \beta_{j})$ för alla $j$, dvs $d \mid GCD(a, b)$. Därmed är $GCD(a, b)$ infimum. Metod: aritmetikens fundamentalsats. |
| HT2024 Omtentamen april U5 | Egenskapsutredning | På $\mathbb{Z}$: $x\mathcal{R}y \Leftrightarrow x^{2} = y^{2} \lor (x = 1 \land y = 0).$ Ge fullständig utredning av reflexivitet, symmetri, antisymmetri och transitivitet. | Reflexiv ($x^{2} = x^{2}$), inte symmetrisk ($1\mathcal{R}0$ men inte $0\mathcal{R}1$), inte antisymmetrisk ($1\mathcal{R}-1$ och $-1\mathcal{R}1$ men talen är olika), inte transitiv ($x = -1$, $y = 1$, $z = 0$: $x\mathcal{R}y$ och $y\mathcal{R}z$ men inte $x\mathcal{R}z$). |
| HT2025 Tentamen U5 | Egenskapsutredning | $\Omega = \mathbb{N} \times \mathbb{N}$, $(a, b)(c, d)\mathcal{R} \Leftrightarrow ac = bd.$ Ge fullständig utredning av reflexivitet, symmetri, antisymmetri och transitivitet. | Inte reflexiv (kräver $a^{2} = b^{2}$, falskt för $a = 1$ och $b = 2$), symmetrisk ($ac = bd \Rightarrow ca = db$), inte antisymmetrisk (lösningen tar $(-1, 1)$ och $(1, -1)$ — tryckt så trots att $\Omega = \mathbb{N} \times \mathbb{N}$ — med lika produkter men skilda element), inte transitiv (med paren $(1, 2)$, $(2, 1)$ och $(1, 2)$ gäller förleden men inte sista ledet). |
| HT2025 Omtentamen april U5 | Partiell ordning | Utred sanningshalten: (1) $\mathcal{R}$ på $\mathbb{Z}$, $a\mathcal{R}b \Leftrightarrow a \mid b$, är en partiell ordningsrelation. (2) $\mathcal{S}$ på $\mathbb{N}$, $a\mathcal{S}b \Leftrightarrow a \mid b$, är en partiell ordningsrelation. ($\mathbb{N} = \{1, 2, 3, \ldots\}$.) | (1) falskt: $\mathcal{R}$ är inte antisymmetrisk på $\mathbb{Z}$, ty $1 \mid -1$ och $-1 \mid 1$ men talen är olika. (2) sant: $\mathcal{S}$ är reflexiv ($x \mid x$), antisymmetrisk (ur $x = ky \land y = k'x$ med positiva tal fås $kk' = 1$ så $x = y$) och transitiv (delbarhet ärvs, så $x \mid z$). |

## Område 6 – Fördjupad talteori

**avancerat område – bara tentan, sätter betyget.** Uppgifter i underlaget: 31, från 31 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Summaidentitet | 12 | 12 | HT2019–HT2024 | 2 |
| Delbarhet | 7 | 7 | HT2019–HT2025 | 2 |
| Olikhet | 5 | 5 | HT2019–HT2021 | 0 |
| Restklasser | 3 | 3 | HT2020–HT2025 | 1 |
| Formelbevis | 2 | 2 | HT2020–HT2024 | 1 |
| Multiplikativ invers | 1 | 1 | HT2019–HT2019 | 0 |
| Komplettering | 1 | 1 | HT2019–HT2019 | 0 |

- **Summaidentitet** – bevisa med induktion att en summa $\sum$ är lika med en sluten formel.
- **Olikhet** – bevisa med induktion att en summa eller ett uttryck är mindre än (eller större än) ett annat.
- **Delbarhet** – bevisa med induktion att ett uttryck alltid är delbart med ett fast tal.
- **Restklasser** – visa ett delbarhets- eller likhetspåstående med kongruensräkning (modulo) i stället för induktion.
- **Formelbevis** – gissa eller bevisa en formel som inte är en summa ($M^{n}$, $D(x^{n})$) med induktion.
- **Multiplikativ invers** – räkna elementen i $\mathbb{Z}_{n}$ som är sin egen multiplikativa invers.
- **Komplettering** – rätta en tidigare inlämnad lösning.

### Vad uppgifterna ber om

- Nästan varje uppgift säger rakt ut "Visa med matematisk induktion", och då måste alla tre stegen finnas med: basfallet, induktionssteget och slutsatsen (HT2022 KS4 U6, HT2023 KS4 U6).
- Basfallet är inte alltid $n = 1$. Det kan vara $n \geq 2$ (HT2021 Omtentamen april U6, HT2021 Fx2 U6) eller $n \geq 4$ (HT2019 Fx1 U6, HT2021 Tentamen januari U6), och då kontrolleras basfallet för just det talet.
- En del uppgifter ger en *ledning* som styr metoden: skriv om påståendet utan summatecken först (HT2021 KS4 U6), eller använd en given olikhet eller ett givet explicit uttryck utan motivering (HT2021 Tentamen januari U6, HT2024 Tentamen januari U6).
- Ibland ska du själv formulera formeln innan du bevisar den: "formulera en hypotes ... och bevisa sedan" (HT2021 Fx1 U6), "Gissa en formel ... och bevisa den" (HT2020 Fx1 U6).
- Någon uppgift ber uttryckligen om en annan metod än induktion: "räkning med restklasser modulo 3" (HT2020 Omtentamen april U6) eller "Arbeta modulo $a - b$" (HT2025 Omtentamen april U6).
- Ett påstående kan vara en ekvivalens som ska visas åt båda håll (HT2020 Omtentamen april U6), eller ett par där det ena är sant och det andra falskt så att du ska bevisa det sanna och motbevisa det falska med ett exempel (HT2023 Omtentamen april U6).

**De senaste åren (HT2024–HT2025):** uppgiften är ett rent induktionsbevis och lyder "Använd matematisk induktion för att ..." eller "Visa med matematisk induktion ...". Det har gällt en summaidentitet (HT2024 KS2 U6, HT2024 Omtentamen april U6), delbarhet för en rekursivt given talföljd (HT2024 Tentamen januari U6) och delbarhet för polynom $(x - 1) \mid (x^{n} - 1)$ (HT2025 Tentamen U6). HT2025 Omtentamen april U6 bröt mönstret och löstes i stället med kongruensräkning. Räkna alltså med ett induktionsbevis, men var beredd på att ledningen kan peka mot restklasser.

### Så löser lösningsförslagen uppgifterna

**Summaidentitet**

1. Inför predikatet $A(n)$, sätt vänsterledet $VL_{n}$ lika med summan och högerledet $HL_{n}$ lika med den slutna formeln (HT2020 KS2 U6, HT2022 KS2 U6).
2. Steg 1: räkna ut $VL_{1}$ och $HL_{1}$ var för sig och visa att de är lika, så att $A(1)$ gäller (HT2022 KS4 U6).
3. Steg 2: gör induktionsantagandet $A(p)$, alltså $VL_{p} = HL_{p}$ (HT2021 KS2 U6).
4. Bryt ut den sista termen (för $k$ lika med $p + 1$) ur $VL_{p+1}$ så att resten blir $VL_{p}$ (HT2020 KS4 U6, HT2024 Omtentamen april U6).
5. Ersätt $VL_{p}$ med $HL_{p}$ och räkna om via gemensam nämnare eller faktorisering tills uttrycket blir $HL_{p+1}$ (HT2022 KS2 U6).
6. Steg 3: konstatera att steg 1, steg 2 och induktionsaxiomet fullbordar beviset (HT2023 KS4 U6).

**Olikhet**

1. Inför $A(n)$ med $VL_{n}$ och $HL_{n}$; målet är $\forall n \geq 4 : A(n)$ eller motsvarande undre gräns (HT2019 Fx1 U6).
2. Steg 1: kontrollera basfallet vid den undre gränsen, till exempel $A(2)$ eller $A(4)$, genom att räkna ut båda leden (HT2021 Fx2 U6).
3. Steg 2: anta $A(p)$, alltså $VL_{p} < HL_{p}$, och bryt ut sista termen ur $VL_{p+1}$ (HT2020 Tentamen januari U6).
4. Skatta uppåt: ersätt $VL_{p}$ med $HL_{p}$ och visa att resultatet håller sig under $HL_{p+1}$ (HT2021 Omtentamen april U6).
5. Om den kvarvarande olikheten är svår, visa den separat i en hjälpsats eller ett extra inbäddat induktionsbevis (HT2021 Tentamen januari U6).

**Delbarhet**

1. Inför $A(n)$ som att talet är delbart med ett fast tal och skriv antagandet som att det finns ett heltal $k$ med uttrycket lika med $3k$ (HT2020 Fx2 U6, HT2023 Tentamen januari U6).
2. Steg 1: sätt in basvärdet och se att talet delar sig självt (HT2019 KS2 U6).
3. Steg 2: anta $A(p)$, utveckla $(p + 1)$-uttrycket algebraiskt och samla ihop termerna (HT2021 KS4 U6).
4. Byt ut den del som är induktionsantagandet mot $3k$ och bryt ut 3 ur hela uttrycket (HT2023 Tentamen januari U6).
5. För polynom är metoden densamma: skriv $x^{p} - 1 = q(x)(x - 1)$ och använd ledningen för att få $x^{p+1} - 1$ som en produkt med $(x - 1)$ (HT2025 Tentamen U6).
6. När talföljden är rekursiv: hitta först det explicita uttrycket och sätt in det innan induktionen (HT2024 Tentamen januari U6).

**Restklasser**

1. När en ekvivalens ska visas: bevisa att vänster- och högerledet är kongruenta modulo talet, led för led (HT2020 Omtentamen april U6).
2. Skriv talet $n$ som siffror gånger tiopotenser och använd att varje tiopotens ger rest 1 vid division med 3 (HT2020 Omtentamen april U6).
3. När ett existenspåstående ska visas räcker ett exempel; när ett allpåstående ska motbevisas räcker ett motexempel (HT2023 Omtentamen april U6).
4. För delbarhet med modulo-metoden: räkna i kongruenser tills uttrycket blir $\equiv 0$ modulo talet (HT2025 Omtentamen april U6).

**Formelbevis**

1. Räkna ut de första fallen, till exempel $M^{2}$ och $M^{3}$, och gissa en formel för $M^{n}$ (HT2020 Fx1 U6).
2. Inför $A(n)$ för att formeln gäller och verifiera $A(1)$ ur definitionen (HT2020 Fx1 U6).
3. Steg 2: skriv $(p + 1)$-fallet som $p$-fallet gånger en faktor till, $M^{p+1} = M \cdot M^{p}$ eller via produktregeln $D(x^{p+1}) = D(x \cdot x^{p})$, och sätt in antagandet (HT2020 Fx1 U6, HT2024 KS3 U6).
4. Räkna ut produkten och visa att den blir formeln för $p + 1$ (HT2024 KS3 U6).

**Multiplikativ invers**

Ingen löst uppgift av den här typen finns i underlaget — HT2019 Hemtentamen april U6 saknar lösning — så ingen metod kan återges.

**Komplettering**

Ingen metod finns i underlaget; HT2019 Komplettering U6 ber bara om att rätta en tidigare inlämnad lösning och har ingen lösning.

**Fallgropar**

- Motiveringen måste vara *fullständig*: inga led som behövs för slutsatsen får utelämnas, även om man får skriva kort (HT2019 KS2 U6).
- Glöm inte slutsatsen (steg 3) — den behövs för att induktionsaxiomet ska få åberopas (HT2023 KS4 U6).
- Vid olikhet måste riktningen hållas: man skattar $VL_{p}$ uppåt med $HL_{p}$, aldrig tvärtom (HT2021 Fx2 U6).
- Vid delbarhet räcker inte bara basfallet; antagandet måste skrivas som att det finns ett heltal (HT2023 Tentamen januari U6).

### Formelsamlingen och kapitlet

Formelsamlingen har inget eget avsnitt för kapitel 6 (Fördjupad talteori). Under "4 Inledande talteori" trycker den delbarhetsdefinitionen $a \mid b$, kongruensdefinitionen $a \equiv b \pmod{n}$, kongruenslagarna (addition, multiplikation och potens), divisionsalgoritmen, Bézouts sats och Euklides algoritm, och i notationstabellen står $\mathbb{Z}_{n}$ för restklasser modulo $n$.

Det kapitlet behöver och som bladet inte ger:

- Principen för matematisk induktion och dess tre steg — den behövs i nästan varje uppgift men står inte på bladet (HT2022 KS4 U6).
- Standardsumman $2\sum_{k=1}^{n} k = n^{2} + n$, som i en uppgift får användas utan bevis — den ges som ledning, inte på bladet (HT2021 KS4 U6).
- Fibonaccitalens definition $F_{n+2} = F_{n+1} + F_{n}$ — ges i uppgiften, inte på bladet (HT2024 KS2 U6).
- Produktregeln för derivata $D(f \cdot g) = f' \cdot g + f \cdot g'$ — ges som tips, inte på bladet (HT2024 KS3 U6).
- Formeln för geometrisk summa $\sum_{k=1}^{n} a^{k} = a \cdot \frac{1 - a^{n}}{1 - a}$ — ges i uppgiften själv och ska bevisas (HT2022 Tentamen januari U6).
- Begreppet multiplikativ invers i $\mathbb{Z}_{n}$ — bladet listar $\mathbb{Z}_{n}$ men säger inget om inverser (HT2019 Hemtentamen april U6).

### Uppgifter som återkommer

- $s - t \mid s^{n} - t^{n}$ respektive $a - b \mid a^{n} - b^{n}$ (samma påstående, olika metod): HT2023 KS2 U6, HT2025 Omtentamen april U6.
- $n^{3} + 2n$ är delbart med 3: HT2020 Fx2 U6, HT2023 Tentamen januari U6.
- summan $\sum_{k=1}^{n} k(k + 1)$ lika med $\frac{n(n + 1)(n + 2)}{3}$: HT2021 Fx1 U6, HT2022 KS4 U6.
- summan $\sum_{k=1}^{n} 3k^{2} - k$ (samma identitet, högerledet skrivet på två sätt): HT2019 KS4 U6, HT2023 KS4 U6.
- summan av $\frac{1}{4k^{2} - 1}$-typ lika med $\frac{n}{2n + 1}$: HT2019 Tentamen januari U6, HT2021 KS2 U6.

### Mönsterlösningar

- **Summaidentitet**: HT2024 Omtentamen april U6
- **Olikhet**: HT2021 Tentamen januari U6
- **Delbarhet**: HT2025 Tentamen U6
- **Restklasser**: HT2025 Omtentamen april U6
- **Formelbevis**: HT2024 KS3 U6
- **Multiplikativ invers**: inget löst exempel
- **Komplettering**: inget löst exempel

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 KS2 U6 | Delbarhet | Visa med induktion att $7^{n} - 4^{n}$ är delbart med 3 för alla positiva heltal $n$. | Gäller. $A(1)$ ger $3 \mid 3$; skriv antagandet som $7^{p} = 3 \cdot k + 4^{p}$ och faktorisera så att $7^{p+1} - 4^{p+1}$ blir $3 \cdot (7k + 4^{p})$. |
| HT2019 KS4 U6 | Summaidentitet | Visa med induktion att för alla positiva heltal gäller $\sum_{k=1}^{n} 3k^{2} - k = n^{2}(n + 1).$ | Gäller. $VL_{1} = HL_{1}$ (båda 2); dela av summan, sätt in $HL_{p}$ och faktorisera $VL_{p+1}$ till $(p + 1)(p + 1)(p + 2)$. |
| HT2019 Tentamen januari U6 | Summaidentitet | Visa med induktion att för alla heltal $n \geq 1$ gäller $\sum_{k=1}^{n} \frac{1}{(2k - 1)(2k + 1)} = \frac{n}{2n + 1}.$ | Gäller. $VL_{1} = HL_{1}$ (båda $\frac{1}{3}$); sätt in $HL_{p}$, förläng med $(2p+1)$ och visa att $VL_{p+1}$ blir $HL_{p+1}$. |
| HT2019 Fx1 U6 | Olikhet | Visa med induktion att för alla heltal $n \geq 4$ gäller $2^{n+1} \cdot n! > 5^{n}.$ | Gäller. Basfallet $A(4)$ stämmer ($VL_{4}$ = 768, $HL_{4}$ = 625); i steget skrivs $VL_{p+1}$ som $2 \cdot (p + 1) \cdot VL_{p}$ och $2(p + 1) \geq 5$ för $p \geq 4$. Tryckt jämförelse står som 768 > 25. |
| HT2019 Hemtentamen april U6 | Multiplikativ invers | Ange för varje $\mathbb{Z}_{n}$ med $n = 2, 3, 4, 5, 6, 7, 8, 9$ antalet element som har sig själva som multiplikativ invers; fyll i tabellen och redovisa hur du tänkt. Ledning: avsnittet om inverser i $\mathbb{Z}_{p}$. | Lösning saknas i underlaget. |
| HT2019 Komplettering U6 | Komplettering | Kompletteringsuppgift: "Uppdatera din lösning från ordinarie tentan så att den blir korrekt." Ingen egen uppgiftstext. | Lösning saknas i underlaget. |

| HT2020 KS2 U6 | Summaidentitet | Visa med induktion att $\sum_{k=1}^{n} (k + 1)(k + 5) = \frac{1}{6}n(n + 7)(2n + 7)$ för alla $n = 1, 2, 3, \ldots$. | Gäller. $VL_{1} = 12 = HL_{1}$; sätt in $HL_{p}$ och visa att både $VL_{p+1}$ och $HL_{p+1}$ blir $\frac{1}{6}(2p^{3} + 27p^{2} + 97p + 72)$. |
| HT2020 KS4 U6 | Summaidentitet | Visa med induktion summaformeln $\sum_{k=1}^{n} \frac{k}{2^{k}} = 2 - \frac{n + 2}{2^{n}}$ för alla positiva heltal $n = 1, 2, 3, \ldots$. | Gäller. $VL_{1} = \frac{1}{2} = HL_{1}$; sätt in $HL_{p}$ och förläng, så $VL_{p+1}$ blir $2 - \frac{p + 3}{2^{p+1}}$ som är $HL_{p+1}$. |
| HT2020 Tentamen januari U6 | Olikhet | Visa med induktion olikheten $\sum_{k=1}^{n} \frac{1}{\sqrt{k}} < 2\sqrt{n}$ för alla positiva heltal $n = 1, 2, 3, \ldots$. Ledning ger en hjälpolikhet att förlänga. | Gäller. $VL_{1} = 1 < 2 = HL_{1}$; skatta upp $VL_{p}$ med $HL_{p}$ och visa $2\sqrt{p} + \frac{1}{\sqrt{p+1}} \leq 2\sqrt{p+1}$ via förlängning med $\sqrt{p+1} + \sqrt{p}$. |
| HT2020 Fx1 U6 | Formelbevis | Bilda matrisen $M = \begin{pmatrix} 1 & a \\ 0 & 1 \end{pmatrix}.$ Gissa en formel för $M^{n}$ (heltal $n \geq 1$) och bevisa den med matematisk induktion. | Gäller. Formeln är $M^{n} = \begin{pmatrix} 1 & na \\ 0 & 1 \end{pmatrix}$; i steget används $M^{p+1} = M \cdot M^{p}$, sätt in antagandet och multiplicera matriserna. |
| HT2020 Omtentamen april U6 | Restklasser | Bevisa med restklasser modulo 3 ekvivalensen, där $\sigma_{n}$ är siffersumman i det positiva heltalet $n$: $\sigma_{n} \equiv 0 \pmod{3} \Leftrightarrow n \equiv 0 \pmod{3}.$ | Gäller (ekvivalens). Skriv $n$ som siffror gånger tiopotenser; varje tiopotens har formen $3 \cdot 33..3 + 1$, så $n \equiv 0$ modulo 3 omm siffersumman $\equiv 0$. |
| HT2020 Fx2 U6 | Delbarhet | Visa med induktion, utan kongruensräkning, att $n^{3} + 2n$ alltid är delbart med 3 för alla positiva heltal $n$. | Gäller. $A(1)$ ger $3 \mid 1 + 2 = 3$; skriv antagandet $p^{3} + 2p = 3k$ och få att $(p + 1)^{3} + 2(p + 1)$ blir $3 \cdot (k + p^{2} + p + 1)$. |

| HT2021 KS2 U6 | Summaidentitet | Visa med induktion att för alla positiva heltal $n > 0$ gäller $\sum_{k=1}^{n} \frac{1}{4k^{2} - 1} = \frac{n}{2n + 1}.$ | Gäller. Båda leden blir $\frac{1}{3}$ i basfallet; faktorisera $4p^{2} + 8p + 3 = (2p + 3)(2p + 1)$, förläng och få $VL_{p+1} = HL_{p+1}$. |
| HT2021 KS4 U6 | Delbarhet | Visa med induktion, utan kongruensräkning, att $3 \mid (n + 1) \cdot \sum_{k=1}^{n} (4k - 1)$ för alla heltal $n \geq 1$. Ledning: $2\sum_{k=1}^{n} k = n^{2} + n$ får användas; skriv om utan summatecken först. | Gäller. Skriv om till $3 \mid 2n^{3} + 3n^{2} + n$; antagandet ger $2p^{3} + 3p^{2} + p = 3q$ och $(p + 1)$-fallet blir $3 \cdot (q + 2p^{2} + 4p + 2)$. |
| HT2021 Tentamen januari U6 | Olikhet | Visa med induktion att för varje heltal $n \geq 4$ gäller $4n^{2} + 2^{n} \leq 3^{n}$ (lösningsfilen). Uppgiftsfilen trycker i stället den inre olikheten $8n + 4 + 2^{n} \leq 2 \cdot 3^{n}$. | Gäller. $VL_{4} = 80 \leq 81 = HL_{4}$; reducera steg 2 till $8p + 4 + 2^{p} \leq 2 \cdot 3^{p}$ och visa den med ett extra inbäddat induktionsbevis $B(p)$ (använder att $h(p) = 3^{p} - 2^{p}$ växer). |
| HT2021 Fx1 U6 | Summaidentitet | Studera identiteterna med start $1 \cdot 2 = \frac{1}{3} \cdot 1 \cdot 2 \cdot 3,$ formulera en hypotes med ett summatecken och bevisa den med matematisk induktion. | Gäller. Hypotesen är $\sum_{k=1}^{n} k(k + 1) = \frac{1}{3}n(n + 1)(n + 2)$; sätt in $HL_{p}$ och faktorisera till $\frac{1}{3}(p + 1)(p + 2)(p + 3)$. |
| HT2021 Omtentamen april U6 | Olikhet | Visa med induktion att för alla heltal $n \geq 2$ gäller $\sum_{k=1}^{n} k^{2} < n^{3}$. | Gäller. $VL_2 = 5 < 8 = HL_2$; skatta upp $VL_{p+1}$ med $p^{3} + (p + 1)^{2}$ och jämför med $(p + 1)^{3} = p^{3} + 3p^{2} + 3p + 1$. |
| HT2021 Fx2 U6 | Olikhet | Visa med induktion att för alla heltal $n \geq 2$ gäller $\sum_{k=1}^{n} \frac{1}{k^{2}} < 2 - \frac{1}{n}$. | Gäller. $VL_{2} = 5/4$ och $3/2 = HL_{2}$; skatta upp $VL_{p}$ med $HL_{p}$ och reducera olikheten till $\frac{1}{(p + 1)} > 0$, som är sann. |

| HT2022 KS2 U6 | Summaidentitet | Visa med induktion att för alla heltal $n > 0$ gäller $\sum_{k=1}^{n} \frac{2k + 1}{k^{2}(k + 1)^{2}} = \frac{n(n + 2)}{(n + 1)^{2}}.$ | Gäller. $VL_{1}$ och $HL_{1}$ blir båda $\frac{3}{4}$; sätt in $HL_{p}$ och visa att $VL_{p+1}$ och $HL_{p+1}$ båda blir $\frac{p^{4} + 6p^{3} + 12p^{2} + 10p + 3}{(p + 1)^{2}(p + 2)^{2}}$. |
| HT2022 KS4 U6 | Summaidentitet | Visa med induktion att $\sum_{k=1}^{n} k(k + 1) = \frac{n(n + 1)(n + 2)}{3}$ för alla heltal $n \geq 1$. | Gäller. $VL_{1} = HL_{1}$ (båda 2); sätt in $HL_{p}$ och faktorisera $VL_{p+1}$ till $\frac{(p + 1)(p + 2)(p + 3)}{3}$. |
| HT2022 Tentamen januari U6 | Summaidentitet | Bevisa med induktion den geometriska summan $\sum_{k=1}^{n} a^{k} = a \cdot \frac{1 - a^{n}}{1 - a}.$ för heltal $n \geq 1$, med $a \neq 1$ konstant. | Gäller. $VL_{1} = HL_{1}$ (lika med $a$); sätt in antagandet och bryt ut, så $VL_{p+1}$ blir $a \cdot \frac{1 - a^{p+1}}{1 - a}$, alltså $HL_{p+1}$. |
| HT2023 KS2 U6 | Delbarhet | Låt $s, t$ vara fixa heltal. Visa med induktion att $s - t \mid s^{n} - t^{n}$ för alla heltal $n = 1, 2, 3, \ldots$. | Gäller. $A(1)$ ger $s - t \mid s - t$; skriv antagandet som $s^{p} = q(s - t) + t^{p}$ så att $s^{p+1} - t^{p+1}$ blir $(s - t)(t^{p} + sq)$. |
| HT2023 KS4 U6 | Summaidentitet | Visa summaformeln $\sum_{k=1}^{n} 3k^{2} - k = n^{3} + n^{2}$ för $n = 1, 2, 3, \ldots$ med matematisk induktion. | Gäller. $A(1)$ stämmer (båda leden 2); sätt in $HL_{p}$ och visa att både $VL_{p+1}$ och $HL_{p+1}$ blir $p^{3} + 4p^{2} + 5p + 2$. |
| HT2023 Tentamen januari U6 | Delbarhet | Visa med induktion att alla tal på formen $n^{3} + 2n$ är delbara med 3, där $n \geq 1$ är ett heltal. | Gäller. $A(1)$ ger $3 \mid 3$; antagandet $p^{3} + 2p = 3q_{p}$ ger att $(p + 1)^{3} + 2(p + 1)$ blir $3 \cdot (q_{p} + p^{2} + p + 1)$. |

| HT2023 Omtentamen april U6 | Restklasser | Med $\mathbb{Z}_{n}$ och kvadratklasserna $\mathbb{Z}_{n}^{2} = \{\overline{0}^{2}, \overline{1}^{2}, \ldots, \overline{n-1}^{2}\}.$ Ett av påståendena "för alla primtal $p$ gäller $\mathbb{Z}_{p}^{2} = \mathbb{Z}_{p}$" och "det finns ett primtal $p$ med $\mathbb{Z}_{p}^{2} = \mathbb{Z}_{p}$" är sant, det andra falskt; bevisa det sanna och motbevisa det falska. | Allpåståendet är falskt, existenspåståendet sant. Motexempel: $\mathbb{Z}_{5}^{2}$ blir $\{\overline{0}, \overline{1}, \overline{4}\} \neq \mathbb{Z}_{5}$. Exempel för det sanna: primtalet 2 ger $\{\overline{0}, \overline{1}\}$. |
| HT2024 KS2 U6 | Summaidentitet | Visa med induktion att summan av de första $n$ Fibonaccitalen är $F_{1} + F_{2} + F_{3} + \cdots + F_{n} = F_{n+2} - 1,$ där $F_{1} = 1$, $F_{2} = 1$ och $F_{n+2} = F_{n+1} + F_{n}$. | Gäller. Skriv om till $F_{n+2} = \sum_{k=1}^{n} F_{k} + 1$; i steget blir $HL_{p+1}$ lika med $F_{p+2} + F_{p+1}$, som enligt rekursionen är $F_{p+3}$. |
| HT2024 KS3 U6 | Formelbevis | Visa med induktion deriveringsregeln $D(x^{n}) = n \cdot x^{n-1}$ för alla positiva heltal $n$. Tips: lutningen av $y = kx + m$ är $k$, och produktregeln $D(f \cdot g) = f' \cdot g + f \cdot g'$. | Gäller. $A(1)$: $D(x) = 1$, alltså $1 \cdot x^{1-1}$; produktregeln ger $D(x^{p+1}) = D(x \cdot x^{p})$, och med antagandet blir det $(p + 1)x^{p}$. |
| HT2024 Tentamen januari U6 | Delbarhet | En följd ges av $a_{1} = 4$ och $a_{n+1} - 2a_{n} = 0$ för $n \geq 1$. Visa med induktion att $a_{n+1} \cdot a_{n} + 1$ är delbart med 3 för alla heltal $n \geq 1$. Ledning: använd det explicita uttrycket. | Gäller. Explicit är $a_{n}$ lika med $2^{n+1}$, så påståendet blir att $8 \cdot 2^{2n} + 1$ är delbart med 3; $A(1)$: $33 = 3 \cdot 11$; steget skrivs $4 \left( 8 \cdot 2^{2p} + 1 \right) - 3$. |
| HT2024 Omtentamen april U6 | Summaidentitet | Visa med induktion att summan av de första $n$ udda heltalen i kvadrat uppfyller $\sum_{k=1}^{n} (2k - 1)^{2} = \frac{n(4n^{2} - 1)}{3}, \quad n = 1, 2, 3, \ldots.$ | Gäller. $VL_{1} = HL_{1}$ (lika med 1); sätt in $HL_{p}$, lägg till $(2p + 1)^{2}$ och visa att täljaren blir densamma som i $HL_{p+1}$. |
| HT2025 Tentamen U6 | Delbarhet | Med delbarhet för polynom, där $f(x) \mid g(x)$ om $g(x) = q(x) \cdot f(x)$, visa med induktion att för varje heltal $n \geq 1$ gäller $(x - 1) \mid (x^{n} - 1).$ Ledning: $x^{p+1} - 1 = (x^{p+1} - x) + (x - 1)$. | Gäller. $A(1)$: $(x - 1) \mid (x - 1)$; skriv antagandet $x^{p} - 1 = q(x)(x - 1)$, och ledningen ger att $x^{p+1} - 1$ blir $(q(x) + 1)(x - 1)$. |
| HT2025 Omtentamen april U6 | Restklasser | Låt $a, b$ vara godtyckliga heltal. Visa att $a - b \mid a^{n} - b^{n}$ för alla positiva heltal $n$. Ledning: arbeta modulo $a - b$. | Gäller (kongruensräkning, inte induktion). Modulo $a - b$: $a^{n} - b^{n} \equiv (a - b + b)^{n} - b^{n} \pmod{a - b}$, vidare $\equiv (a - b)^{n} \pmod{a - b}$ och $\equiv 0 \pmod{a - b}$. |

## Område 9 – Sannolikhetslära

**avancerat område – bara tentan, sätter betyget.** Uppgifter i underlaget: 30, från 29 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Total sannolikhet | 9 | 9 | HT2019–HT2025 | 1 |
| Oberoende och komplement | 5 | 5 | HT2019–HT2022 | 0 |
| Klassisk sannolikhet | 5 | 5 | HT2019–HT2024 | 1 |
| Bayes sats | 3 | 3 | HT2020–HT2025 | 1 |
| Inklusion–exklusion | 3 | 3 | HT2020–HT2022 | 0 |
| Betingad sannolikhet | 3 | 3 | HT2021–HT2024 | 1 |
| Sannolikhetsbevis | 2 | 2 | HT2021–HT2024 | 1 |

- **Total sannolikhet** – räkna ut en sannolikhet genom att dela upp i fall och väga ihop sannolikheten för utfallet givet varje fall med fallets egen sannolikhet.
- **Bayes sats** – vänd på betingningen och sök sannolikheten för en orsak givet en verkan, ur sannolikheten för verkan givet orsaken.
- **Oberoende och komplement** – räkna med givna sannolikheter via unionsformeln, oberoende och komplement, eller avgör om två händelser är oberoende eller disjunkta.
- **Inklusion–exklusion** – beräkna $P(A \cup B \cup C)$ eller sannolikheten för precis två eller precis en av tre händelser.
- **Klassisk sannolikhet** – räkna gynnsamma genom totala utfall ($m/n$), ofta med kombinatorik och komplement.
- **Betingad sannolikhet** – beräkna $P(A \mid B) = \frac{P(A \cap B)}{P(B)}$, ofta genom att räkna i utfallsrummet.
- **Sannolikhetsbevis** – bevisa en allmän likhet eller olikhet mellan sannolikheter.

### Vad uppgifterna ber om

Uppgift 9 hör alltid till Sannolikhetslära, men alla skrivningar har den inte: den finns i 29 av 53 sittningar. Antal sittningar med uppgiften, per slag av skrivning: alla: Hemtentamen 1 av 1; KS3 6 av 6; KS4 5 av 5; Tentamen 7 av 7. Ibland: Fx1 3 av 7; Fx2 2 av 6; Omtentamen 5 av 6. Aldrig: KS1 0 av 7; KS2 0 av 7; Komplettering 0 av 1. (Räknat ur matrisen.) Den här terminen bidrar kapitlet bara till betyget och examineras på tentan (5 jan), inte på KS1 eller KS2.

- Beräkna en sannolikhet ur en slumpprocess med urnor, tärningar, mynt eller kort (HT2020 Omtentamen april U9, HT2021 KS4 U9).
- Avgör om två händelser är oberoende eller disjunkta, med motivering (HT2019 KS3 U9).
- Beräkna sammansatta sannolikheter som $P(A \cap B)$, $P(A \cup B)$ och $P(A \cup B^{c})$ ur givna sannolikheter (HT2022 KS3 U9).
- En population delas i grupper, och total sannolikhet plus Bayes söks (HT2020 Tentamen januari U9, HT2025 Tentamen U9).
- Beräkna $P(A \cup B \cup C)$ eller sannolikheten för precis två eller precis en av tre händelser (HT2020 Fx2 U9, HT2021 Fx1 U9).
- "Visa att" betyder ett fullständigt bevis, inte bara ett svar (HT2019 Tentamen januari U9, HT2024 Omtentamen april U9).
- "Motivera" krävs: ett blankt ja eller nej räcker inte (HT2019 KS3 U9).
- Utan miniräknare räcker det ofta att teckna det numeriska uttrycket, men resonemanget måste vara rätt (HT2020 Tentamen januari U9, HT2020 Fx1 U9).
- Ibland krävs ändå ett tal som svar, fast miniräknare inte är tillåten (HT2020 Fx2 U9).
- Venndiagram får användas för att motivera, men måste förklaras noggrant med text (HT2021 Fx1 U9).
- En ledning kan peka ut metoden, till exempel att förenkla slumpprocessen först (HT2021 Tentamen januari U9).

**De senaste åren (HT2024–HT2025):** Den senaste tentan som använde Bayes sats var HT2025 Tentamen U9, där uppgiften löstes med satsen om total sannolikhet och sedan Bayes sats; den allra senaste sittningen, HT2025 Omtentamen april U9, var ren total sannolikhet. HT2024 visade i stället betingad sannolikhet i en population (HT2024 KS3 U9), ett urvalsproblem med en kortlek (HT2024 Tentamen januari U9) och ett bevis med betingad sannolikhet (HT2024 Omtentamen april U9). Eftersom kapitlet examineras på tentan den här terminen är tentauppgifterna HT2024 Tentamen januari U9 och HT2025 Tentamen U9 de närmaste ledtrådarna till formen.

### Så löser lösningsförslagen uppgifterna

**Total sannolikhet**

1. Inför en händelse för det som söks och namnge varje fall som slumpprocessen kan hamna i (HT2019 KS4 U9, HT2025 Omtentamen april U9).
2. Kontrollera att fallen täcker allt och inte överlappar, ofta en händelse och dess komplement (HT2023 KS4 U9, HT2019 Fx1 U9b).
3. Skriv satsen om total sannolikhet: sannolikheten för det sökta är summan av sannolikheten för det sökta givet varje fall gånger fallets sannolikhet (HT2019 KS4 U9, HT2021 KS4 U9).
4. Läs av fallens sannolikheter och de betingade sannolikheterna ur texten eller ur hur urnan ser ut i varje fall (HT2020 Omtentamen april U9, HT2023 KS4 U9).
5. Sätt in och räkna ihop till ett tal (HT2021 Tentamen januari U9, HT2025 Omtentamen april U9).

Fallgropar: en ledning kan be dig förenkla processen först, till exempel slå ihop två urnor till en (HT2021 Tentamen januari U9); ett "givet"-värde kan vara 0 eller 1 därför att händelsen är omöjlig eller säker i det fallet (HT2025 Omtentamen april U9).

**Bayes sats**

1. Inför händelserna och avgör vilken betingad sannolikhet som söks, orsak givet verkan (HT2020 Fx1 U9, HT2025 Tentamen U9).
2. Beräkna först nämnaren med satsen om total sannolikhet över alla orsaker (HT2020 Tentamen januari U9, HT2025 Tentamen U9).
3. Skriv Bayes sats: sökt betingad sannolikhet är sannolikheten för verkan givet orsaken gånger orsakens sannolikhet, delat med den totala sannolikheten (HT2020 Tentamen januari U9, HT2020 Fx1 U9).
4. Sätt in värdena; ett numeriskt uttryck räcker ofta som svar (HT2020 Fx1 U9).

Fallgropar: orsakerna måste partitionera utfallsrummet, annars blir nämnaren fel (HT2020 Fx1 U9); svaret på omvänd fråga ligger nära men inte lika med gruppens egen andel (HT2020 Tentamen januari U9, HT2025 Tentamen U9).

**Oberoende och komplement**

1. Komplementregeln ger en saknad sannolikhet: sannolikheten för komplementet är ett minus sannolikheten (HT2020 KS3 U9, HT2022 KS3 U9).
2. Är händelserna oberoende är sannolikheten för snittet produkten av de två sannolikheterna (HT2020 KS3 U9, HT2022 KS3 U9).
3. Unionsformeln ger unionen: summan av de två sannolikheterna minus snittet (HT2019 KS3 U9, HT2020 KS3 U9).
4. För att avgöra oberoende, jämför produkten av sannolikheterna med snittets sannolikhet; lika betyder oberoende (HT2019 KS3 U9, HT2019 Tentamen januari U9).
5. För att avgöra disjunkta, kolla om snittets sannolikhet är noll (HT2019 KS3 U9).

Fallgropar: oberoende och disjunkta är inte samma sak, två händelser med positivt snitt kan inte vara disjunkta (HT2019 KS3 U9); är händelserna oberoende så är även en händelse och den andras komplement oberoende (HT2022 KS3 U9).

**Inklusion–exklusion**

1. Skriv inklusion–exklusion för tre händelser: summan av de enkla, minus summan av parsnitten, plus trippelsnittet (HT2020 Fx2 U9, HT2022 Tentamen januari U9).
2. Använd att händelserna aldrig alla inträffar samtidigt så att trippelsnittet är noll (HT2021 Fx1 U9, HT2022 Tentamen januari U9).
3. Sannolikheten för precis två är summan av de tre parsnitten minus två gånger trippelsnittet (HT2021 Fx1 U9).
4. Att någon av händelserna alltid inträffar betyder att unionens sannolikhet är ett (HT2021 Fx1 U9, HT2022 Tentamen januari U9).
5. Teckna de okända som variabler och lös ekvationen (HT2022 Tentamen januari U9).

Fallgropar: ett parsnitt kan behöva fås ur oberoende först (HT2020 Fx2 U9); håll isär "precis två" och "minst två", de sammanfaller bara när trippelsnittet är noll (HT2021 Fx1 U9).

**Klassisk sannolikhet**

1. Räkna totala antalet utfall utan restriktioner, ofta som ett urval med binomialkoefficient eller som en valprocess i flera steg (HT2019 Fx1 U9a, HT2022 KS4 U9).
2. Räkna gynnsamma utfall på samma sätt och med samma ordningsval som nämnaren (HT2020 KS4 U9, HT2024 Tentamen januari U9).
3. Sannolikheten är gynnsamma delat med totala (HT2019 Fx1 U9a, HT2022 KS4 U9).
4. Är det sökta krångligt, räkna komplementet i stället och dra från ett (HT2020 KS4 U9, HT2022 KS4 U9).
5. Dela upp gynnsamma i disjunkta fall och addera (HT2020 KS4 U9, HT2024 Tentamen januari U9).

Fallgropar: nämnare och täljare måste räknas med samma syn på ordning (HT2020 KS4 U9); jämför två alternativ genom att jämföra deras sannolikheter, inte genom att räkna ut dem exakt (HT2024 Tentamen januari U9).

**Betingad sannolikhet**

1. Skriv definitionen: sannolikheten för $A$ givet $B$ är snittets sannolikhet delat med sannolikheten för $B$ (HT2021 Omtentamen april U9, HT2024 KS3 U9).
2. När allt är likformigt, rita utfallsrummet och räkna rutor för varje händelse (HT2021 Omtentamen april U9).
3. Läs av snittets och villkorets sannolikheter och sätt in (HT2021 Omtentamen april U9, HT2023 Omtentamen april U9).
4. Finns en okänd sannolikhet, lös ut den ur en annan betingad likhet (HT2024 KS3 U9).

Fallgropar: ett dragningsutfall utan återläggning ger samma sannolikhet för andra kortet som för första, fast man inte tror det (HT2023 Omtentamen april U9); två betingade likheter kan sättas lika när texten säger att de är lika vanliga (HT2024 KS3 U9).

**Sannolikhetsbevis**

1. Skriv om de betingade sannolikheterna med definitionen (HT2024 Omtentamen april U9).
2. Använd kända samband: mängddifferens för sannolikheter och inklusion–exklusion (HT2021 Fx2 U9).
3. Utnyttja en olikhet mellan sannolikheter, till exempel att unionen är minst lika sannolik som en del (HT2024 Omtentamen april U9).
4. Förenkla båda led och visa att de är lika eller uppfyller olikheten (HT2021 Fx2 U9, HT2024 Omtentamen april U9).

Fallgropar: snittet av snittet med unionen blir bara snittet, det förkortar uttrycket (HT2024 Omtentamen april U9); villkoret att trippelsnittet är noll är det som gör omskrivningen möjlig (HT2021 Fx2 U9).

### Formelsamlingen och kapitlet

Formelsamlingen har ingen avdelning för sannolikhetslära — inget av det nedan står i den. (Binomialkoefficienterna som klassisk sannolikhet behöver ligger i formelsamlingens kombinatorikdel, kapitel 8.) Det problemen och lösningarna behöver och som formelsamlingen saknar:

- Komplementregeln: sannolikheten för komplementet är ett minus sannolikheten (HT2020 KS3 U9).
- Unionsformeln (additionssatsen) för två händelser (HT2019 KS3 U9).
- Definitionen av oberoende: snittets sannolikhet är produkten av de två sannolikheterna (HT2019 KS3 U9, HT2022 KS3 U9).
- Definitionen av betingad sannolikhet (HT2021 Omtentamen april U9, HT2024 KS3 U9).
- Satsen om total sannolikhet över en partition (HT2019 KS4 U9, HT2025 Omtentamen april U9).
- Bayes sats (HT2020 Tentamen januari U9, HT2025 Tentamen U9).
- Inklusion–exklusion för tre händelser (HT2020 Fx2 U9).
- Klassisk sannolikhet som gynnsamma genom totala utfall, $m/n$ (HT2019 Fx1 U9a).
- Mängddifferens för sannolikheter: $P(E - F) = P(E) - P(E \cap F)$ (HT2021 Fx2 U9).
- Komplementära händelser: deras sannolikheter summerar till ett (HT2022 KS4 U9).

### Uppgifter som återkommer

- Två oberoende händelser med givna sannolikheter (eller komplementen); beräkna $P(A \cap B)$ och $P(A \cup B)$ med unionsformeln: HT2020 KS3 U9, HT2022 KS3 U9
- En population delas i grupper där en andel i varje har en egenskap; total sannolikhet för egenskapen och Bayes för den omvända frågan: HT2020 Tentamen januari U9, HT2020 Fx1 U9, HT2025 Tentamen U9
- Urnor med kulor där en kula flyttas eller byts innan en dras; total sannolikhet: HT2020 Omtentamen april U9, HT2021 Tentamen januari U9

### Mönsterlösningar

- **Total sannolikhet**: HT2025 Omtentamen april U9
- **Bayes sats**: HT2025 Tentamen U9
- **Oberoende och komplement**: HT2022 KS3 U9
- **Inklusion–exklusion**: HT2022 Tentamen januari U9
- **Klassisk sannolikhet**: HT2024 Tentamen januari U9
- **Betingad sannolikhet**: HT2024 KS3 U9
- **Sannolikhetsbevis**: HT2024 Omtentamen april U9

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |
| HT2019 KS3 U9 | Oberoende och komplement | Låt $S$ vara ett utfallsrum med händelserna $A$ och $B$ och $P(A) = 0.4$, $P(B) = 0.6$, $P(A \cup B) = 0.9$. (a) Är $A$ och $B$ oberoende? Motivera. (b) Är $A$ och $B$ disjunkta? Motivera. | Inte oberoende och inte disjunkta. Unionsformeln ger $0.9 = 0.4 + 0.6 - P(A \cap B) \Leftrightarrow P(A \cap B) = 0.1$; eftersom $P(A \cap B) = 0.1 > 0$ är de inte disjunkta, och $P(A) \cdot P(B) = 0.4 \cdot 0.6 = 0.24 \neq 0.1 = P(A \cap B)$ ger att de inte är oberoende. |
| HT2019 KS4 U9 | Total sannolikhet | En person åker buss från $A$ till $C$ med byte vid $B$. Är bussen $A$–$B$ inte sen (sannolikhet 90%) gäller en bra tidtabell och då är det 10% att bli sen till $C$; är den sen (sannolikhet 10%) är det 20%. Beräkna sannolikheten att personen blir försenad till $C$. | Svaret är 11%. Inför $E$ = bussen mellan A och B är försenad; total sannolikhet $P(F) = P(F \mid E^{c}) \cdot P(E^{c}) + P(F \mid E) \cdot P(E)$, som ger $P(F) = 0.10 \cdot 0.9 + 0.20 \cdot 0.10 = 0.09 + 0.02 = 0.11$. |
| HT2019 Tentamen januari U9 | Oberoende och komplement | Låt $S$ vara ett utfallsrum med händelserna $A, B, C$ och $P(A) = 0.3, \quad P(A \cup C) = 0.6, \quad P(A \cup B) = 0.44, \quad P(B \mid A) = 0.2, \quad P(A \mid C) = 0.1.$ Visa att $A$ och $B$ är oberoende och att $A$ och $C$ inte är oberoende. | $A, B$ oberoende; $A, C$ inte. Unionsformeln ger $P(A \cap B) = P(A) + P(B) - P(A \cup B) = 0.2 + 0.3 - 0.44 = 0.06$ och $P(A) \cdot P(B) = 0.3 \cdot 0.2 = 0.06 = P(A \cap B)$, med $P(B) = 0.2$. För C: $P(C) = 1/3$ och $P(A \cap C) = P(A) + P(C) - P(A \cup C) = 0.3 + 1/3 - 0.6 = 0.03333 \ldots$ medan $P(A) \cdot P(C) = 0.1$. |
| HT2019 Fx1 U9a | Klassisk sannolikhet | Tre urnor: $U_{1}$ har en gul, en blå och en röd kula, $U_{2}$ en gul och en blå, $U_{3}$ en gul. En kula dras ur varje urna. Beräkna sannolikheten att det bland de tre dragna kulorna finns minst två kulor med samma färg. | Svaret enligt lösningen är 1/6. Klassisk sannolikhet: de gynnsamma räknas som $m = A_{1} \cdot A_{2} \cdot A_{3} = 1 \cdot 1 \cdot 1 = 1$ och totala antalet utan restriktioner som $1 \cdot 2 \cdot 3 = 6$, så $\frac{m}{n} = \frac{1}{6}$. Lösningens tre steg är alla märkta Steg 1 (tryckfel). |
| HT2019 Fx1 U9b | Total sannolikhet | Alex har ett delområde kvar och det kommer en uppgift av typ $A$ eller typ $B$. Chansen att klara typ $A$ är 80%, typ $B$ 50%, och det är 60% chans att uppgiften är av typ $A$. Beräkna sannolikheten att Alex klarar uppgiften. | Svaret är 68%. Total sannolikhet med $A$ och $B$ som komplementhändelser: $P(K) = P(K \mid A) \cdot P(A) + P(K \mid B) \cdot P(B) = 0.80 \cdot 0.60 + 0.50 \cdot 0.40 = 0.48 + 0.20 = 0.68$. |
| HT2019 Hemtentamen april U9 | Klassisk sannolikhet | Studera ordet SANNOLIKHETSLÄRAN och välj två bokstäver utan återläggning. (a) Sannolikheten att de två valda bokstäverna är lika (alltså två S eller två N). (b) Om de är lika, sannolikheten att båda är S. (c) Om de är lika, sannolikheten att båda är N. | Lösning saknas i underlaget. |
| HT2020 KS3 U9 | Oberoende och komplement | Låt $A, B$ vara två oberoende händelser med $P(A^{c}) = 0.5$ och $P(B^{c}) = 0.3$. (a) Ange $P(A)$ och $P(B)$. (b) Om $A, B$ är oberoende, vad är $P(A \cup B)$? | (a) $P(A) = 1 - P(A^{c}) = 1 - 0.5 = 0.5$ respektive $P(B) = 1 - P(B^{c}) = 1 - 0.3 = 0.7$. (b) $P(A \cap B) = P(A) \cdot P(B) = 0.5 \cdot 0.7 = 0.35$ och $P(A \cup B) = P(A) + P(B) - P(A \cap B) = 0.5 + 0.7 - 0.5 \cdot 0.7 = 1.2 - 0.35 = 0.85$ (= 85%). |
| HT2020 KS4 U9 | Klassisk sannolikhet | Tre sexsidiga tärningar kastas. Beräkna sannolikheten att utfallet blir (a) samma poängtal på alla tärningar, (b) samma poängtal på precis två tärningar, (c) olika poängtal på alla tärningar. | (a) $\frac{1}{36}$, (b) $\frac{5}{12}$, (c) $\frac{5}{9}$. Klassisk sannolikhet med $n = 6 \cdot 6 \cdot 6 = 6^{3}$: (a) $m = 6$; (b) valprocess $m = 3 \cdot 6 \cdot 5$; (c) komplement $m = 6^{3} - 3 \cdot 6 \cdot 5 - 6$. |

| HT2020 Tentamen januari U9 | Bayes sats | USAs befolkning delas i vita (69%), latinamerikaner (18%) och svarta (13%). Av de svarta har 82% D-vitaminbrist, av latinamerikanerna 70% och av de vita 42%. (a) Sannolikheten att en slumpvis vald person har D-vitaminbrist. (b) Sannolikheten att en person som har D-vitaminbrist är svart. (Numeriska uttryck räcker.) | (a) $P(D) = 0.82 \cdot 0.13 + 0.70 \cdot 0.18 + 0.42 \cdot 0.69$ ($= 0.5224$) med total sannolikhet. (b) Bayes sats: $P(S \mid D) = \frac{P(D \mid S) \cdot P(S)}{P(D)}$ ($\approx 0.2041$). |
| HT2020 Fx1 U9 | Bayes sats | Tre sjukdomar $S_1, S_2, S_3$ med sannolikhet 5%, 10% respektive 5%; en patient kan ha högst en. Symtomet $A$ uppträder vid dem med 5%, 40% respektive 90%. En patient har symtomet $A$. Beräkna sannolikheten att patienten har $S_2$. (Numeriskt uttryck räcker.) | $P(S_2 \mid A) = \frac{0.4 \cdot 0.1}{0.05 \cdot 0.05 + 0.4 \cdot 0.1 + 0.9 \cdot 0.05 + 0 \cdot 0.8} = \frac{0.04}{0.0875}$ ($\approx 45.7\%$). Bayes sats med $S_1, S_2, S_3$ och $F$ (frisk) som partition av utfallsrummet. |
| HT2020 Omtentamen april U9 | Total sannolikhet | Två urnor med tre kulor var: $U_{1}$ två vita och en svart, $U_{2}$ två svarta och en vit. En slumpvis vald kula flyttas från $U_{2}$ till $U_{1}$, kulorna blandas, och en kula dras ur $U_{1}$. Vad är sannolikheten att den dragna kulan är vit? | Svaret är 7/12. Total sannolikhet över den flyttade kulans färg ($A$ = flyttad svart, $B$ = flyttad vit): $P(V) = P(V \mid A) \cdot P(A) + P(V \mid B) \cdot P(B) = \frac{1}{2} \cdot \frac{2}{3} + \frac{3}{4} \cdot \frac{1}{3} = \frac{1}{3} + \frac{1}{4} = \frac{7}{12}$. |
| HT2020 Fx2 U9 | Inklusion–exklusion | Låt $A, B, C$ uppfylla $P(A) = P(B) = P(C) = 0.4$, att $A, B$ är oberoende, $P(A \cap C) = P(B \cap C) = 0.18$ och $P(A \cap B \cap C) = 0.08$. Beräkna $P(A \cup B \cup C)$. (Svara med ett tal.) | Svaret är 0.76. Inklusion–exklusion; oberoende ger $P(A \cap B) = P(A) \cdot P(B) = 0.4 \cdot 0.4 = 0.16$, sedan $P(A \cup B \cup C) = 0.4 + 0.4 + 0.4 - 0.16 - 0.18 - 0.18 + 0.08 = 0.76$. |
| HT2021 KS3 U9 | Oberoende och komplement | Låt $A, B$ vara två oberoende händelser med lika sannolikhet i ett utfallsrum $S$ och antag att $P(A \cap B) = d > 0$. Beräkna $P((A \cup B)^{c})$ uttryckt i $d$. | Svaret är $(1 - \sqrt{d})^{2}$. Sätt $P(A) = P(B) = x$; oberoende ger $d = P(A \cap B) = P(A) \cdot P(B) = x \cdot x = x^{2}$, så $x = P(A) = P(B) = \sqrt{d}$. Unionsformeln ger $P(A \cup B) = P(A) + P(B) - P(A \cap B) = x + x - d = 2\sqrt{d} - d$ och $P((A \cup B)^{c}) = 1 - (2\sqrt{d} - d) = 1 - 2\sqrt{d} + d = (1 - \sqrt{d})^{2}$. Alternativt via $P(A^{c}) \cdot P(B^{c})$. |
| HT2021 KS4 U9 | Total sannolikhet | En sexsidig tärning $T$: kasta en gång och lägg resultatet till en summa $S$ ($S = 0$ från början); om första kastet är udda (1, 3 eller 5) kasta en gång till och lägg till $S$. Beräkna sannolikheten att $S$ är större än eller lika med 6. | Svaret är 1/2. Total sannolikhet över udda eller jämnt första kast: $P(Q) = P(U) \cdot P(Q \mid U) + P(J) \cdot P(Q \mid J) = 1/2 \cdot 2/3 + 1/2 \cdot 1/3 = 1/3 + 1/6 = 1/2$, där $P(Q \mid J) = 1/3$ och $P(Q \mid U) = 12/18 = 2/3$ räknas ur de 18 lika sannolika fallen. |
| HT2021 Tentamen januari U9 | Total sannolikhet | Tre urnor: $U_{1}$ två blåa, $U_{2}$ en blå och en gul, $U_{3}$ två gula. En av $U_{2}$ och $U_{3}$ väljs slumpmässigt, en kula därur byter plats med en slumpvis vald kula i $U_{1}$, sedan väljs en kula ur $U_{1}$. Sannolikheten att den är blå? Ledning: förenkla formuleringen först. | Svaret är 5/8. Förenkla: steg 1–2 motsvarar byte med en urna $V$ med en blå och tre gula. Total sannolikhet: $P(X) = P(X \mid B) \cdot P(B) + P(X \mid G) \cdot P(G) = 1 \cdot \frac{1}{4} + \frac{1}{2} \cdot \frac{3}{4} = \frac{5}{8}$. |
| HT2021 Fx1 U9 | Inklusion–exklusion | Antag att $A, B, C$ uppfyller: (1) $P(A \cap (B \cup C)^{c}) = P(B \cap (A \cup C)^{c}) = P(C \cap (A \cup B)^{c}) = 0.3$; (2) alla tre kan inte inträffa samtidigt men någon av dem inträffar säkert. Beräkna sannolikheten att precis två av dem inträffar. Ledning: motivera med ett Venndiagram. | $P(X) = 0.1$. Med Venndiagram delas $P(A \cup B \cup C) = 1$ i de tre "bara en"-delarna (vardera 0.3) plus "precis två"-delen $X$; alltså $1 = 0.3 + 0.3 + 0.3 + P(X)$. |

| HT2021 Omtentamen april U9 | Betingad sannolikhet | Två tärningar kastas. $A$ = tärningssumman är 3, $B$ = tärningssumman är 7, $C$ = minst en av tärningarna visar en etta. (a) Beräkna $P(A \mid C)$. (b) Beräkna $P(B \mid C)$. (c) Är $A$ och $C$ oberoende? Hur är det med $B$ och $C$? | (a) $P(A \mid C) = \frac{P(A \cap C)}{P(C)} = \frac{2/36}{11/36} = \frac{2}{11}$, (b) $P(B \mid C) = 2/11$, (c) varken $A$ och $C$ eller $B$ och $C$ är oberoende. Rita 6×6-utfallsrummet: $P(A) = 2/36$, $P(B) = 6/36$, $P(C) = 11/36$, $P(A \cap C) = 2/36$ och $P(B \cap C) = 2/36$; betingad via definitionen, oberoende prövas med $P(E) \cdot P(F) = P(E \cap F)$. |
| HT2021 Fx2 U9 | Sannolikhetsbevis | Låt $A, B, C$ vara tre händelser med $P(A \cap B \cap C) = 0$. Visa att $P(A \cup B \cup C) = P(A - C) + P(B - A) + P(C - B).$ | Gäller (bevisat). Använd $P(E - F) = P(E) - P(E \cap F)$ och inklusion–exklusion; med trippelsnittet = 0 omordnas termerna till $P(A) - P(A \cap C) + P(B) - P(A \cap B) + P(C) - P(B \cap C)$, som blir de tre differenstermerna. |
| HT2022 KS3 U9 | Oberoende och komplement | Inför två oberoende händelser $A, B$ med $P(A) = 0.4$ respektive $P(B) = 0.7$. Beräkna (1) $P(A \cap B)$, (2) $P(A \cup B)$, (3) $P(A \cup B^{c})$. | (1) $P(A \cap B) = P(A) \cdot P(B) = 0.4 \cdot 0.7 = 0.28$, (2) $P(A \cup B) = P(A) + P(B) - P(A \cap B) = 0.7 + 0.4 - 0.28 = 0.82$, (3) $P(A \cup B^{c}) = P(A) + P(B^{c}) - P(A \cap B^{c}) = P(A) + (1 - P(B)) - P(A) \cdot (1 - P(B)) = 0.4 + 0.3 - 0.4 \cdot 0.3 = 0.7 - 0.12 = 0.58$, med $P(B^{c}) = 1 - P(B) = 0.3$. Oberoende ger snitten som produkter. |
| HT2022 KS4 U9 | Klassisk sannolikhet | En urna med 2 vita och 3 svarta kulor; ta två kulor utan återläggning. $A$: de två tagna har olika färg. $B$: de två tagna har samma färg. Beräkna $P(A)$ och $P(B)$. | $P(B) = \frac{4}{10} = 2/5(= 40\%)$ och $P(A) = 1 - P(B) = 3/5(= 60\%)$. $A$ och $B$ är komplementära, så $P(A) + P(B) = 1$. Klassisk sannolikhet: $n = \binom{5}{2} = \frac{5 \cdot 4}{2 \cdot 1} = 10$ och $m = v + s = 1 + 3 = 4$ (två vita ger 1, två svarta ger $\binom{3}{2} = 3$). |
| HT2022 Tentamen januari U9 | Inklusion–exklusion | Antag att $A, B, C$ uppfyller (1) $P(A) = P(B) = P(C)$, (2) $P(A \cap B) = P(B \cap C) = P(C \cap A)$, (3) någon av $A, B, C$ inträffar alltid, (4) alla kan inte inträffa samtidigt. Antag att det alltid är dubbelt så sannolikt att precis en inträffar som att precis två gör det. Beräkna $P(A)$ och $P(A \cap B)$. | $P(A) = x = \frac{4}{9}$ respektive $P(A \cap B) = y = x/4 = \frac{1}{9}$. Sätt $P(A) = x$ och $P(A \cap B) = y$: precis två ger $3y$, precis en ger $3x - 6y$; villkoret ger $x = 4y$. Inklusion–exklusion med trippelsnitt 0 och union 1 ger $1 = \frac{9}{4}x$. |
| HT2023 KS3 U9 | Total sannolikhet | Två mynt $A, B$ med 0.5 för krona respektive klave. Process: singla $A$; blir det krona noteras "krona"; blir det klave singlas $B$ och $B$:s utfall noteras som resultat. Beräkna sannolikheten att vi efter tre omgångar har minst 2 slutresultat som är "krona". | Svaret är 27/32 (= 0.84375). Total sannolikhet ger $1 \cdot 0.5 + 0.5 \cdot 0.5 = \frac{3}{4}$ som $P(KR)$ per omgång; minst 2 av 3 krona: $P(\Omega) = P(KR)^{3} + 3 \cdot P(KR)^{2} \cdot P(KL)$, vilket ger $\frac{27}{64} + \frac{27}{64} = \frac{27}{32}$. |
| HT2023 KS4 U9 | Total sannolikhet | Två urnor $U_{1}$ och $U_{2}$ med en svart och två vita kulor var. Slå en sexsidig tärning; vid utfallen 1, 2, 3 eller 4 läggs en extra vit kula i båda urnorna. Sedan tas en kula ur varje urna. Vad är sannolikheten att de tagna kulorna har olika färger? | Svaret är 43/108 ($\approx 40\%$). Total sannolikhet över $X$ = extra kulor, $P(X) = 4/6 = 2/3$: med extra kulor $\frac{3}{4} \cdot \frac{1}{4} + \frac{1}{4} \cdot \frac{3}{4} = \frac{6}{16} = \frac{3}{8}$, utan extra $\frac{2}{3} \cdot \frac{1}{3} + \frac{1}{3} \cdot \frac{2}{3} = \frac{4}{9}$; väg ihop: $P(O) = P(O \mid X) \cdot P(X) + P(O \mid X^{c}) \cdot P(X^{c}) = \frac{3}{8} \cdot \frac{2}{3} + \frac{4}{9} \cdot \frac{1}{3} = \frac{1}{4} + \frac{4}{27} = \frac{27 + 16}{4 \cdot 27} = \frac{43}{108}$. |
| HT2023 Tentamen januari U9 | Total sannolikhet | En fabrik har två maskiner $A$ och $B$ som tillverkar all produktion. $A$ ger en felaktig produkt i 2% av fallen, $B$ i 5%. Om man accepterar att 3% av totala produktionen är felaktig, hur stor andel ska ske vid $A$ respektive $B$? | $A$ gör 2/3 och $B$ gör 1/3 ($b = 1/3 \Rightarrow a = 2/3$). Total sannolikhet för en felaktig produkt: $0.03 = 0.02 \cdot P(T_{A}) + 0.05 \cdot P(T_{B}) \Leftrightarrow 3 = 2a + 5b$; lös ekvationssystemet $2a + 5b = 3$ och $a + b = 1$. |

| HT2023 Omtentamen april U9 | Betingad sannolikhet | Från en vanlig kortlek med 52 kort dras två kort utan återläggning ("kort 1" och "kort 2"). Beräkna (a) kort 1 är ett ess, (b) kort 2 är ett ess, (c) båda korten är ess, (d) kort 2 är ett ess givet att kort 1 är ett ess. | (a) och (b) $P(E_{1}) = P(E_{2}) = 1/13$. (c) $P(E_{1} \cap E_{2}) = m/n = \frac{\binom{50}{2}}{\binom{52}{4}}$, lika med $\frac{1}{13 \cdot 17}$. (d) $\frac{P(E_{1} \cap E_{2})}{P(E_{1})} = \frac{\frac{1}{13 \cdot 17}}{\frac{1}{13}} = \frac{1}{17}$. Klassisk sannolikhet via platsval för essen, $P(E_{1}) = m/n = \frac{\binom{51}{3}}{\binom{52}{4}}$. |
| HT2024 KS3 U9 | Betingad sannolikhet | I en population undersöks egenskaperna $E_{1}$, $E_{2}$ och $E_{3}$: $\frac{2}{5}$ har $E_{3}$, $\frac{1}{12}$ har både $E_{1}$ och $E_{2}$, $\frac{1}{5}$ har både $E_{1}$ och $E_{3}$, och det är lika vanligt att individer med $E_{2}$ också har $E_{1}$ som att individer med $E_{3}$ också har $E_{1}$. Vad är sannolikheten att en vald individ har $E_{2}$? | Svaret är 1/6 ($B$ = har $E_{2}$). Betingad sannolikhet med $P(A \mid B) = P(A \mid C)$: $P(B) = \frac{P(A \cap B)}{P(A \mid C)} = \frac{P(A \cap B)}{\left( \frac{P(A \cap C)}{P(C)} \right)} = \frac{P(A \cap B)P(C)}{P(A \cap C)} = \frac{\frac{1}{12} \cdot \frac{2}{5}}{\frac{1}{5}} = \frac{1}{6}$. |
| HT2024 Tentamen januari U9 | Klassisk sannolikhet | En kortlek med 52 kort, fyra färger med 13 valörer. De två första korten är hjärter 5 och hjärter 6 och man får totalt fem kort. Vad är troligast: alternativ 1) de fem korten bildar en stege, eller alternativ 2) de fem korten har alla samma färg? | Alternativ 1 (stege) är troligast. Klassisk sannolikhet för de tre sista korten: stege $\frac{4^{4}}{50 \cdot 49 \cdot 8} = \frac{32}{50 \cdot 49}$ och färg $\frac{11 \cdot 5 \cdot 3}{50 \cdot 49 \cdot 8} = \frac{33}{10 \cdot 49}$ (med $\binom{11}{3}$ hjärter kvar och $\binom{50}{3}$ kort totalt); jämför sannolikheterna. (Källan tappar en faktor 8 i färgnämnaren, men slutsatsen stämmer.) |
| HT2024 Omtentamen april U9 | Sannolikhetsbevis | Låt $X$ och $Y$ vara händelser i ett utfallsrum där $P(X) > 0$. Visa att $P(X \cap Y \mid X \cup Y) \leq P(X \cap Y \mid X)$. | Gäller (bevisat). Definitionen ger $P(X \cap Y \mid X \cup Y) = \frac{P(X \cap Y)}{P(X \cup Y)}$ och $\frac{P(X \cap Y)}{P(X)} = P(X \cap Y \mid X)$; eftersom $P(X \cup Y) \geq P(X)$ följer $P(X \cap Y \mid X \cup Y) = \frac{P(X \cap Y)}{P(X \cup Y)} \leq \frac{P(X \cap Y)}{P(X)} = P(X \cap Y \mid X)$. |
| HT2025 Tentamen U9 | Bayes sats | Vid en kurs läser 30% av studenterna på distans och 70% på campus. Av distansstudenterna klarade 80% kursen, av campusstudenterna 90%. Vad är sannolikheten att en slumpmässigt vald student som klarat kursen läste kursen på campus? | Svaret är 21/29 ($\approx 0.724$). Total sannolikhet: $P(E) = 0.8 \times 0.3 + 0.9 \times 0.7 = 0.24 + 0.63 = 0.87$; Bayes sats: $P(D^{c} \mid E) = \frac{P(E \mid D^{c})P(D^{c})}{P(E)} = \frac{0.9 \times 0.7}{0.87} = \frac{63}{87} = \frac{21}{29}$. |
| HT2025 Omtentamen april U9 | Total sannolikhet | Tre urnor: $U_{1}$ en blå, en röd och en gul boll, $U_{2}$ en blå och en röd, $U_{3}$ en blå och en gul. Steg 1: ta en boll ur $U_{1}$. Steg 2: var bollen blå tas en till ur $U_{1}$, var den röd tas en ur $U_{2}$, var den gul tas en ur $U_{3}$. Beräkna sannolikheten att de två tagna bollarna har samma färg. | Svaret är 1/3. Total sannolikhet över första bollens färg ($P(B) = P(R) = P(G) = 1/3$): $P(S \mid B) = 0$ (ingen blå kvar), $P(S \mid R) = 1/2$, $P(S \mid G) = 1/2$, så $P(S) = (0 + 1/2 + 1/2)/3 = 1/3$. |

## Högrebetygsuppgifter

**inget eget område – överbetygsuppgiften sätter betyget, och kan ibland täcka ett område.** Uppgifter i underlaget: 22, från 13 av 53 sittningar.

### Typer

| Typ | Uppgifter | Sittningar | Första–senaste | Varav HT2024–HT2025 |
| --- | --- | --- | --- | --- |
| Talteori och kongruenser | 6 | 6 | HT2019–HT2023 | 0 |
| Relationsegenskaper | 5 | 5 | HT2019–HT2024 | 1 |
| Induktionsbevis | 4 | 4 | HT2021–HT2025 | 1 |
| Grafbevis | 3 | 3 | HT2019–HT2025 | 1 |
| Sannolikhetslära | 2 | 2 | HT2019–HT2020 | 0 |
| Kombinatorisk identitet | 1 | 1 | HT2023–HT2023 | 0 |
| Funktionsbevis | 1 | 1 | HT2024–HT2024 | 1 |

- **Induktionsbevis** – visa att ett påstående gäller för alla heltal från ett startvärde, med vanlig eller stark matematisk induktion.
- **Talteori och kongruenser** – delbarhet, Bézout, Euklides algoritm och system av kongruenser.
- **Relationsegenskaper** – avgör och bevisa reflexivitet, symmetri, antisymmetri och transitivitet för en given relation (eller en variant som cirkulär relation).
- **Grafbevis** – bevisa en egenskap hos ett träd eller en graf, eller resonera om minsta uppspännande träd.
- **Sannolikhetslära** – konstruera ett utfallsrum med givna villkor eller räkna fram ett antal med betingad och total sannolikhet.
- **Kombinatorisk identitet** – bevisa en räkneformel, till exempel formeln för multinomialkoefficienten.
- **Funktionsbevis** – bevisa en egenskap hos en funktion eller avbildning, till exempel att en potens av en bijektion blir identiteten.

### Vad uppgifterna ber om

Detta är den sista uppgiften på skrivningen (Uppgift 10, och i de äldsta designerna även 11, 12 och 13). Den är märkt "För betyg C", "För betyg A", "Högrebetygsuppgift" eller "Betygshöjande uppgift" och styr bara betyget, inte om du blir godkänd.

Rubriken säger nästan alltid vilket grundområde uppgiften också kan täcka, och i HT2025 Tentamen U10 står det rakt ut att uppgiften "kan ersätta område 7" — löser du den helt räknas ett grundområde som klarat.

Nästan alltid ber uppgiften om ett **bevis** ("Visa att", "Bevisa att", "Avgör om"), inte ett räknesvar. Ett löst räknetal räcker inte.

För ett induktionsbevis måste både basfallet och induktionssteget visas, och HT2021 Omtentamen april U10 säger uttryckligen att du "dels [behöver] visa formeln ... och dels visa att alla dessa gnomoner verkligen täcker över kvadraten".

För en relationsuppgift ska varje egenskap antingen bevisas eller motbevisas med motexempel: HT2019 Tentamen januari U12 säger "Om relationen har egenskapen, bevisa det, om relationen inte har egenskapen, bevisa att den inte har den egenskapen."

I diagramuppgiften HT2020 Tentamen januari U11 räcker det inte med alla rätt: "För att få godkänt på uppgiften ska minst 7 diagram vara korrekta. (Det är ok att missa ett alltså.)"

En *Ledning* finns ofta med och pekar ut metoden (HT2019 Tentamen januari U10 leder till binomialkoefficienten; HT2024 Omtentamen april U10 ber dig först visa ett hjälppåstående med induktion).

**De senaste åren (HT2024–HT2025):** en enda uppgift, märkt "Högrebetygsuppgift", utan uppdelning i flera deluppgifter. Den har varit ett funktionsbevis (HT2024 Tentamen januari U10), en relationsuppgift som använder induktion som hjälpsteg (HT2024 Omtentamen april U10), ett grafbevis om minsta uppspännande träd (HT2025 Tentamen U10) och ett induktionsbevis (HT2025 Omtentamen april U10). Induktion och bevis om relationer/grafer är alltså det du bäst bör öva inför den här uppgiften.

### Så löser lösningsförslagen uppgifterna

**Induktionsbevis**

1. Inför ett predikat som är exakt det påstående som ska gälla för varje n (HT2023 Tentamen januari U10, HT2025 Omtentamen april U10).
2. Visa basfallet: sätt in minsta värdet och kontrollera att påståendet stämmer där (HT2025 Omtentamen april U10, HT2023 Tentamen januari U10).
3. Anta induktionsantagandet (vid stark induktion: för alla värden upp till p) och skriv ut vad steget till p+1 påstår (HT2021 Tentamen januari U11, HT2024 Omtentamen april U10).
4. Härled p+1-fallet ur antagandet genom att bygga på nästa steg, till exempel dela upp mängden eller slå ihop fyra delövertäckningar (HT2023 Tentamen januari U10, HT2021 Omtentamen april U10).
5. Avsluta med att basfall, induktionssteg och induktionsaxiomet tillsammans ger påståendet (HT2025 Omtentamen april U10, HT2021 Tentamen januari U11).

Fallgropar: vid stark induktion måste antagandet gälla alla värden upp till p, inte bara p (HT2021 Tentamen januari U11); i en geometrisk induktion räcker det inte att räkna antalet, du måste också visa att konstruktionen finns (HT2021 Omtentamen april U10).

**Talteori och kongruenser**

1. Skriv om en kongruens som en heltalslikhet (x ≡ a mod n blir x = a + nk; a delar b blir b = ak) (HT2020 Tentamen januari U10, HT2022 Tentamen januari U10).
2. Ställ upp en Bézout-likhet och motivera att lösning finns med gcd — två skilda primtal är alltid relativt prima (HT2020 Tentamen januari U10, HT2023 Omtentamen april U10).
3. Kör Euklides utvidgade algoritm baklänges för att få koefficienterna, och därmed den multiplikativa inversen (HT2022 Tentamen januari U10, HT2020 Tentamen januari U10).
4. Slå ihop delbarheterna: om de två modulerna är relativt prima gäller resultatet modulo deras produkt (HT2022 Tentamen januari U10).

Fallgropar: en del (b)-fråga vill ha ett generellt argument, inte bara exemplet — peka på att inget i beviset använde just de talen (HT2020 Tentamen januari U10). Två uppgifter använder en helt egen metod: HT2019 Tentamen januari U10 utnyttjar att binomialkoefficienten är ett heltal, och HT2021 Omtentamen april U11 översätter delbarhetssystemet till en matrisekvation och sätter determinanten till noll.

**Relationsegenskaper**

1. Gå igenom egenskaperna en i taget och skriv ut definitionen för var och en innan du prövar den (HT2020 Omtentamen april U10, HT2019 Tentamen januari U12).
2. För att visa en egenskap: anta förledet för godtyckliga element och härled efterledet ur relationens definition (HT2020 Omtentamen april U10).
3. För att motbevisa en egenskap: ge ett konkret motexempel där förledet gäller men inte efterledet (HT2019 Tentamen januari U12).
4. Vid matrisdiagram: läs reflexivitet ur diagonalen och symmetri ur speglingen i diagonalen, och pröva transitivitet genom att systematiskt gå igenom alla val av x, y, z (HT2020 Tentamen januari U11).

Fallgropar: en cirkulär relation visas enklast genom att relationen är symmetrisk och transitiv (HT2024 Omtentamen april U10); ett exempel räcker aldrig för att visa en egenskap, argumentet måste gälla godtyckliga element (HT2019 Tentamen januari U12).

**Grafbevis**

1. För en motsägelse: anta motsatsen, till exempel att alla hörn har grad högst 2, och härled en orimlighet (HT2019 Tentamen januari U11).
2. Bygg argumentet på grafens definitioner — ett träd är sammanhängande, så det finns en väg mellan två hörn (HT2019 Tentamen januari U11).
3. Vid minsta uppspännande träd: resonera utifrån Kruskals algoritm och gör en falluppdelning på de okända kantvikterna (HT2025 Tentamen U10).
4. Räkna antalet minsta uppspännande träd genom att se på hur många sätt det sista kantvalet kan göras (HT2025 Tentamen U10).

Fallgrop: HT2025 Tentamen U10:s lösning har en tryckt slarvformulering i slutsatsen ("x ≥ 6 och x = 5", rimligen y = 5) — luta dig på symmetrin i stället.

**Sannolikhetslära**

1. Inför händelser och skriv problemets villkor som likheter mellan sannolikheter (HT2020 Omtentamen april U11, HT2019 Tentamen januari U13).
2. Vid konstruktion: utnyttja symmetri och sätt vissa sannolikheter lika, så att få obekanta återstår, och lös ekvationen villkoren ger (HT2019 Tentamen januari U13).
3. Vid beräkning: använd satsen om total sannolikhet och de betingade sannolikheterna, sätt in talen och lös (HT2020 Omtentamen april U11).
4. Kontrollera att valet ger ett giltigt utfallsrum, alltså att sannolikheterna summerar till högst 1 (HT2019 Tentamen januari U13).

Fallgropar: svaret ska vara ett helt antal personer, så avrunda nedåt (HT2020 Omtentamen april U11); parvis oberoende medför inte att alla tre händelser är oberoende (HT2019 Tentamen januari U13).

**Kombinatorisk identitet**

1. Tolka storheten som en process i steg: välj först elementen till delmängd 1, sedan till delmängd 2, och så vidare (HT2023 Omtentamen april U11).
2. Använd multiplikationsprincipen och skriv varje steg som ett binomialtal (HT2023 Omtentamen april U11).
3. Skriv ut binomialtalen som fakulteter och förkorta teleskopartat tills bara den sökta formeln står kvar (HT2023 Omtentamen april U11).

Fallgrop: använd att 0! = 1 i den sista faktorn (HT2023 Omtentamen april U11).

**Funktionsbevis**

1. Utnyttja att mängden är ändlig: en följd av upprepade bilder av ett element måste till slut återvända till elementet (HT2024 Tentamen januari U10).
2. Bygg vidare element för element — hitta en potens som fixerar första elementet, sedan en som också fixerar det andra, och så vidare (HT2024 Tentamen januari U10).
3. Slutfunktionen fixerar alla element och är en potens av f, alltså är den identiteten (HT2024 Tentamen januari U10).

### Formelsamlingen och kapitlet

Högrebetygsuppgifterna har inget eget avsnitt i formelsamlingen, utan lånar från grundområdenas avsnitt. De drar framför allt på avsnitt 2 Mängdlära (kartesisk produkt, snitt, komplement, kardinalitet), 3 Funktioner (bijektiv, invers, identitet, sammansättning), 4 Inledande talteori (divisionsalgoritmen, Bézouts sats, Euklides algoritm, kongruenslagarna), 7 Grafteori (Kruskals, Prims och Dijkstras algoritmer samt Eulers handskakningslemma) och 8 Kombinatorik (binomial- och multinomialtal, urvalstabellen). Flera av de områden uppgifterna "kan täcka" har däremot **inget** avsnitt alls på bladet: 5 Relationer, 6 Fördjupad talteori och 9 Sannolikhetslära saknas, och under 7 Grafteori står rubriken "Definitioner" tom.

Det här behöver uppgifterna men formelsamlingen ger inte:

- **Matematisk induktion** — hela bevisstrukturen med predikat, basfall och induktionssteg står inte på bladet, trots att det är en vanlig metod här (HT2025 Omtentamen april U10, HT2023 Tentamen januari U10).
- **Stark induktion** — antagandet om alla värden upp till p (HT2021 Tentamen januari U11).
- **Relationsegenskaperna** reflexiv, symmetrisk, antisymmetrisk, transitiv — inget avsnitt 5 (HT2019 Tentamen januari U12, HT2020 Omtentamen april U10).
- **Ekvivalensrelation** som begrepp (HT2019 Hemtentamen april U10).
- **Grafbegreppen** träd, löv, väg, sammanhängande, bipartit, eulercykel, hamiltoncykel och uppspännande träd — grafavsnittets "Definitioner" är tomt (HT2019 Tentamen januari U11, HT2019 Hemtentamen april U11, HT2025 Tentamen U10).
- **Sannolikhet**: oberoende händelser, betingad sannolikhet och satsen om total sannolikhet — inget avsnitt 9 (HT2019 Tentamen januari U13, HT2020 Omtentamen april U11).
- **Multiplikativ invers modulo n** — bladet ger Bézout och Euklides men inte själva inverssteget (HT2022 Tentamen januari U10).
- **Multiplikationsprincipen** som namngiven regel — multinomialtalet står på bladet, men inte metoden att härleda det (HT2023 Omtentamen april U11).
- **Determinant och radoperationer** på en 3×3-matris — ingen linjär algebra på bladet (HT2021 Omtentamen april U11).

### Uppgifter som återkommer

Inga uppgifter återkommer ordagrant.

### Mönsterlösningar

- **Induktionsbevis**: HT2025 Omtentamen april U10
- **Talteori och kongruenser**: HT2022 Tentamen januari U10
- **Relationsegenskaper**: HT2024 Omtentamen april U10
- **Grafbevis**: HT2025 Tentamen U10
- **Sannolikhetslära**: HT2020 Omtentamen april U11
- **Kombinatorisk identitet**: HT2023 Omtentamen april U11
- **Funktionsbevis**: HT2024 Tentamen januari U10

### Alla uppgifter

| ID | Typ | Uppgiften i korthet | Svar och metod i korthet |
| --- | --- | --- | --- |

| HT2019 Tentamen januari U10 | Talteori och kongruenser | (Kan täcka område 4.) Visa att, för alla heltal $n \geq 0$ gäller $n! \mid (2n) \cdot (2n - 1) \cdot \ldots \cdot (n + 1)$. Ledning: studera binomialkoefficienten $\binom{2n}{n}$. | Antag $\binom{2n}{n} = k$ (ett heltal). Eftersom $(2n)!$ innehåller faktorn $n!$ blir $\frac{2n \cdot (2n - 1) \cdot \ldots \cdot (n + 1)}{n!} = k$ efter förkortning — alltså ett heltal, vilket är just delbarheten. Bevis klart. |
| HT2019 Tentamen januari U11 | Grafbevis | (Kan täcka område 7.) Om ett träd har tre löv, visa att det måste ha minst ett hörn av minst grad 3. | Motsägelsebevis: anta att alla hörn har grad högst 2 men att tre löv $a, b, c$ finns. Vägarna från $a$ till $b$ och från $a$ till $c$ tvingas sammanfalla hörn för hörn (annars får ett hörn grad $\geq 3$), så $b = c$ — motsägelse. Alltså finns ett hörn av grad minst 3. |
| HT2019 Tentamen januari U12 | Relationsegenskaper | (Kan täcka område 5.) Relationen $\mathcal{R}$ på $\mathbb{Z}_{8}$ ges av $x\mathcal{R}y \Leftrightarrow x - y \in U$, där $U = \{\overline{0}, \overline{2}, \overline{4}, \overline{6}\}$. Ge en fullständig utredning av reflexivitet, symmetri, antisymmetri och transitivitet (bevisa eller motbevisa var och en). | Reflexiv (ja: $\overline{x-x} = \overline{0} \in U$), symmetrisk (ja: $U$ sluten under negation), **inte** antisymmetrisk (motexempel $x = 0$ och $y = 2$: både $\overline{0}\mathcal{R}\overline{2}$ och $\overline{2}\mathcal{R}\overline{0}$ men $\overline{0} \neq \overline{2}$), transitiv (ja: $U$ sluten under addition). Varje egenskap prövas mot sin definition. |
| HT2019 Tentamen januari U13 | Sannolikhetslära | (Kan täcka område 9.) Konstruera ett utfallsrum med tre händelser $A, B, C$ som är parvis oberoende ($P(A \cap B) = P(A) \cdot P(B)$ osv.) men där $P(A \cap B \cap C) \neq P(A) \cdot P(B) \cdot P(C)$. Ange värden på $a, b, c, x, y, z, w$. Ledning: börja med $w = 0$ och $a=b=c$, $x=y=z$. | Med $w = 0$, $a = b = c$, $x = y = z$ blir kravet $(a + 2x)^{2} = x$. Välj $x = 0.04$; då blir de tre sannolikheterna lika med 0.2, de parvisa snitten 0.04 (som är $0.04 = 0.2^{2}$), medan trippelsnittet 0 skiljer sig från produkten 0.008. Valet ger ett giltigt utfallsrum. |
| HT2019 Hemtentamen april U10 | Relationsegenskaper | (Kan täcka område 5.) $U$ och $V$ disjunkta; $\mathcal{R}$ ekvivalensrelation på $U$, $\mathcal{S}$ ekvivalensrelation på $V$. Relationen $\mathcal{T}$ på $U \cup V$ ges av $x\mathcal{T}y \Leftrightarrow x\mathcal{R}y \lor x\mathcal{S}y$. Bevisa att $\mathcal{T}$ också är en ekvivalensrelation. | Lösning saknas i underlaget. |
| HT2019 Hemtentamen april U11 | Grafbevis | (Kan täcka område 7.) Låt $G = (V, E)$ vara en bipartit sammanhängande graf där alla hörn har grad 2. Visa att grafen har en eulercykel som också är en hamiltoncykel. | Lösning saknas i underlaget. |

| HT2020 Tentamen januari U10 | Talteori och kongruenser | (Kan täcka område 4.) (a) Finn ett heltal $x$ med $x \equiv 0 \pmod{13} \quad \text{och} \quad x \equiv 1 \pmod{17}$. (b) Om $p, q$ är två skilda primtal, kan vi alltid hitta ett $x$ med $x \equiv 0 \pmod{p} \quad \text{och} \quad x \equiv 1 \pmod{q}$? Bevisa ditt påstående. | (a) $x = 4 \cdot 13 = 52$. Skriv $x = s \cdot 13$; kravet ger $13 \cdot s + 17 \cdot t = 1$, som har lösning då $GCD(13, 17) = 1$ (Bézout). Euklides utvidgade ger $1 = 4 \cdot 13 - 3 \cdot 17$. (b) Ja — inget i (a) utom talen berodde på just 13 och 17; skilda primtal är relativt prima, så samma argument gäller alla $p, q$. |
| HT2020 Tentamen januari U11 | Relationsegenskaper | (Kan täcka område 5.) På $A = \{a, b, c\}$ ritas relationer som kryssmatriser. Rita 8 diagram vars relationer tillsammans har alla 8 kombinationer av reflexivitet, symmetri och transitivitet, och märk varje med sin bokstavskombination (t.ex. "R-T" = reflexiv, inte symmetrisk, transitiv). Minst 7 ska vara korrekta för godkänt. | Fullständig konstruktion med matriser. Utgå från de fyra diagrammen för reflexivitet och symmetri (diagonal ifylld = reflexiv, spegling i diagonalen = symmetrisk) och ändra varje litet för att lägga till eller ta bort transitivitet, som prövas genom att gå igenom alla val av $x, y, z$. Ger alla 8 kombinationer. |
| HT2020 Omtentamen april U10 | Relationsegenskaper | (Kan täcka område 5.) Ett monom i två variabler är $x^{n}y^{m}$ ($n$ och $m$ heltal $\geq 0$). Relationen ges av $x^{n_{1}}y^{m_{1}}\mathcal{R}x^{n_{2}}y^{m_{2}} \iff n_{1} < n_{2} \text{ eller } (n_{1} = n_{2} \text{ och } m_{1} \leq m_{2})$. Visa att relationen är reflexiv, antisymmetrisk och transitiv. | Alla tre gäller (en lexikografisk ordning). Reflexiv: $n=n$ och $m \leq m$. Antisymmetrisk: båda hållen tvingar $n_{1}=n_{2}$, och $m_{1} \leq m_{2}$, $m_{2} \leq m_{1}$ ger $m_{1}=m_{2}$. Transitiv: falluppdelning på om $n$-värdena är lika eller växer. Varje egenskap prövas mot definitionen. |
| HT2020 Omtentamen april U11 | Sannolikhetslära | (Kan täcka område 9.) I en vaccinstudie med $N = 43538$ personer (hälften vaccinerade) smittades 94. "Minst 90% effektivt" tolkas som att smittrisken för en vaccinerad är högst 10% av smittrisken för en ovaccinerad. Beräkna största antalet smittade bland de vaccinerade som är förenligt med 90%-ig effektivitet. | Max 8 vaccinerade smittade. Använd satsen om total sannolikhet för händelserna "smittad" och "vaccinerad", med villkoret att den betingade smittrisken för vaccinerade är en tiondel av den för ovaccinerade; det ger $94 = 11 \cdot x$, alltså $x = \frac{94}{11}$, ungefär 8.5, avrundat nedåt till 8. |
| HT2021 Tentamen januari U10 | Talteori och kongruenser | (Kan täcka område 4.) Låt $m$ vara ett positivt heltal och $\overline{x}$ restklassen i $\mathbb{Z}_{m}$. Visa att $m > 2 \Rightarrow \vert\{\overline{1^{2}}, \overline{2^{2}}, \ldots, \overline{m^{2}}\}\vert < m$. | Gäller. Välj $i = 1$ och $j = m-1$ (olika element då $m > 2$). Då är $\overline{(m-1)^{2}} = \overline{m^{2} - 2m + 1} = \overline{1} = \overline{1^{2}}$, så två element i listan sammanfaller och antalet distinkta restklasser blir mindre än $m$. |
| HT2021 Tentamen januari U11 | Induktionsbevis | (Kan täcka område 6.) En differensekvation av andra graden $a_{n+2} = pa_{n+1} + qa_{n}$ ($q \neq 0$). Visa med stark induktion: om $r_{1}, r_{2}$ är lösningarna till den karakteristiska ekvationen $r^{2} = pr + q$ med $r_{1} \neq r_{2}$, så finns konstanter $C, D$ sådana att $a_{n} = Cr_{1}^{n} + Dr_{2}^{n}$ för $n = 0, 1, 2, \ldots$. | Gäller. Steg 1: $a_{0}, a_{1}$ ger ett ekvationssystem i $C, D$ vars determinant $r_{2} - r_{1}$ är nollskild (ty $r_{1} \neq r_{2}$), så $C, D$ finns entydigt. Steg 2: anta påståendet för alla index upp till $n+1$, sätt in rekursionen och använd att $r_{1}, r_{2}$ löser $r^{2} = pr + q$ för att få $a_{n+2} = Cr_{1}^{n+2} + Dr_{2}^{n+2}$. Stark induktion. |

| HT2021 Omtentamen april U10 | Induktionsbevis | (Kan täcka område 6.) En kvadrat med sidan $2^{n}$ rutor. En gnomon är en L-form av tre rutor (fyller en 2×2-ruta utom en). Bevisa med matematisk induktion att varje sådan kvadrat kan täckas av $(2^{2n} - 1)/3$ gnomoner så att endast en ruta i ett hörn lämnas otäckt. Visa både formeln och att övertäckningen finns. | Gäller. Basfallet $n = 1$ är givet. Induktionssteg: ta fyra övertäckningar av kvadrater med sidan $2^{p}$, lägg i ett 2×2-mönster så att tre otäckta rutor möts i mitten och fyll dem med en extra gnomon; den fjärde otäckta rutan hamnar i hörnet. Antalet gnomoner blir de fyra delarnas plus en, vilket räknas ihop till $(2^{2n} - 1)/3$ med $n = p + 1$. Geometrisk induktion. |
| HT2021 Omtentamen april U11 | Talteori och kongruenser | (Kan täcka område 4.) Heltal $a, b, c$ med $a \mid b + c$, $b \mid a + c$, $c \mid a + b$, skrivet $b + c = ak_1$, $a + c = bk_2$, $a + b = ck_3$. I specialfallet $k_1 = k_2 = k_3$ (gemensamt värde $k$): undersök för vilka $a, b, c, k$ detta är möjligt då minst en av $a, b, c$ är skild från noll. | Möjligt bara för $k = -1$ och $k = 2$. Skriv systemet som en matrisekvation; icke-trivial lösning kräver determinanten noll, vilket ger $(k - 2)(k + 1)^{2} = 0$. För $k = -1$: alla $a, b, c$ med $a + b + c = 0$ (ej alla noll), t.ex. $a=1, b=2, c=-3$. För $k = 2$: $a = b = c$, t.ex. $a=b=c=2$. |
| HT2022 Tentamen januari U10 | Talteori och kongruenser | (Kan täcka område 4.) Finn alla heltal $x$ som uppfyller systemet $\begin{cases} 5x \equiv 2 \pmod{7} \\ 7x \equiv 2 \pmod{5} \end{cases}$. Ledning: med "system" menas att båda kongruenserna ska vara uppfyllda. | $x \equiv 6 \pmod{35}$. Euklides utvidgade ger $1 = 3 \cdot 7 - 4 \cdot 5$, så inversen av 5 mod 7 och av 7 mod 5 är båda 3. Multiplicera varje kongruens med 3: $x \equiv 6 \pmod{7}$ och $x \equiv 6 \pmod{5}$; då 5 och 7 är relativt prima blir det $x \equiv 6 \pmod{35}$. |
| HT2023 Tentamen januari U10 | Induktionsbevis | (Kan täcka område 2 eller 6.) Låt $A, B$ vara godtyckliga mängder. Bevisa med matematisk induktion över heltal $n \geq 1$ att $\vert A \cap B \vert = n \Rightarrow \vert(A \times B) \cap (B \times A)\vert = n^{2}$. | Gäller. Predikat $Q(n)$. Basfall $Q(1)$: ett gemensamt element $x$ ger snittet $\{(x,x)\}$, alltså $1 = 1^{2}$. Steg: lyft bort ett gemensamt element, dela upp de två produkterna och använd $Q(p)$; de disjunkta bitarna ger $p^{2} + 2p + 1 = (p+1)^{2}$. Induktion över $n$. |
| HT2023 Omtentamen april U10 | Talteori och kongruenser | (Kan täcka område 4.) Visa följande variant av Bezouts sats: för godtyckliga heltal $a, b, c$ gäller att om två av dem är relativt prima varandra så finns heltal $x, y, z$ sådana att $xa + yb + zc = 1$. | Gäller. Antag $\gcd(a, b) = 1$, så $x'a + y'b = 1$ för några $x', y'$. Multiplicera med $(1 - z)$ och flytta om: $x'(1-z)a + y'(1-z)b + z = 1$, så $x = x'(1-z)$, $y = y'(1-z)$, $z = 1$ duger. Analogt om ett annat par är relativt prima. |
| HT2023 Omtentamen april U11 | Kombinatorisk identitet | (Kan täcka område 8.) Multinomialkoefficienten $\binom{n}{n_{1}, n_{2}, \ldots, n_{k}}$ anger antalet sätt att partitionera en mängd med $n$ element i $k$ delmängder med $n_{1}, \ldots, n_{k}$ element. Visa att $\binom{n}{n_{1}, n_{2}, \ldots, n_{k}} = \frac{n!}{n_{1}! \cdot n_{2}! \cdot \ldots \cdot n_{k}!}$. | Gäller. Se partitioneringen som $k$ steg (först välja $n_{1}$ element av $n$, sedan $n_{2}$ av de kvarvarande, och så vidare); multiplikationsprincipen ger en produkt av binomialtal. Skriv ut dem som fakulteter; alla täljare utom $n!$ förkortas teleskopartat, och kvar blir $\frac{n!}{n_{1}! \cdot n_{2}! \cdot \ldots \cdot n_{k}!}$. |

| HT2024 Tentamen januari U10 | Funktionsbevis | (Område ej angivet i rubriken.) Låt $A$ vara en ändlig mängd och $f : A \to A$ en bijektiv funktion. Definiera $f^{n}$ rekursivt genom $f^{1} = f$ och $f^{n+1} = f \circ f^{n}$. Bevisa att det för något positivt heltal $m$ gäller att $f^{m}$ är identitetsfunktionen $\iota_{A}$. | Gäller. Eftersom $A$ är ändlig återvänder följden av upprepade bilder av $a_{1}$ till $a_{1}$, så någon potens fixerar $a_{1}$ (och alla multiplar av den). Upprepa element för element tills en potens $h$ fixerar alla element; $h$ är då identiteten $\iota_{A}$ och en potens av $f$. Ändlighetsargument. |
| HT2024 Omtentamen april U10 | Relationsegenskaper | (Område ej angivet i rubriken.) En relation $\mathcal{R}$ på $M$ är cirkulär om $x\mathcal{R}y \land y\mathcal{R}z \Rightarrow z\mathcal{R}x$ för alla $x, y, z$. $S : \mathbb{R}^{n} \to \mathbb{R}^{n}$ uppfyller $S(x) \neq x$ för $x \neq 0$ och $S^{4}(x) = x$. Definiera $x_{1}\mathcal{R}x_{2} \Leftrightarrow x_{1} = S^{k}(x_{2})$ för något positivt heltal $k$. Avgör om $\mathcal{R}$ är cirkulär. | Ja, $\mathcal{R}$ är cirkulär. Visa först med induktion att $S^{4m}(x) = x$ för alla positiva $m$. Visa sedan att $\mathcal{R}$ är symmetrisk (välj $m$ med $k + m = 4l$) och transitiv (av $x_{1} = S^{k}(x_{2})$ och $x_{2} = S^{m}(x_{3})$ fås $S^{k+m}(x_{3})$); symmetrisk plus transitiv ger cirkulär. |
| HT2025 Tentamen U10 | Grafbevis | (Kan täcka/ersätta område 7.) En viktad graf på 12 hörn A–L i ett 3×4-rutnät; de flesta kantvikter är givna (vikterna 1, 2, 3 och kanten FG har vikt 5), men kanten BC har vikt $x$ och kanten JK har vikt $y$, där $x, y$ är två positiva heltal. För vilka $(x, y)$ har grafen exakt två minsta uppspännande träd? Ge ett fullständigt resonemang. | Exakt två minsta uppspännande träd då $(x, y) = (1, 1), (2, 2), (3, 3)$ eller $(4, 4)$, samt då $x = 5$ och $y \geq 6$ (och det symmetriska fallet med $x$ och $y$ ombytta). Falluppdelning utifrån Kruskals algoritm: räkna på hur många sätt det sista kantvalet kan göras. (Lösningens slutmening har ett tryckfel, den skriver "$x \geq 6$" och "$x = 5$" tillsammans, där det rimligen ska stå $y$.) |
| HT2025 Omtentamen april U10 | Induktionsbevis | (Kan täcka område 6.) Välordningsprincipen: varje icketom delmängd av de naturliga talen har ett minsta element. Bevisa den med matematisk induktion. Ledning: dela upp i ändliga mängder (induktion över antal element) och oändliga (hänvisa till det ändliga fallet); de naturliga talen är $\{1, 2, 3, \ldots\}$. | Gäller. Predikat $A(n)$ = varje mängd med $n$ naturliga tal har ett minsta element. Basfall $A(1)$ trivialt. Steg: i en mängd $E$ med $p+1$ element, lyft bort ett element $e$; $E - \{e\}$ har ett minsta element $m$ enligt antagandet; jämför $e$ och $m$. För oändliga $F$: välj $x \in F$ och bilda den ändliga mängden element $< x$, som har ett minsta element. |

## Verifierat och osäkert

**Verifierat mot filerna:** att varje rad i varje gammal fil hamnade i exakt en del av underlaget, och
varje uppgift i exakt ett område (skript); att varje uppgift finns med exakt en gång i tabellerna (388
rader); att all matematik i tabellraderna står ordagrant i den sittningens egen källtext (skript); att de
17 uppgifter som saknar facit är märkta så; kursens regler för HT2026 ur KursPM och detaljplanering.
Varje område skrevs av en analytiker och granskades rad för rad mot underlaget av en annan.

**Osäkert eller okänt:**

1. **Hjälpmedel på KS1, KS2 och tentan HT2026** — KursPM säger inget (se ovan).
2. **De gamla skrivningarna är äldre upplägg.** Ingen gammal KS2 hade exakt område 4, 7, 8. Ett
   mönster från HT2019–HT2021 är en svagare ledtråd än ett från HT2024–HT2025.
3. **Sju läsår är sju observationer.** "Vanligast" betyder vanligast i underlaget, inte att det kommer.
4. **Tryckfel i källorna** är återgivna som tryckta och nämnda i raden där de spelar roll.
5. Flera sittningar finns bara som lösningsfil; deras försättsblad med regler saknas.

## Källfiler

Alla under `KTH/2026 Höst/CM1000 Diskret Matematik/Filer/Canvas/AI-optimerad Markdown/`
(tredjepartsmaterial från Canvas, utanför git — **läs, redigera aldrig**). Kursinformationen ligger i
`Kursinformation/` (`KursPM_HT26-1.md`, `Detaljplanering_HT26.md`, `formelsamling_ht26_v01.md`),
kurslitteraturen i `Filer/Litteraturlista/kap1.md`–`kap9.md`. Figurer i tentorna är beskrivna i text i
filerna (`graf`- och `figur`-block) och finns som bilder under `assets/`.

| Sittning | Uppgiftsfil | Lösningsfil |
| --- | --- | --- |
| HT2019 KS1 | saknas | `Gamla Tentor/KS1/HT2019 KS1 - Lösningar.md` |
| HT2019 KS2 | saknas | `Gamla Tentor/KS2/HT2019 KS2 - Lösningar.md` |
| HT2019 KS3 | saknas | `Gamla Tentor/KS3/HT2019 KS3 - Lösningar.md` |
| HT2019 KS4 | saknas | `Gamla Tentor/KS4/HT2019 KS4 - Lösningar.md` |
| HT2019 Tentamen januari | saknas | `Gamla Tentor/Tentor/HT2019 Tentamen januari - Lösningar.md` |
| HT2019 Fx1 | saknas | `Gamla Tentor/Fx1/HT2019 Fx1 - Lösningar.md` |
| HT2019 Hemtentamen april | `Gamla Tentor/Tentor/HT2019 Hemtentamen april.md` | saknas |
| HT2019 Komplettering | `Gamla Tentor/Komplettering/HT2019 Komplettering.md` | saknas |
| HT2020 KS1 | saknas | `Gamla Tentor/KS1/HT2020 KS1 - Lösningar.md` |
| HT2020 KS2 | saknas | `Gamla Tentor/KS2/HT2020 KS2 - Lösningar.md` |
| HT2020 KS3 | saknas | `Gamla Tentor/KS3/HT2020 KS3 - Lösningar.md` |
| HT2020 KS4 | saknas | `Gamla Tentor/KS4/HT2020 KS4 - Lösningar.md` |
| HT2020 Tentamen januari | saknas | `Gamla Tentor/Tentor/HT2020 Tentamen januari - Lösningar.md` |
| HT2020 Fx1 | saknas | `Gamla Tentor/Fx1/HT2020 Fx1 - Lösningar.md` |
| HT2020 Omtentamen april | saknas | `Gamla Tentor/Tentor/HT2020 Omtentamen april - Lösningar.md` |
| HT2020 Fx2 | saknas | `Gamla Tentor/Fx2/HT2020 Fx2 - Lösningar.md` |
| HT2021 KS1 | `Gamla Tentor/KS1/HT2021 KS1.md` | `Gamla Tentor/KS1/HT2021 KS1 - Lösningar.md` |
| HT2021 KS2 | `Gamla Tentor/KS2/HT2021 KS2.md` | `Gamla Tentor/KS2/HT2021 KS2 - Lösningar.md` |
| HT2021 KS3 | `Gamla Tentor/KS3/HT2021 KS3.md` | `Gamla Tentor/KS3/HT2021 KS3 - Lösningar.md` |
| HT2021 KS4 | `Gamla Tentor/KS4/HT2021 KS4.md` | `Gamla Tentor/KS4/HT2021 KS4 - Lösningar.md` |
| HT2021 Tentamen januari | `Gamla Tentor/Tentor/HT2021 Tentamen januari.md` | `Gamla Tentor/Tentor/HT2021 Tentamen januari - Lösningar.md` |
| HT2021 Fx1 | `Gamla Tentor/Fx1/HT2021 Fx1.md` | `Gamla Tentor/Fx1/HT2021 Fx1 - Lösningar.md` |
| HT2021 Omtentamen april | `Gamla Tentor/Tentor/HT2021 Omtentamen april.md` | `Gamla Tentor/Tentor/HT2021 Omtentamen april - Lösningar.md` |
| HT2021 Fx2 | `Gamla Tentor/Fx2/HT2021 Fx2.md` | `Gamla Tentor/Fx2/HT2021 Fx2 - Lösningar.md` |
| HT2021 Omtentamen september | saknas | `Gamla Tentor/Tentor/HT2021 Omtentamen september - Lösningar.md` |
| HT2022 KS1 | `Gamla Tentor/KS1/HT2022 KS1.md` | `Gamla Tentor/KS1/HT2022 KS1 - Lösningar.md` |
| HT2022 KS2 | `Gamla Tentor/KS2/HT2022 KS2.md` | `Gamla Tentor/KS2/HT2022 KS2 - Lösningar.md` |
| HT2022 KS3 | `Gamla Tentor/KS3/HT2022 KS3.md` | `Gamla Tentor/KS3/HT2022 KS3 - Lösningar.md` |
| HT2022 KS4 | `Gamla Tentor/KS4/HT2022 KS4.md` | `Gamla Tentor/KS4/HT2022 KS4 - Lösningar.md` |
| HT2022 Tentamen januari | `Gamla Tentor/Tentor/HT2022 Tentamen januari.md` | `Gamla Tentor/Tentor/HT2022 Tentamen januari - Lösningar.md` |
| HT2022 Fx1 | `Gamla Tentor/Fx1/HT2022 Fx1.md` | `Gamla Tentor/Fx1/HT2022 Fx1 - Lösningar.md` |
| HT2022 Fx2 | `Gamla Tentor/Fx2/HT2022 Fx2.md` | `Gamla Tentor/Fx2/HT2022 Fx2 - Lösningar.md` |
| HT2023 KS1 | `Gamla Tentor/KS1/HT2023 KS1.md` | `Gamla Tentor/KS1/HT2023 KS1 - Lösningar.md` |
| HT2023 KS2 | `Gamla Tentor/KS2/HT2023 KS2.md` | `Gamla Tentor/KS2/HT2023 KS2 - Lösningar.md` |
| HT2023 KS3 | `Gamla Tentor/KS3/HT2023 KS3.md` | `Gamla Tentor/KS3/HT2023 KS3 - Lösningar.md` |
| HT2023 KS4 | `Gamla Tentor/KS4/HT2023 KS4.md` | `Gamla Tentor/KS4/HT2023 KS4 - Lösningar.md` |
| HT2023 Tentamen januari | `Gamla Tentor/Tentor/HT2023 Tentamen januari.md` | `Gamla Tentor/Tentor/HT2023 Tentamen januari - Lösningar.md` |
| HT2023 Fx1 | `Gamla Tentor/Fx1/HT2023 Fx1.md` | `Gamla Tentor/Fx1/HT2023 Fx1 - Lösningar.md` |
| HT2023 Omtentamen april | `Gamla Tentor/Tentor/HT2023 Omtentamen april.md` | `Gamla Tentor/Tentor/HT2023 Omtentamen april - Lösningar.md` |
| HT2023 Fx2 | `Gamla Tentor/Fx2/HT2023 Fx2.md` | `Gamla Tentor/Fx2/HT2023 Fx2 - Lösningar.md` |
| HT2024 KS1 | `Gamla Tentor/KS1/HT2024 KS1.md` | `Gamla Tentor/KS1/HT2024 KS1 - Lösningar.md` |
| HT2024 KS2 | `Gamla Tentor/KS2/HT2024 KS2.md` | `Gamla Tentor/KS2/HT2024 KS2 - Lösningar.md` |
| HT2024 KS3 | `Gamla Tentor/KS3/HT2024 KS3.md` | `Gamla Tentor/KS3/HT2024 KS3 - Lösningar.md` |
| HT2024 Tentamen januari | `Gamla Tentor/Tentor/HT2024 Tentamen januari.md` | `Gamla Tentor/Tentor/HT2024 Tentamen januari - Lösningar.md` |
| HT2024 Fx1 | `Gamla Tentor/Fx1/HT2024 Fx1.md` | `Gamla Tentor/Fx1/HT2024 Fx1 - Lösningar.md` |
| HT2024 Omtentamen april | `Gamla Tentor/Tentor/HT2024 Omtentamen april.md` | `Gamla Tentor/Tentor/HT2024 Omtentamen april - Lösningar.md` |
| HT2024 Fx2 | `Gamla Tentor/Fx2/HT2024 Fx2.md` | `Gamla Tentor/Fx2/HT2024 Fx2 - Lösningar.md` |
| HT2025 KS1 | saknas | `Gamla Tentor/KS1/HT2025 KS1 - Lösningar.md` |
| HT2025 KS2 | saknas | `Gamla Tentor/KS2/HT2025 KS2 - Lösningar.md` |
| HT2025 Tentamen | saknas | `Gamla Tentor/Tentor/HT2025 Tentamen - Lösningar.md` |
| HT2025 Fx1 | saknas | `Gamla Tentor/Fx1/HT2025 Fx1 - Lösningar.md` |
| HT2025 Omtentamen april | saknas | `Gamla Tentor/Tentor/HT2025 Omtentamen april - Lösningar.md` |
| HT2025 Fx2 | saknas | `Gamla Tentor/Fx2/HT2025 Fx2 - Lösningar.md` |
