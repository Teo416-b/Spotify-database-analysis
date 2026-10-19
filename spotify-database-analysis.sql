--Query 1

Select strftime('%Y', release_date / 1000, 'unixepoch') As year, count() As albums_per_year From albums 
Where popularity >= 40
Group by year
Order by release_date desc;


--Query 2

Select strftime('%Y', release_date / 1000, 'unixepoch') As year, count() As albums_per_year From albums 
Where popularity >= 40 
Or album_type == 'single'
Group by year
Order by release_date desc;


--Query 3

Select album_type, strftime('%Y', release_date / 1000, 'unixepoch') As year, count() As albums_per_type_year From albums
Group by year, album_type
Order by release_date desc;


--Query 4

Select artists.name, strftime('%Y', release_date / 1000, 'unixepoch') As year, count() As albums_per_year From albums
join r_albums_artists on albums.id=r_albums_artists.album_id 
join artists on artists.id=r_albums_artists.artist_id
Where artists.name='ABBA'
Group by year
Order by year desc;


--Query 5

Select name As album, strftime('%Y', release_date / 1000, 'unixepoch') As year, max(popularity) As max_popularity From albums
Group by year
Having max(popularity) != 0 
Order by year desc;


--Query 6

Select artists.name As name, count() As number_of_albums From albums 
join r_albums_artists on albums.id=r_albums_artists.album_id 
join artists on artists.id=r_albums_artists.artist_id
Group by artists.name
having count() >= 30
Order by artists.name asc;


--Query 7 

Create View RatingsView As
Select user_id As user_id, Avg(rating) As avg_rating, count(*) As rating_count From ratings
Group by user_id;


--Query 8 

Select name as album_title, popularity From albums
Order by popularity desc
limit 10;


--Query 9

Select strftime('%Y', a1.release_date / 1000, 'unixepoch') As year, a1.name As most_popular_album From albums a1
Where a1.popularity = (Select MAX(a2.popularity) From albums a2
                       Where strftime('%Y', a2.release_date / 1000, 'unixepoch') = strftime('%Y', a1.release_date / 1000, 'unixepoch'))
Group by year
Order By year, most_popular_album desc;


--Query 10

Select a.name From artists a
Where Exists (Select 1 From r_artist_genre rag1 
              Where rag1.artist_id = a.id 
              And rag1.genre_id = 'rock')
And Exists (Select 1 From r_artist_genre rag2 
            Where rag2.artist_id = a.id 
            And rag2.genre_id = 'blues')
Order by a.name asc;


--Query 11

Select a.name From artists a
Join r_artist_genre rag On a.id = rag.artist_id
Where rag.genre_id = 'rock'

Intersect

Select a.name From artists a
Join r_artist_genre rag On a.id = rag.artist_id
Where rag.genre_id = 'blues'
Order by a.name asc;


--Query 12

Select r1.user_id As User_A, r2.user_id As User_B From Ratings r1
Join Ratings r2 On r1.album_id = r2.album_id 
And r1.rating = r2.rating
Where r1.user_id < r2.user_id
Group By r1.user_id, r2.user_id
Having Count(r1.album_id) >= 25;

