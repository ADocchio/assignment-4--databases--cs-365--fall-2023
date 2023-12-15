-- Command One
SELECT CONCAT(artist_name, ' recorded ', album_name) AS Recording
FROM artist JOIN album ON artist.artist_id = album.artist_id;

-- Command Two, was unable to figure out how to do it with only adding a sub-query in the parens
SELECT artist_name, album_name FROM artist JOIN album ON artist.artist_id = album.artist_id
WHERE artist.artist_id IN (
  SELECT artist_id
  FROM album
);

-- Command Three
SELECT subquery.artist_name, album.album_name FROM
(SELECT artist.artist_name, artist.artist_id, compiles.album_id
  FROM artist JOIN compiles ON artist.artist_id = compiles.artist_id) AS subquery
JOIN album ON subquery.artist_id = album.artist_id AND subquery.album_id = album.album_id;

-- Command Four
SELECT album.album_name, subquery.track_name, subquery.time FROM
(SELECT contains.artist_id, contains.album_id, track.track_name, track.time
  FROM track JOIN contains ON track.artist_id = contains.artist_id
  AND track.album_id = contains.album_id
  AND track.track_id = contains.track_id) AS subquery
JOIN album ON subquery.artist_id = album.artist_id AND subquery.album_id = album.album_id;

-- Command Five
SELECT album.album_name, subquery.track_name, subquery.time FROM
(SELECT wasplayedat.artist_id, wasplayedat.album_id, track.track_name, track.time
  FROM track JOIN wasplayedat ON track.artist_id = wasplayedat.artist_id
  AND track.album_id = wasplayedat.album_id
  AND track.track_id = wasplayedat.track_id) AS subquery
JOIN album ON subquery.artist_id = album.artist_id AND subquery.album_id = album.album_id;
