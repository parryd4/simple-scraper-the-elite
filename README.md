At first, I had one question: What is the slowest time of a Goldeneye player that has submitted times for all 60 stages?

Trying to answer this, I realized The-Elite.net has no API. This gave me the perfect opportunity to do something I've always wanted to try: making my first scraper script.

When you visit the [Goldeneye rankings](https://rankings.the-elite.net/goldeneye) you are automatically shown the top 50 players and their points and times. At the bottom of the table of 50 is an option to "Show all" which loads all remaining users.

This provides us an [AJAX endpoint](https://rankings.the-elite.net/ajax/rankings/ge/post50/1510367957) to collect data on the remaining players. The Top 50 are not of interest: I'm looking for slowest times of people who have completed all 60 stages.  
As of November 10, 2017 11:30pm Eastern time there are 814 players with Goldeneye times. 764 players remain to collect data from.

What I want to scrape is the username of every player and collect it in an array. The username will be used to
