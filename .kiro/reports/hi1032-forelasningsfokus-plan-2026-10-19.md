# Plan - HI1032: teori och kort omorganiserade efter lärarens föreläsningar, med tentasannolikhet per ämne

Datum: 2026-10-19. Status: **genomförd (F99, nedkortad i F100).** Kasiems svar ändrade planen: båda
teorifilerna skrevs om från grunden begreppsförst utan tentastrategi, Möjlig fick få kort, befintliga kort
fick skrivas om och tas bort, tentadatumet ignorerades. Det som faktiskt byggdes står i F99 i backloggen.

## Vad han bad om

Kasiem, 2026-10-19 (översatt): teorifilerna och korten är för fokuserade på gamla tentor. Han vill i
stället utgå från lärarens presentationer och "i princip lära sig allt där", ordnat efter ämne och efter
hur troligt vi bedömer att ämnet kommer på tentan han ska skriva.

Målet är fortfarande 9 av 22 poäng på båda delarna. Skälet att byta utgångspunkt finns i F97: med varje
gammal tenta som den okända gav Del B 6-12 **nya** poäng av 22, och minst 14 av de 21 nya delfrågorna stod
på föreläsningsbilderna. Del A gav 0-2 nya poäng, men det måttet räknade ämnen, inte enskilda fakta.

## Utgångsläget, mätt 2026-10-19

**Källorna.** Sju föreläsningar av examinatorn Martin Jacobsson (MJ), utom F7 som är Internetstiftelsens
gästföreläsning om DNS (CC BY 4.0). PDF:er i `Filer/Canvas/Föreläsningar och artiklar/`, konverterade i
`Filer/Canvas/AI-optimerad Markdown/Föreläsningar och artiklar/`:

| Fil | Ämnen | Sidor | Del | Konvertering |
| --- | --- | --- | --- | --- |
| F1 | transportlagret, UDP, portar, inkapsling, TCP-huvudet, etablering, terminering, tillstånd, MSS/MTU, Path MTU Discovery med DF och ICMP | 45 | A | 12 000 tecken, 33 bilder, **figurerna ej transkriberade** |
| F2 | TCP: tillstånd, numrering, ACK-regler, omsändning, RTO, Karn, timers | 33 | A | 10 000 tecken, 22 bilder, **ej transkriberade** |
| F3 | SACK, ARQ, flödeskontroll, fönster, congestion control (Tahoe, Reno, CUBIC), SCTP | 37 | A | 8 000 tecken, 28 bilder, **ej transkriberade** |
| F4 | FCAPS, övervakningsverktyg, SNMP, ASN.1/TLV, SMI, MIB-2, BER, NETCONF/YANG, prestandahantering | 41 | B | `## Transkriberat innehåll` finns |
| F5 | digital representation, sampling, kvantisering, förlustfri och förstörande kompression, DCT/JPEG, MPEG, paketering, streaming, RTP/RTCP, SIP | 50 | B | finns, men PNG-raden föll bort (F97) |
| F6 | protokolldesign, klient/server, DNS, representation, FTP, SSH, e-post, SMTP, MIME, QP, Base64, webben, HTTP/2 | 42 | B | finns; s.41 är examinatorns sammanfattning |
| F7 | DNS (gäst): domänträdet, posttyper, hosting, resolver, uppslagning, MX, CNAME | 104 | B | finns |

I figurerna i F1-F3 ligger det mesta av Del A: tillståndsdiagrammet, ACK-förloppen, cwnd-graferna och
huvudlayouterna finns bara som bilder under `AI-optimerad Markdown/assets/`.

Därutöver, under samma Canvas-rubrik: artiklarna *What is HTTP/2* (Kinsta), *HTTP/3 explained*,
`NET-2019-06-1_03` (översikt av congestion control-algoritmer), MIT-rapporten TR-494 och tcptrace-manualens
§12-13. Examinatorns **rekommenderade övningsuppgifter** ur 6:e upplagans kapitel 9-12, med lösningar i
fyra okonverterade filer `Lösningar till boken/CHAPTER_09.docx` till `CHAPTER_12.docx`. Fyra gamla tentor
med facit, klassade delfråga för delfråga i `HI1032 Tentaanalys - AI-kontext.md` avsnitt 3.

**Saknas:** kursens nionde tillfälle, *Summering* den 8/10 enligt kurs-PM:et. Om bilderna finns är de den
starkaste enskilda signalen om vad examinatorn tycker är viktigt.

**Det vi har byggt.** `HI1032 Tentasvar - Del A` (896 rader) och `Del B` (806 rader) är ordnade efter
tentans frågor: helhetsbild, pooler för fråga 1 och fråga 5, sedan de tentade blocken i rangordning.
Föreläsningsfakta finns bara i Del B, som `📍 Från föreläsningen - aldrig tentat`-block (F97).
`HI1032 Tentaplugg - Del A` har **49 kort och 49 markörer**, `Del B` **71 och 71**: varje kort har
repetitionshistorik. Ingen av de fyra har `nosr`.

**Tentan.** Skriftlig, 4 timmar, bara miniräknare. Del A och Del B, 22 poäng var, **9 krävs på båda**.
Fråga 1 och 5 är 1-2-poängsfrågor, resten block på 4-6 poäng. Tentan delar ut TCP-huvudet, de sex
ACK-reglerna, minst en tillståndsmaskin och IP-huvudet, och ibland RTO-formlerna och kodningstabellerna.
**Datumet för 2026 är okänt.** Båda tidigare ordinarie tentor låg i oktober (2024:s header säger 18/10;
2025:s header är opålitlig, AI-kontext avsnitt 6), så tentan kan vara inom dagar.

## Målbilden

1. **Steg 1 och alltid: en ny not, `HI1032 Föreläsningskarta - Ämnen och tentasannolikhet.md`.** Varje
   delämne i varje föreläsning, med sidor, nivå och beläggen för nivån. Det är det han bad om, och den
   enda filen han behöver för att välja vad han läser. Överst ett index över fråga 1- och
   fråga 5-poolerna med var varje fakta nu står, eftersom poolerna är den billigaste vägen till 9 poäng
   (Ranking-filen).
2. **Del B:s teorifil och deck byggs om efter föreläsningarna.** H2 = ämne, i föreläsningsordning, med
   nivån i rubriken. Inom ämnet: fakta från bilderna först, sedan, där ämnet tentats, tillämpningen som
   underavsnitt (Huffman, Base64, QP, DNS-uppslagningen). Faktaföre-strukturen behålls, eftersom han
   skriver av fakta för hand och ordnar sina egna anteckningar kring begreppen (`product.md`).
3. **Del A efter hans svar på fråga 3.** Förslaget: kartan för Del A byggs ändå, men teorifilen och decket
   behåller sin struktur och får bara de Trolig-delämnen som saknas, eftersom Del A är mättad och han redan
   skriver av den filen.

**Uppdelningen i Del A och Del B behålls**, eftersom kravet är 9 poäng per del. F1-F3 är Del A; F4-F7 och
HTTP-artiklarna är Del B. Kontrollerat mot delfrågeinventeringen: ingen tentad delfråga korsar gränsen.

**Ämnesindelningen är föreläsningens, inte bokens.** Kursens bok är 6:e upplagan och vaultets 5:e. Boken
används bara när en bild är otydlig, och det markeras.

## Sannolikhetsmodellen

**Delämnet är enheten.** Där ett delämne tentats används ämnesnamnet ur AI-kontext avsnitt 3; annars
bildens rubrik. Ämnets nivå i rubriken är den högsta bland dess delämnen.

| Nivå | Regel | Vad det betyder för honom |
| --- | --- | --- |
| **Säker** | tentat i minst 3 av 4 tentor | kommer nästan säkert, i någon form |
| **Trolig** | tentat i 1-2 av 4; **eller** aldrig tentat men minst två signaler | stor chans att något härifrån kommer |
| **Möjlig** | aldrig tentat, högst en signal, egen bild hos examinatorn, fakta av samma slag som 1-2-poängsfrågorna | kan komma som en 1-poängsfråga |
| **Osannolik** | kursadministration, historik, verktygsdemo, kodexempel, produktnamn, detaljer som bara gästföreläsningen har, och allt tentan själv delar ut | läses inte |

**Tentafrekvensen går före kategorin.** FTP:s kommandon och "nämn en annan congestion control-algoritm"
ser ut som Osannolik (kommandon, produktnamn) men är tentade, och blir Säker respektive Trolig.
**Osannolik grundas på belägg**, inte på antal bilder: AI-kontext avsnitt 6 visar att OSPF, HSRP, STP och
EtherChannel aldrig tentats, och det är dit regeln pekar först.

**Signalerna**, var och en med belägg i kartan:

1. Examinatorn ställer en fråga eller övning på bilden (F1:s första bild: *"What alternatives to UDP/TCP
   exist?"*).
2. Delämnet finns på examinatorns sammanfattningsbild (F6 s.41) eller i Summering.
3. Delämnet finns i de rekommenderade övningsuppgifterna.
4. Delämnet får minst tre egna bilder.
5. Delämnet behandlas i minst två av föreläsningsfilerna F1-F7. Artiklarna räknas inte här.

**Nivåerna är bedömningar, inte sannolikheter.** De visas med beläggen bredvid och aldrig som procent.

**Kalibreringen, held-out.** Innan kartan visas: för varje gammal tenta sätts nivåerna med de **tre andra**
tentorna plus föreläsningssignalerna, och sedan mäts hur många av den tentans poäng som låg i Säker plus
Trolig, i Möjlig, i Osannolik och utanför föreläsningarna. Siffran rapporteras som den blir. Ett mått där
den mätta tentan också satte nivåerna citeras aldrig (`lessons-learned.md`, 2026-10-15).

## Djupet per nivå

| Nivå | Teorifilen | Decken |
| --- | --- | --- |
| Säker | mekanism, avvägning, felfall och tillämpning; befintligt innehåll stannar | befintliga kort, plus kort för bildfakta som saknas |
| Trolig | fakta och mekanism | ett till tre kort per delämne |
| Möjlig | ett kort stycke | **inga kort** |
| Osannolik | bara i kartan, med skälet | inget |

Korten följer `write-flashcards`: svaret står ut (F92), en sak per kort, listor 2-4 rader, inget som tentan
delar ut, vardaglig svenska. **Inga id:n att memorera:** en OID kortas som begrepp (en väg i MIB-trädet),
aldrig som sträng, även om tentan någon gång bett om en.

## Arbetsgången

Utan känt datum gäller det brådskande spåret: Del B först, Del A lätt.

### Fas 1 - inventera, transkribera och sätt nivå (bara läsning)

- **En subagent per föreläsning (7), en för artiklarna och en för övningsuppgifterna, parallellt.** Var
  och en går igenom sin källa **sida för sida**, läser figurerna som bilder och jämför med PDF:ens
  textlager (uttaget med `pypdf` till `%TEMP%`), så att inget som bara står i textlagret faller bort.
  Övningsuppgifternas docx-filer packas upp till text i `%TEMP%` först.
- Per delämne en rad: sidor, fakta i en mening var (med figurernas innehåll utskrivet), signalerna, vilka
  tentadelfrågor som träffat det, och om det redan finns i teorin eller decken.
- **Allt skrivs till `%TEMP%`.** Ingenting skrivs under `Filer/` (`conventions.md` §4); faktat hamnar i
  vaultets egna noter först i fas 2.
- Nivåerna sätts av ett skript ur regeln, inte av agenterna. Kalibreringen körs.
- **Granskning:** en faktagranskare per del jämför inventeringen mot bilderna och letar efter sidor utan
  rad.

### Kontrollpunkt - kartan visas för honom

Kartan, kalibreringssiffran och volymen: antal nya kort per nivå och del, och hur mycket teorifilerna
växer. **Han godkänner djupet innan något skrivs**, och kartan skrivs in i vaultet först då.

### Fas 2 - kartan och Del B

- Kartnoten skrivs.
- **Del B:s teorifil:** varje stycke i dagens fil flyttas till sitt ämne. Inget stryks utom dubbletter, och
  varje strykning listas. Fråga 5-poolens fakta hamnar under sina ämnen, och poolindexet i kartan visar
  var. Nytt innehåll från bilderna märks med föreläsning och sida, med examinatorns garderingar kvar.
  Egna slutsatser märks `(egen slutsats)`.
- **Del B:s deck:** ett skript flyttar varje befintligt kortblock, från frågerad till markör, under sitt
  nya ämne. Det följer `conventions.md` §3: torrkörning, backup, LF och BOM bevarade. Inget kort skrivs om.
  `Get-SRIntegrity.ps1 -Compare` mot egen baslinje ska visa **samma** kort- och markörantal och **noll**
  flyttade markörer, eftersom varje markör står kvar under samma fråga. Sedan läggs nya kort till per nivå,
  kontrollerade mot de befintliga så att ingen fakta kortas två gånger.
- `Tentaanalys`-filerna lämnas som de är. De är underlaget för nivåerna.

### Fas 3 - Del A, enligt hans svar

Förslaget: Trolig-delämnen som saknas läggs in i dagens struktur, med kort. Byggs filen om ska samma
procedur som för Del B gälla.

### Fas 4 - verifiering

- **Källan räknas, inte briefen.** Ett skript kontrollerar mot kartan att varje delämne finns i teorin och
  decken på den nivå regeln säger, eller står som Osannolik med ett skäl (`lessons-learned.md`: *scope
  checked, source not*).
- En faktagranskare per föreläsning, med bara read och grep, jämför nya rader och kort mot bilderna och
  inventeringen.
- Grindarna: `Test-DeckHygiene.ps1 -All`, där bara decken läses; `Get-SRIntegrity.ps1 -Compare`; lint;
  auditen sist.
- Dokumentation: F99 i backloggen, F-intervallet, `current-state.md`, och HI1032:s rad i `product.md`.

## Risker

- **Volymen.** Han bad om "allt", men har tidigare bett om få kort och mätbart svårast att komma ihåg
  djupa detaljer. Nivåerna och kortlösa Möjlig håller ihop det, och kontrollpunkten visar priset innan
  det betalas.
- **Nivåerna ser exakta ut.** Fyra tentor räcker inte för att skilja Trolig från Möjlig säkert. Därför
  står beläggen bredvid varje nivå.
- **Figurer tolkade från bilder kan bli fel**, och han kan inte upptäcka det. Varje tolkad figur
  faktagranskas.
- **Kort med historik.** Bara hela block flyttas; inget skrivs om utan att han sagt till.
- **Han repeterar dagligen.** Baslinjen tas omedelbart före varje skrivning.
- **Ombyggd teorifil** betyder att det han redan skrivit av inte följer den nya ordningen. Därför byggs
  bara Del B om utan vidare.

## Frågor till honom

1. **När är tentan?** Utan svar gäller det brådskande spåret.
2. **Har du bilderna från Summering (8/10)**, eller något annat examinatorn sagt om tentan?
3. **Del A:** bygga om teorifilen och decket efter föreläsningarna, eller behålla strukturen och bara
   lägga till det som saknas? Förslaget är det senare.
4. **Djupet per nivå**, tabellen ovan: rätt?
5. **Befintliga kort:** flytta dem orörda, eller får jag skriva om och ta bort kort som blir dubbletter?

## Granskning, 2026-10-19

**Premiss** (`premise-reviewer`): BYGG MED ÄNDRINGAR. **Fakta och konformitet** (`kiro_default`, bara
read och grep): GODKÄND MED ÄNDRINGAR. Ändrat:

- **Inget skrivs under `Filer/`.** Transkriberingen blev en del av inventeringen och skrivs till `%TEMP%`.
  Den förra frågan om var den ska ligga är struken.
- **Kontrollpunkten flyttad före all skrivning**, och transkribering och inventering körs i samma
  parallella fas.
- **Del A görs lätt som förslag**, och blev en fråga i stället för ett antagande. Kartan byggs ändå för
  båda delarna.
- **Inget väntar på datumet:** utan svar gäller det brådskande spåret.
- **Möjlig ger inga kort.**
- **Regeln skärpt:** frekvens går före kategori, signal 5 definierad, delämnen förankrade i AI-kontext
  avsnitt 3, Osannolik grundad på avsnitt 6. OID kortas som begrepp.
- **Poolerna bevaras som index** i kartan.
- **Faktarättelser:** 2025:s tentadatum är opålitligt; övningslösningarna är fyra docx-filer; F1:s och
  F4:s ämnen var ofullständigt listade.
- Artikelfrågan avgjord i planen: HTTP/2 och HTTP/3 för Del B, congestion control-översikten för Del A,
  MIT-rapporten och tcptrace Osannolik om inventeringen inte visar annat.

Bekräftat utan ändring: del-mappningen, tentans form och utdelade material, F97:s held-out-siffror,
F5:s PNG-rad, F6 s.41, 49 och 71 kort med markörer, F7 som gästföreläsning, upplagorna, och att
kalibreringen följer lärdomen från 2026-10-15.
