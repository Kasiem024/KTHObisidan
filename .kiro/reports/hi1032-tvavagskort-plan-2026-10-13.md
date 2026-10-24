# Plan - HI1032: tvavagskort i Del A-decket, sedan en teorifil for Del B

Datum: 2026-10-13. Status: utkast for granskning. Tva uppgifter, en i taget.

## Vad forfattaren bad om

> jag gillar kort som ar tva vag, och det ar faktiskt flera termer som jag inte kanner till. jag vill
> att du lagger till fler kort till del a decket och garna ocksa omformulerar de kort som redan finns
> sa att de blir tva vags kort. [...] efter att du har gjort det vill jag att du skapar en fil for
> del b som du gjorde for del a.

Det ar en **uttrycklig instruktion att omformulera befintliga kort**, vilket lyfter
`write-flashcards` regel 12. Vad regeln skyddar ar *vem som bestammer*, och han har bestamt.

## Datan fran hans forsta varv - detta styr allt nedan

Alla 42 kort bar nu markorer, satta mellan 19:18 och 19:38 den 2026-10-13. `lapses` ar 0 pa samtliga
eftersom alla kort var nya, sa **`reps` ar signalen**: varje gang han tryckte "Again" visades kortet
igen och `reps` okade. Difficulty ar FSRS:s egen skattning, 1 till 10.

| Kort | reps | difficulty | Anmarkning |
| --- | --- | --- | --- |
| Vad gor stream sequence number i SCTP? | **8** | **9.98** | intervall 0, aldrig ur inlarningsfasen |
| I ett UDP-huvud, i vilken ordning kommer falten? | **6** | 9.90 | |
| Vad ar SCTP-multihoming? | **5** | **9.94** | intervall 0, aldrig ur inlarningsfasen |
| I vilken ordning fyller du i RTO-tabellen? | 5 | 9.79 | procedurkort |
| Vad skiljer de tva RTO-varianterna at? | 5 | 9.79 | procedurkort |
| Nar anvands dynamic/private-portarna? | 4 | 9.44 | |
| Vilka nummer bar serverns SYN+ACK? | 4 | 9.44 | |
| Vad gor MSS-optionen med forsta segmentets datamangd? | 4 | 9.44 | |
| Vad ar en chunk i SCTP? | 3 | 9.59 | intervall 0, aldrig ur inlarningsfasen |

22 av 42 kort gick pa `reps=2` med difficulty 5.20, alltsa raett pa forsta eller andra forsoket.

**Tre slutsatser ur datan, och den forsta overraskade mig:**

1. **SCTP ar en total miss.** Alla tre korten ligger kvar med intervall 0 och forfaller samma dag,
   och tva av dem ar deckets svaraste. SCTP ar ocksa **garanterade poang** - rankningen sager
   "alltid exakt 1p i fraga 1", i 3 av 4 tentor. Det ar den enskilt mest lonsamma reparationen.
2. **De tva RTO-procedurkorten ar bland de svaraste**, precis som `write-flashcards` forutsager:
   en flerstegsprocedur laers inte in med kort. Bada finns nu i noten i stallet, sa de kan
   formuleras om till faktakort eller strykas.
3. **Decket anvander termer det aldrig laer ut.** `cwnd`, `ssthresh`, `rwnd`, `RTTS`, `RTTD`, `RTTM`,
   `MSL`, `TSN`, `fast recovery`, `slow start`, `congestion avoidance` forekommer i kortsvar men har
   inget eget kort. Det ar precis de termer han sager att han inte kanner till.

---

# Uppgift 1: Del A-decket

## Sakerhetsfragan som maste avgoras forst

Ett `::`-kort har **en** schemalaggning i sin markor. Ett `;;`-kort har **tva**, separerade med `!`.
Att andra `::` till `;;` ger alltsa ett kort som behover tva scheman men bara har ett.

**Vad jag tror hander:** det befintliga schemat behalls for framriktningen och baklangeskortet
behandlas som nytt. Det ar den oskadliga utgangen. **Men jag har inte verifierat det**, och
`conventions.md` SS1 ar otvetydig om att markorer ar levande data.

**Darfor: pilottest pa ETT kort.** Ett kort konverteras, forfattaren oppnar Obsidian och bekraftar
att framriktningen behallit sitt forfallodatum, och forst da gors resten. Kostnaden om jag har fel ar
en kvalls repetitionsdata, inte manader - men det ar hans data och inte min att riskera.

Den omvanda riktningen, `;;` till `::`, ar den som bevisligen forstor: den kastar ett av tva scheman.
Den gors inte nagonstans.

## 1a. Omformulera till tvavagskort - 10 kandidater

Villkoret ar att **baksidan entydigt pekar tillbaka pa framsidan**. Formen blir
`**Term** (engelsk term);;forklaring med ett ==highlight==`, alltsa samma form som HE1033-decket han
fick A med.

| Nuvarande framsida | Blir | Varfor saker |
| --- | --- | --- |
| Vad ar SCTP-multihoming? | `**Multihoming** (SCTP);;` | baksidan ar unik; deckets 3:e svaraste kort |
| Vad gor stream sequence number i SCTP? | `**Stream sequence number** (SSN);;` | deckets svaraste kort, reps 8 |
| Vad ar en chunk i SCTP? | `**Chunk** (SCTP);;` | unik definition |
| Vad ar silly window syndrome? | `**Silly window syndrome**;;` | klassiskt begreppspar |
| Vad sager Karns algoritm? | `**Karns algoritm**;;` | regeln identifierar entydigt |
| Vad tillfor SACK en vanlig ACK? | `**SACK** (selective ACK);;` | kraever omformulering, se nedan |
| Vad ar syftet med PSH-flaggan? | `**PSH-flaggan** (push);;` | unikt syfte |
| Vad star i faltet window size? | `**Window size**-faltet;;` | kraever omformulering, se nedan |
| Vilken flodeskontrollprincip galler mellan mottagarbuffert och process? | `**Pull** (flodeskontroll);;` | unik |
| Vad gor Reno vid tre dubbla ACK:ar...? | `**Fast recovery** (Reno);;` | unik mekanism |

**Tre av dem kraever att baksidan skrivs om forst**, eftersom de annars krockar baklanges. SACK,
window size och 3-dupACK-kortet ligger alla i samma semantiska horn som ACK-regel 4. Omformuleringen
maste gora baksidorna sarskiljande - det ar exakt det fel som bet i HI1031 kapitel 5, dar tre
`;;`-kort blev omojliga att skilja baklanges.

## 1b. Kort som INTE ska vandas

- **Alla sex ACK-regelkorten utom 3-dupACK**, alla tre RTO-korten, etableringskorten och
  jamforelsekorten. De ar *hur*- och *varfor*-fragor eller procedurer, och baklangesriktningen ar
  meningslos.
- **"Vad ar speciellt med ISN?"** - baksidan "slumptal" pekar inte entydigt tillbaka.
- **"Vad ar det minsta vardet cwnd kan ha?"** - baksidan "1".
- **"Kan tva processer lyssna pa samma port...?"** - ja/nej-kort.
- **"Vad ar MTU eller MSS...?"** - tva termer pa en framsida, baksidan kan inte valja. **Ska i
  stallet delas i tva kort**, se nedan.
- **"Vad innebar piggybacking, och varfor ar det bra?"** - tva fragor i ett kort.
- **"Namn annu en congestion control-algoritm"** - baksidan ar fyra alternativ.

## 1c. Nya kort - termerna decket anvander men aldrig laer ut

Alla som `;;`, eftersom de ar aekta begreppspar. Riktvaerde **10 till 12 nya kort**, inte mer:
kortantal ar en kostnad.

- **cwnd** (congestion window) och **ssthresh** (slow start threshold) - baerande i sju kortsvar,
  aldrig definierade.
- **rwnd** (receiver window) - anvands i kortet om sandarfonstret.
- **MSS** och **MTU** var for sig, ur det nuvarande dubbelkortet.
- **RTTM**, **RTTS**, **RTTD** - tre termer hela RTO-avsnittet vilar pa. Kan slaas ihop till tva kort.
- **MSL** (maximum segment lifetime) - anvands i TIME-WAIT-kortet.
- **TSN** (transmission sequence number) - SCTP:s motsvarighet till sekvensnummer, och den **saknas
  helt** fast SSN-kortet forutsatter kontrasten. okt 2024 fraga 1d handlar om just den skillnaden.
- **slow start** och **congestion avoidance** som termer.
- **dupACK**.

**Inget nytt kort far ha en adress, mask eller ID som svar** (`product.md`, 2026-10-01).

## 1d. Verifiering av uppgift 1

1. `Get-SRIntegrity.ps1 -Save -BaselinePath <egen fil>` **omedelbart fore** forsta aendringen. Egen
   sokvag, inte den delade - en parallell session kan annars redatera snapshotet (**T22**).
2. Pilottestet: ett kort, forfattaren bekraftar i Obsidian.
3. `-Compare` efterat. Las **per-filraden**, inte vaulttotalen. Foervaentat: `cards` okar med antalet
   nya kort, `raw_srComments` ar **oforandrat** eftersom inget kort tas bort.
4. `Test-DeckHygiene.ps1 -All` och las radarna for Del A-filen. Default-scopet ar kapiteldeck och
   HI1032 har inga, sa `-Course HI1032` ger exit 2.
5. Lint, audit, och grep for att inga separatorer tappats.
6. **Raekna markorerna fore och efter.** De 42 maste vara 42, byte-identiska for de kort som inte
   rors.

---

# Uppgift 2: teorifil for Del B

Gors **efter** uppgift 1, inte parallellt.

`HI1032 Tentasvar - Del B Applikationsnivan.md`, speglad mot decket
`HI1032 Tentaplugg - Del B Applikationsnivan.md` sektion for sektion, i samma form som Del A-filen:
helhetsbild forst, sedan ett avsnitt per amne med var det passar in, `TENTAFOKUS`-block, och
begreppslista. Djupet styrs av samma tre kriterier: poang, frekvens, och hur laett poangen ar att ta.

**Acceptanstest:** laeser han filen ska han kunna besvara varje kort i Del B-decket. Det ar hans egna
ord: *"om jag lar mig innehallet av den filen kommer jag kunna alla flashcards och samtidigt vara mer
redo for del b av tentan."*

**Skillnaden mot Del A, och den ar viktig:** Del B ar mer faktabetonad. Fraga 5-poolen ger 7-8p av 22
och varje delfraga lag inom poolen i alla fyra tentorna. Men varje tenta har ocksa **ett block pa
4-5p som ar en procedur eller en figur** - Quoted-Printable och Base64 for hand (okt 2024, 5p),
Huffmantraed (dec 2024, 4p), OID ur en MIB-traedfigur (okt 2025, 2p), rita rekursiv DNS (okt 2025,
3p). De tva forsta star pa hans egen hoppa-over-lista.

Rankningens tre poster for Del B ger 12, **9**, 13 och 17 poang over de fyra tentorna. December 2024
landar pa exakt 9 eftersom FTP saknades, sa DNS som fjaerde post ar den marginal som behovs.

Detaljerad amnesfoerdelning tas fram nar uppgift 1 ar klar, mot samma underlag.

## Vad som uttryckligen INTE ska goras

- **Inget kort tas bort** utan att forfattaren bett om det. De tva RTO-procedurkorten ar kandidater
  men foreslas, de stryks inte.
- **Ingen `;;` till `::`-konvertering** nagonstans. Den kastar data.
- **Ingen aendring av `nosr`** pa nagon fil.
- **Ingen Forouzan.** Amnena ar belagda i de fyra tentorna med facit.
