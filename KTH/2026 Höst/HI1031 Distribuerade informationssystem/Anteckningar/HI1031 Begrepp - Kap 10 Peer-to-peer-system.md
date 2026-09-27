---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
description: "Flashcards HI1031 kap 10 – peer-to-peer: skillnaden mot klient-server med för- och nackdelar, passande situationer och datatyper, Napster och upphovsrätten, de sex icke-funktionella kraven, routing overlay och DHT, strukturerat mot ostrukturerat, samt IP jämfört med routning på applikationsnivå."
---
# HI1031 Begrepp - Kap 10 Peer-to-peer-system

## 1. P2P mot klient-server, fördelar och nackdelar

Vad skiljer P2P från klient-server? (2)
||
- **Klient-server:** resurserna ligger på en server, och skalan begränsas av den datorn
- **P2P:** alla datorer bidrar med resurser och är likvärdiga, utan central server

Vilka är P2P:s viktigaste fördelar? (3)
||
- **Utnyttjar oanvänd kapacitet** – lagring och beräkning i vanliga datorer
- **Skalar bra** – klarar många användare med jämn lastbalansering
- **Självorganiserande** – driftskostnaden växer knappt med antalet deltagare

Vilka är P2P:s viktigaste svagheter? (2)
||
- **Föränderlig data är dyr** att lagra jämfört med en betrodd central tjänst
- **Svag anonymitet** – tekniken ger ännu inga starka garantier

Varför kan ett P2P-system inte lova att en viss resurs alltid går att nå?::Datorerna ägs av vanliga användare och kan ==stängas av när som helst==. Systemet kan bara göra chansen att missa alla kopior mycket liten.

## 2. Situationer, datatyper och upphovsrätten

Vilken typ av data passar P2P bäst, och varför?::==Oföränderliga filer== som musik och video. Objektets id (GUID) är en hash av innehållet, så minsta ändring skulle ge ett nytt id.

Vilka två egenskaper hos musikdelning passade P2P? (2)
||
- **Musikfiler ändras aldrig** – kopiorna behöver aldrig hållas i synk
- **Ingen tillgänglighetsgaranti krävs** – är en fil onåbar hämtar man den senare

När passar P2P dåligt?::När man måste ==garantera integritet och tillgänglighet==.

Hur såg Napsters arkitektur ut?::==Centraliserat index==, men själva filerna låg och hämtades på användarnas egna datorer.

Varför kunde Napster stängas ner juridiskt?::De hävdade att de inte deltog i kopieringen, men de ==centrala indexservrarna var en väsentlig del== av det och låg på kända adresser – så operatörerna kunde pekas ut och stämmas.

Varför är helt distribuerad fildelning svår att stoppa juridiskt?::Ansvaret ==sprids ut över alla användare==, så det blir mycket svårt, kanske omöjligt, att rikta rättsliga åtgärder mot någon.

## 3. Icke-funktionella krav

Vilka tre krav följer av att P2P-systemet är stort? (3)
||
- **Global skalbarhet**
- **Lastbalansering**
- **Optimering för närliggande noder** – korta nätavstånd ger lägre fördröjning

Vilka tre krav följer av att datorerna varken ägs eller kan litas på? (3)
||
- **Klarar att noder kommer och går** (dynamisk tillgänglighet)
- **Säkerhet** – autentisering och kryptering vid blandad tillit
- **Anonymitet och motstånd mot censur**

## 4. Att hitta resurser, routing overlay, strukturerat mot ostrukturerat

**Routing overlay**;;En ==algoritm som ruter en förfrågan till den dator som har objektet==. Kallas överlägg för att den ruter i applikationslagret, ovanpå IP.

**GUID**;;En ==globalt unik identifierare== för en nod eller ett objekt, oftast en hash av innehållet. Säger ingenting om var objektet finns.

I ett strukturerat P2P-nät (DHT), var hamnar ett objekt och var hittar man det?::På ==den nod vars GUID ligger närmast objektets GUID== (plus några grannar som håller kopior).

Hur hittar man en resurs i ett ostrukturerat P2P-nät?::Man ==söker genom nätet genom att fråga grannarna== (flooding). Ingen garanti att objektet hittas.

Strukturerat mot ostrukturerat P2P – för- och nackdelar? (4)
||
- **Strukturerat, fördel:** hittar garanterat objektet, med gränser för tid och trafik
- **Strukturerat, nackdel:** måste underhålla en komplex struktur, dyrt när noder kommer och går
- **Ostrukturerat, fördel:** självorganiserande och tåligt mot nodfel
- **Ostrukturerat, nackdel:** ingen garanti att hitta objektet, kan ge mycket söktrafik

P2P:s tre generationer? (3)
||
- **Napster** – centralt index, filerna hos användarna
- **Gnutella/Freenet** – ostrukturerat, mer skalbart och anonymt
- **DHT-mellanprogram** (Pastry m.fl.) – strukturerat, med garanterad leverans

## 5. IP mot routning på applikationsnivå

Vilken relation har rutningsöverlägget till IP?::Det ==ersätter inte IP utan ligger ovanpå==. Varje överläggshopp skickas med ett transportprotokoll (oftast UDP) och kan i sin tur kräva många IP-hopp.

Vad är den skarpaste skillnaden mellan IP och överlägget i hur man pekar ut ett mål?::En ==IP-adress pekar på exakt en dator==, medan överlägget kan ruta till den närmaste kopian av ett objekt.

Hur skiljer sig IP och överlägget i feltolerans?::IP:s redundans är ==inbyggd i nätet== och tål att en router eller länk går ner. Överlägget klarar fel genom att replikera objekt och rutter på flera noder.

Hur skiljer sig IP och överlägget i skala?::IP:s adressrymd är ==begränsad (IPv4: 2³²)==, medan överläggets GUID-rymd är mycket större (2¹²⁸).
