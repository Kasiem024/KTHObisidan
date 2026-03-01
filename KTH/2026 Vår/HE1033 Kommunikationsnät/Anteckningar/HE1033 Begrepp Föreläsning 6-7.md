# HE1033 Begrepp Föreläsning 6-7

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HE1033 #begrepp

---

Vad är huvudsyftet med en router i ett nätverk?(Definition)::Att vidarebefordra datapaket mellan olika nätverk baserat på deras IP adresser.

Vilken regel använder en router när en destinationsadress matchar flera rader i dess routingtabell?(Definition)::Den använder regeln Longest Prefix Match.

Vad innebär regeln Longest Prefix Match i praktiken?(Definition)::Routern väljer alltid den väg i tabellen som har den längsta och mest specifika nätverksmasken.

Vilken nätverksadress används i en routingtabell för att representera en Default Route?(Definition)::Adressen 0.0.0.0/0.

När skickar en router ett paket via sin Default Route?(Definition)::När paketets destinationsadress inte matchar någon annan specifik rad i routingtabellen.

Vad är ett Autonomt System(AS)?(Definition)::En grupp av IP nätverk och routrar som styrs under en och samma administrativa kontroll.

Vad står förkortningen IGP för och var används det?(Definition)::Interior Gateway Protocol. Det används för routing inuti ett enda Autonomt System.

Vad står förkortningen EGP för och var används det?(Definition)::Exterior Gateway Protocol. Det används för routing mellan olika Autonoma System.

Ge två konkreta exempel på IGP protokoll.(Definition)::Protokollen RIP och OSPF.

Ge ett konkret exempel på ett EGP protokoll.(Definition)::Protokollet BGP.

Vilken övergripande typ av routingalgoritm bygger protokollet RIP på?(Definition)::Algoritmen Distance Vector.

Vilken övergripande typ av routingalgoritm bygger protokollet OSPF på?(Definition)::Algoritmen Link State.

Hur fungerar en Distance Vector algoritm i grunden?(Definition)::Varje router känner bara till sina direkta grannar och delar sin routingtabell enbart med dem.

Hur fungerar en Link State algoritm i grunden?(Definition)::Varje router bygger en komplett matematisk karta över hela nätverkets topologi.

Vilken typ av routingalgoritm brukar kallas för routing by rumor eftersom den förlitar sig helt på vad grannarna säger?(Definition)::Algoritmen Distance Vector.

Vilken matematisk algoritm använder Link State protokoll som OSPF för att beräkna den kortaste vägen i sin karta?(Definition)::Dijkstras algoritm.

Vilket specifikt metric mätvärde använder protokollet RIP för att avgöra vilken väg som är bäst?(Definition)::Antal hopp eller hop count.

Vad är det maximala antalet hopp som protokollet RIP kan hantera för en giltig väg?(Definition)::Maximalt 15 hopp.

Enligt den återkommande tentamensfrågan vilket protokoll är ett "Gammalt routingprotokoll där oändligheten är 16"?(Definition)::Protokollet RIP.

Varför definieras 16 som oändligheten i protokollet RIP?(Definition)::Eftersom nätverk som ligger 16 hopp bort eller mer anses vara helt onåbara.

Enligt den återkommande tentamensfrågan vilket protokoll är ett "Internt routingprotokoll baserat på Link State"?(Definition)::Protokollet OSPF.

Vad baseras kostnaden metric generellt på i protokollet OSPF?(Definition)::Länkens bandbredd. Högre bandbredd ger en lägre kostnad.

Vad kallas det centrala kärnområdet i ett OSPF nätverk som alla andra områden måste ansluta till?(Definition)::Area 0 eller Backbone.

Enligt den återkommande tentamensfrågan vilket protokoll används för att "Koppla samman olika autonoma system på Internet"?(Definition)::Protokollet BGP.

Vad är den fundamentala skillnaden mellan statisk och dynamisk routing?(Definition)::Statisk routing konfigureras manuellt och ändras inte. Dynamisk routing anpassar sig automatiskt till nätverksförändringar via protokoll.

Vad kallas den grundläggande principen en router använder för att välja rätt väg i routingtabellen?(Definition);;**Longest Prefix Match** (Längsta nätverksmask/Högst prefix).

Hur fungerar Longest Prefix Match?(Definition);;Routern jämför destinations-IP med nätverken i tabellen. Den väg som har **flest matchande bitar** (högst siffra efter snedstrecket, t.ex. /27 över /24) prioriteras.

Om en router har vägarna 193.10.38.0/24 och 193.10.38.0/26, vilken väg väljs för paketet till 193.10.38.10?(Definition);;**193.10.38.0/26**. Båda matchar, men /26 är en längre (mer specifik) matchning.

Vad är en Default Route (Standardväg) och hur skrivs den?(Definition);;Det är vägen routern väljer om ingen specifik rutt matchar destinationen. Skrivs oftast som **0.0.0.0/0**.

Vad är Metric (Kostnad) i kontexten av routing?(Definition);;Ett värde som beskriver "avståndet" eller "kostnaden" till ett nätverk. Om en router har två exakt likadana rutter via olika vägar, väljs den med **lägst metric**.

Vad anger värdet MTU (Maximum Transmission Unit)?(Definition);;Den maximala storleken på ett helt IP-paket (inklusive IP-huvud) som får skickas över en specifik länk (t.ex. 1500 bytes för Ethernet).

Hur stor är i regel datalasten i ett fragment om länkens MTU är 580 bytes?(Definition);;$580 - 20 = \mathbf{560}$ **bytes** (om IP-huvudet är standard på 20 bytes).

Vad betyder flaggan MF (More Fragments) = 1?(Definition);;Att det **finns fler fragment** som tillhör samma ursprungliga paket.

Vad betyder flaggan MF = 0?(Definition);;Att detta är **det sista** (eller enda) fragmentet av datagrammet.

Hur beräknas Fragment Offset?(Definition);;Det är antalet *data*-bytes före det aktuella fragmentet dividerat med **8**.

Första fragmentet har skickat 560 bytes data. Vad blir Fragment Offset för det andra fragmentet?(Definition);;$560 / 8 = \mathbf{70}$.

Vad är ett Autonomous System(AS)?(Definition);;En samling av nätverk under en **gemensam administration** som använder en gemensam routingstrategi (t.ex. ett ISP:s nätverk eller KTH:s nätverk).

Vad står IGP för och vad är dess syfte?(Definition);;**Interior Gateway Protocol**. Används för routing **inom** ett och samma Autonomous System (Intra-domain routing). Exempel: OSPF, RIP.

Vad står EGP för och vad är dess syfte?(Definition);;**Exterior Gateway Protocol**. Används för routing **mellan** olika Autonoma System på internet (Inter-domain routing). Exempel: BGP.

Vilken av routingtyperna delar endast sin routingtabell med sina direkta grannar ("Routing by rumor")?(Definition);;**Distance Vector**.

Vilken routingtyp låter varje nod skicka sin länkinformation (kostnad för direkt anslutna länkar) till alla noder i hela nätverket (Flooding)?(Definition);;**Link State**.

Känner en enskild router till hela nätverkets topologi i Distance Vector?(Definition);;**Nej**, den känner bara till vilken granne som leder till destinationen (avstånd och riktning).

Känner en enskild router till hela nätverkets topologi i Link State?(Definition);;**Ja**, genom flooding bygger varje nod en komplett databas (karta) över nätverket innan den räknar ut vägen.

Vilken specifik algoritm används av Distance Vector-protokoll?(Definition);;**Bellman-Ford**.

Vilken specifik algoritm används av Link State-protokoll?(Definition);;**Dijkstras algoritm**.

Får man poäng på tentan för Dijkstras algoritm om man bara ritar slutresultatet?(Definition);;**Nej, automatiskt 0 poäng**. Du måste visa varje iteration rad för rad i en **tabellstruktur**.

I vilket exakt format ska kostnad och tidigare nod skrivas i Dijkstras-tabellen?(Definition);;**(Kostnad, Föregående nod)**. Exempel: (7, A) eller (12, B).

Vilka är de tre oförhandlingsbara kraven på det träd (graf) du måste rita i slutet av Dijkstras-uppgiften?(3)
??
- Det ska vara riktade **pilar** ut från startnoden.
- Trädet får absolut **inte ha några loopar**.
- Varje aktiv länk måste ha sin **kostnad utskriven**.

Routing Information Protocol(RIP) (Kategori & Algoritm)(Definition);;Ett **Intra-domain** protokoll (IGP) av typen **Distance Vector** (Bellman-Ford).

Vad är det maximala "hop count" (oändligheten) för RIP?(Definition);;**16 hopp**. (15 är det längsta giltiga avståndet, når en rutt 16 anses nätverket vara oåtkomligt).

Vilken mätvariabel (metric) använder RIP?(Definition);;Enbart **Antal hopp (Hop count)**. Det ignorerar länkarnas hastighet.

Open Shortest Path First(OSPF) (Kategori & Algoritm)(Definition);;Ett **Intra-domain** protokoll (IGP) av typen **Link State** (använder **Dijkstras algoritm**).

Vilken mätvariabel (metric) använder typiskt OSPF?(Definition);;**Länkkostnad** (Cost), vilket oftast är omvänt proportionellt mot länkens **bandbredd** (snabbare länk = lägre kostnad).

Hur hanterar OSPF skalbarhet i väldigt stora nätverk?(Definition);;Genom att dela in autonoma systemet i olika hierarkiska **Areas** (Zoner). Area 0 är alltid Backbone.

Border Gateway Protocol(BGP) (Kategori & Syfte)(Definition);;Ett **Inter-domain** protokoll (EGP). Det är det enda standardprotokollet som används för att koppla ihop olika **Autonoma System (AS)** på det globala internet.

Vilken typ av algoritm ligger till grund för BGP?(Definition);;En avancerad form av Distance Vector som kallas **Path Vector**.
