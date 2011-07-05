
Digital Demokrati
=================

Digital Demokrati aims to implement a system for collective policy debate and decision making, leveraging both direct and representative democracy. The project is primarily aimed at Sweden and thus the main [introduction/manifesto](http://digitaldemokrati.se/) is available in Swedish only. However, development is done in english for various practical reasons - not least to enable people from all over the world to participate.

For a generall introduction to the project, se the above link. What follows are some loose lists of things that remains to be done to finish this prototype. (Most of this should probably be converted into GitHub issues.)

Milestone 1: Deploy a MVP
-------------------------

* Implement proper account handling:
 * Enable account creation
* Enable users to create new propositions, arguments.
* Implement voting on both propositions and arguments.
* Do the actualy deployment somewhere and point digitaldemokrati.se to the server.

Random stuff that should be done
--------------------------------

* The views needs some major refactoring. For one thing, proper little partials should be made for displaying stuff like lists of citizens, votes etc. There is also a shameful amount of logic in the views, to be moved to the models.

Slightly more long term technical issues
----------------------------------------

* Should we use Redis for the database backend? The reason for going with Redis initially was performance, since the voting algortithm demands a whole lot of vote counting and weighing in realtime. If Redis is a good choice, is Ohm a good layer on top? It would probably have some benefits to skip it and just use the Redis gem. On the other hand, it would be kind of convenient to run the whole app on Heroku, so perhaps we should consider going with a more traditional SQL solution for the database?

* How can we programmatically identify political blocs? A clean algorithm for this would be most appreciated! It is important for this algorithm to be as objective as possible, that is, it should contain as few arbitrary variables as possible (say, thresholds for how alike two voting patterns need to be to be clustered into the same block). Any clever ideas? (When we have a solution it will be way fun to see which citizens are most representative for their respective blocks, etc!)

* A special task which we can hopefully find a volonteer for is to do Facebook integration! For one, people should be able to create accounts by connecting with their Facebook accounts. Of course, stuff should also be sharable (say, sharing that you have voted for something, that you like a particular argument, that you have chosen a representative etc). Maybe it's also possible to make a widget for people to have on their FB profiles displaying their status in DD (how many representatives, what voting power etc).

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
  * Show the "current power" of every participant!
  
  


