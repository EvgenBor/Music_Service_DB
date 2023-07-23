-- ������� 2

-- 1. �������� � ����������������� ������ ����������� �����.

SELECT name, duration 
FROM track 
WHERE duration = (SELECT max(duration) FROM track)


-- 2. �������� ������, ����������������� ������� �� ����� 3,5 �����.

SELECT name 
FROM track 
WHERE duration > '00:03:30';


-- 3. �������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������.

SELECT name
FROM collection 
WHERE release_year >='2018-01-01' AND release_year <= '2020-12-31';


-- 4. �����������, ��� ��� ������� �� ������ �����.

SELECT name
FROM singer 
WHERE name NOT LIKE '% %';


-- 5. �������� ������, ������� �������� ����� ���� ��� �my�.

SELECT name
FROM track 
WHERE name LIKE '%my%' OR name LIKE '%���%';




-- ������� 3
-- 1. ���������� ������������ � ������ �����.

SELECT genre, COUNT(name)
FROM genre JOIN singer_genre
ON genre.genre_id = singer_genre.genre_id
GROUP BY genre
ORDER BY 1
;


-- 2. ���������� ������, �������� � ������� 2019�2020 �����.

SELECT COUNT(track.name)
FROM track JOIN album
ON track.album_id = album.album_id
WHERE release_date >= '2019-01-01' AND release_date <= '2020-12-31'  
;



-- 3. ������� ����������������� ������ �� ������� �������.

SELECT AVG(track.duration)
FROM track JOIN album
ON track.album_id = album.album_id  
GROUP BY album
;


-- 4. ��� �����������, ������� �� ��������� ������� � 2020 ����.

SELECT DISTINCT singer.name
FROM singer 
JOIN singer_album ON singer.singer_id = singer_album.singer_id
JOIN album ON (singer_album.album_id = album.album_id) 
	AND NOT (release_date >= '2020-01-01' AND release_date <= '2020-12-31')
GROUP BY singer.name
;

-- 5. �������� ���������, � ������� ������������ ���������� ����������� (Metalica).


SELECT collection.name, singer.name
FROM collection 
LEFT JOIN collection_track  ON collection.collection_id = collection_track.collection_id
LEFT JOIN track ON track.track_id = collection_track.track_id
LEFT JOIN album ON album.album_id = track.album_id
LEFT JOIN singer_album ON singer_album.album_id = album.album_id
LEFT JOIN singer ON singer.singer_id = singer_album.singer_id
WHERE singer.singer_id = 3 
GROUP BY collection.name, singer.name