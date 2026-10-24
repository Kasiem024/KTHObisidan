---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
  - nosr
created: 2026-10-20
updated: 2026-10-20
description: "En lasfil som samlar teoriavsnitten for de HI1032-amnen dar flest flashcards annu ar oklarade, rankade med det svagaste amnet overst. Avsnitten ar kopierade ordagrant fran teorifilerna Tentasvar Del A och Del B. Filen bar nosr och ingar inte i repetitionen; den ar till for att lasa ikapp det som inte sitter."
---

# HI1032 Tentasvar - Svaga ämnen

De har avsnitten ar de HI1032-amnen dar flest kort annu ar oklarade i mina tva deck, rankade efter andelen oklarade kort med det svagaste amnet overst. Texten ar kopierad rakt av fran teorifilerna Tentasvar Del A och Del B, sa den haller samma niva (Saker/Trolig/Mojlig) och samma genomraknade exempel. Filen ar en lasfil med nosr och ligger utanfor repetitionen.

## Rakna sjalv: de genomraknade exemplen

Korten tranar begrepp och tillampning, men tentan ber dig ocksa att rakna och lasa diagram — och de delarna tranas inte av ett flashcard. Ga igenom de har for hand minst en gang var, fran teorifilerna. De star kvar aven nar de vanliga amnena nedan byts ut, sa de ar inte "svaga amnen" utan en fast ovningslista.

**Del A — Transportnivan**

- **RTO steg for steg** (*RTO: hur lange TCP vantar pa en ACK*). Rakna $6 \rightarrow 4{,}5 \rightarrow 4{,}74$ s med $\alpha = 1/8$, $\beta = 1/4$. Ordning: uppdatera $\text{RTT}_\text{S}$, sedan $\text{RTT}_\text{D}$, sedan RTO. Sakra poang.
- **Lasa cwnd-grafen** (*Vid paketforlust: Tahoe och Reno*). Handelse for handelse: slow start till troskeln, sedan congestion avoidance; vid timeout $\text{cwnd} = 1$, vid tre dubbel-ACK Reno halverar och gor fast recovery. Las faserna pa SS/CA/FR-etiketterna.
- **ACK-reglerna i ett diagram** (*ACK-reglerna och hur man tillampar dem*). Normal drift (500 ms fordrojd ACK, piggyback), tappat segment (byte 701-800 tappas, ACK upprepar 701, hoppar sedan till 901), tappad kvittens.
- **Three-way handshake med nummer** (*Etablering*). Klient seq 8000 (SYN), server seq 15000 / ack 8001, klient seq 8001 / ack 15001 — ett SYN forbrukar ett sekvensnummer.

**Del B — Applikationsnivan**

- **Huffman-kod** (*Huffman - Sa gor du*). Bygg tradet ur frekvenserna (A 5 %, B 10 %, C 15 %, D 28 %, E 42 %) genom att sla ihop de tva minsta; las av A=0000 ... E=1.
- **JPEG-kvantisering** (*JPEG - Sa gor du*). Rakna $c(m,n) = \mathrm{round}(M(m,n) / Q_k(m,n))$ elementvis pa ett $8 \times 8$-block; hoga frekvenser blir 0.
- **Base64** (*Base64 - Sa gor du*). `11001100 10000001 00111001` till 6-bitarsgrupper till talen 51, 8, 4, 57 till tecknen `z I E 5`.
- **Quoted-Printable** (*Quoted-Printable - Sa gor du*). Koda icke-ASCII som likhetstecken plus hex: a-ring blir `=E5`, a-prick blir `=E4`.
- **DNS-uppslagning** (*Uppslagning: iterativ vs rekursiv*). Rekursiv halva (klient till resolver) och iterativ halva (resolver: rot, `.se`, `kth.se`, `www.kth.se A 130.237.28.40`).

## Paketering (Möjlig)

**Hur rutorna läggs i paket spelar roll.** Försvinner hela I-rutan vid en paketförlust blir B/P-rutorna meningslösa, eftersom de bara beskriver skillnaden mot den; dessutom är vi ==känsligare för ljudförsämringar än bildförsämringar==.

## Ljudkompression (Trolig)

**Två nivåer av kompression.** Slidet ställer upp hur hårt ljud kan komprimeras med de två principerna, utöver den okomprimerade ==PCM:en (tal 64 kbps, CD 705,6 kbps/kanal)==.

**Predictive ~ 1:2.** Predictive coding (DM, ADPCM) ger ungefär ==1:2== och bygger på att "små fel inte gör så mycket".

**Perceptual ~ 1:10.** Perceptual coding (MP3, AAC) ger ungefär ==1:10== och bygger på maskering, att "små fel inte hörs/syns".

## µ-law och A-law (Trolig)

**Problemet med en rak skala.** Med jämnt fördelade kvantiseringsnivåer (linjär skala) går lika många nivåer åt för starka som svaga ljud, fast ==örat är känsligare för de svaga==.

**Lösningen är en icke-linjär skala.** µ-law och A-law använder i stället en ==icke-linjär skala== som lägger fler nivåer där ljudet är svagt och färre där det är starkt.

**Vinsten.** Då får man ett ==större dynamiskt omfång== utan fler kvantiseringsnivåer, alltså utan större bit-djup.

## MPEG – temporal och spatial kodning (Trolig)

**Video är stillbilder i följd.** En video är många bildrutor per sekund (en ruta var 1/25 s). Att JPEG-koda varje ruta för sig blir stort, så MPEG komprimerar ==i två riktningar: i rummet och i tiden==.

**Spatial (i rummet).** Inom en enskild ruta används ==samma idé som JPEG== – DCT, kvantisering och kodning av block.

**Temporal (i tiden).** Mellan rutor utnyttjas att ==närliggande rutor är nästan lika==: i stället för hela bilden skickas bara skillnaden mot grannrutorna. Därför finns olika rutetyper – en hel ruta (I) och rutor som bara beskriver förändringen (B/P).

**Varför inte bara en I-ruta.** Slidet pekar på ==delay== som skäl. (egen slutsats: med bara en I-ruta i början måste allt annat byggas som skillnader mot den, vilket ökar fördröjningen, så I-rutor återkommer med jämna mellanrum.)
