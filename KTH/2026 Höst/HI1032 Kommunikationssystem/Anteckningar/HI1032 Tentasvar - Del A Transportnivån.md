---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-10
updated: 2026-10-19
description: "En teorifil för HI1032:s Del A, transportnivån, byggd på examinatorns föreläsningar om transportlagret. Varje avsnitt börjar med vad begreppet är och bygger vidare: hur det fungerar, varför, och vad det kostar. Rubriken har en nivå inom parentes, Säker, Trolig eller Möjlig, för hur troligt ämnet är på tentan, satt efter hur ofta det förekommit i fyra gamla tentor och hur mycket läraren tagit upp det. Föreläsningskartan har hela bilden. De fetstilta orden är dispositionen, och egna slutsatser är märkta."
---

# HI1032 Tentasvar - Del A Transportnivån

En teorifil för HI1032:s Del A, transportnivån, byggd på examinatorns föreläsningar om transportlagret. Varje avsnitt börjar med vad begreppet är och bygger vidare: hur det fungerar, varför, och vad det kostar. Rubriken har en nivå inom parentes, Säker, Trolig eller Möjlig, för hur troligt ämnet är på tentan, satt efter hur ofta det förekommit i fyra gamla tentor och hur mycket läraren tagit upp det. Föreläsningskartan har hela bilden. De fetstilta orden är dispositionen, och egna slutsatser är märkta.

## Transportlagret och vad det ska lösa (Trolig)

**Vad det är.** Transportlagret ligger mellan applikationerna och IP, och på nätet är det ==bara ändpunkterna (värdarna) som har ett transportlager==. En router jobbar upp till nätlagret (IP), en switch bara på länklagret, så de två värdarnas transportlager pratar ände-till-ände fast trafiken i verkligheten går genom routrar och switchar.

**Vad applikationerna vill ha uppifrån.** Kraven föreläsaren ställer upp är bland annat att ==data ska komma fram oförändrad och i rätt ordning==, att man ska kunna nyttja nätet väl utan att äta upp andras trafik, att man ska kunna skicka ett litet meddelande utan för mycket overhead, och att man ska kunna skilja på trafik till olika program på samma värd.

**Vad IP ger nerifrån — och inte ger.** IP kan skicka ett paket till en värd via en adress, men mer är inte garanterat: ==paket kan tappas bort, två paket kan komma fram i omvänd ordning, och bitar kan bli felaktiga==. IP ger inte heller information om vägens kapacitet eller MTU. Bitfel fångas "bara i IPv4, och inte ens då", så man kan inte lita på att IP fångar förvanskad data (att den noten hör just till bitfelen är min läsning, *(egen slutsats)*). **Vi behöver ett transportlager som fyller igen de här luckorna.**

## Portar och multiplexing (Säker)

**Vad en port är.** En port är ett ==16-bitars osignerat heltal==, alltså 0–65535 (det följer av att fältet är 16 bitar, *(egen slutsats)*). IP-adressen pekar ut vilken *värd* ett paket ska till; portnumret pekar ut vilket *program* på den värden. Tillsammans bildar de en ==socketadress: IP-adress + portnummer==.

**Multiplexing och demultiplexing.** Transportlagret tar emot data från alla processer och ==skickar ner allt över samma IP — det är multiplexing==. När paket kommer in läser det destinationsporten och ==lämnar varje datagram till rätt process — det är demultiplexing==.

**Domänerna skiljer sig.** Nätlagrets domän går ==från värd till värd==, men transportlagrets går ett steg längre, ==från process till process==.

**Well-known-portar och efemära portar.** Servrar lyssnar på ==well-known-portar — låga, fasta nummer som tilldelas centralt av IANA== (listan i `/etc/services`). En klient tar i stället en ==efemär (tillfällig) port== som den får för stunden; boken ger det dynamiska intervallet 49152–65535 som exempel (Q9-3). Portdomänen är lokal, inte global, så två datorer kan köra samma serverprocess på samma portnummer.

## UDP (Trolig)

**Vad det är.** UDP är en ==ren datagramtjänst som är både förbindelselös och opålitlig==: ingen uppkoppling att etablera, ingen bekräftelse och ingen omsändning. Det UDP lägger till ovanpå IP är process-till-process-leverans via portar (multiplexing och demultiplexing).

**Huvudet är litet.** UDP-huvudet är ==bara 8 byte== och har fyra fält: källport, destinationsport, total längd och checksumma. Det lilla huvudet är hela poängen med UDP — lite overhead för den som bara vill skicka ett kort meddelande.

**Checksumman och pseudohuvudet.** UDP:s checksumma är frivillig men räknas, om den används, över UDP-huvudet, datan och ett ==pseudohuvud med några fält lånade från IP-huvudet== (käll- och destinations-IP samt protokollnumret, som för UDP är 17). Poängen är att upptäcka om paketet levererats till fel värd.

## Inkapsling (Möjlig)

**Vad det är.** Inkapsling är att varje lager packar in lagret ovanför med sitt eget huvud: ett meddelande får ett ==UDP- (eller TCP-) huvud, blir sedan data i ett IP-paket, och blir till sist data i en länkram==.

## TCP-huvudet — fälten du tolkar (Trolig)

**Vad fälten i huvudet betyder.** TCP-huvudet är ==20 till 60 byte== — 20 byte i grunden plus upp till 40 byte options. Det du behöver är vad fälten betyder, resten läser du ur huvudet du har framför dig.

**De fält som bär mening.** Källport och destinationsport pekar ut processerna (som i UDP). Sekvensnumret och bekräftelsenumret (ack) är 32-bitars och gör TCP ordnat och pålitligt. HLEN säger hur långt huvudet är, vilket ==behövs just för att huvudet är olika långt beroende på hur mycket options som finns med==. Fönsterfältet (window) är 16-bitars och är mottagarens annonserade mottagningsfönster, rwnd. Checksumman tar ett pseudohuvud precis som UDP (här är protokollnumret 6).

**De sex kontrollflaggorna.** I huvudet sitter sex enbitsflaggor: ==URG, ACK, PSH, RST, SYN och FIN==. SYN och FIN öppnar och stänger, ACK bekräftar, PSH ber mottagaren lämna över datan direkt, RST river en förbindelse abrupt, och URG markerar brådskande data.

## TCP-egenskaper (Trolig)

**Vad det är.** Där UDP är avskalat ger TCP applikationen en pålitlig, ordnad förbindelse. TCP är en ==ström av oktetter (byte)== som skickas i segment, där varje segment kapslas in i ett IP-paket. Det är förbindelseorienterat, har felkontroll med omsändning, och har dessutom flödeskontroll och trängselkontroll.

**Hur strömmen fungerar.** Applikationen ser en ström: den sändande processen stoppar in byte i ena änden och den mottagande läser ut samma byte i andra, i rätt ordning. TCP självt bestämmer hur strömmen delas upp i segment. Att det är ==en ström, inte meddelanden med gränser== är den stora skillnaden mot UDP.

## Etablering — three-way handshake (Trolig)

**Vad det är.** Innan data kan flöda kopplar TCP upp förbindelsen med en ==three-way handshake==, tre segment. Den ena sidan gör *active open* (vanligen klienten), den andra har gjort *passive open* och väntar (vanligen servern).

**Hur de tre segmenten går.** Klienten skickar ett segment med SYN-flaggan och sitt ==initiala sekvensnummer (ISN)==. Servern svarar med SYN + ACK: bekräftar klientens ISN med ack = klientens ISN + 1 och skickar sitt eget ISN. Klienten svarar till sist med ett rent ACK. I föreläsarens exempel: klienten skickar seq 8000 (SYN), servern seq 15000 / ack 8001 (SYN+ACK), klienten seq 8001 / ack 15001 (ACK), och båda annonserar sitt fönster (rwnd). Att ack:en är 8001 beror på att ==ett SYN förbrukar ett sekvensnummer==.

**Vad det kostar.** Eftersom tre segment ska skickas innan nyttodatan börjar kostar etableringen ungefär ett extra tur-och-retur (en RTT) av fördröjning innan något riktigt skickas *(egen slutsats om själva RTT-formuleringen)*.

## Dataöverföring (Trolig)

**Vad det är.** När förbindelsen står skickas data som segment, och eftersom TCP är en byteström numreras ==data per byte, inte per paket==. Sekvensnumret i ett segment är numret på den första byten i segmentet, och ack-numret är numret på nästa byte mottagaren väntar sig.

**Hur det syns.** I föreläsarens exempel skickar klienten byte 8001–9000 i ett segment och 9001–10000 i nästa, med PSH-flaggan satt för att be mottagaren lämna över datan direkt. När servern också har data att skicka kan den ==lägga sin bekräftelse i samma segment som sin egen data — det kallas piggybacking== och samtidigt annonsera sitt fönster (rwnd).

## Terminering — three-way och four-way (Trolig)

**Vad det är.** Att stänga en förbindelse görs med FIN-flaggan, i två varianter. I den vanliga ==three-way-termineringen== skickar den aktivt stängande sidan FIN, den andra svarar med ett kombinerat FIN + ACK, och den första bekräftar med ACK — tre segment, för att den passiva sidans ACK och FIN hann slås ihop.

**Four-way med half-close.** Om den passiva sidan fortfarande har data att skicka kan den inte slå ihop sina två segment, och då blir det fyra: FIN, ACK, (data skickas färdigt), FIN, ACK. Det bygger på ==half-close: den ena sidan slutar skicka men kan fortsätta ta emot==.

**Aktiv och passiv stängning.** Precis som vid uppkoppling finns en ==aktiv part som börjar stänga och en passiv som följer med==; vilken sida som är vilken spelar roll för vilka tillstånd de går igenom efteråt.

## Tillståndsdiagrammet — hur du följer det (Trolig)

**Hur du följer tillståndsdiagrammet.** Diagrammet beskriver en TCP-änds liv som en följd av tillstånd, där varje pil är ==märkt "indata / utdata"== — vad TCP tar emot och vad det skickar som svar. Klientens väg ritas med heldragna pilar, serverns med streckade, och pilar som gäller båda är röda.

**Klientens normala väg.** Från CLOSED gör klienten *active open* och skickar SYN → SYN-SENT. När SYN+ACK kommer svarar den ACK → ESTABLISHED, och nu flödar data. Vid stängning: *close* skickar FIN → FIN-WAIT-1, ACK tas emot → FIN-WAIT-2, motpartens FIN besvaras → TIME-WAIT, och efter en timeout → CLOSED.

**Serverns normala väg.** Från CLOSED gör servern *passive open* → LISTEN. När en SYN kommer svarar den SYN+ACK → SYN-RCVD, klientens ACK kommer → ESTABLISHED. Vid stängning tar den emot FIN och svarar ACK → ==CLOSE-WAIT==, skickar sedan sin egen FIN → LAST-ACK, och när slut-ACK:en kommer → CLOSED.

**TIME-WAIT och de knepiga fallen.** Den aktivt stängande sidan hamnar i ==TIME-WAIT och väntar 2MSL== innan CLOSED, där MSL enligt föreläsaren är "standard" 60 sekunder. Väntan finns för att ett tappat slut-ACK ska kunna skickas om och för att gamla dubbletter ska hinna dö ut *(egen slutsats)*. Diagrammet har också två symmetriska specialfall: *simultaneous open* och *simultaneous close* via tillståndet CLOSING.

## MSS och MTU (Säker)

**Frågan.** Hur stort ska ett TCP-segment vara? Varje länk har en ==MTU, den största ram den kan bära==, och MSS (maximum segment size) är den största nyttolast TCP vill lägga i ett segment. Eftersom segmentet blir data i ett IP-paket måste det få plats i länkens MTU tillsammans med IP- och TCP-huvudena, annars måste det delas upp *(egen slutsats om själva passar-i-relationen; föreläsaren ger ingen formel)*.

**Men IP kan ju fragmentera — så vad är problemet?** IP klarar att dela ett för stort paket i fragment, men föreläsaren ger tre skäl att ändå undvika det. ==Overhead==: om det andra fragmentet bara bär en enda byte data blir det nästan bara huvuden. ==Omsändning==: tappas ett enda fragment måste *hela* paketet skickas om. Och ==RTT-mätning blir oklar== när paket fragmenteras, vilket TCP behöver för sina timers.

**Så gör du för att hitta MSS.** ==Först: fråga den anslutna länken vilken MTU den stöder.== Det ger en övre gräns för första biten av vägen. ==Sedan: Path MTU discovery== för att hitta den minsta MTU:n längs *hela* vägen. MSS förhandlas i övrigt vid uppkopplingen via en TCP-option med samma namn.

## Path MTU Discovery (Trolig)

**Vad det är.** Path MTU discovery är sättet att ta reda på den minsta MTU:n längs hela vägen, inte bara på den första länken. Föreläsaren anger att det är definierat i RFC 1191 för IPv4 och RFC 8201 för IPv6, och att det bygger på ==Don't Fragment (DF)-flaggan i IP-huvudet== på utgående paket.

**Hur det funkar — så gör du.** Du skickar paketet med DF satt, vilket förbjuder routrarna att fragmentera. När en länk inte kan bära paketets storlek: ==paketet slängs, och en ICMP tillbaka till avsändaren säger "Fragmentation Needed" (typ 3, kod 4) och anger länkens MTU==. Avsändaren sänker då sin MSS enligt ICMP-meddelandet och försöker igen, och stegar sig ner till den storlek som får plats hela vägen.

**Felläget det löser.** Utan det skulle du få onödig fragmentering, eller — om DF är satt men ingen ICMP kommer fram — paket som bara tyst försvinner och en förbindelse som hänger sig. Mekaniken bygger på att ICMP-felet faktiskt når tillbaka *(egen slutsats)*.

## TCP som byteström och förbindelse (Trolig)

**TCP är en förbindelseorienterad transport som ser datan som en ström av byte.** Appen lämnar över en följd av byte, och TCP bestämmer själv hur de delas upp i ==segment== som skickas inkapslade i IP-paket. Hos mottagaren sätts byteströmmen ihop i rätt ordning innan appen läser den.

**Innan data kan skickas sätts en förbindelse upp, och den är tvåvägs.** Att TCP är ==förbindelseorienterat== betyder att båda sidor först kommer överens om att prata (och om vilka startnummer de använder) och stänger ner när de är klara; två processer får var sin ström i var sin riktning.

**TCP lägger till tre sorters kontroll ovanpå IP:s opålitliga leverans.** Felkontroll upptäcker förlorade eller trasiga segment och sänder om dem, flödeskontroll hindrar att en snabb sändare dränker en långsam mottagare, och trängselkontroll drar ner takten när nätet är överbelastat. Den här föreläsningen handlar framför allt om ==felkontrollen==.

## Kontrollflaggorna (Trolig)

**TCP-huvudet har sex kontrollflaggor, och var och en slår på ett beteende.** De sex heter ==URG, ACK, PSH, RST, SYN och FIN==.

**SYN och FIN styr förbindelsens liv, och ACK säger att kvittensfältet gäller.** ==SYN== sätts bara när en förbindelse etableras, för att synka startnumren, och FIN sätts när en sida vill stänga sin egen riktning. ACK-flaggan talar om att segmentets fält "acknowledgment number" är giltigt, och den är satt i så gott som alla segment efter etableringen.

**PSH, URG och RST är de tre som är lätta att blanda ihop.** ==PSH== ber TCP skicka det som finns direkt i stället för att vänta på ett fullt segment, vilket är poängen vid interaktiv terminaltrafik; URG pekar (med urgent pointer) ut brådskande data; och RST begär att förbindelsen avbryts direkt, till exempel när någon försöker nå en port som inte lyssnar.

## Numreringssystem: sekvens- och ACK-nummer (Trolig)

**TCP numrerar varje byte, inte varje segment.** När förbindelsen sätts upp väljer varje sida ett ==slumpmässigt startnummer== (ISN), och därifrån räknas varje byte uppåt; ett segment med 100 byte förbrukar 100 nummer.

**Sekvensnumret i huvudet är numret på segmentets första databyte.** Bär ett segment byte 1401–1500 står det alltså ==1401== som sekvensnummer.

**ACK-numret är numret på nästa byte mottagaren väntar sig.** Kvittensen är ==kumulativ==: ett ACK med nummer 7001 säger "jag har fått allt till och med byte 7000". Ett segment som kommer i oordning buffrar mottagaren men kvitterar inte — den skickar en dubblett-ACK med samma väntade nummer tills hålet fyllts.

## Tillstånd: etablering, terminering och TIME-WAIT (Trolig)

**En TCP-förbindelse rör sig genom tre lägen:** ==koppla upp, skicka data och koppla ner==.

**Etableringen är en trevägshandskakning.** Klienten skickar ett SYN med sitt startnummer, servern svarar med SYN+ACK (sitt eget startnummer plus en kvittens), och klienten kvitterar. Efter det är båda i ESTABLISHED och ==data kan börja flöda==. Poängen är att båda sidor lär sig varandras startnummer innan data skickas.

**Termineringen behöver i grunden fyra steg, ett FIN och ett ACK per riktning.** Ett ==FIN stänger bara en riktning==: den som skickar FIN lovar att inte sända mer, men måste fortfarande kunna kvittera det som kommer åt andra hållet (half-close). Ofta slås den andra sidans FIN och ACK ihop, så det blir en trevägshandskakning.

**Den sista som stänger stannar en stund i TIME-WAIT.** Sidan väntar ==2 × MSL== (maximum segment lifetime, standardvärde 60 s) och är beredd att sända om sitt FIN, eftersom den sista kvittensen (FIN-ACK) kan tappas. Eftersom MSL är den längsta tid ett segment kan ligga kvar i nätet, hinner gamla segment dö ut innan samma portpar återanvänds (egen slutsats).

## Felkontroll i TCP (Trolig)

**Felkontroll är TCP:s svar på att IP kan tappa, skada eller fördröja segment.** Verktygen är ==positiva kvittenser (ACK), omsändningar och omsändningstimers==. Checksumman i huvudet gör att ett skadat segment upptäcks och kastas, och då uteblir kvittensen precis som om segmentet tappats.

**Eftersom flera segment kan vara "ute" samtidigt måste de gå att skilja åt.** Det är ==numreringssystemet== som gör det: varje segment bär sekvensnumret på sin första byte, och kvittenserna pekar på nästa väntade byte.

## ACK-reglerna och hur man tillämpar dem (Säker)

**Mottagaren skickar inte ett ACK för precis varje segment — sex regler avgör när och hur.** Tre idéer räcker långt: kvittenser är kumulativa, de får fördröjas lite, och de skickas ==direkt så fort något ser fel ut==. Reglerna gäller själva dataöverföringen, inte etableringen eller termineringen.

**Kumulativ kvittens betyder att ett ACK täcker allt dessförinnan.** ACK-numret är numret på nästa väntade byte, så ett ACK på 7001 kvitterar ==allt till och med byte 7000== på en gång. Kommer en kvittens bort gör det därför ofta ingenting: nästa ACK täcker ändå det den tappade täckte.

**När mottagaren själv har data att skicka hänger den på kvittensen — piggybacking.** Har mottagaren inget att skicka och allt har kommit i ordning får den ==vänta upp till 500 ms== (eller tills nästa segment kommer) innan den skickar ett rent ACK. Det sparar bandbredd genom att slå ihop kvittenser och data i samma segment.

**Ser något fel ut skickas kvittensen direkt.** Kommer ett segment i oordning, eller kommer ett nytt medan ett tidigare ännu inte kvitterats, skickar mottagaren ==omedelbart ett ACK== med det nummer den väntar på. Regeln är att det aldrig får finnas mer än två okvitterade segment.

**Normal drift visar de tre vanliga reglerna.** I bilden bär varje datasegment en kvittens med sig (piggyback). När servern skickat ett segment och klienten inget har att sända startar ==ACK-fördröjningstimern på 500 ms==; hinner inget mer komma skickas ett rent ACK när den löper ut. Kommer i stället ett andra segment medan det första är okvitterat skickas ACK:en direkt — aldrig mer än två okvitterade.

**Ett tappat segment känns igen på att samma ACK-nummer upprepas.** I bilden tappas segmentet med byte 701–800. Nästa segment (801–900) kommer då i oordning, och mottagaren svarar med ett ACK som fortfarande säger ==701== — alltså "jag vill fortfarande ha 701". Först när det saknade segmentet sänts om och kommit fram hoppar kvittensen till 901, som nu kvitterar allt i ett svep.

**En tappad kvittens repareras oftast av nästa kvittens.** Tappas ett ACK men ett senare ACK hinner fram innan timern löper ut, så täcker det senare (kumulativa) ACK:et ändå allt — ingen omsändning behövs. ==Bara om timern hinner löpa ut== sänder sändaren om, och mottagaren, som redan har datan, svarar då med ett nytt ACK.

**Så kan du tänka.** Reglerna ser ut som sex separata fall men följer en enkel logik: kvittera så sällan som möjligt när allt flyter (spara bandbredd med fördröjning och piggyback), men ==kvittera direkt så fort ett hål uppstår== så att sändaren snabbt förstår vad som saknas. Läser du ett diagram, fråga för varje kvittens: kom segmentet i ordning, och fanns det något okvitterat sedan tidigare?

## Omsändning: timeout och fast retransmit (Trolig)

**Ett segment sänds om när TCP tror att det gått förlorat, och det finns två utlösare.** Den ena är att ==omsändningstimern (RTO) löper ut== innan segmentet kvitterats; den andra är tre dubblett-ACK:er i rad, som utlöser en snabb omsändning utan att vänta på timern.

**TCP startar en timer per skickat datasegment, men inte för rena ACK-segment.** Rena kvittenser kvitteras ju inte tillbaka, så det vore ingen mening att ==vänta på en kvittens av en kvittens==. Löper timern ut sänds segmentet om och timern startas på nytt.

**Fast retransmit låter sändaren slippa vänta på timern.** Varje gång ett segment kommer i oordning svarar mottagaren med samma ACK-nummer igen (en dubblett). Får sändaren ==tre dubblett-ACK:er== tolkar den det som att just det segmentet tappats medan resten gått fram, och sänder om det genast. I bilden upprepas ACK 301 tre gånger innan segment 301–400 sänds om, varpå kvittensen hoppar till 701.

## RTO: hur länge TCP väntar på en ACK (Säker)

**RTO är tiden TCP väntar på en kvittens innan det sänder om, och den måste följa nätets verkliga tempo.** Sätter man den för kort sänder man om i onödan; för lång blir man långsam på att upptäcka förluster. Lösningen är att ==mäta rundturstiden== (RTT) löpande och räkna fram RTO ur den.

**TCP slätar ut den mätta rundturstiden i stället för att lita på en enskild mätning.** Den mätta tiden kallas $\text{RTT}_\text{M}$ och den utjämnade $\text{RTT}_\text{S}$. $\text{RTT}_\text{S}$ uppdateras som ett ==glidande medelvärde== (EWMA): $\text{RTT}_\text{S} = (1 - \alpha) \cdot \text{RTT}_\text{S} + \alpha \cdot \text{RTT}_\text{M}$, med $\alpha = 1/8$. Varje ny mätning väger alltså lätt (en åttondel), och en enstaka avvikande mätning rubbar inte helheten.

**En enkel RTO vore k gånger $\text{RTT}_\text{S}$, men den tar inte höjd för hur mycket tiden varierar.** Därför mäts också avvikelsen $\text{RTT}_\text{D}$, även den utjämnad: $\text{RTT}_\text{D} = (1 - \beta) \cdot \text{RTT}_\text{D} + \beta \cdot |\text{RTT}_\text{S} - \text{RTT}_\text{M}|$, med $\beta = 1/4$. Den slutliga formeln lägger på fyra sådana avvikelser:

$$
\text{RTO} = \text{RTT}_\text{S} + 4 \cdot \text{RTT}_\text{D}
$$

När nätet är stabilt är marginalen liten, när tiderna hoppar växer den.

**Grafen visar varför marginalen behövs.** Den enkla RTO:n ($k \cdot \text{RTT}_\text{S}$) ligger nära den utjämnade tiden och ==skärs ibland igenom av en topp== i den mätta RTT:n — där hade en onödig omsändning utlösts. RTO med fyra avvikelser lägger sig i stället en bra bit ovanför topparna, och marginalen växer när mätningarna spretar. Bilden ber dig jämföra det med Six Sigma eller 95-percentilen, alltså samma idé som att lägga en säkerhetsmarginal ovanför det normala.

**Så gör du: räkna fram RTO steg för steg (bokens exempel).** Innan en enda RTT mätts används ett förvalt startvärde (6 s i exemplet). Vid uppkopplingen mäts första $\text{RTT}_\text{M} = 1{,}5$ s; då sätts startvärdena $\text{RTT}_\text{S} = \text{RTT}_\text{M} = 1{,}5$ och $\text{RTT}_\text{D} = \text{RTT}_\text{M}/2 = 0{,}75$, vilket ger $\text{RTO} = \text{RTT}_\text{S} + 4 \cdot \text{RTT}_\text{D} = 1{,}5 + 3 = 4{,}5$ s. Nästa mätning ger $\text{RTT}_\text{M} = 2{,}5$: $\text{RTT}_\text{S}$ blir $0{,}875 \cdot 1{,}5 + 0{,}125 \cdot 2{,}5 = 1{,}625$, $\text{RTT}_\text{D}$ blir $0{,}75 \cdot 0{,}75 + 0{,}25 \cdot |1{,}625 - 2{,}5| \approx 0{,}78$, och $\text{RTO} = 1{,}625 + 4 \cdot 0{,}78 \approx 4{,}74$ s. Mönstret: uppdatera $\text{RTT}_\text{S}$, sedan $\text{RTT}_\text{D}$, sedan RTO — i den ordningen.

## Karns algoritm (Möjlig)

**Vad det är.** Karns algoritm löser mätproblemet att man vid en omsändning inte vet om en inkommande ACK gäller originalet eller omsändningen, så RTO uppdateras ==inte alls utifrån ett omsänt segment== utan dubblas i stället för varje omsändning (exponentiell backoff).

## TCP-timers (Trolig)

**TCP använder fyra timers, och var och en vaktar mot ett eget problem.** De fyra är ==retransmission, persistence, keepalive och TIME-WAIT==. Den första är RTO, den längsta tiden att vänta på en ACK.

**Persistence-timern bryter ett dödläge när mottagarens fönster är noll.** Säger mottagaren rwnd = 0 (full buffert) slutar sändaren skicka — men om den ACK som senare öppnar fönstret tappas skulle båda vänta för evigt. Därför ==sonderar sändaren var 60:e sekund== med ett litet segment för att fråga om fönstret öppnats.

**Keepalive-timern rensar bort döda klienter.** Sändaren skickar ==prober==, och får den inget svar efter tio stycken förklaras klienten död och förbindelsen stängs.

**TIME-WAIT-timern skyddar nedkopplingen.** Tappas den sista kvittensen (FIN-ACK) väntar sidan ==2 × MSL== och är beredd att skicka sitt FIN igen.

## SACK – selektiva kvittenser (Trolig)

**Vad det är.** SACK (Selective Acknowledgments, RFC 2018) låter mottagaren, utöver den kumulativa kvittensen, dessutom tala om ==exakt vilka segment utanför ordning den redan har tagit emot==.

**Hur det fungerar.** SACK bärs i TCP:s options-fält. Vid uppkopplingen skickar båda sidor en SACK-permitted-option i SYN och SYN+ACK; sedan använder mottagaren SACK-optionen för att rapportera vilka block den fått ur ordning. Metoden fungerar ungefär som ==Selective Repeat ARQ==.

**D-SACK.** RFC 2883 är en utökning (D-SACK) som också låter mottagaren rapportera ==dubbletter== den tagit emot.

**Varför det är bra.** När sändaren vet precis vad mottagaren redan har kan den ==låta bli att skicka om segment som kommit fram==. Utan SACK ser sändaren bara "nästa väntade byte" och kan tvingas gissa. Examinatorn påpekar att SACK och D-SACK är frivilliga men mycket vanliga i praktiken.

## Snabb omsändning och dubbel-ACK (Säker)

**Vad det handlar om.** Grunden är att en ACK alltid ==pekar på nästa byte mottagaren väntar sig==.

**Piggybacking.** Har mottagaren egna data att skicka tillbaka lägger den kvittensen i det paketet, vilket ==sparar bandbredd==.

**Fördröjd ACK.** Kommer ett segment i rätt ordning, mottagaren inget har att skicka och det förra redan är kvitterat, så ==väntar den upp till 500 ms== (eller tills ett segment till dyker upp) innan den kvitterar. Men kommer ett segment medan det förra ännu inte är kvitterat skickar den ACK direkt — och låter aldrig mer än två segment stå okvitterade.

**Dubbel-ACK:ar vid lucka.** Kommer ett segment i fel ordning skickar mottagaren genast en kvittens som pekar på ==det byte som fortfarande saknas==. Varje senare segment ger samma kvittensnummer igen, så det blir en rad likadana kvittenser — dubbel-ACK:ar, sändarens signal om att en lucka finns men att senare segment tagit sig fram.

**Förlorat segment (så gör du).** Mottagaren buffrar det den får ur ordning och upprepar kvittensen på luckan. Till slut ==löper sändarens RTO-timer ut== och det saknade segmentet skickas om; då kan mottagaren kvittera allt den nu har i ordning. Det upprepade kvittensnumret *är* första saknade byte.

**Snabb omsändning (så gör du).** ==Tre dubbel-ACK:ar på samma nummer== tolkas som att ett segment tappats men att senare segment kommit fram, och då skickas just det segmentet om direkt — snabbare än att invänta RTO.

## ARQ: Stop-and-Wait, Go-Back-N och Selective Repeat (Trolig)

**Vad ARQ är.** ARQ (Automatic Repeat reQuest) är sättet att få tillförlitlighet genom att ==kvittera och skicka om== det som inte kom fram. Föreläsningen visar tre varianter: Stop-and-Wait, Go-Back-N och Selective Repeat.

**Stop-and-Wait.** Sändaren skickar ett segment och ==väntar på dess kvittens== innan nästa går iväg — enkelt, men större delen av länken står oanvänd medan man väntar en hel rundtur per segment.

**Go-Back-N och Selective Repeat.** Båda skickar ett helt fönster med segment utan att vänta på varje kvittens, så länken hålls sysselsatt. Vid en förlust skickar Go-Back-N om ==det tappade segmentet och allt efter det==, medan Selective Repeat skickar om bara det som saknas och låter mottagaren buffra dem som kom ur ordning.

**Varför fönstret spelar roll.** ==Större sändfönster ger snabbare överföring==, eftersom mindre av länken står oanvänd. TCP blandar de två idéerna (egen slutsats): kumulativa kvittenser som i Go-Back-N, men mottagaren buffrar segment ur ordning och med SACK beter den sig som Selective Repeat.

## Flödeskontroll: pull och push (Säker)

**Vad det är.** Flödeskontroll ska ==skydda mottagaren från att översvämmas== — hindra en snabb sändare från att fylla en långsam mottagares buffert fortare än mottagaren hinner tömma den.

**Flow control är inte congestion control.** De gör olika saker: flödeskontroll skyddar ==mottagaren==, medan congestion control skyddar nätet mellan dem.

**Pull och push.** I en push-modell skickar producenten så fort den har data; i en pull-modell ==frågar konsumenten först== och producenten levererar sedan (i bilden en Request och sedan en Delivery).

**Så gör TCP.** TCP:s flödeskontroll är mottagarstyrd, alltså pull-likt (egen slutsats): mottagaren ==annonserar hur mycket den är beredd att ta emot== (rwnd) och sändaren får inte överskrida det. Längst in hämtar programmet själv sina byte med ett recv()-anrop (egen slutsats, grundad i pull/push-bilden).

**Vad som går fel utan den.** Utan flödeskontroll fyller en snabb sändare mottagarens buffert och data ==kastas fast nätet var helt friskt==. Felet sitter i andra änden, inte på vägen — därför behövs en egen mekanism skild från congestion control.

## Send window och receive window (Säker)

**Vad det är.** TCP håller reda på byte med två glidande fönster: sändfönstret (hur mycket sändaren får ha ute okvitterat) och mottagarfönstret (hur mycket mottagaren är redo att ta emot). Poängen är att ==fönstren glider framåt== allt eftersom byte kvitteras och konsumeras.

**Sändfönstret.** Byte till vänster om fönstret är redan kvitterade och kan rensas. Inuti ligger först de byte som är ==skickade men inte kvitterade==, sedan de som får skickas men ännu inte är det (det användbara fönstret); till höger de som inte får skickas förrän fönstret glider dit. Storleken bestäms av vad mottagaren annonserat.

**Mottagarfönstret (rwnd).** rwnd är ==hur många byte till mottagaren kan ta emot== just nu. Vänsterkanten stängs när data kommer in, högerkanten öppnas när programmet hämtar data.

**Fönstret öppnas och stängs (så gör du).** Mottagaren annonserar en rwnd vid uppkopplingen. När sändaren skickar data ==krymper fönstret== (rwnd sjunker); när programmet i andra änden hämtar data växer det igen. Varje kvittens bär med sig den aktuella rwnd, så följ rwnd i varje ACK för att se hur mycket sändaren får skicka härnäst.

**Förhållandet mellan fönstren.** Sändfönstret är ==aldrig större än mottagarfönstret==; congestion kan göra det mindre, men aldrig större. Når rwnd noll måste sändaren stoppa helt tills mottagaren öppnar igen.

## Congestion: vad händer vid för stort fönster (Säker)

**Vad congestion är.** Congestion betyder att det kommer ==mer trafik än en länk eller router hinner med==.

**Hur det går fel.** En router (R1) som matar en flaskhalslänk har en buffert. Kommer det in fler paket än som kan skickas vidare ==fylls bufferten==, och när den är full börjar paket kastas; redan dessförinnan fördröjs paketen eftersom de får köa.

**Förlust och fördröjning är signalen.** TCP:s congestion control använder ==paketförlust och/eller ökad fördröjning== som tecken på överbelastning. Examinatorn hedgar medvetet med "may use", eftersom olika versioner tittar på olika signaler.

**Flera delar på flaskhalsen.** Ofta samsas flera flöden om samma flaskhalslänk, och då uppstår frågan om ==rättvisa==: hur ska den delade kapaciteten fördelas mellan flödena?

**Så kan du tänka.** För litet fönster slösar bort kapacitet, för stort ger förlust och fördröjning. Det rätta fönstret är det som ==fyller röret utan att svämma över bufferten== (egen slutsats), och eftersom nätet ändras hela tiden måste TCP ständigt leta efter det.

## Throughput probing (AIMD) och det faktiska fönstret (Säker)

**Grundprincipen.** TCP vet inte rätt fönsterstorlek i förväg, så den ==trevar sig fram==: öka sändfönstret så länge kvittenserna fortsätter komma, och dra ner när en förlust visar att man gått för långt.

**AIMD.** Mönstret heter Additive Increase, Multiplicative Decrease. Medan kvittenser kommer ökas fönstret lite varje rundtur (additivt); vid en förlust ==skärs det ner kraftigt== (multiplikativt). Det ritar den klassiska sågtandskurvan.

**Varför just AIMD.** Den försiktiga ökningen gör att man inte överskjuter hårt, och den kraftiga nedskärningen backar snabbt nog för att lätta på trängseln; tillsammans gör de också att flöden som delar en flaskhals ==närmar sig en rättvis fördelning== (egen slutsats, grundad i probing-bildens "maintain fairness").

**Det faktiska fönstret.** TCP håller samtidigt två tak: congestion-fönstret cwnd (vad nätet verkar tåla) och mottagarfönstret rwnd (vad mottagaren tål), och får skicka ==det minsta av rwnd och cwnd==. cwnd börjar på 1 MSS, rwnd kommer från andra änden i SYN-paketet.

## Slow start och congestion avoidance (Säker)

**Två sätt att växa.** cwnd växer i två faser: slow start växer ==snabbt (exponentiellt)==, congestion avoidance växer långsamt (linjärt). Gränsen mellan dem är tröskelvärdet ssthresh.

**Slow start.** Starta på cwnd = 1 MSS. För varje kvitterad MSS ökas cwnd med 1 MSS, vilket gör att cwnd ==fördubblas varje rundtur== (1, 2, 4, 8 …), tills cwnd når ssthresh. Namnet är missvisande: man startar på minimal fart men ökar exponentiellt.

**Congestion avoidance.** När cwnd når ssthresh byter TCP till linjär ökning: cwnd ökas med ==1 MSS per helt kvitterat fönster==, alltså ungefär +1 MSS per rundtur.

**Ekvationerna.** Räknat i MSS blir slow start $\text{cwnd} = \text{cwnd} + 1$ för varje kvitterad MSS, medan congestion avoidance blir $\text{cwnd} = \text{cwnd} + 1/\text{cwnd}$ för varje kvittens (summerar till +1 per helt fönster). (Räknat i sekvensnummer blir motsvarigheterna $\text{cwnd} + \text{MSS}$ respektive $\text{cwnd} + \text{MSS} \cdot (\text{MSS}/\text{cwnd})$.)

**Varför två faser.** Slow start hittar ==det grova taket snabbt==, congestion avoidance kryper sedan uppåt försiktigt så att TCP inte far rakt förbi det (egen slutsats, grundad i figurernas exponentiella respektive linjära form).

## Vid paketförlust: multiplicative decrease, Tahoe och Reno (Säker)

**Vad som händer.** När en förlust upptäcks skärs cwnd ner — det är den multiplikativa nedskärningen. *Hur* den skärs beror på vilken signal förlusten gav och vilken TCP-version som används.

**Två förlustsignaler.** En timeout betyder att RTO-timern löpt ut utan att något kom fram — allvarligt. Tre dubbel-ACK:ar betyder i stället att senare segment ändå kommit fram, så bara ett saknas — mindre allvarligt. Examinatorn säger rakt ut att ==tre dubbel-ACK:ar ses som lindrigare än en timeout==.

**Multiplicative decrease.** Grundregeln vid timeout: sätt ssthresh till ==hälften av nuvarande fönster==, sätt cwnd till ett segment, och börja om med slow start. Vid tre dubbel-ACK:ar beror åtgärden på versionen.

**Tahoe.** Tahoe behandlar ==båda signalerna likadant==: $\text{ssthresh} = \text{cwnd}/2$, $\text{cwnd} = 1$, slow start.

**Reno.** Reno ==skiljer på signalerna==. Vid en timeout gör den som Tahoe: $\text{cwnd} = 1$, slow start. Men vid tre dubbel-ACK:ar halverar den i stället ($\text{ssthresh} = \text{cwnd}/2$, $\text{cwnd} = \text{ssthresh} + 3$) och går in i fast recovery; varje ny dubbel-ACK ökar cwnd med 1, och när en ny riktig kvittens kommer sätts $\text{cwnd} = \text{ssthresh}$ och den går vidare i congestion avoidance. Reno behåller alltså ett högt fönster efter en lindrig förlust och kraschar till 1 bara vid en verklig timeout.

**Läsa cwnd-grafen (så gör du).** Gå igenom cwnd-grafen händelse för händelse i stället för att minnas kurvan utantill: börja i slow start på cwnd = 1, fördubbla varje rundtur tills du når tröskeln Th (ssthresh), byt då till linjär congestion avoidance. Vid en markerad förlust: är det en timeout blir ssthresh = hälften, cwnd = 1, tillbaka till slow start; är det tre dubbel-ACK:ar gör Tahoe samma sak, medan Reno halverar till ssthresh och gör en kort fast recovery innan den fortsätter linjärt. De blå fälten är congestion avoidance; de gula är de snabba faserna — slow start, och i Reno även fast recovery (den lilla pucken). Läs faserna på etiketterna SS/CA/FR längst ner, inte på färgen.

**Så kan du tänka.** Tahoe är enklare men slänger bort genomströmning vid varje förlust, medan Reno återhämtar sig snabbare från den vanliga lindriga förlusten (egen slutsats, grundad i att tre dubbel-ACK:ar är lindrigare än en timeout). Det är hela vinsten med att skilja signalerna åt.

## TCP-versioner, modern TCP och CUBIC (Möjlig)

**Vad det är.** Det finns många TCP-versioner (Tahoe, Reno, New Reno, CUBIC, BBR med flera) som angriper problem med den klassiska idén att ==varje förlust betyder congestion==, och CUBIC är standard i moderna Linux- och Windows-system.

## SCTP (Säker)

**Vad det är.** SCTP (Stream Control Transmission Protocol) är ett transportprotokoll i klass med TCP men ==meddelandeorienterat== i stället för byteströmsorienterat. Det är tillförlitligt och förbindelseorienterat som TCP, och används för signalering, till exempel SS7 och SIP.

**Flera strömmar.** En SCTP-association kan bära ==flera oberoende strömmar== av datachunks samtidigt mellan samma två processer, så ett tappat segment i en ström blockerar inte de andra strömmarna (egen slutsats, grundad i bilden med parallella strömmar).

**Chunks och paket.** Data bärs i chunks. Ett SCTP-paket består av ett generellt huvud (portar, verification tag, checksumma), sedan kontroll-chunks och data-chunks, och ==flera chunks kan rymmas i samma paket==.

**Tre nummer håller ordning.** TSN (transmission sequence number) numrerar ==alla datachunks i hela associationen==, precis som sekvensnummer i TCP, och sköter tillförlitlighet och global ordning. SI (stream identifier) säger vilken ström en chunk tillhör. SSN (stream sequence number) håller ordningen inom en enskild ström. Så TSN är globalt, medan SI och SSN är per ström.

**Multi-homing.** En SCTP-ändpunkt kan ha ==flera IP-adresser== och associationen kan använda mer än en. Går en väg ner kan trafiken fortsätta på en annan utan att koppla upp på nytt, vilket ger motståndskraft (det sista är egen slutsats, grundad i bilden över association).

**Association med fyrvägshandskakning.** SCTP kopplar upp med en ==fyrvägshandskakning== (INIT, INIT ACK, COOKIE ECHO, COOKIE ACK) där en cookie ingår. Poängen med cookien är att servern slipper allokera resurser förrän den fått tillbaka den och vet att klienten är äkta, vilket skyddar mot översvämningsattacker (egen slutsats; bilden visar handskakningen, inte skälet).
