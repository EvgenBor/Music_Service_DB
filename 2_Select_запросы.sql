-- Задание 2
-- 1. Название и продолжительность самого длительного трека.
SELECT name, duration 
FROM track 
WHERE duration = (SELECT max(duration) FROM track);

-- 2. Название треков, продолжительность которых не менее 3,5 минут.
SELECT name 
FROM track 
WHERE duration > '00:03:30';

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name
FROM collection 
WHERE release_year >='2018-01-01' AND release_year <= '2020-12-31';

-- 4. Исполнители, чьё имя состоит из одного слова.
SELECT name
FROM singer 
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM track 
WHERE name LIKE '%my%' OR name LIKE '%мой%';

-- Задание 3
-- 1. Количество исполнителей в каждом жанре.
SELECT genre, COUNT(name)
FROM genre JOIN singer_genre
ON genre.genre_id = singer_genre.genre_id
GROUP BY genre
ORDER BY 1;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(track.name)
FROM track JOIN album
ON track.album_id = album.album_id
WHERE release_date >= '2019-01-01' AND release_date <= '2020-12-31'  
;

-- 3. Средняя продолжительность треков по каждому альбому.
SELECT AVG(track.duration)
FROM track JOIN album
ON track.album_id = album.album_id  
GROUP BY album
;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT DISTINCT singer.name
FROM singer 
JOIN singer_album ON singer.singer_id = singer_album.singer_id
JOIN album ON (singer_album.album_id = album.album_id) 
	AND NOT (release_date >= '2020-01-01' AND release_date <= '2020-12-31')
GROUP BY singer.name
;

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection.name, singer.name
FROM collection 
LEFT JOIN collection_track  ON collection.collection_id = collection_track.collection_id
LEFT JOIN track ON track.track_id = collection_track.track_id
LEFT JOIN album ON album.album_id = track.album_id
LEFT JOIN singer_album ON singer_album.album_id = album.album_id
LEFT JOIN singer ON singer.singer_id = singer_album.singer_id
WHERE singer.singer_id = 3 
GROUP BY collection.name, singer.name
;