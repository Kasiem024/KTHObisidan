---
tags: [tenta, HI1032, nätverk, KTH, year2026]
created: 2026-10-02
updated: 2026-10-02
description: "Flashcards för HI1032:s tenta, Del B Applikationsnivån, prioriterade efter tentaanalysen av fyra gamla tentor. Fråga 5-poolen i sin helhet, plus SNMP, FTP, DNS och bildkomprimering i den ordning analysen rekommenderar."
---

# HI1032 Tentaplugg - Del B Applikationsnivån

Urvalet styrs av [[HI1032 Tentaanalys - Ranking och poängstrategi]]. Godkänt kräver 9 av 22 poäng
i den här delen, oberoende av Del A. Fråga 5-poolen nedan ger 7–8 av dem och låg inom poolen i alla
fyra gamla tentor, så den är viktigast.

Ordningen efter poolen är analysens egen: SNMP, sedan FTP före DNS, eftersom DNS gav noll poäng
utöver fråga 5 i oktober 2024 medan FTP gav fem.

## Fråga 5-poolen

Vad är huvudalternativet till klient-server?::==Peer-to-peer==

Vad är serverns roll i klient-servermodellen?::Att ==svara på och utföra klienternas instruktioner==

Vilken teckenkodning klarar å ä ö?::==ISO-8859-1 (Latin1), UTF-8 eller windows-1252==

Vad faller under C i FCAPS?::==Configuration== — hur enheter är kopplade, hårdvara, mjukvara, inställningar

Vad faller under A i FCAPS?::==Accounting==, till exempel debitering och surfpott

Hur är en OID uppbyggd?::==En sekvens heltal som pekar ut en gren i ett träd==

Vad gör BER i SNMP?::==Kodar datat till binärformat==

Varför räcker tre värden för att beskriva en färg?::Ögat har ==tre typer av tappar==

Vad är spatial komprimering i MPEG?::==Varje bildruta komprimeras för sig som en stillbild==, till exempel med JPEG

Är det DCT-steget som är lossy i JPEG?::==Nej==

Vad är ett makroblock i JPEG?::==Fyra intilliggande 8x8-block==, används för att downsampla Cb och Cr

Vad innebär PCM?::Amplituden lagras som ==ett heltal med viss precision==, ett värde var x:e millisekund

Vad anger Content-Type i MIME?::==Filtypen==, hierarkiskt i två nivåer, till exempel text/plain

Vad är syftet med POP och IMAP?::==Hämta mottagen e-post från den egna e-postservern==

Vad anger DNS-posttypen AAAA?::==En IPv6-adress==

Varför tar ett byte av A-posten timmar att slå igenom?::==Caching==, framför allt i DNS-resolvern

Varför duger TCP för streaming av lagrad media?::Vi kan ==buffra en bit först och sedan använda flödeskontroll==

Vilket protokoll bär ljud och bild i ett videosamtal?::==RTP==

Varför skickas serverns DNS-namn i HTTP-anropet?::Ett ==webbhotell med en IP-adress kan ha flera webbservrar==

Vad är fördelen med server push i HTTP/2?::==Lägre latens== — klienten får css och js innan den frågar

Varför behövs MIME när vi skickar e-post?::RFC822 klarar ==bara 7-bitars US-ASCII och ingen rik text==; MIME ger andra teckenuppsättningar, filtyper och bilagor

Vad kan en RTP-sändare göra vid congestion, och hur får den veta?::==Komprimera hårdare== genom att ändra kodning, upplösning eller fps; informationen kommer via RTCP från mottagarna

Vad kan SSH användas till utöver terminal?::==Säker filöverföring och tunnling av osäkra protokoll==

## SNMP

Vilka SNMP-meddelanden skickar managern till agenten? (3)
||
- **GetRequest**
- **GetNextRequest**
- **SetRequest**

Vilket SNMP-meddelande skickar agenten till managern?::==Trap==

Vad gör GetNextRequest i SNMP?::Ger ==nästa variabel i MIB-trädet==

Vad är MIB i SNMP?::==Specifikationen av allt som går att övervaka==, ordnad som ett träd

Hur skiljer sig en Counter från en Gauge i SNMP?::Counter ==räknar bara uppåt och slår runt==, medan Gauge går upp och ner

Vad har Counter, Gauge och INTEGER gemensamt i SNMP?::Alla tre är ==32-bitars unsigned==

Vad faller under F i FCAPS?::==Fault== — upptäcka, isolera, rätta och dokumentera fel

Vad faller under P i FCAPS?::==Performance== — övervaka att nätet går så effektivt som möjligt: kapacitet, trafik, genomströmning, svarstid

Vad faller under S i FCAPS?::==Security== — styra åtkomsten till nätet enligt en bestämd policy, med kryptering och autentisering

## FTP

Vilka två förbindelser använder FTP, och vad går de över? (2)
||
- **Kontrollförbindelsen** för kommandon, över TCP
- **Dataförbindelsen** för filen, över TCP

Hur ser ett FTP-kommando ut?::==Fyra bokstäver, argument och radbrytning==, till exempel CWD /home/martin

Vem öppnar FTP:s dataförbindelse, och från vilken port?::==Servern, från port 20==

När stänger FTP dataförbindelsen?::==När filen är slut==

Vad räcker FTP:s kontrollförbindelse till på egen hand?::==Skapa en tom mapp eller ta bort filer==

## DNS

Varför använder DNS oftast UDP?::==TCP skulle kräva en handskakning per fråga==, alltså stor overhead

När använder DNS TCP i stället för UDP?::==När svaret är större än 512 byte==

Hur hittar DNS-resolvern rotservrarna?::Deras adresser är ==förprogrammerade i resolvern==

Hur får klienten adressen till sin DNS-resolver?::==Oftast via DHCP==

I en iterativ DNS-uppslagning, var kommer nästa servers adress ifrån?::==I svaret från servern på nivån ovanför==

Vad skiljer rekursiv från iterativ DNS-uppslagning?::I rekursiv ==gör servrarna jobbet mellan sig och svaret kommer tillbaka samma väg==; i iterativ får frågaren adressen till nästa server och frågar vidare själv

Vad pekar DNS-posttypen MX ut?::==Mottagarens e-postserver==, alltså dess MTA

## Bild- och videokomprimering

Vad gör DCT-steget med värdena i JPEG?::==Flyttar de viktiga värdena till övre vänstra hörnet== och gör resten små

Vilka steg kommer efter DCT i JPEG? (2)
||
- **Kvantisering**
- **Zigzag-kodning**

Vilka bildformat är lossless? (3)
||
- **PNG**
- **GIF**
- **TIFF**

Vilka bildformat är lossy? (2)
||
- **JPEG**
- **HEIC**

## RTP och SIP

Varför går RTP över UDP och inte TCP?::TCP:s ==omsändningar tar för lång tid== och stör allt som kommer efter

Vad gör SIP? (3)
||
- **Etablerar och avslutar** sessionen
- **Hittar motparten**
- **Förhandlar kodningen** med SDP

## E-post, MIME och Base64

Hur avslutar SMTP ett meddelande?::Med en ==punkt på egen rad==

Vad tillför S/MIME utöver MIME?::==Kryptering==

Hur mycket större blir datat av Base64?::==33 procent== — tre byte blir fyra ASCII-tecken

## HTTP

Hur anger HTTP/1.1 hur långt svaret är?::Med fältet ==Content-Length== i huvudet
