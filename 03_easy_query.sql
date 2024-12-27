/*
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where licensed = TRUE.
4. Find all tracks that belong to the album type single.
5. Count the total number of tracks by each artist.
*/

--- 1.

SELECT * FROM spotify 
WHERE stream > 1000000000

--- 2.

SELECT DISTINCT album, artist
FROM spotify
ORDER BY 1

--- 3.

SELECT SUM(comments) as total_comments
FROM spotify
WHERE licensed = 'true'

--- 4.

SELECT * FROM spotify 
WHERE album_type = 'single';

--- 5.

SELECT 
artist, COUNT(*) AS total_no_songs
FROM spotify
GROUP BY artist ORDER BY 2;