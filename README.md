At first, I had one question: What is the slowest time of a GoldenEye player that has submitted times for all 60 stages?

Trying to answer this, I realized The-Elite.net has no API. This gave me the perfect opportunity to do something I've always wanted to try: making my first scraper script.

When you visit the [GoldenEye rankings](https://rankings.the-elite.net/goldeneye) you are automatically shown the top 50 players and their points and times. At the bottom of the table of 50 is an option to "Show all" which loads all remaining users.

This provides us an [AJAX endpoint](https://rankings.the-elite.net/ajax/rankings/ge/post50/1510367957) to collect data on the remaining players. The Top 50 are not of interest: I'm looking for slowest times of people who have completed all 60 stages.  
As of November 10, 2017 11:30pm Eastern time there are 814 players with GoldenEye times. 764 players remain to collect data from.

What I want to scrape is the username of every player and collect it in an array. Although the endpoint contains data on overall total time, and total time for each difficulty, I don't want to hold on to all that data just yet. I want to remove any player who has incomplete times from the list.

The above endpoint has a JSON object with 2 keys, "p" for points and "t" for time, with values of arrays. I can split it's text after the "t" key to remove redundant data and then proceed to track what fits my criteria.

A user's GoldenEye time's page has a URL format of "https://rankings.the-elite.net/~USERNAME/goldeneye" and contains their personal best time for every stage. If a stage has a time of "N/A" then no time has been submitted and I can remove the user from the array.

Once I have removed all users with incomplete times from the list, I will be able to user a Player Class Method to puts the slowest time in the console.
