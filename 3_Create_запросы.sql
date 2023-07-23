CREATE TABLE Genre ( 
genre_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE Singer ( 
singer_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

CREATE TABLE Singer_genre ( 
singer_genre_id INT,
genre_id INT REFERENCES Genre(genre_id),
singer_id INT REFERENCES Singer(singer_id),
constraint pk primary key (genre_id, singer_id)
);

CREATE TABLE Album ( 
album_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
release_date DATE
);

CREATE TABLE Singer_album ( 
singer_album_id INT,
album_id INT REFERENCES Album(album_id),
singer_id INT REFERENCES Singer(singer_id),
constraint pk primary key (singer_id, album_id)
);

CREATE TABLE Track ( 
track_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
album_id INT REFERENCES Album(album_id),
duration TIME
);

CREATE TABLE Collection ( 
collection_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
release_year DATE
);

CREATE TABLE Collection_track ( 
collection_track_id INT PRIMARY KEY,
track_id INT REFERENCES Track(track_id),
collection_id INT REFERENCES Collection(collection_id),
constraint pk primary key (track_id, collection_id)
);
