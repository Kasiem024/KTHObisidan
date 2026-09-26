---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-09
updated: 2026-09-15
description: "Svar på tentafrågorna för kapitel 10 om peer-to-peer-system: skillnaden mot klient-server med för- och nackdelar, vilka situationer och datatyper som passar, kopplingen till upphovsrätt via Napster, de sex icke-funktionella kraven, hur en resurs hittas med routing overlay, strukturerat mot ostrukturerat, samt jämförelsen mellan IP och routing på applikationsnivå."
---

# HI1031 Tentafrågor och Svar - Kap 10 Peer-to-peer-system

Fem tentafrågor, och allt finns i boken. Tabellerna i fråga 4 och 5 är hämtade ur original-PDF:en
eftersom de var stympade i textversionen — se `## Luckor och källor`.

## 1. Vad skiljer P2P från klient/server-modellen? Vilka är de viktigaste fördelarna respektive nackdelarna med ett P2P-system?

Bokens avsnitt: §10.1 och §10.7.

**Målet förklarar hela skillnaden.** P2P ska göra det möjligt att dela data och resurser i ==mycket stor
skala, genom att slippa servrar som måste skötas för sig== och all infrastruktur runt dem. Säg den
meningen först — resten följer ur den.

**Så här ser klient-server ut.** Resurserna ligger på ==en serverdator eller ett litet, tätt kopplat
kluster==. Fördelen är att ==få beslut behövs== om var resurser ska placeras och hur hårdvaran ska
skötas. Nackdelen är att ==tjänstens skala begränsas av serverns kapacitet och nätanslutning==. Att bara
köpa fler servrar löser det inte: om leverantören äger och sköter alla datorer ==går det mesta åt till
drift och att laga fel==, och hur mycket bandbredd en enda serverplats kan få är också en ==stor
begränsning==.

**Så här ser P2P ut.** Resurserna ligger på datorer ==spridda över ett nätverk==, och algoritmerna för
att placera och sedan hitta objekten är en ==nyckeldel av designen==. Målet är en tjänst som är ==helt
decentraliserad och självorganiserande== — alltså att den ==själv ordnar om sig== när datorer ansluter
och lämnar, utan att någon konfigurerar den.

**Bokens fem kännetecken för ett P2P-system:**

1. Designen ser till att ==varje användare bidrar med resurser== till systemet.
2. Noderna kan bidra med olika mycket, men ==alla noder har samma funktionella förmåga och samma
   ansvar==.
3. Att systemet fungerar rätt ==beror inte på något centralt administrerat system==.
4. De kan byggas så att de ger en ==begränsad grad av anonymitet== till både de som tillhandahåller och
   de som använder resurser.
5. Nyckelfrågan för effektiv drift är ==valet av algoritm för att placera data över många värdar== och
   komma åt det igen, balanserat och tillgängligt utan för stora omkostnader.

**Fördelarna, bokens egen lista i §10.7:**

- De kan ==utnyttja oanvända resurser== — lagring och beräkning — i värddatorerna.
- De ==skalar== till stora antal klienter och värdar, med ==utmärkt balansering== av lasten på både
  nätlänkar och värdarnas beräkningsresurser.
- Mellanprogrammets ==självorganiserande egenskaper== gör att ==supportkostnaderna i stort sett är
  oberoende av== hur många klienter och värdar som satts in.

**Nackdelarna, också bokens egen lista:** att lagra ==föränderlig data är relativt dyrt== jämfört med en
betrodd, central tjänst, och den lovande grunden för anonymitet ==har ännu inte gett starka garantier==.

**Nackdelen som väger tyngst i praktiken: volatilitet.** Datorer och nätanslutningar som ägs och sköts
av en mängd olika användare är ==nödvändigtvis volatila resurser== — ägarna garanterar inte att hålla dem
påslagna, anslutna och felfria, så tillgängligheten är ==oförutsägbar==. Tjänsten kan däremot byggas så
att ==chansen att man inte når en enda kopia== av ett replikerat objekt kan göras hur liten som helst.

**Så kan du tänka.** Svagheten går att vända till en styrka, och boken säger det själv: replikeringen som
volatiliteten kräver kan ==utnyttjas för att stå emot manipulation== från illvilliga noder.

### Muntligt svar

1. Målet är att dela data och resurser i mycket stor skala genom att avskaffa behovet av separat
   administrerade servrar.
2. I klient-server ligger resurserna på en server eller ett litet kluster. Det kräver få beslut, men
   skalan begränsas av serverns kapacitet, och kostnaderna för administration och felåterställning
   dominerar om man försöker växa genom att köpa fler.
3. I P2P ligger resurserna på datorer spritt över nätet. Alla noder har samma funktionella förmåga och
   samma ansvar, varje användare bidrar med resurser, och driften beror inte på något centralt
   administrerat system.
4. Nyckelfrågan blir därför placeringsalgoritmen — hur data läggs ut över många värdar och hittas
   igen, balanserat och tillgängligt.
5. Fördelarna: oanvända resurser utnyttjas, systemet skalar med bra lastbalansering, och det
   självorganiserar sig så att supportkostnaden i stort är oberoende av antalet deltagare.
6. Nackdelarna: föränderlig data är relativt dyr jämfört med en central betrodd tjänst, anonymiteten har
   aldrig blivit starka garantier, och värdarna är volatila — men just den replikering volatiliteten
   tvingar fram ger också motstånd mot manipulation.

## 2. I vilka situationer och för vilken typ av data passar P2P-system? Varför har P2P-tekniken kopplats samman med piratkopiering och upphovsrätt?

Bokens avsnitt: §10.1 och §10.2.

**Datatypen är svaret, och skälet är tekniskt.** Resurser identifieras av ==GUID:er== (globalt unika
identifierare), som **normalt** räknas ut som en ==säker hash== av hela eller delar av resursens
tillstånd. Att hashen är *säker* betyder att det i praktiken är ==omöjligt att hitta två olika data som
ger samma värde==, så värdet fungerar som ett fingeravtryck av innehållet.

Det gör resursen ==självcertifierande==: en klient som får resursen kan ==räkna om hashen och se att den
stämmer==, vilket skyddar mot manipulation från de obetrodda noder den kan ha lagrats på.

**Men det kräver att tillståndet är oföränderligt**, eftersom en ändring skulle ge ett ==annat
hashvärde==. Därför är P2P-lagringssystem ==i grunden bäst lämpade för oföränderliga objekt==, som musik-
och videofiler. Föränderlig data går, men boken kallar det ==mer utmanande== och säger att det kan
hanteras genom ==betrodda servrar== som sköter en versionsföljd och pekar ut den aktuella versionen —
så gör **OceanStore** och **Ivy**.

**Vad Napster kunde utnyttja i sin tillämpning** — detta är svaret på "i vilka situationer":

- **Musikfiler uppdateras aldrig**, så man slipper hålla replikerna konsistenta efter ändringar.
- **Inga garantier krävs om enskilda filers tillgänglighet.** Är en fil tillfälligt onåbar kan den
  ==laddas ner senare==, vilket sänker kraven på de enskilda datorernas driftsäkerhet.

**Så kan du tänka.** Vänd det till en regel du kan säga högt: P2P passar när datat är **stort,
oföränderligt och inte kritiskt just nu**, och passar sämre när ==integritet och tillgänglighet måste
garanteras==. Boken säger just det i sammanfattningen.

### Kopplingen till upphovsrätt

**Napster kort.** Startade 1999 och blev snabbt mycket populärt för musikutbyte. Arkitekturen hade
==centraliserade index==, men ==användarna tillhandahöll filerna==, som lagrades och lästes på deras egna
datorer. Tjänsten stängdes efter en rättsprocess som upphovsrättsinnehavarna drev mot operatörerna.

**Argumentet och varför det föll** — det här är kärnan i frågan:

- Utvecklarna hävdade att de ==inte var ansvariga== för intrånget, eftersom de ==inte deltog i
  kopieringen==: den skedde helt och hållet mellan användarnas maskiner.
- Argumentet föll eftersom ==indexservrarna bedömdes vara en väsentlig del av processen==.
- Och eftersom indexservrarna låg på ==välkända adresser== kunde deras operatörer ==inte vara anonyma==,
  så de kunde ==pekas ut i stämningar==.

**Slutsatsen som förklarar hela teknikens rykte.** Boken skriver att en ==mer fullständigt distribuerad==
fildelningstjänst hade kunnat uppnå en bättre uppdelning av det juridiska ansvaret, genom att ==sprida
ansvaret över alla användare== och därmed göra rättsliga åtgärder ==mycket svåra, om inte omöjliga==. Det
är därför utvecklingen efter Napster gick mot att ta bort varje central punkt — och därmed också mot
något som är svårare att stämma.

### Muntligt svar

1. Datatypen är oföränderlig data. GUID:et är en säker hash av objektets tillstånd, så en ändring ger
   ett annat GUID — därför passar musik och video särskilt bra.
2. Hashen gör resursen självcertifierande: mottagaren kan kontrollera att den inte manipulerats av de
   obetrodda noder den legat på. Det är hela vinsten, och priset är att datat måste stå still.
3. Föränderlig data går men är mer utmanande, och kräver då betrodda servrar som håller versionsordning
   — som i OceanStore och Ivy.
4. Situationen som passar är stor skala där ingen enskild fil är kritisk. Napster kunde utnyttja att
   musikfiler aldrig uppdateras och att en tillfälligt onåbar fil kan hämtas senare.
5. Upphovsrättskopplingen kommer från Napster. Utvecklarna hävdade att de inte deltog i kopieringen,
   men indexservrarna bedömdes vara en väsentlig del av processen.
6. Och eftersom indexservrarna låg på välkända adresser kunde operatörerna inte vara anonyma och kunde
   stämmas. Boken påpekar att en helt distribuerad tjänst hade spritt ansvaret över alla användare, och
   därmed gjort rättsliga åtgärder mycket svåra.

## 3. Vilka icke-funktionella krav ställs på ett P2P-system?

Bokens avsnitt: §10.3. Kraven gäller ==mellanprogrammet==.

**1. Global skalbarhet.** Mellanprogrammet måste stödja tillämpningar som når ==miljoner objekt på tio-
eller hundratusentals värdar==.

**2. Lastbalansering.** Prestandan beror på en ==balanserad fördelning av arbetslasten==, och här uppnås
det genom ==slumpmässig placering== av resurser plus ==repliker av hårt använda== resurser.

**3. Optimering för lokala interaktioner mellan närliggande peers.** "Nätavståndet" mellan noder som
interagerar påverkar ==latensen== märkbart. Mellanprogrammet ska sträva efter att ==placera resurser nära
de noder som använder dem mest==.

**4. Anpassning till mycket dynamisk värdtillgänglighet.** De flesta P2P-system byggs av datorer som är
==fria att ansluta eller lämna när som helst==, och värdarna ==ägs inte och sköts inte av någon enskild
instans==. Kravet går åt båda hållen: när en värd ansluter måste den ==integreras och lasten omfördelas==
så att dess resurser utnyttjas, och när den lämnar måste systemet ==upptäcka avhoppet och fördela om==
dess last och resurser.

**5. Säkerhet för data i en miljö med heterogen tillit.** När de deltagande värdarna har ==olika ägare==
måste tillit byggas upp med ==autentisering och kryptering==, så att ingen kan ändra eller läsa
informationen i smyg.

**6. Anonymitet, förnekbarhet och motstånd mot censur.** Anonymitet för den som håller och den som tar
emot data är ett ==legitimt intresse i många situationer==. Ett närliggande krav är att värdarna ska
kunna ==rimligt förneka ansvar== för att hålla eller lämna ut data. Att P2P-system använder ==många
värdar== hjälper till att uppnå det.

**Så kan du tänka.** Kraven följer ur två fakta: att systemet är **stort** (krav 1, 2 och 3) och att det
består av **datorer du inte äger och inte kan lita på** (krav 4, 5 och 6). Kan du uppdelningen kan du
härleda listan i stället för att memorera den.

**Konsekvensen boken drar direkt efteråt.** Kraven gör det ==omöjligt att hålla en databas hos alla
klientnoder== över var alla objekt finns. Kunskapen måste ==partitioneras och distribueras==: varje nod
ansvarar för en ==del av namnrymden== — alltså av mängden möjliga identifierare — plus allmän kunskap om
hur ==namnrymdens topologi==, dess kopplingsmönster, ser ut. Kunskapen replikeras dessutom hårt: man
använder ofta ==så höga replikeringsfaktorer som 16==.

### Muntligt svar

1. Kraven gäller mellanprogrammet, och boken listar sex icke-funktionella krav.
2. Global skalbarhet — miljoner objekt på tio- eller hundratusentals värdar.
3. Lastbalansering, som uppnås med slumpmässig placering plus repliker av det som används mest, och
   optimering för lokala interaktioner, alltså att lägga resurser nära dem som använder dem.
4. Anpassning till mycket dynamisk värdtillgänglighet: noder kommer och går fritt, så lasten måste
   omfördelas i båda riktningarna — både när en värd ansluter och när den lämnar.
5. Säkerhet i en miljö med heterogen tillit, som kräver autentisering och kryptering, plus anonymitet,
   förnekbarhet och censurmotstånd.
6. Ett sätt att minnas dem: tre krav följer av att systemet är stort, tre av att datorerna varken ägs
   eller kan litas på. Och konsekvensen är att kunskapen om var objekt ligger måste partitioneras och
   replikeras, med faktorer så höga som 16.

## 4. Hur hittar man en specifik resurs i ett P2P-nätverk? Vad är en "routing overlay"? Vad är skillnaden mellan strukturerade och ostrukturerade P2P-system?

Bokens avsnitt: §10.4 och §10.5, särskilt §10.5.3.

### Vad en routing overlay är

**Definitionen.** I P2P-system tar en distribuerad algoritm som kallas ==routing overlay== ansvar för att
==lokalisera noder och objekt==. Namnet kommer av att mellanprogrammet utgör ett ==lager som ruter
förfrågningar från en klient till en värd som håller objektet== förfrågan gäller. Objekten kan ligga på,
och flyttas till, ==vilken nod som helst utan att klienten är inblandad==. Den kallas *överlägg* därför
att den ==ruter i applikationslagret==, helt skilt från rutningsmekanismer på nätnivå som IP-rutning.

**Hur den hittar rätt.** Överlägget ser till att ==varje nod kan komma åt varje objekt== genom att ruta
förfrågan genom en ==följd av noder==, och utnyttja kunskapen hos var och en för att lokalisera
målobjektet. P2P-system lagrar oftast ==flera repliker==; då håller överlägget reda på var alla
tillgängliga repliker finns och levererar till den ==närmaste "levande" noden== som har en kopia.

**Överläggets fyra uppgifter.** Huvuduppgiften är att **ruta förfrågningar till objekt**: klienten
skickar objektets ==GUID== till överlägget, som ruter förfrågan till en nod där en replik finns. Utöver
den ska överlägget **sätta in objekt** — en nod räknar ut ett GUID och anmäler det, varefter objektet är
nåbart för alla — **ta bort objekt**, och **hantera att noder ansluter och lämnar**, där en ny nod tar
över en del av andra noders ansvar och en nod som lämnar får sitt ansvar fördelat bland de övriga.

### Strukturerade system

**Distribuerad hashtabell (DHT).** Eftersom de slumpmässigt fördelade identifierarna används för att
==bestämma var objekt placeras== och för att hämta dem, kallas överlägg ibland distribuerade
hashtabeller. Gränssnittet är ==`put(GUID, data)`==, ==`get(GUID)`== och ==`remove(GUID)`==. Ett objekt
med GUID *X* lagras på ==den nod vars GUID är numeriskt närmast *X*==, plus på de *r* värdar vars
GUID:er är näst närmast, där *r* är en ==replikeringsfaktor==.

**Hur sökningen faktiskt går.** Både **Pastry** och **Tapestry** använder ==prefixrutning==: för varje
hopp matchar man ==en siffra mer== av mål-GUID:et, så sökningen smalnar av stegvis och antalet hopp växer
==mycket långsammare än nätet==. Det är mekanismen som gör att metoden alls fungerar i global skala.

### Ostrukturerade system

**Motivet är underhållskostnaden.** De strukturerade algoritmerna är effektiva och ger ==tidsgränser==
för att lokalisera objekt, men ==till priset av att underhålla de underliggande strukturerna==, ofta i
mycket dynamiska miljöer.

**Hur de fungerar.** Det finns ==ingen övergripande kontroll== över topologin eller över var objekten
placeras. Överlägget skapas ==ad hoc==: varje nod som ansluter följer ==enkla, lokala regler==, tar
kontakt med en ==uppsättning grannar== som i sin tur är kopplade till fler grannar, och nätet blir
==i grunden decentraliserat och självorganiserande== och därmed ==tåligt mot nodfel==.

**Priset.** För att hitta ett objekt måste man ==söka igenom topologin==, alltså fråga sig fram genom
grannarna. Görs det naivt flödar man nätet med förfrågningar, så tre strategier används: ==expanded ring
search==, alltså en följd av sökningar med växande tak för antalet hopp; ==random walks==, där ett antal
vandrare följer egna slumpmässiga vägar; och ==gossiping==, där förfrågan skickas vidare till en granne med
en viss sannolikhet och sprids som ett virus. Metoden kan ändå ==inte ge några garantier== att objektet
hittas, prestandan blir ==oförutsägbar==, och det finns en ==verklig risk för överdriven
meddelandetrafik==.

**Figur 10.11, ordagrant om styrkor och svagheter:**

| | Strukturerat | Ostrukturerat |
|---|---|---|
| **Fördelar** | Garanterat att hitta objekt (om de finns) och kan ge gränser för tid och komplexitet; relativt låg meddelandeomkostnad | Självorganiserande och naturligt tåligt mot nodfel |
| **Nackdelar** | Måste underhålla ofta komplexa överläggsstrukturer, vilket kan vara svårt och kostsamt, särskilt i mycket dynamiska miljöer | Sannolikhetsbaserat och kan därför inte ge absoluta garantier om att objekt hittas; benäget att ge överdriven meddelandeomkostnad, vilket kan påverka skalbarheten |

**Poängen som förvånar, och som är värd att säga högt.** Trots de skenbara nackdelarna är det
==ostrukturerade angreppssättet det dominerande på Internet==, särskilt för fildelning — **Gnutella**,
**FreeNet** och **BitTorrent** använder alla ostrukturerade metoder.

### Muntligt svar

1. Grundproblemet: det går inte att hålla en databas hos varje klient över var allt finns, så kunskapen
   måste partitioneras och distribueras, med hög replikering.
2. En routing overlay är en distribuerad algoritm — ett lager i mellanprogrammet som ruter en förfrågan
   från klienten till en värd som har objektet. Den kallas överlägg för att den ruter i applikationslagret,
   skilt från IP-rutningen.
3. Dess huvuduppgift är att ruta förfrågningar till objekt utifrån deras GUID. Den ska också sätta in
   objekt, ta bort objekt, och hantera att noder ansluter och lämnar.
4. I strukturerade system är GUID:et en säker hash och avgör placeringen. I en DHT lagras objektet på
   noden vars GUID är numeriskt närmast, och man kommer åt det med put och get. Sökningen sker med
   prefixrutning: för varje hopp matchas en siffra mer av målet.
5. I ostrukturerade system finns ingen kontroll över topologi eller placering — överlägget byggs ad hoc
   av lokala regler, och man hittar objekt genom att fråga sig fram genom grannarna, med expanded ring
   search, random walks eller gossiping.
6. Avvägningen: strukturerat garanterar att objektet hittas och ger tidsgränser, men strukturen måste
   underhållas. Ostrukturerat är självorganiserande och tåligt, men bara sannolikhetsbaserat och kan
   flöda nätet. Ändå är det ostrukturerade dominerande på Internet — Gnutella, FreeNet och BitTorrent.

## 5. Vad är skillnaden mellan IP och P2P på applikationsnivå?

Bokens avsnitt: §10.1, underrubriken "Overlay routing versus IP routing", med figur 10.1.

**Varför frågan alls ställs.** Boken konstaterar att routing overlays ==till att börja med ser ut att dela
många egenskaper== med IP-paketrutningen, och att det därför är ==rimligt att fråga== varför en
ytterligare mekanism på applikationsnivå behövs. Svaret ligger i skillnaderna i figur 10.1.

**Figur 10.1, alla sex rader:**

| | IP | Rutningsöverlägg på applikationsnivå |
|---|---|---|
| **Skala** | IPv4 är begränsat till 2³² adresserbara noder. IPv6:s namnrymd är mycket generösare (2¹²⁸), men adresserna i båda versionerna är hierarkiskt strukturerade och mycket av rymden är förallokerad enligt administrativa krav | P2P-system kan adressera fler objekt. GUID-namnrymden är mycket stor och platt (>2¹²⁸), vilket gör att den kan fyllas mycket mer fullständigt |
| **Lastbalansering** | Lasten på routrar bestäms av nätets topologi och de trafikmönster som hör till | Objektens placering kan slumpas, och därmed skiljs trafikmönstren från nätets topologi |
| **Nätdynamik** (objekt och noder läggs till eller tas bort) | IP:s rutningstabeller uppdateras asynkront på best-effort-basis, med tidskonstanter i storleksordningen en timme | Rutningstabellerna kan uppdateras synkront eller asynkront med fördröjningar på bråkdelar av en sekund |
| **Feltolerans** | Redundans byggs in i IP-nätet av dess förvaltare, vilket säkrar tolerans mot fel i en router eller en nätkoppling. *n*-faldig replikering är kostsam | Rutter och objektreferenser kan replikeras *n*-faldigt, vilket säkrar tolerans mot *n* fel i noder eller kopplingar |
| **Målidentifiering** | Varje IP-adress avbildas på exakt en målnod | Meddelanden kan rutas till den närmaste repliken av ett målobjekt |
| **Säkerhet och anonymitet** | Adressering är bara säker när alla noder är betrodda. Anonymitet för adressernas ägare är inte uppnåelig | Säkerhet kan uppnås även i miljöer med begränsad tillit. En begränsad grad av anonymitet kan ges |

**Bokens egen gardering, ta med den.** Boken skriver att det ==kan hävdas== att några av skillnaderna
==uppstår ur IP:s "legacy"-natur== som Internets primära protokoll — men att arvet ==sitter för hårt för
att gå att ändra== så att det stödjer P2P-tillämpningar mer direkt. Skillnaderna är alltså inte alla
principiella, men de går i praktiken inte att komma runt.

**Så kan du tänka.** Två skillnader är de mest talande om du bara får tid till några. **Målidentifiering**
är den skarpaste: IP pekar ut ==en maskin==, överlägget pekar ut ==ett objekt== och får därmed friheten
att välja närmaste kopia. **Nätdynamik** är den mest praktiska: en timme mot bråkdelar av en sekund är
skillnaden mellan ett nät som antas ligga still och ett som antas ändras hela tiden. (*Best-effort* i
tabellen betyder att nätet försöker leverera men inte lovar något — varken att uppdateringen kommer fram
eller när.)

**Kom ihåg vad "applikationsnivå" betyder här.** Överlägget ==ersätter inte IP==. Det ligger ovanpå:
varje hopp i överlägget genomförs med ett underliggande transportprotokoll, ==normalt UDP==, och ett enda
överläggshopp kan kräva ==ett stort antal IP-hopp==.

### Muntligt svar

1. Frågan är legitim, och boken säger det själv: överlägget liknar IP-rutning, så varför behövs ett
   lager till? Svaret ligger i sex skillnader.
2. Skala: IPv4 har 2³² adresser och IPv6 2¹²⁸, men adresserna är hierarkiska och mycket av rymden är
   förallokerad. GUID-rymden är platt och kan fyllas mycket mer.
3. Lastbalansering och nätdynamik: IP:s last följer topologin och tabellerna uppdateras på
   timskalan. I överlägget kan placeringen slumpas, så trafiken skiljs från topologin, och tabellerna
   uppdateras på bråkdelar av en sekund.
4. Feltolerans: IP:s redundans byggs in av förvaltarna och tål ett fel, medan *n*-faldig replikering är
   dyr. I överlägget kan rutter och objektreferenser replikeras *n*-faldigt.
5. Målidentifiering är den skarpaste skillnaden: en IP-adress pekar på exakt en nod, medan överlägget
   ruter till närmaste replik av ett objekt. Och säkerhet: IP-adressering är bara säker om alla noder är
   betrodda och ger ingen anonymitet, medan överlägget kan ge säkerhet med begränsad tillit och en
   begränsad grad av anonymitet.
6. Boken garderar att flera skillnader kommer ur IP:s legacy-natur, men att arvet är för starkt att
   övervinna. Och överlägget ersätter inte IP — varje överläggshopp går normalt över UDP och kan kräva
   många IP-hopp.

## Luckor och källor

**Inga luckor mot tentafrågorna.** Alla fem besvaras ur boken. Tabellerna i fråga 4 och 5 är hämtade ur
PDF:en eftersom de var stympade i textversionen, och är översatta — inte citerade.

**KursPM markerar §10.5–10.6 som kursivt läsande**, men fråga 4 frågar uttryckligen om routing overlay
och om skillnaden mellan strukturerade och ostrukturerade system, som står i **§10.5.3**. Det är läst och
använt ändå, eftersom tentafrågan kräver det.

**Medvetet utanför noten**, eftersom ingen tentafråga rör det: Pastrys och Tapestrys fullständiga
rutningsalgoritmer med 128-bitars GUID och *O(log N)*, DOLR, Gnutellas versioner och ultrapeers,
tillämpningarna i §10.6 (Squirrel, OceanStore, Ivy) samt SETI@home.
