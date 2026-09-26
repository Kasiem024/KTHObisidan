---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
description: "Flashcards HI1031 kap 10 – peer-to-peer: skillnaden mot klient-server med för- och nackdelar, passande situationer och datatyper, Napster och upphovsrätten, de sex icke-funktionella kraven, routing overlay och DHT, strukturerat mot ostrukturerat, samt IP jämfört med routning på applikationsnivå."
---
# HI1031 Begrepp - Kap 10 Peer-to-peer-system

## 1. P2P mot klient-server, fördelar och nackdelar

Vad är målet med peer-to-peer-system?::Att dela data och resurser i ==mycket stor skala== genom att avskaffa varje krav på separat administrerade servrar och deras infrastruktur.

Var ligger resurserna i klient-server-modellen?::På ==en serverdator eller ett litet, tätt kopplat kluster==.

Vad begränsar skalan i klient-server, och vad är fördelen?::Skalan begränsas av ==serverns kapacitet och nätanslutning==. Fördelen är att få beslut behövs om var resurser placeras och hur hårdvaran sköts.

Vilka fem kännetecken har ett P2P-system enligt boken? (5)
||
- Varje användare **bidrar med resurser** till systemet
- Alla noder har **samma funktionella förmåga och samma ansvar**, även om de bidrar med olika mycket
- Korrekt drift **beror inte på något centralt administrerat system**
- De kan ge en **begränsad grad av anonymitet** till både utgivare och användare
- Nyckelfrågan är **algoritmen för att placera data** över många värdar och nå det igen

Vilka tre fördelar med P2P listar boken i sammanfattningen? (3)
||
- De **utnyttjar oanvända resurser** – lagring och beräkning – i värddatorerna
- De **skalar** till många klienter och värdar med utmärkt lastbalansering
- Mellanprogrammet är **självorganiserande**, så supportkostnaden är i stort oberoende av antalet deltagare

Vilka två svagheter med P2P listar boken i sammanfattningen? (2)
||
- Att lagra **föränderlig data är relativt dyrt** jämfört med en betrodd, central tjänst
- Grunden för anonymitet har **ännu inte gett starka garantier**

Varför är P2P-värdar oundvikligen volatila, och vad kan tjänsten då inte lova?::Datorerna ==ägs och sköts av en mängd olika användare==, som inte garanterar att hålla dem påslagna och felfria. Tjänsten kan därför inte lova åtkomst till en enskild resurs, bara göra sannolikheten att missa varje kopia hur liten som helst.

## 2. Situationer, datatyper och upphovsrätten

**Självcertifierande** resurs;;Att en klient som får resursen kan ==räkna om hashen och se att den stämmer==, vilket skyddar mot manipulation från de obetrodda noder resursen legat på.

Vilken typ av data passar P2P-lagring bäst, och varför?::==Oföränderliga objekt== som musik- och videofiler. GUID:et är en hash av tillståndet, så en ändring skulle ge ett annat hashvärde.

Hur kan föränderlig data hanteras trots hashproblemet?::Genom att lägga till ==betrodda servrar== som sköter en versionsföljd och pekar ut den aktuella versionen. Så gör OceanStore och Ivy.

Vilka två egenskaper hos musikdelning kunde Napster utnyttja? (2)
||
- **Musikfiler uppdateras aldrig**, så replikerna behöver inte hållas konsistenta
- **Inga tillgänglighetsgarantier krävs** – är en fil onåbar kan den hämtas senare

När passar P2P sämre?::När ==integritet och tillgänglighet måste garanteras==. Boken säger att de tekniska nackdelarna begränsade Napster-generationen till tillämpningar där sådana garantier var oviktiga.

Hur såg Napsters arkitektur ut?::Med ==centraliserade index==, men användarna tillhandahöll filerna, som lagrades och lästes på deras egna datorer.

Vad hävdade Napsters utvecklare, och varför föll argumentet?::Att de ==inte deltog i kopieringen==, som skedde helt mellan användarnas maskiner. Det föll eftersom indexservrarna bedömdes vara en väsentlig del av processen, och låg på välkända adresser så att operatörerna inte kunde vara anonyma.

Vad skriver boken att en mer fullständigt distribuerad tjänst hade uppnått?::Att ==ansvaret spritts över alla användare==, så att det blivit mycket svårt, om inte omöjligt, att driva rättsliga åtgärder.

## 3. Icke-funktionella krav

Vilka tre icke-funktionella krav följer av att ett P2P-system är stort? (3)
||
- **Global skalbarhet**
- **Lastbalansering** – slumpmässig placering plus repliker av hårt använda resurser
- **Optimering för lokala interaktioner** mellan närliggande peers, eftersom nätavståndet påverkar latensen

Vilka tre icke-funktionella krav följer av att datorerna varken ägs eller kan litas på? (3)
||
- Anpassning till **mycket dynamisk värdtillgänglighet**
- **Säkerhet för data** i en miljö med heterogen tillit, via autentisering och kryptering
- **Anonymitet, förnekbarhet och motstånd mot censur**

Vad innebär kravet på global skalbarhet konkret?::Att stödja tillämpningar som når ==miljoner objekt på tio- eller hundratusentals värdar==.

Vad kräver dynamisk värdtillgänglighet åt båda hållen?::Att en ==anslutande värd integreras och lasten omfördelas== till den, och att systemet upptäcker ett avhopp och fördelar om värdens last och resurser.

Vilken konsekvens drar boken direkt ur kraven?::Att det är ==omöjligt att hålla en databas hos alla klientnoder== över var objekten finns – kunskapen måste partitioneras, distribueras och replikeras, med faktorer så höga som 16.

## 4. Att hitta resurser, routing overlay, strukturerat mot ostrukturerat

**Routing overlay**;;En ==distribuerad algoritm som ruter förfrågningar från klient till en värd som håller objektet==. Kallas överlägg för att den ruter i applikationslagret, skilt från IP-rutningen.

**GUID**;;En ==globalt unik identifierare== för en nod eller ett objekt, normalt en säker hash av tillståndet. Ett *rent* eller *opakt* namn – det avslöjar ingenting om var objektet finns.

Vilka fyra uppgifter har en routing overlay? (4)
||
- **Ruta förfrågningar till objekt** utifrån deras GUID – huvuduppgiften
- **Sätta in objekt**: noden räknar ut ett GUID och anmäler det, så objektet blir nåbart för alla
- **Ta bort objekt**, alltså göra dem otillgängliga
- Hantera att **noder ansluter och lämnar**, genom att flytta ansvar mellan dem

Vad heter de tre operationerna i en distribuerad hashtabell?::==`put(GUID, data)`, `get(GUID)` och `remove(GUID)`==.

Var lagras ett objekt i DHT-modellen?::På ==den nod vars GUID är numeriskt närmast objektets GUID==, plus på de *r* värdar vars GUID:er är näst närmast, där *r* är replikeringsfaktorn.

Vad är prefixrutning?::Att man för varje hopp ==matchar en siffra mer av mål-GUID:et==, så sökningen smalnar av stegvis och antalet hopp växer mycket långsammare än nätet. Används av Pastry och Tapestry.

Hur byggs ett ostrukturerat överlägg, och vad kostar det?::==Ad hoc==, utan övergripande kontroll över topologi eller placering – varje ny nod följer enkla, lokala regler och tar kontakt med grannar. Priset är att man måste söka igenom topologin, utan garanti att objektet hittas.

Vad säger figur 10.11 om strukturerat mot ostrukturerat? (4)
||
- **Strukturerat, fördel:** garanterat att hitta objekt om de finns, kan ge gränser för tid och komplexitet, relativt låg meddelandeomkostnad
- **Strukturerat, nackdel:** måste underhålla ofta komplexa överläggsstrukturer, svårt och kostsamt i dynamiska miljöer
- **Ostrukturerat, fördel:** självorganiserande och naturligt tåligt mot nodfel
- **Ostrukturerat, nackdel:** sannolikhetsbaserat utan absoluta garantier, och benäget till överdriven meddelandeomkostnad

## 5. IP mot routning på applikationsnivå

Hur skiljer sig namnrymderna i skala?::IPv4 har 2³² adresser och IPv6 2¹²⁸, men adresserna är ==hierarkiskt strukturerade och mycket av rymden förallokerad==. GUID-rymden är mycket stor och platt (>2¹²⁸) och kan fyllas mycket mer fullständigt.

Hur snabbt uppdateras rutningstabellerna i IP jämfört med i ett överlägg?::IP asynkront på best-effort med tidskonstanter i storleksordningen ==en timme==; överlägget synkront eller asynkront med bråkdelar av en sekund.

Hur skiljer sig feltoleransen?::IP:s redundans ==byggs in av nätets förvaltare== och tål fel i en router eller koppling, medan *n*-faldig replikering är kostsam. I överlägget kan rutter och objektreferenser replikeras *n*-faldigt.

Vad är den skarpaste skillnaden i målidentifiering?::En ==IP-adress avbildas på exakt en målnod==, medan överlägget kan ruta till den närmaste repliken av ett målobjekt.

Hur skiljer sig säkerhet och anonymitet?::IP-adressering är ==bara säker när alla noder är betrodda==, och anonymitet för adressägarna är inte uppnåelig. Överlägget kan ge säkerhet även med begränsad tillit och en begränsad grad av anonymitet.

Vilken reservation gör boken om skillnaderna mellan IP och överlägget?::Att det ==kan hävdas== att flera av dem uppstår ur IP:s legacy-natur – men att arvets genomslag är för starkt att övervinna.

Vilken relation har rutningsöverlägget till IP?::Det ==ersätter inte IP utan ligger ovanpå==. Varje överläggshopp genomförs med ett underliggande transportprotokoll, normalt UDP, och kan kräva många IP-hopp.
