
Digital Demokrati
=================

Digital Demokrati aims to implement a system for collective policy debate and decision making, leveraging both direct and representative democracy. The project is primarily aimed at Sweden and thus the main [introduction/manifesto](http://digitaldemokrati.se/) is available in Swedish only. However, development is done in english for various practical reasons - not least to enable people from all over the world to participate.

For a general introduction to the project, se the above link. What follows are some loose lists of things that remains to be done to finish the prototype. (A lot of this should probably be converted into GitHub issues.)


Getting it up and running
-------------------------

To install the project and all dependencies in a clean directory:

    git clone git@github.com:digitaldemokrati/prototyp.git .
    bundle install

To run the app, you need to have a Redis running:

    redis-server
  
To start the app:

    rackup
    
Easy, huh?

The app depends on a few API:s, so to run it you need some accounts:

    credentials/sms.txt
    credentials/redis.txt


Current status
--------------

Very, very close to the MVP.

The code is still a mess, but I have done some stuff recently:

* User account management.
* Interfaces for voting and debating.
* Account verification by SMS.
* User profiles and editing them.
* Admin/backoffice interface.
* Major overhaul of the whole UI.
* Completely redone the file and directory structure.
* Set up a Rakefile with some tasks, like:
  * generate [documentation](http://digitaldemokrati.se/om/docs) (with Rocco)
  * clear and repopulate the database with dummy data

Then I will get down and dirty with the last few details before full on beta testing launch:

* Make outgoing mail work. This is required by at least two things: Verifying email addresses and reseting passwords. Also in the near future for various notifications (weekly digest etc).
* Do some jQuery-polishing, like proper placeholders in input fields, nicer popups, more tooltips etc.
* Make the site IE compatible. It's a damn shame, but this needs to be done. Help please!
* Write up at least a minimum of decent documentation.

Major stuff that is more or less needed for maximum success at beta launch:

* Do the integration with Riksdagen. This is a hairy one, but it is high on my todo list. The mental blocker for me right now is not knowing how the UI should work.
* Enable account creation through Google profiles and Facebook accounts.
* Create a system of invites. Simple stuff really, but needs to work cleanly with the HasKeys etc.

Admin needed!

* Deploy the system on a decent server. NOTE: The problem here is that I'm unable to properly configure a web server on a VPS. If someone competent could spend a few minutes setting up apache/nginx etc on my server, it would be immensly appreciated.


Random stuff that should be done later
--------------------------------------

* The views needs some major refactoring. For one thing, proper little partials should be made for displaying stuff like lists of citizens, votes etc. There is also a shameful amount of logic in the views, to be moved to the models.

* Pretty early on we will need a widget for incremental search (e.g. for finding citizens when adding representatives, but also more generally). This would be an excellent task for someone who is interested in contributing a little something to the project!


Slightly more long term technical issues
----------------------------------------

* Should we use Redis for the database backend? The reason for going with Redis initially was performance, since the voting algortithm demands a whole lot of vote counting and weighing in realtime. If Redis is a good choice, is Ohm a good layer on top? It would probably have some benefits to skip it and just use the Redis gem. On the other hand, it would be kind of convenient to run the whole app on Heroku, so perhaps we should consider going with a more traditional SQL solution for the database?

* How can we programmatically identify political blocs? A clean algorithm for this would be most appreciated! It is important for this algorithm to be as objective as possible, that is, it should contain as few arbitrary variables as possible (say, thresholds for how alike two voting patterns need to be to be clustered into the same block). Any clever ideas? (When we have a solution it will be way fun to see which citizens are most representative for their respective blocks, etc!)

* A special task which we can hopefully find a volonteer for is to do Facebook integration! For one, people should be able to create accounts by connecting with their Facebook accounts. Of course, stuff should also be sharable (say, sharing that you have voted for something, that you like a particular argument, that you have chosen a representative etc). Maybe it's also possible to make a widget for people to have on their FB profiles displaying their status in DD (how many representatives, what voting power etc).

* There should be a comprehensive API that let's others plug into the Direkt Demokrati platform! Yes, it's a cliche, but it's also quite useful. Our API could be modelled after the Facebook Graph API, which is very nicely implemented. It would be very cool if others could start displaying voting results on their homepages, if arguments could be both imported and exported to other forums etc. The opportunities are obviously endless.

* An important question is how to handle local politics. Should we have separate instances for every municipality? Obviously, the user management should to be universal, but it will probably be very natural to isolate issues relating to a specific municipal council etc. Perhaps we can do this simply with some kind of tags, but if we need to have something more complex, we should put it in the plans early on. So, if nothing else, some serious thinking needs to be done here.

* We should use rigourous testing of the program, or rather, _formal validation_, as one of several ways to enable people to trust the integrity of the system. Any programmer should be able to check out the code, read and run the tests, and then be able to verify that the system is doing what it is supposed to be doing (of course, to do this properly you need to read the entire codebase). This way we have a streamlined way to build up the list of experts who officially declare that at this or that point in time, the system had integrity. (Compare this to the miserable state of closed source voting machines used for general elections in many countries.)

* A point that will be controversial is voting transparence. Voting by secret ballot is an ingrained habit in the western world, and similar projects have always been met with objections on this point. However, total transparency is one of the fundamental principles of Digital Demokrati, like it or leave it. The details of the present state of every vote and representation will always be available for any one (member) to examine. There are plenty of reasons for this in a system of this kind, but these need to be elaborated very carefully and strategically.



Miscellaneous
-------------

* On the first page:
  * Latest changes of outcome in descisions.
  * Separate lists for approved and declined propositions respectively.
  * Who are the most popular representatives?
  * Who are the most popular debaters?
  * Who are the most active citizens (most votes, arguments, propositions)?
  * Which representatives have the most active supporters (and respectively, the most passive)?
  * Who has the largest number of supporters per argument karma?
  * Most popular comments in the last 48 hours.
* On user profiles:
  * How many votes have I participated in (directly and indirectly)? How large percentage of all votes?
  * Which other users have most similiar/dissimilar voting pattern?
* For proposition profiles:
  * How many have participated, directly and indirectly respectively? What percentages of the total citizenry have participated?
  
  


