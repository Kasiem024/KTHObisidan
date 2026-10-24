---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 10 – peer-to-peer: skillnaden mot klient-server med för- och nackdelar, passande situationer och datatyper, Napster och upphovsrätten, de sex icke-funktionella kraven, routing overlay och DHT, strukturerat mot ostrukturerat, samt IP jämfört med routning på applikationsnivå."
---
# HI1031 Begrepp - Kap 10 Peer-to-peer-system

## 1. P2P mot klient-server, fördelar och nackdelar

Vad skiljer P2P från klient-server? (2)
||
- **Klient-server:** resurserna ligger på en server, och skalan begränsas av den datorn
- **P2P:** alla datorer bidrar med resurser och är likvärdiga, utan central server
<!--SR:!fsrs,2026-10-23T13:08:42.834Z,7,7.1657096,7.82817172,2,5,0,0,2026-10-16T13:08:42.834Z-->

Vilka är P2P:s viktigaste fördelar? (3)
||
- **Utnyttjar oanvänd kapacitet** – lagring och beräkning i vanliga datorer
- **Skalar bra** – klarar många användare med jämn lastbalansering
- **Självorganiserande** – driftskostnaden växer knappt med antalet deltagare
<!--SR:!fsrs,2026-10-31T09:16:07.340Z,9,8.88594896,9.18400844,2,8,0,0,2026-10-22T09:16:07.340Z-->

Vilka är P2P:s viktigaste svagheter? (2)
||
- **Föränderlig data är dyr** att lagra jämfört med en betrodd central tjänst
- **Svag anonymitet** – tekniken ger ännu inga starka garantier
<!--SR:!fsrs,2026-10-26T16:59:36.314Z,5,5.10162958,9.57414278,2,9,1,0,2026-10-21T16:59:36.314Z-->

Varför kan ett P2P-system inte lova att en viss resurs alltid går att nå?::Datorerna ägs av vanliga användare och kan ==stängas av när som helst==. Systemet kan bara göra chansen att missa alla kopior mycket liten.
<!--SR:!fsrs,2026-10-24T22:39:12.648Z,11,11.24994299,5.19004872,2,3,0,0,2026-10-13T22:39:12.648Z-->

## 2. Situationer, datatyper och upphovsrätten

Vilken typ av data passar P2P bäst, och varför?::==Oföränderliga filer== som musik och video. Objektets id (GUID) är en hash av innehållet, så minsta ändring skulle ge ett nytt id.
<!--SR:!fsrs,2026-10-25T15:50:59.279Z,10,9.58319878,6.77731618,2,4,0,0,2026-10-15T15:50:59.279Z-->

Vilka två egenskaper hos musikdelning passade P2P? (2)
||
- **Musikfiler ändras aldrig** – kopiorna behöver aldrig hållas i synk
- **Ingen tillgänglighetsgaranti krävs** – är en fil onåbar hämtar man den senare
<!--SR:!fsrs,2026-10-23T13:06:44.987Z,7,7.1657096,7.82817172,2,5,0,0,2026-10-16T13:06:44.987Z-->

När passar P2P dåligt?::När man måste ==garantera integritet och tillgänglighet==.
<!--SR:!fsrs,2026-11-06T10:50:11.873Z,15,15.20984622,7.80567534,2,6,0,0,2026-10-22T10:50:11.873Z-->

Hur såg Napsters arkitektur ut?::==Centraliserat index==, men själva filerna låg och hämtades på användarnas egna datorer.
<!--SR:!fsrs,2026-10-23T12:06:35.369Z,9,9.0922167,6.78887202,2,4,0,0,2026-10-14T12:06:35.369Z-->

Varför kunde Napster stängas ner juridiskt?::De hävdade att de inte deltog i kopieringen, men de ==centrala indexservrarna var en väsentlig del== av det och låg på kända adresser – så operatörerna kunde pekas ut och stämmas.
<!--SR:!fsrs,2026-10-27T22:45:09.904Z,13,13.03762871,5.19004872,2,3,0,0,2026-10-14T22:45:09.904Z-->

Varför är helt distribuerad fildelning svår att stoppa juridiskt?::Ansvaret ==sprids ut över alla användare==, så det blir mycket svårt, kanske omöjligt, att rikta rättsliga åtgärder mot någon.
<!--SR:!fsrs,2026-11-20T16:49:04.311Z,30,31.53242237,5.6856738,2,5,0,0,2026-10-21T16:49:04.311Z-->

## 3. Icke-funktionella krav

Vilka tre krav följer av att P2P-systemet är stort? (3)
||
- **Global skalbarhet**
- **Lastbalansering**
- **Optimering för närliggande noder** – korta nätavstånd ger lägre fördröjning
<!--SR:!fsrs,2026-10-23T13:20:57.956Z,7,7.1657096,7.82817172,2,5,0,0,2026-10-16T13:20:57.956Z-->

Vilka tre krav följer av att datorerna varken ägs eller kan litas på? (3)
||
- **Klarar att noder kommer och går** (dynamisk tillgänglighet)
- **Säkerhet** – autentisering och kryptering vid blandad tillit
- **Anonymitet och motstånd mot censur**
<!--SR:!fsrs,2026-10-23T13:08:58.874Z,7,7.1657096,7.82817172,2,5,0,0,2026-10-16T13:08:58.874Z-->

## 4. Att hitta resurser, routing overlay, strukturerat mot ostrukturerat

**Routing overlay**;;En ==algoritm som ruter en förfrågan till den dator som har objektet==. Kallas överlägg för att den ruter i applikationslagret, ovanpå IP.
<!--SR:!fsrs,2026-10-23T22:38:26.216Z,9,9.17562561,6.79877821,2,3,0,0,2026-10-14T22:38:26.216Z!fsrs,2026-10-23T22:45:26.359Z,9,9.17562561,6.79877821,2,3,0,0,2026-10-14T22:45:26.359Z-->

**GUID**;;En ==globalt unik identifierare== för en nod eller ett objekt, oftast en hash av innehållet. Säger ingenting om var objektet finns.
<!--SR:!fsrs,2026-10-23T12:13:43.213Z,9,9.17562561,6.79877821,2,3,0,0,2026-10-14T12:13:43.213Z!fsrs,2026-10-23T23:50:54.012Z,9,9.17562561,6.79877821,2,3,0,0,2026-10-14T23:50:54.012Z-->

I ett strukturerat P2P-nät (DHT), var hamnar ett objekt och var hittar man det?::På ==den nod vars GUID ligger närmast objektets GUID== (plus några grannar som håller kopior).
<!--SR:!fsrs,2026-11-20T16:17:36.385Z,30,33.91869353,5.15529788,2,5,0,0,2026-10-21T16:17:36.385Z-->

Hur hittar man en resurs i ett ostrukturerat P2P-nät?::Man ==söker genom nätet genom att fråga grannarna== (flooding). Ingen garanti att objektet hittas.
<!--SR:!fsrs,2026-10-25T10:52:09.953Z,8,8.09109212,7.82817172,2,5,0,0,2026-10-17T10:52:09.953Z-->

Strukturerat mot ostrukturerat P2P – för- och nackdelar? (4)
||
- **Strukturerat, fördel:** hittar garanterat objektet, med gränser för tid och trafik
- **Strukturerat, nackdel:** måste underhålla en komplex struktur, dyrt när noder kommer och går
- **Ostrukturerat, fördel:** självorganiserande och tåligt mot nodfel
- **Ostrukturerat, nackdel:** ingen garanti att hitta objektet, kan ge mycket söktrafik
<!--SR:!fsrs,2026-11-05T17:02:45.913Z,15,14.97892166,7.80567534,2,6,0,0,2026-10-21T17:02:45.913Z-->

P2P:s tre generationer? (3)
||
- **Napster** – centralt index, filerna hos användarna
- **Gnutella/Freenet** – ostrukturerat, mer skalbart och anonymt
- **DHT-mellanprogram** (Pastry m.fl.) – strukturerat, med garanterad leverans
<!--SR:!fsrs,2026-11-05T14:17:50.690Z,15,15.29238374,7.80567534,2,6,0,0,2026-10-21T14:17:50.690Z-->

## 5. IP mot routning på applikationsnivå

Vilken relation har rutningsöverlägget till IP?::Det ==ersätter inte IP utan ligger ovanpå==. Varje överläggshopp skickas med ett transportprotokoll (oftast UDP) och kan i sin tur kräva många IP-hopp.
<!--SR:!fsrs,2026-11-20T16:26:17.151Z,30,31.53242237,5.6856738,2,5,0,0,2026-10-21T16:26:17.151Z-->

Vad är den skarpaste skillnaden mellan IP och överlägget i hur man pekar ut ett mål?::En ==IP-adress pekar på exakt en dator==, medan överlägget kan ruta till den närmaste kopian av ett objekt.
<!--SR:!fsrs,2026-11-20T19:57:26.553Z,30,31.53242237,5.6856738,2,5,0,0,2026-10-21T19:57:26.553Z-->

Hur skiljer sig IP och överlägget i feltolerans?::IP:s redundans är ==inbyggd i nätet== och tål att en router eller länk går ner. Överlägget klarar fel genom att replikera objekt och rutter på flera noder.
<!--SR:!fsrs,2026-10-23T13:06:36.468Z,7,7.1657096,7.82817172,2,5,0,0,2026-10-16T13:06:36.468Z-->

Hur skiljer sig IP och överlägget i skala?::IP:s adressrymd är ==begränsad (IPv4: $2^{32}$)==, medan överläggets GUID-rymd är mycket större ($2^{128}$).
<!--SR:!fsrs,2026-10-23T23:51:33.921Z,9,9.17562561,6.79877821,2,3,0,0,2026-10-14T23:51:33.921Z-->
