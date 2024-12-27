--- 

EXPLAIN ANALYZE    -- et 7.82 ms pt 0.109 ms
SELECT artist, track, views 
FROM spotify
WHERE artist = 'Gorillaz'
AND most_played_on = 'Youtube'
ORDER BY stream DESC LIMIT 25;

CREATE INDEX artist_index ON spotify(artist)