Spotify database analysis

Description:
This project contains 12 SQL queries developed for a database analysis.

Database and Setup:
The analysis was performed on a SQLite database. The base Spotify dataset, the user ratings file, and the initial indexing script were provided as part of the academic assignment. My contribution in this project is the design, logical structuring, and implementation of the 12 SQL queries.

Query overview:

Query 1: Calculates the number of albums per year for albums with a popularity score greater than 40.

Query 2: Calculates the number of albums per year that either have a popularity score greater than 40 or are classified specifically as singles.

Query 3: Counts the number of albums categorized by their album type and release year.

Query 4: Retrieves the total number of albums the artist ABBA has participated in, grouped by year.

Query 5: Finds the album with the highest popularity score per year, excluding albums with zero popularity.

Query 6: Lists the names of artists who have a large volume of work, specifically those who have participated in more than 30 albums.

Query 7: Creates a database view named RatingsView that calculates the average rating and the total number of ratings submitted by each individual user.

Query 8: Retrieves the top 10 albums with the highest overall popularity across the database.

Query 9: Uses a correlated subquery to find the names of the albums that achieved the maximum popularity score for each respective release year.

Query 10: Uses the EXISTS operator to find versatile artists who have at least one album in the Rock genre and at least one in the Blues genre.

Query 11: Achieves the exact same result as Query 10 (artists in both Rock and Blues) by utilizing the INTERSECT set operator.

Query 12: Identifies pairs of users with highly similar tastes (for recommendation purposes) by finding those who have given the exact same rating to at least 25 common albums.


