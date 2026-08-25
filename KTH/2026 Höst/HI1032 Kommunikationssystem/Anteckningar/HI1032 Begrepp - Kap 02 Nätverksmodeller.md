---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 2 – nätverksmodeller: protokollskiktning, TCP/IP (5 lager) och OSI (7 lager), inkapsling, PDU:er och adresser per lager."
---
# HI1032 Begrepp - Kap 02 Nätverksmodeller

## Skiktning och modeller

**Protokollskiktning** (protocol layering);;Att dela upp kommunikationsuppgiften i ==lager med ett protokoll per lager==; ger modularitet så att varje lager kan ändras oberoende.

Vilka fem lager har TCP/IP-modellen? (5)
||
- **Applikation**
- **Transport**
- **Nätverk** (network)
- **Datalänk** (data-link)
- **Fysiskt** (physical)

Vilka sju lager har OSI-modellen? (7)
||
- **Applikation**
- **Presentation**
- **Session**
- **Transport**
- **Nätverk**
- **Datalänk**
- **Fysiskt**

Hur förhåller sig OSI-modellen till TCP/IP-modellen?
||
- **OSI:** 7 lager (teoretisk referensmodell).
- **TCP/IP:** 5 lager; dess *applikationslager* motsvarar ==OSI:s applikation + presentation + session==.

Varför ersatte OSI-modellen aldrig TCP/IP?::OSI blev klar ==när TCP/IP redan var etablerat== (dyrt att byta), och vissa OSI-lager (session/presentation) definierades aldrig fullt ut.

**Inkapsling** (encapsulation);;Att ett lager ==lägger till sitt eget huvud== på dataenheten från lagret ovanför innan den skickas nedåt; mottagaren avkapslar i omvänd ordning.

## Dataenheter och adresser

Vad heter dataenheten (PDU) i respektive TCP/IP-lager? (5)
||
- **Applikation:** meddelande (message)
- **Transport:** segment (TCP) / user datagram (UDP)
- **Nätverk:** datagram
- **Datalänk:** ram (frame)
- **Fysiskt:** bitar

Vilken typ av adress hör till respektive lager? (4)
||
- **Applikation:** applikationsspecifikt namn (t.ex. e-postadress)
- **Transport:** portnummer
- **Nätverk:** logisk adress (IP)
- **Datalänk:** fysisk adress (MAC)

Vilken kommunikationsomfattning har datalänk-, nätverks- respektive transportlagret?::Datalänk = ==nod-till-nod==, nätverk = ==värd-till-värd==, transport = ==process-till-process==.

**Multiplexering/demultiplexering** (i transportlagret);;Att portnummer låter ==flera applikationsprocesser dela transportlagret== – data buntas ut (mux) och levereras till rätt process hos mottagaren (demux).
