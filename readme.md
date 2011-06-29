

Digital Demokrati
=================

De flesta människor inser att det som idag kallas demokrati inte är en särskilt bra approximation av den den filosofiska idén om demokrati eller folkstyre. Demokratin som idé spåras ofta till antikens Aten, men det faktiska politiska system som användes där hade knappast några betydelsefulla likheter med modern "parlamentarisk demokrati". Eftersom demokrati ytterst är ett abstrakt begrepp går det förmodligen inte att skapa något sådant som en perfekt demokrati - men det vore sorgligt om vi inte kan skapa något som är bättre än den version vi har nu. Med hjälp av datorer och internet finns rimligen helt andra möjligheter för människor att samlas och gemensamt fatta beslut än vad som fanns för hundra eller tusen år sedan.


Problemen med modern demokrati
------------------------------

* I ett modernt paralamentariskt system som det svenska får medborgare bara utöva inflytande en gång vart fjärde år, och inflytandet de då tillåts är minimalt. Resten av tiden är deras möjligheter att påverka det politiska livet i praktiken helt obefintliga.
* Processen för att utse kandidater (och därmed vilka specifika personer som sitter i riksdagen) har de flesta människor inget som helst inflytande över, eftersom den sker helt och hållet inom de politiska partierna. Man kan inte rösta på den eller de personer som man själv tror bäst kan representera en, utan man ställs inför ett fåtal färdiga listor, mestadels befolkade av yrkespolitiker.
* Samma sak som för kandidaterna gäller de processer där politiska förslag arbetas fram. De diskussioner som förs, insamlandet av olika uppfattningar, skrivandet av allt ifrån utkast till färdiga propositioner och motioner - allt detta sker i tysthet bland ett antal klickar av inflytelserika personer inom statsförvaltningen.
* I praktiken är medborgare helt utelämnade åt makthavare i de politiska partiernas ledningar - inte ens i samband med valen har de i praktien någon realistisk chans att t.ex. återkalla förtroendet för en enskild politiker.
* Sedan allmän rösträtt infördes har det aldrig hänt att ett svenskt val har avgjorts med en enda rösts övervikt. Därmed är det för varje avlagd röst under åtminstone de senaste hundra åren fallet att inget hade blivit annorlunda om den inte avlagts. Att folk över huvud taget röstar har därför gissningsvis fler orsaker än det obefintliga politiska inflytande en enskild röst ger. Det hela har mer karaktären av en enorm samhällelig ritual där man visar sin lojalitet till den styrande eliten och ödmjukar sig genom att symboliskt ge sitt stöd till en av en handfull fraktioner som tillsammans utgör eliten.


Hur fungerade den antika demokratin
-----------------------------------

TODO


Den moderna statsförvaltningens historia
----------------------------------------

Demokratin anses ofta vara något mycket betydelsefullt och revolutionerande. Vi lever nu i demokratins tidevarv, och staten antas därmed fungera på ett mycket annorlunda sätt än den gjorde innan allmän rösträtt infördes. Men lyfter man blicken är det lätt att se att det är ganska liten skillnad på hur samhället styrs nu och hur det styrdes innan den moderna moderna demokratiska omvälvningen. Den nuvarande svenska statsministern innehar en viss position med vissa specifika möjligheter till maktutövning. Denna position uppstod inte genom att den allmäna rösträtten infördes. Den moderna svenska statsförvaltningen (i grunden det som idag kallas för Regeringskansliet) skapades på 1500-talet av Gustav Vasa. Parallellt med kansliet har själva kungaämbetet evolverat till dagens statsministerämbete. Detta är det arv som Fredrik Reinfeldt förvaltar - inte en kultur av genuint folkstyre nedärvd från de klassiska grekerna.

(Fotnot: Demokratientusiaster tenderar att hela tiden föra tillbaka uppmärksamheten till frågan om allmän rösträtt - som om det är den enda aspekt av demokrati som verkligen betyder något. Med detta perspektiv är det till och med så förvridet att den antika grekiska demokratin betraktas som en mindrevärdig variant av demokrati, inte fullt demokratisk, eftersom kvinnor och slavar inte fick rösta. Med dagens värderingar skulle vi förstås inte betrakta ett sådant demokrati som acceptabelt, men detta har mycket litet att göra med demokratins principer som sådana, och mer att göra med nutidens fäbless för jämlikhet och de specifika fördomar som är förhärskande just nu. (I Aten skulle man betraktat idén att ge slavar rösträtt som fullständigt bisarr, och detta kan förstås av moderna människor uppfattas som oerhört fördomsfullt. Samtidigt uppvisar moderna människor exakt samma attityd själva, men mot andra grupper. Mer än två och en halv miljoner svenska medborgare saknar fortfarande rösträtt, nära nog 27% av befolkningen.))
 

Direkt _och_ representativ demokrati
------------------------------------

Digital Demokrati är ett helt automatiserat och internetbaserat demokratiskt system. Den mest betydelsefulla drivande principen är att i ett och samma system implementera både fullständig direkt demokrati och mycket sofistikerad representativ demokrati.

Här är följer en överblick över de grundläggande idéerna bakom projektet:

* I ett mjukvarusystem hanteras en stor mängd medborgare, omröstningar och medborgares debatter kring omröstningar.
* Vem som helst får bli medlem och delta i debatter. Medlemmar som är svenska medborgare får delta i omröstningar.
* Varje medborgare kan själv rösta i varje omröstning.
* För de omröstningar då man själv inte kan eller vill delta kan man utse en eller flera representanter. Ens röststyrka fördelas jämt över ens representanter (en medborgare med sju representanter ger varje representant en sjundedels röst).
  * Medborgares röststyrka anges generellt som den teoretiskt maximala röststyrkan. I praktiken beräknas röststyrka dynamiskt för varje deltagare i varje enskild omröstning, så att röststyrkan minskar när en eller flera av de medborgare en viss medborgare representerar själva deltar i omröstningen. Exempel: Fredrik har valts till representant av 100 personer och i genomsnitt har har hans anhängare utsett tio representanter var. Fredriks maximala röststyrka är därmed elva (sin egen röst samt 100 * 0,1 från anhängarna). Om 50 av hans anhängare själva deltar i en viss omröstning är Fredriks röststyrka i genomsnitt närmare sex.
   * Not till tidiga läsare: Jag tycker inte om ordet "anhängare" - är det någon som har ett bättre förslag? Supportrar? Representander? Representerade?
* Medborgare kan när som helst byta representanter.
* Alla omröstningar förblir öppna för alltid, så utfallet kan ändras när som helst - antingen genom att medborgare ändrar sina röster eller genom att de ändrar sin representation.
* Det enda sättet att veta vad Digitial Demokrati "tycker" i en viss fråga är att fråga systemet i realtid.
 * Eftersom resultat alltid beräknas i realtid finns aldrig ett visst utfall sparat i en databas som det aktuella eller officiella. I praktiken kommer förstås omslag i vad partiet står ske relativt sällan, och systemet självt kommer att presentera just dessa omröstningar på en särskilt prominent plats på hemsidan, eftersom de är en naturlig vägledning för pågående diskussioner.

Med andra ord: I exakt den mån varje väljare själv vill tillämpas obegränsad direktdemokrati. I exakt den mån varje väljare själv vill tillämpas en version av representativ demokrati som är långt mycket mer sofistikerad och rättvis än den som tillämpas av världens stater. Ambitionen är att erbjuda en perfekt syntes av dessa demokratins alltför länge åtskiljda grenar. Frågan har ställts otaliga gånger genom historien: Hur mycket direkt respektive representativ demokrati bör vi ha? Det enda rimliga svaret på frågan är att låta medborgarna själva bestämma. Med Digital Demokrati kan det ske i realtid.

De grundläggande principerna bakom Digital Demokrati är mycket enkla. En mängd medborgare framställer, diskuterar och röstar om politiska förslag. Allt sker genom en minimalistisk och lättanvänd hemsida. Systemet för att beräkna röster är relativt komplext, men en av grundprinciperna för projektet är att denna algoritm i likhet med all bakomliggande programkod måste vara helt öppen för vem som helst att granska. All källkod publiceras på följande address: https://github.com/digitaldemokrati


Långsiktiga mål
---------------

Till att börja med och på kort sikt är Digital Demokrati ett forum för människor som vill vara med och starta ett nytt stort samtal om samhället. På längre sikt, om tillräckligt många ansluter sig, är planen att projektet utvecklas till ett politiskt parti som ställer upp i valen till Sveriges Riksdag. Detta parti har inga partiledare och inget partiprogram, utan bara ett enda stort digitalt "partimöte" som pågår dygnet runt, året runt. 

Hur detta ska gå till i praktiken är naturligtvis i långa stycken oklart - projektet är trots allt alldeles nystartat (juni 2011) och specifika frågor kommer förstås att diskuteras på djupet när de blir aktuella. Men för att förekomma vissa vanliga frågor och invändingar kan den som är intresserad här ta del av några tankar om hur uppenbara problem skulle kunna lösas:

* Kandidater till representanter i riksdagen utses genom normala omröstningar i Digital Demokrati-systemet. (De nomineringar som får flest ja-röster placeras på riksdagslistor.)
* Partiets riksdagskandidaterna har ett enda mandat från partiet: Att sitta i riksdagens plenisal och rösta i enlighet med den aktuella ställningen i motsvarande omröstning i Digital Demokrati. I praktiken kan man rimligen inte tvinga riksdagsledamöter att rösta på ett visst sätt, men inom partiet måste det betraktas som en dödssynd att rösta emot partilinjen, och förhoppningsvis kan man vaska fram rätt sorts kandidater.
* Det bör inte vara förknippat med stor personlig prestige att vara riksdagsledamot för Digital Demokrati, eftersom uppdraget är oförenligt med att driva en personliga agenda i Riksdagen. Snarare bör representanterna känna en stolthet över att vara tysta men ändå obeskrivligt mer kraftfulla företrädare för folket. De deltar i riksdagsdebatterna, men bara genom att läsa upp de högst rankade inläggen om den aktuella frågan i Digital Demokrati.
* Riksdagsledamöterna bör inte få ta ut hela sina riksdagslöner. En viss andel är rimlig att betala ut som kompensation för tid tillbringad i riksdagen, men eftersom det är och ska vara ett hedersuppdrag bör åtminstone runt hälften av lönen gå till partikassan, avsättas till stiftelsen som driver det tekniska systemet osv.
* Det hjälper förmodligen om man utvecklar en kultur som inte fokuserar på att vara ett politiskt parti, utan om partiet istället ses som ett bihang till själva det demokratiska systemet. Partiet blir en kanal för att utöva inflytande över och ta emot pengar ifrån staten (partistöd, riksdagslöner osv).


Teknisk integration med riksdagen
---------------------------------

Grundmängden omröstningar och debatter i Digital Demokrati bör redan från början avar de omröstningar och debatter som sker i Sveriges Riksdag. Dessa importeras löpande av Digital Demokrati-systemet för att ge alla medborgare en mer lättsmält tillgång till riksdagens motioner, debatter osv - och också en möjlighet at gå rakt in i vilken debatt som helst och delta.

Mycket av det som händer i riksdagen är visserligen ganska ointressant för normal politiskt intresserade personer, men dessa ärenden kan enkelt sorteras bort av användarna själva (de omröstningar och debatter som folk ägnar mest uppmärksamhet visas längst upp i listor osv).

Riksdagsledamöters officiella verksamheter i riksdagen representeras på samma sätt som vilken aktivitet som helst från vilken medborgare som helst (förutom att det möjligen markeras visuellt att en viss medborgare är eller har varit riksdagsledamot). (Ett undantag är ironiskt nog Digital Demokratis eventuella egna riksdagsledamöter, som måste ha en möjlighet att driva sin egen agenda i Direkt Demokrati samtidigt som de hela tiden röstar å systemets vägnar i riksdagen.) Digital Demokrati importerar också alla röster som avläggs i riksdagen och dessa räknas som vilken röster som helst i de motsvarande DD-omröstningarna. Politiker är i grunden vanliga medborgare med en röst var, men kan också som alla andra utses till representanter, och deras röststyrka kommer då att beräknas på normalt sätt.

Digitial Demokrati bör se entydigt positivt på att politiker från alla partier deltar i Digital Demokrati-systemet. Folkvalda politiker vars verksamhet dokumenteras på internet, t.ex. riksdagsledamöter, kommer att importeras automatiskt, men deras konton fungerar också precis som vilket konto som helst. När medborgare går in i t.ex. en riksdagsdebatt med egna inlägg vore det fantastiskt om de faktiska riksdagsledamöterna ville fortsätta ett bredare samtal utanför plenisalen. Det är både tillåtet och uppmuntrat för etablerade politiker att odla en särskild maktbas inom ramen för Digital Demokrati och utöva politiskt inflytande även genom denna kanal.

