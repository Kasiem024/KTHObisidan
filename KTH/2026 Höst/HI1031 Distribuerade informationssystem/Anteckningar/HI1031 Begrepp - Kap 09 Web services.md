---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-26
description: "Flashcards HI1031 kap 9 – web services: SOAP, WSDL, UDDI och REST samt lös koppling och interoperabilitet."
---
# HI1031 Begrepp - Kap 09 Web services

**Webbtjänst** (web service);;En tjänst som ==anropas över internet via öppna standarder== (ofta HTTP och XML), så att program på olika plattformar kan samverka *löst kopplat*.

**SOAP**;;Ett ==XML-baserat protokoll för meddelanden== mellan webbtjänster, vanligtvis skickat över HTTP.

**WSDL** (Web Services Description Language);;Ett *XML-språk* som ==beskriver en webbtjänsts gränssnitt== – vilka operationer och meddelanden som finns och var tjänsten nås.

**UDDI**;;En ==katalog- och namntjänst för webbtjänster== där tjänster kan publiceras och sökas upp (via namn eller kategori) för att hitta deras beskrivning.

**REST**;;En arkitekturstil där allt ses som ==resurser med URL:er== som manipuleras med HTTP:s standardmetoder (GET/POST/PUT/DELETE); enkelt och lättviktigt.

Vad skiljer SOAP-baserade webbtjänster från REST?
||
- **SOAP:** meddelanden i *XML* med en rik men tung egen protokollstack.
- **REST:** använder ==HTTP:s egna metoder== direkt på *resurser* (URL:er) – enklare och lättare.

**Löst kopplad** (loose coupling);;När parter samverkar ==med minimalt beroende av varandras interna detaljer==; en bärande idé bakom webbtjänster och tjänsteorienterad arkitektur (SOA).

Varför bygger webbtjänster på öppna format som XML och HTTP?::För ==interoperabilitet== – öppna, textbaserade standarder gör att helt olika system och språk kan samverka, och trafiken tar sig igenom brandväggar.

**SOA** (tjänsteorienterad arkitektur);;Att bygga system av ==löst kopplade, oberoende tjänster med väldefinierade gränssnitt== som kan kombineras (t.ex. *mashups*) och nås globalt – möjliggör *business-to-business*-integration mellan organisationer.

**Ajax** (Asynchronous JavaScript and XML);;En teknik där webbläsaren gör ==asynkrona anrop i bakgrunden== (ofta till webbtjänster) och uppdaterar *delar* av sidan utan omladdning – ger responsiva webbappar trots nätets fördröjning (t.ex. Google Maps).
