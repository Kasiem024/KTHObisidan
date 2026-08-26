---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 11 – DLC: ramning (byte-/bit-stuffing), flödes- och felkontroll, Stop-and-Wait, piggybacking, HDLC och PPP."
---
# HI1032 Begrepp - Kap 11 DLC

**Ramning** (framing);;Att ==packa bitarna från fysiska lagret i avgränsade ramar==, var och en med adressinformation, så att en ram kan skiljas från nästa. Metafor: att lägga ett brev i ett kuvert.

Vad är skillnaden mellan byte-stuffing och bit-stuffing?
||
- **Byte-stuffing:** i *teckenorienterade* protokoll – lägg in ett escape-tecken före ett datatecken som råkar likna flaggan.
- **Bit-stuffing:** i *bitorienterade* protokoll – ==lägg in en extra 0 efter fem ettor== så att data aldrig förväxlas med flaggan.

Vad är skillnaden mellan flödeskontroll och felkontroll?
||
- **Flödeskontroll:** hindrar sändaren från att ==översvämma mottagaren== med mer data än den hinner ta emot.
- **Felkontroll:** upptäcker och åtgärdar ==förlorade eller skadade ramar== (t.ex. via ACK och omsändning).

**Stop-and-Wait**;;Ett protokoll där sändaren skickar en ram och ==väntar på bekräftelse (ACK) innan nästa skickas==; enkelt men ineffektivt över långa länkar.

**Piggybacking**;;Att ==bekräftelser (ACK) skickas med i vanliga dataramar== åt motsatt håll i stället för i separata ramar; effektivare vid tvåvägstrafik.

**HDLC** (High-level Data Link Control);;Ett *bitorienterat* datalänksprotokoll för punkt-till-punkt och multipunkt som ==implementerar Stop-and-Wait== och är grunden för många praktiska protokoll.

**PPP** (Point-to-Point Protocol);;Ett mycket vanligt datalänksprotokoll för ==punkt-till-punkt-förbindelser== (t.ex. uppringt/DSL); stödjer autentisering och flera slags nyttolast.
