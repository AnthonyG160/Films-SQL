CREATE TABLE films (
    film_name           VARCHAR(50) PRIMARY KEY,
    film_release_year   NUMERIC(4) NOT NULL,
    film_runtime        INTEGER,
    film_language       VARCHAR(50)
);

CREATE TABLE genre (
    genre_id                NUMERIC(4) NOT NULL PRIMARY KEY,
    genre_title             VARCHAR(50) NOT NULL
);

CREATE TABLE film_genre (
    film_name               VARCHAR(50) NOT NULL,
		FOREIGN KEY (film_name)
			REFERENCES films (film_name)
			ON DELETE CASCADE ON UPDATE CASCADE,
    genre_id                NUMERIC(4) NOT NULL,
		FOREIGN KEY (genre_id)
			REFERENCES genre (genre_id)
			ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE director (
    director_id             NUMERIC(4) PRIMARY KEY,
    director_fName          VARCHAR(50) NOT NULL,
    director_lName          VARCHAR(50) NOT NULL
);

CREATE TABLE film_director (
    director_id             NUMERIC(4) NOT NULL,
		FOREIGN KEY (director_id)
		REFERENCES director (director_id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    film_name               VARCHAR(50) NOT NULL,
		FOREIGN KEY (film_name)
		REFERENCES films (film_name)
		ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE budget (
    film_name               VARCHAR(50) NOT NULL,
		FOREIGN KEY (film_name)
		REFERENCES films (film_name)
		ON DELETE CASCADE ON UPDATE CASCADE,
    budget                  NUMERIC(10)
);
    
CREATE TABLE rating (
    film_name               VARCHAR(50) NOT NULL,
		FOREIGN KEY (film_name)
		REFERENCES films (film_name)
		ON DELETE CASCADE ON UPDATE CASCADE,
    rating_imdb             DECIMAL(5,1),
    rating_rotten_tomatoes  NUMERIC(2)
);