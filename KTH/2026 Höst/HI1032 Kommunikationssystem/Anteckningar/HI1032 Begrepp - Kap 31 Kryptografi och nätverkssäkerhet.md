---
tags: [begrepp, HI1032, nätverk, säkerhet, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 31 – kryptografi & nätverkssäkerhet: säkerhetsmål, symmetrisk/asymmetrisk kryptering, integritet, MAC, digital signatur och nyckelhantering."
---
# HI1032 Begrepp - Kap 31 Kryptografi och nätverkssäkerhet

Vilka tre är de grundläggande säkerhetsmålen? (3)
||
- **Konfidentialitet** – bara behöriga kan *läsa*
- **Integritet** – bara behöriga kan *ändra*
- **Tillgänglighet** – behöriga kommer *åt* informationen

Vad skiljer en symmetrisk-nyckel- från en asymmetrisk-nyckel-chiffer?
||
- **Symmetrisk:** *samma* hemliga nyckel krypterar och dekrypterar – snabb.
- **Asymmetrisk:** ett *nyckelpar* – ==öppen nyckel krypterar, privat dekrypterar==.

**Meddelandeintegritet** (message integrity);;Att garantera att ett meddelande ==inte har ändrats==; uppnås med en *hashfunktion* som skapar en digest av meddelandet.

**Hashfunktion** (digest);;En funktion som skapar ett ==litet fingeravtryck (digest) av ett meddelande==; minsta ändring i meddelandet ger en helt annan digest.

Vad skiljer en MAC från en digital signatur?
||
- **MAC** (message authentication code): bygger på en ==delad hemlig nyckel== – bevisar äkthet men inte *vem* (ingen oavvislighet).
- **Digital signatur:** bygger på avsändarens ==privata nyckel== – bevisar *vem* och ger oavvislighet.

**Digital signatur**;;Ett värde skapat med avsändarens ==privata nyckel== som bevisar vem som skickat meddelandet och att det inte ändrats.

**KDC** (Key Distribution Center);;En betrodd server som ==delar ut hemliga (symmetriska) sessionsnycklar== till parter som vill kommunicera säkert.

Vad används Diffie-Hellman-protokollet till?::Att låta två parter ==komma överens om en gemensam hemlig nyckel över en osäker kanal==, utan att själva nyckeln skickas.
