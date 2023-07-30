INSERT INTO Singer (singer_id, name) VALUES 
(1, 'Adele'), 
(2, 'Imagine Dragons'), 
(3, 'Metallica'), 
(4, 'Rihanna')
;

INSERT INTO genre (genre_id, name) VALUES 
(1, 'Rock'), 
(2, 'Pop'), 
(3, 'R&B')
;

INSERT INTO album (album_id, name, release_date) VALUES 
(1, '21', '2011-01-24'), 
(2, 'Origins', '2019-01-09'), 
(3, 'Black Album', '1991-08-12'), 
(4, 'Good Girl Gone Bad', '2007-01-01')
;

INSERT INTO track (track_id, name, album_id, duration) VALUES 
(1, 'The Unforgiven', 3, '00:06:07'), 
(2, 'Nothing Else Matters', 3, '00:05:50'), 
(3, 'Natural', 2, '00:04:15'), 
(4, 'Rolling in the Deep', 1, '00:03:15'),
(5, 'Someone Like You', 1, '00:03:25'),
(6, 'Umbrella', 4, '00:02:45'),
(7, 'Whats my name?', 4, '00:03:20')
(8, 'My Own', 2, '00:02:15'),
(9, 'By myself', 1, '00:03:05'),
(10, 'Beemy', 3, '00:04:25')
;

INSERT INTO collection (collection_id, name, release_year) VALUES 
(1, 'The Best of Metallica', '1991-01-01'), 
(2, 'The Best of 2007', '2007-01-01'), 
(3, 'The Best of 2011', '2011-01-01'), 
(4, 'The Best of 2018', '2018-01-01')
;

INSERT INTO singer_genre (genre_id, singer_id) VALUES 
(1, 2),
(1, 3),
(2, 1),
(3, 4)
;

INSERT INTO singer_album (album_id, singer_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4)
;

INSERT INTO collection_track (track_id, collection_id) VALUES
(1, 1),
(2, 1),
(3, 4),
(4, 3),
(5, 3),
(6, 2),
(7, 2)
(8, 4),
(9, 3),
(10, 1)
;