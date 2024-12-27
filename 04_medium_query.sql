/*
1. Calculate the average danceability of tracks in each album.
2. Find the top 5 tracks with the highest energy values.
3. List all tracks along with their views and likes where official_video = TRUE.
4. For each album, calculate the total views of all associated tracks.
5. Retrieve the track names that have been streamed on Spotify more than YouTube.
*/

--- 1.

SELECT album, avg(danceability) as avg_danceability
FROM spotify
GROUP BY 1
ORDER BY 2 DESC;

--- 2.

SELECT 
track,
MAX(energy) 
FROM spotify 
GROUP BY 1 
ORDER BY 2 
DESC LIMIT 15;

--- 3.

SELECT 
 track,
 SUM(views) AS total_views,
 SUM(likes) AS total_likes
 FROM spotify
 WHERE official_video = 'true'
 GROUP BY 1
 ORDER BY 2 DESC LIMIT 15;

--- 4.

SELECT album, track, SUM(views)
FROM spotify
GROUP BY 1, 2 ORDER BY 3 DESC;

--- 5. 
SELECT * FROM
(SELECT track,
	COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END), 0) AS streamed_on_youtube,
	COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END), 0) AS streamed_on_spotify
 	FROM spotify
	GROUP BY 1
)as t1
WHERE 
	streamed_on_spotify > streamed_on_youtube
	AND 
	streamed_on_youtube <> 0;