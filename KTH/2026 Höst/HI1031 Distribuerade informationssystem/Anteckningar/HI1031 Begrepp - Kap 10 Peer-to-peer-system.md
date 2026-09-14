---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 10 – peer-to-peer: skillnaden mot klient-server med för- och nackdelar, passande situationer och datatyper, Napster och upphovsrätten, de sex icke-funktionella kraven, routing overlay och DHT, strukturerat mot ostrukturerat, samt IP jämfört med routning på applikationsnivå."
---
# HI1031 Begrepp - Kap 10 Peer-to-peer-system

## 1. P2P mot klient-server, fördelar och nackdelar

Vad är målet med peer-to-peer-system?::Att dela data och resurser i ==mycket stor skala== genom att ==avskaffa varje krav på separat administrerade servrar== och deras infrastruktur.

Var ligger resurserna i klient-server, och vad begränsar skalan?::På ==en server eller ett litet, tätt kopplat kluster==. Skalan begränsas av ==serverns kapacitet och nätanslutning==.

Vilka två skäl ger boken till att det inte räcker att köpa fler servrar?
||
- Kostnaderna för ==administration och felåterställning dominerar== när allt måste ägas och skötas av leverantören
- ==Nätbandbredden== till en enda serverplats är också en stor begränsning

Vad är fördelen med klient-servers centraliserade design?::Att ==få beslut behövs== om var resurser placeras och hur serverns hårdvara sköts.

Vilka fem kännetecken har ett P2P-system enligt boken? (5)
||
- Varje användare ==bidrar med resurser== till systemet
- Alla noder har ==samma funktionella förmåga och samma ansvar==, även om de bidrar med olika mycket
- Korrekt drift ==beror inte på något centralt administrerat system==
- De kan ge en ==begränsad grad av anonymitet== till både utgivare och användare
- Nyckelfrågan är ==algoritmen för att placera data== över många värdar och nå det igen

Vilka tre fördelar med P2P listar boken i sammanfattningen? (3)
||
- De ==utnyttjar oanvända resurser== (lagring, beräkning) i värddatorerna
- De ==skalar== till många klienter och värdar med utmärkt lastbalansering
- Mellanprogrammet är ==självorganiserande==, så supportkostnaden är i stort oberoende av antalet deltagare

Vilka två svagheter med P2P listar boken i sammanfattningen? (2)
||
- Att lagra ==föränderlig data är relativt dyrt== jämfört med en betrodd, central tjänst
- Grunden för anonymitet har ==ännu inte gett starka garantier==

Varför är P2P-värdar oundvikligen volatila?::Därför att datorerna och anslutningarna ==ägs och sköts av en mängd olika användare==, som inte garanterar att hålla dem påslagna, anslutna och felfria.

Vad kan en P2P-tjänst inte lova, och vad kan den lova i stället?::Den kan ==inte lova garanterad åtkomst till en enskild resurs==, men den kan göra ==sannolikheten att inte nå någon kopia av ett replikerat objekt hur liten som helst==.

Hur kan volatiliteten vändas till en styrka?::Den ==replikering som volatiliteten kräver== kan utnyttjas för att ==stå emot manipulation== från illvilliga noder.

## 2. Situationer, datatyper och upphovsrätten

**Självcertifierande** resurs;;Att en klient som får resursen kan ==räkna om hashen och se att den stämmer==, vilket skyddar mot manipulation från de obetrodda noder resursen legat på.

Varför måste resurser vara oföränderliga i ett P2P-lagringssystem?::Eftersom GUID:et är en hash av tillståndet – en ==ändring skulle ge ett annat hashvärde==.

Vilken typ av data passar P2P-lagring bäst, enligt boken?::==Oföränderliga objekt==, som musik- och videofiler. Boken skriver att systemen är "i grunden bäst lämpade" för dem.

Hur kan föränderlig data hanteras trots hashproblemet?::Genom att lägga till ==betrodda servrar== som sköter en ==versionsföljd== och pekar ut den aktuella versionen. Så gör OceanStore och Ivy.

Vilka två egenskaper hos musikdelning kunde Napster utnyttja? (2)
||
- ==Musikfiler uppdateras aldrig==, så replikerna behöver inte hållas konsistenta
- ==Inga tillgänglighetsgarantier krävs== – är en fil onåbar kan den hämtas senare

När passar P2P sämre?::När ==integritet och tillgänglighet måste garanteras==. Boken säger att de tekniska nackdelarna begränsade Napster-generationen till tillämpningar där sådana garantier var oviktiga.

Hur såg Napsters arkitektur ut?::Med ==centraliserade (replikerade) index==, men ==användarna tillhandahöll filerna==, som lagrades och lästes på deras egna datorer.

Vad hävdade Napsters utvecklare i rättsprocessen?::Att de ==inte var ansvariga== för intrånget, eftersom de ==inte deltog i kopieringen== – den skedde helt mellan användarnas maskiner.

Varför föll Napsters argument, och varför kunde operatörerna stämmas?::Eftersom ==indexservrarna bedömdes vara en väsentlig del av processen==, och eftersom de låg på ==välkända adresser== så att operatörerna ==inte kunde vara anonyma==.

Vad skriver boken att en mer fullständigt distribuerad tjänst hade uppnått?::Att ==ansvaret spritts över alla användare==, så att det blivit ==mycket svårt, om inte omöjligt==, att driva rättsliga åtgärder.

Vilket legitimt skäl till anonymitet ger boken?::Att ==övervinna censur== och bevara yttrandefriheten i repressiva samhällen. Boken tar uttryckligen ==inte ställning== till om filkopiering är legitimt.

## 3. Icke-funktionella krav

Vilka är de tre första icke-funktionella kraven boken ställer på P2P-mellanprogram? (3)
||
- ==Global skalbarhet==
- ==Lastbalansering==
- ==Optimering för lokala interaktioner== mellan närliggande peers

Vilka är de tre sista icke-funktionella kraven boken ställer på P2P-mellanprogram? (3)
||
- Anpassning till ==mycket dynamisk värdtillgänglighet==
- ==Säkerhet för data== i en miljö med heterogen tillit
- ==Anonymitet, förnekbarhet och motstånd mot censur==

Vad innebär kravet på global skalbarhet konkret?::Att stödja tillämpningar som når ==miljoner objekt på tio- eller hundratusentals värdar==.

Hur uppnås lastbalansering i ett P2P-system?::Med ==slumpmässig placering== av resurser plus ==repliker av hårt använda== resurser.

Varför ska resurser placeras nära de noder som använder dem?::Eftersom ==nätavståndet== mellan noder som interagerar påverkar ==latensen== märkbart, och även belastningen på nättrafiken.

Vad kräver dynamisk värdtillgänglighet åt båda hållen?::Att en ==anslutande värd integreras och lasten omfördelas== till den, och att systemet ==upptäcker ett avhopp och fördelar om== värdens last och resurser.

Vad är det funktionella kravet på P2P-mellanprogram?::Att klienter kan ==hitta och kommunicera med varje enskild resurs== fast de är spridda, att ==resurser och värdar kan läggas till och tas bort== fritt, och att gränssnittet är ==oberoende av resurstypen==.

Vilken konsekvens drar boken direkt ur skalbarhets- och tillgänglighetskraven?::Att det är ==omöjligt att hålla en databas hos alla klientnoder== över var objekten finns – kunskapen måste ==partitioneras, distribueras och replikeras==, med faktorer så höga som ==16==.

## 4. Att hitta resurser, routing overlay, strukturerat mot ostrukturerat

**Routing overlay**;;En ==distribuerad algoritm== som lokaliserar noder och objekt: ett ==lager i mellanprogrammet som ruter förfrågningar från klient till en värd som håller objektet==.

Varför kallas den ett *överlägg*?::Eftersom den ruter i ==applikationslagret==, ==helt skilt från== rutningsmekanismer på nätnivå som IP-rutning.

Hur hittar överlägget rätt värd?::Genom att ruta förfrågan genom en ==följd av noder== och utnyttja ==kunskapen hos var och en==. Finns flera repliker levereras till den ==närmaste levande noden== som har en kopia.

Vilka fyra uppgifter har en routing overlay? (4)
||
- ==Ruta förfrågningar till objekt== utifrån deras GUID – huvuduppgiften
- ==Sätta in objekt==: noden räknar ut ett GUID och anmäler det, så objektet blir nåbart för alla
- ==Ta bort objekt==, alltså göra dem otillgängliga
- Hantera att ==noder ansluter och lämnar==, genom att flytta ansvar mellan dem

**GUID**;;En ==globalt unik identifierare== för en nod eller ett objekt, normalt en säker hash av tillståndet. Ett ==rent== eller ==opakt== namn – det avslöjar ingenting om var objektet finns.

Varför räcker det inte att ha GUID-systemet för att en människa ska hitta en resurs?::GUID:er är ==inte läsbara för människor==, så klienten måste först få tag på GUID:et via ==någon form av indextjänst== med läsbara namn eller sökningar.

Vad heter de tre operationerna i en distribuerad hashtabell?::==`put(GUID, data)`==, ==`get(GUID)`== och ==`remove(GUID)`==.

Var lagras ett objekt i DHT-modellen?::På ==den nod vars GUID är numeriskt närmast objektets GUID==, plus på de *r* värdar vars GUID:er är näst närmast, där *r* är replikeringsfaktorn.

Vad är skillnaden mellan DHT och DOLR?::==DHT bestämmer var objektet ska ligga==, medan ==DOLR får veta var det redan ligger== och håller en avbildning från GUID till nodadresser. DOLR anmäler repliker med `publish(GUID)`.

Vad är prefixrutning?::Att rutten avgörs av mål-GUID:ets värde: en ==binär mask väljer ut ett ökande antal hexadecimala siffror== ur mål-GUID:et efter varje hopp, så man matchar ==en siffra mer av målet per hopp==. Används av Pastry och Tapestry.

Vad betyder det att Pastry ruter i *O(log N)* steg?::Att antalet hopp växer ==mycket långsammare än nätet==. Tiodubblas antalet noder ökar hoppen bara med en konstant – det är därför metoden fungerar i global skala.

Vad händer i Pastry om målnoden inte är aktiv?::Meddelandet levereras till den ==aktiva nod vars GUID är numeriskt närmast==. Aktiva noder tar ansvar för alla objekt i sin numeriska omgivning.

Hur byggs ett ostrukturerat överlägg?::==Ad hoc==, utan någon övergripande kontroll över topologi eller objektplacering. Varje ny nod följer ==enkla, lokala regler== och tar kontakt med en uppsättning grannar.

Vilka fördelar har strukturerade respektive ostrukturerade system? (figur 10.11)
||
- **Strukturerat:** ==garanterat att hitta objekt== om de finns, kan ge ==gränser för tid och komplexitet==, relativt låg meddelandeomkostnad
- **Ostrukturerat:** ==självorganiserande== och naturligt ==tåligt mot nodfel==

Vilka nackdelar har strukturerade respektive ostrukturerade system? (figur 10.11)
||
- **Strukturerat:** måste ==underhålla ofta komplexa överläggsstrukturer==, svårt och kostsamt särskilt i mycket dynamiska miljöer
- **Ostrukturerat:** ==sannolikhetsbaserat==, kan inte ge absoluta garantier, och benäget till ==överdriven meddelandeomkostnad== som påverkar skalbarheten

Vilket angreppssätt dominerar faktiskt Internet, och varför är det förvånande?::Det ==ostrukturerade== – Gnutella, FreeNet och BitTorrent använder alla det, ==trots== att det inte kan garantera att objekt hittas.

Vilka tre sökstrategier förbättrar sökning i ostrukturerade nät? (3)
||
- ==Expanded ring search==: en följd av sökningar med växande time-to-live, eftersom många möts lokalt
- ==Random walks==: ett antal vandrare följer egna slumpmässiga vägar genom grafen
- ==Gossiping==: förfrågan skickas till en granne med en viss sannolikhet, så den sprids som ett virus – kallas därför också epidemiska protokoll

Vad gjorde Gnutella 0.4 fel?::Varje nod ==vidarebefordrade förfrågan till varje granne==, begränsat bara av ett time-to-live-fält. Enkelt, men det ==skalar inte== och flödar snabbt nätet.

**Hybridarkitektur**;;Att noder med ==extra resurser väljs till ultrapeers== och bildar nätets hjärta, medan övriga blir ==löv== som kopplar sig till ett fåtal ultrapeers. Eftersom ultrapeers är tungt kopplade till varandra ==minskar det dramatiskt== antalet hopp en fullständig sökning kräver. Infördes i Gnutella 0.6 och används också i Skype.

## 5. IP mot routning på applikationsnivå

Hur skiljer sig namnrymderna i skala?::IPv4 har 2³² adresser och IPv6 2¹²⁸, men adresserna är ==hierarkiskt strukturerade och mycket av rymden förallokerad==. GUID-rymden är ==mycket stor och platt== (>2¹²⁸) och kan därför ==fyllas mycket mer fullständigt==.

Hur skiljer sig lastbalanseringen?::IP:s last på routrar bestäms av ==nätets topologi och trafikmönstren==. I överlägget kan objektens placering ==slumpas==, så trafikmönstren ==skiljs från topologin==.

Hur snabbt uppdateras rutningstabellerna i IP jämfört med i ett överlägg?::IP asynkront på best-effort med tidskonstanter i storleksordningen ==en timme==; överlägget synkront eller asynkront med ==bråkdelar av en sekund==.

Hur skiljer sig feltoleransen?::IP:s redundans ==byggs in av nätets förvaltare== och tål fel i en router eller koppling, medan *n*-faldig replikering är kostsam. I överlägget kan rutter och objektreferenser ==replikeras *n*-faldigt==.

Vad är den skarpaste skillnaden i målidentifiering?::En ==IP-adress avbildas på exakt en målnod==, medan överlägget kan ==ruta till den närmaste repliken== av ett målobjekt.

Hur skiljer sig säkerhet och anonymitet?::IP-adressering är ==bara säker när alla noder är betrodda==, och anonymitet för adressägarna är ==inte uppnåelig==. Överlägget kan ge ==säkerhet även med begränsad tillit== och en ==begränsad grad av anonymitet==.

Vilken reservation gör boken om skillnaderna mellan IP och överlägget?::Att det ==kan hävdas== att flera av dem uppstår ur IP:s ==legacy-natur== – men att arvets genomslag är ==för starkt att övervinna==.

Vad betyder best-effort om IP:s rutningstabeller?::Att nätet ==försöker leverera men inte lovar något== – inga garantier om att en uppdatering kommer fram eller när.

Vad är en säker hash, och varför spelar det roll här?::En funktion som gör om data av valfri storlek till ett kort värde, där det i praktiken är ==omöjligt att hitta två olika data med samma värde==. Värdet blir därför ett ==fingeravtryck av innehållet==, vilket är vad som gör en resurs självcertifierande.

Vilken relation har rutningsöverlägget till IP?::Det ==ersätter inte IP utan ligger ovanpå==. Varje överläggshopp genomförs med ett underliggande transportprotokoll, ==normalt UDP==, och ett enda överläggshopp kan kräva ==många IP-hopp==.
