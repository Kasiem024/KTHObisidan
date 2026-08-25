---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 6 – indirekt kommunikation: frikoppling i tid/rum, gruppkommunikation, publish-subscribe, meddelandeköer, tuple spaces och DSM."
---
# HI1031 Begrepp - Kap 06 Indirekt kommunikation

## Grundidé

**Indirekt kommunikation**;;Kommunikation ==via en mellanhand==, där sändare och mottagare *inte* pratar direkt med varandra (och ofta inte ens känner till varandra).

Vilka två former av "frikoppling" (uncoupling) ger indirekt kommunikation? (2)
||
- **Rumslig frikoppling** (space uncoupling) – sändaren behöver inte veta *vem* som tar emot
- **Tidsmässig frikoppling** (time uncoupling) – sändare och mottagare behöver inte finnas till *samtidigt*

**Rumslig frikoppling** (space uncoupling);;När en sändare ==inte behöver känna till mottagarnas identitet== – den skickar bara till mellanhanden.

**Tidsmässig frikoppling** (time uncoupling);;När sändare och mottagare ==inte behöver existera samtidigt== – meddelandet lagras tills mottagaren är redo.

## Paradigmerna

**Gruppkommunikation** (group communication);;Att ett meddelande skickas till en ==namngiven grupp och levereras till alla medlemmar==, utan att sändaren känner till dem; ger ofta garantier om tillförlitlighet och ordning.

**Publish-subscribe**;;Ett system där *publicister* skickar händelser och mottagare ==bara får de händelser de anmält intresse för==, via en förmedlande tjänst. Metafor: en radiostation sänder – bara de som ställt in kanalen hör.

**Meddelandekö** (message queue);;En ==punkt-till-punkt==-tjänst där producenter lägger meddelanden i en kö och *en* konsument hämtar dem – till skillnad från publish-subscribe som är en-till-många.

**Tuple space**;;En *delad, beständig* rymd där processer kan ==lägga in och läsa/plocka ut strukturerad data== (tupler) utifrån mönster. Metafor: en gemensam anslagstavla som lever kvar även när skribenten gått.

**Distribuerat delat minne** (DSM);;En abstraktion som låter processer ==dela data som om de läste och skrev i vanligt minne==, trots att de saknar gemensamt fysiskt minne; infrastrukturen sköter kopior och konsistens.

Vad skiljer publish-subscribe från meddelandeköer?
||
- **Publish-subscribe:** ==en-till-många== – en händelse når alla intresserade mottagare.
- **Meddelandekö:** ==punkt-till-punkt== – varje meddelande hämtas av *en* konsument.

Vilken är den stora fördelen med indirekt kommunikation i föränderliga miljöer?::Att parterna är ==frikopplade i tid och rum== – de kan ansluta och försvinna oberoende av varandra, vilket passar mobila och opålitliga system.
