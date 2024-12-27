/*
1. Find the top 3 most-viewed tracks for each artist using window functions.
2. Write a query to find tracks where the liveness score is above the average.
3. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
*/

--- 1.
WITH ranking_artist
AS 
(SELECT artist, track, SUM(views) as total_view, DENSE_RANK()
OVER (PARTITION BY artist ORDER BY SUM(views) DESC) AS RANK
FROM spotify
GROUP BY 1, 2
ORDER BY 1, 3 DESC
)
SELECT * FROM ranking_artist WHERE rank <= 3;

--- 2.
SELECT track,artist, liveness FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);

--- 3.
WITH cte
AS
(SELECT 
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM spotify
GROUP BY 1
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC