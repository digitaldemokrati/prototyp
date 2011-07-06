# coding: utf-8

require 'rubygems'
require 'ohm'
require './models'

Ohm.connect

%w(Citizen Proposition Vote Argument HashKey).each { |klass| eval "#{klass}.all.to_a.map(&:delete)"}

# Set up some dummy citizens
albert = Citizen.create :firstname => "Albert", :lastname => "Bernstein", :email => "albert@example.org"
albert.password = "foo"
cecilia = Citizen.create :firstname => "Cecilia", :lastname => "Dönitz", :email => "cecilia@example.org"
cecilia.password = "foo"
edwin = Citizen.create :firstname => "Edwin", :lastname => "Forbnitz", :email => "edwin@example.org"
edwin.password = "foo"
gunilla = Citizen.create :firstname => "Gunilla", :lastname => "Holm", :email => "gunilla@example.org"
gunilla.password = "foo"
ingemar = Citizen.create :firstname => "Ingemar", :lastname => "Jansson", :email => "ingemar@example.org"
ingemar.password = "foo"
kristina = Citizen.create :firstname => "Kristina", :lastname => "Lazarus", :email => "kristina@example.org"
kristina.password = "foo"
mikael = Citizen.create :firstname => "Mikael", :lastname => "Namaste", :email => "mikael@example.org"
mikael.password = "foo"
octavia = Citizen.create :firstname => "Octavia", :lastname => "Pengler", :email => "octavia@example.org"
octavia.password = "foo"
quintus = Citizen.create :firstname => "Quintus", :lastname => "Rutger", :email => "quintus@example.org"
quintus.password = "foo"
sara = Citizen.create :firstname => "Sara", :lastname => "Tempelhof", :email => "sara@example.org"
sara.password = "foo"
uwe = Citizen.create :firstname => "Uwe", :lastname => "Vogel", :email => "uwe@example.org"
uwe.password = "foo"
xanada = Citizen.create :firstname => "Xanada", :lastname => "Yong", :email => "xanada@example.org"
xanada.password = "foo"
zeno = Citizen.create :firstname => "Zeno", :lastname => "Åkesson", :email => "zeno@example.org"
zeno.password = "foo"
arla = Citizen.create :firstname => "Ärla", :lastname => "Öberg", :email => "arla@example.org"
arla.password = "foo"

# Frihetsvänner
%w(gunilla octavia quintus xanada zeno).each { |c| eval "#{c}.support edwin" }
%w(edwin gunilla octavia xanada zeno).each { |c| eval "#{c}.support octavia" }
%w(octavia quintus xanada zeno).each { |c| eval "#{c}.support zeno" }
%w(edwin xanada zeno).each { |c| eval "#{c}.support quintus" }

# Etatister
%w(cecilia ingemar kristina mikael).each { |c| eval "#{c}.support arla" }
%w(arla ingemar kristina mikael).each { |c| eval "#{c}.support cecilia" }
%w(arla cecilia kristina).each { |c| eval "#{c}.support ingemar" }
%w(arla ingemar mikael).each { |c| eval "#{c}.support kristina" }
%w(arla ingemar kristina).each { |c| eval "#{c}.support mikael" }

# Svenskar
%w(gunilla zeno).each { |c| eval "#{c}.support arla" }
%w(zeno kristina).each { |c| eval "#{c}.support gunilla" }
%w(gunilla mikael).each { |c| eval "#{c}.support ingemar" }
%w(gunilla).each { |c| eval "#{c}.support kristina" }
%w(zeno).each { |c| eval "#{c}.support mikael" }
%w(ingemar mikael).each { |c| eval "#{c}.support zeno" }

# Tyskättlingar
%w(cecilia edwin octavia quintus sara uwe).each { |c| eval "#{c}.support albert" }
%w(albert cecilia octavia uwe).each { |c| eval "#{c}.support edwin" }
%w(octavia sara).each { |c| eval "#{c}.support cecilia" }

# Propositioner
karnkraft = Proposition.create :citizen => sara, :name => "Avskaffa kärnkraften!", :text => "Efter Three Mile Island, Tjernobyl och Fukushima finns det inga tvivel: Kärnkraften är för farlig!\nKärnteknik är inte det enda, men kanske det tydligaste exemplet på att mänskligheten leker med krafter större än vad man kan hantera.\nSamtliga svenska kärnkraftverk bör stängas så snabbt som möjligt."
Vote.create :citizen => albert, :proposition => karnkraft, :value => -1
Vote.create :citizen => edwin, :proposition => karnkraft, :value => 0
Vote.create :citizen => gunilla, :proposition => karnkraft, :value => 1
Vote.create :citizen => ingemar, :proposition => karnkraft, :value => 1
Vote.create :citizen => mikael, :proposition => karnkraft, :value => 1
Vote.create :citizen => octavia, :proposition => karnkraft, :value => -1
Vote.create :citizen => sara, :proposition => karnkraft, :value => 1
Vote.create :citizen => zeno, :proposition => karnkraft, :value => -1
Vote.create :citizen => arla, :proposition => karnkraft, :value => 0
kka1 = Argument.create :citizen => ingemar, :proposition => karnkraft, :text => "Kärnkraften är definitivt farlig, men har vi råd att avskaffa den? Vad ska ersätta den? Om alternativet är ett ökat beroende på rysk naturgas så innebär det i sig en stor risk!"
kka2 = Argument.create :citizen => zeno, :argument => kka1, :text => "Kan vi inte helt enkelt köpa all vår olja och gas från Norge?"
kka3 = Argument.create :citizen => gunilla, :proposition => karnkraft, :text => "Inte bara är kärnkraften oerhört farlig i sig själv. Dessutom finns en annan sida av saken som diskuteras mer sällan:\nEn av de främsta orsakerna till att världens stater bygger kärnkraftverk är att de är ett nödvändigt steg på vägen mot kärnvapenproduktion. För ett land som Japan eller Sverige vore det t.ex. förmodligen en relativt smal sak att utveckla egna kärnvapen, med tanke på den omfattande nukleära industri som finns i dessa länder.\nVi bör också motsätta oss kärnkraften som ett led i motståndet mot kärnvapen!"
kka4 = Argument.create :citizen => albert, :proposition => karnkraft, :text => "Kärnkraft kan tyckas skrämmande men faktum är att mänsklighetens uppfinningsrikedom i våra dagar har tämjt även atomen. Tjernobyl var ett helt annat slags kraftverk än de som finns i Sverige. I Fukushima hade man maximal otur med en enorm jordbävning och en enorm tsunami på samma gång.Utan sådana extrema naturkatastrofer är kärnkraften säker - och Sverige är inte något om inte geologiskt stabilt.\nPå lång sikt får man hoppas att vi hittar andra sätt att generera energi, men tills vidare är kärnkraften nödvändig."
kka5 = Argument.create :citizen => xanada, :argument => kka4, :text => "Vare sig i Sovjet eller i Japan hade man ett underskott av skickliga nukleära ingenjörer.\nAlla vet att Japan ständigt drabbas av jordbävningar och tsunamis (det är ingen slump, som Bernstein tycks antyda, att de uppträder samtidigt) - så varför är inte varje kärnkraftverk byggt för att klara många gånger mer påfrestning än den värsta tänkbara jordbävning eller tsunami kan orsaka? Varför är t.ex. inte alla reaktorer placerade över en kraftig barriär av metervis med sten och stål, av den typ som krävs för att innesluta en härdsmälta?\nOavsett om orsaken är teknisk inkompetens eller bara vanlig psykopatisk girighet är det uppenbart att mänskligheten är oförmögen att konstruera och driva kärnkraftverk."
kka6 = Argument.create :citizen => octavia, :argument => kka5, :text => "Jag är själv ingenjör och kan bestämt säga att det här med kärnkraft är egentligen inte så komplicerat. Sverige kan lita på sina ingenjörer. Att påstå något annat är farligt för samhället!"

invandring = Proposition.create :citizen => arla, :name => "Halvera invandringen", :text => "Invandring är ett naturligt fenomen och i sin naturliga form ett positivt sådant, men för att invandring ska vara till gagn för samhället måste invandrare snabbt integreras i samhället.\nUnder en lång rad år har Sverige årligen tagit emot en mängd invandrare som inte integrerats, i stor utsträckning för att grupperna helt enkelt varit för stora för att kunna få ett nödvändigt stöd från samhället. Det är hög tid att minska invandringen och använda integrationsresurserna mer effektivt på en mindre grupp som kommer att integreras desto snabbare.\nHur mycket ska man då minska invandringen? Det är en svår fråga, särskilt med tanke på de invandrare som inte får komma och som därmed riskerar att leva sämre liv - hur man än beräknar nivån måste man oaptitligt räkna på värdet av människors liv. Därför anser jag att man bör ta en rund siffra ur luften utan att tänka för mycket på saken - på så sätt kan vi åtminstone börja någonstans. Mitt förslag är att man till att börja med halverar invandringen."
Vote.create :citizen => albert, :proposition => invandring, :value => 1
Vote.create :citizen => cecilia, :proposition => invandring, :value => 1
Vote.create :citizen => edwin, :proposition => invandring, :value => 1
Vote.create :citizen => gunilla, :proposition => invandring, :value => -1
Vote.create :citizen => ingemar, :proposition => invandring, :value => 1
Vote.create :citizen => kristina, :proposition => invandring, :value => -1
Vote.create :citizen => mikael, :proposition => invandring, :value => -1
Vote.create :citizen => octavia, :proposition => invandring, :value => -1
Vote.create :citizen => quintus, :proposition => invandring, :value => 1
Vote.create :citizen => sara, :proposition => invandring, :value => -1
Vote.create :citizen => uwe, :proposition => invandring, :value => 1
Vote.create :citizen => xanada, :proposition => invandring, :value => -1
Vote.create :citizen => zeno, :proposition => invandring, :value => -1
Vote.create :citizen => arla, :proposition => invandring, :value => 1

legalisera = Proposition.create :citizen => zeno, :name => "Legalisera cannabis", :text => "Cannabis är en relativt harmlös drog. De skador som drogen orsakar bleknar i jämförelse med de skador som orsakas av förbudet.\nStaten har ingen rätt att förfölja de tusentals människor som väljer att använda cannbis.\nDärför bör cannabis legaliseras, regleras och beskattas på ett sätt som liknar hur man idag hanterar alkohol."
Vote.create :citizen => albert, :proposition => legalisera, :value => -1
Vote.create :citizen => edwin, :proposition => legalisera, :value => 1
Vote.create :citizen => gunilla, :proposition => legalisera, :value => 1
Vote.create :citizen => mikael, :proposition => legalisera, :value => -1
Vote.create :citizen => octavia, :proposition => legalisera, :value => 1
Vote.create :citizen => quintus, :proposition => legalisera, :value => 1
Vote.create :citizen => sara, :proposition => legalisera, :value => -1
Vote.create :citizen => xanada, :proposition => legalisera, :value => 1
Vote.create :citizen => zeno, :proposition => legalisera, :value => 1
Vote.create :citizen => arla, :proposition => legalisera, :value => -1

