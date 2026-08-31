---
tags: [begrepp, HI1031, databaser, säkerhet, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Flashcards HI1031 kap 11 – säkerhet: kryptering (symmetrisk/asymmetrisk), digitala signaturer, certifikat, autentisering och Kerberos."
---
# HI1031 Begrepp - Kap 11 Säkerhet

## Kryptografi

**Kryptering** (encryption);;Att ==omvandla läsbar text (klartext) till oläsbar form (chiffertext)== med en nyckel, så att bara den med rätt nyckel kan läsa innehållet.

Vad skiljer symmetrisk från asymmetrisk kryptering?
||
- **Symmetrisk** (secret-key): *samma* hemliga nyckel både krypterar och dekrypterar – snabbt, men nyckeln måste ==delas i hemlighet==.
- **Asymmetrisk** (public-key): ett *nyckelpar* – en ==öppen== nyckel krypterar och en *privat* dekrypterar (eller tvärtom vid signering).

**Symmetrisk kryptering** (secret-key);;Kryptering där ==samma hemliga nyckel== används för både kryptering och dekryptering; kräver att parterna delar nyckeln säkert.

**Asymmetrisk kryptering** (public-key);;Kryptering med ett *nyckelpar*: en ==öppen (publik) nyckel== som alla får använda och en *privat* nyckel som hålls hemlig.

**Hybridkryptering**;;Kombinerar de två sorterna: *asymmetrisk* kryptering används för att ==autentisera parterna och utbyta en hemlig sessionsnyckel==, sedan sköter snabb *symmetrisk* kryptering all vidare kommunikation. Grunden i bl.a. TLS.

**Säker hashfunktion** (digest);;En *enkelriktad* funktion som gör ett meddelande av godtycklig längd till ett ==kort värde av fast längd== som inte går att vända. Används i digitala signaturer. Exempel: *MD5* (128 bitar), *SHA-1* (160 bitar).

**Digital signatur**;;Ett värde skapat med avsändarens ==privata nyckel== som låter vem som helst verifiera *vem som skickat* datan och att den *inte ändrats*.

**Certifikat** (digitalt);;Ett ==signerat intyg som binder en identitet till en publik nyckel==, utfärdat av en betrodd part (certifikatutfärdare).

## Autentisering och nycklar

**Autentisering** (authentication);;Att ==bevisa vem en part verkligen är== innan man litar på den – med delade hemligheter, nycklar eller certifikat.

**Nonce**;;Ett ==engångsvärde== (slumptal eller tidsstämpel) som läggs i ett meddelande för att bevisa att det är *färskt* och inte en gammal upprepning.

**Sessionsnyckel** (session key);;En ==tillfällig hemlig nyckel== som skapas för en enda session mellan två parter och slängs efteråt.

**Kerberos**;;En *autentiseringstjänst* för intranät där en betrodd server delar ut ==biljetter och sessionsnycklar== så att klient och server kan lita på varandra utan att skicka lösenord över nätet.

**Biljett** (ticket, i Kerberos);;Ett ==krypterat intyg== som visar att bäraren nyligen autentiserats; innehåller en sessionsnyckel och en utgångstid.

**TLS/SSL**;;Ett protokoll som lägger en ==säker kanal (sekretess, integritet, autenticitet) under applikationsprotokoll== (t.ex. *https*). Består av ett *record-protokoll* (själva kanalen) och ett *handskakningsprotokoll*.

Hur går TLS-handskakningen till översiktligt?::Den sker först *i klartext* och ==förhandlar krypterings- och autentiseringsalgoritmer== samt etablerar sessionsnycklar; servern (och ev. klienten) autentiseras med *certifikat*. Först därefter krypteras trafiken.

## Hot

Vilka är de vanliga hoten mot kommunikation? (5)
||
- **Avlyssning** (eavesdropping) – läsa andras meddelanden
- **Maskering** (masquerading) – utge sig för någon annan
- **Manipulation** (tampering) – ändra meddelandets innehåll
- **Uppspelning** (replay) – skicka om ett gammalt men giltigt meddelande
- **Överbelastning** (denial of service) – dränka tjänsten så den inte kan svara
