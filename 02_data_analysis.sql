--- EDA

--- print total rows :
SELECT(*) FROM spotify;

--- print total no. of artists :
SELECT COUNT(DISTINCT artist) FROM spotify;

--- print max duration

SELECT MAX(duration_min) from spotify;

SELECT MIN(duration_min) from spotify;

--- delete 0 min songs entry.
DELETE FROM spotify
WHERE duration_min = 0;

--- print all channels
SELECT DISTINCT channel FROM spotify;

--- print all platfroms
SELECT DISTINCT most_played_on FROM spotify;
