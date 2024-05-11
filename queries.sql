
-- Display Queries --

    -- films
    SELECT * FROM films;

    -- film_genre
    SELECT * FROM film_genre;

    -- genre
    SELECT * FROM genre;

    -- fim_director
    SELECT * FROM film_director;

    -- director
    SELECT * FROM director;

    -- budget
    SELECT * FROM budget;

    -- rating
    SELECT * FROM rating;

    -- master display
    SELECT 
        f.film_name AS Film_Name, 
        f.film_release_year AS Release_Year, 
        f.film_runtime AS Film_Runtime, 
        f.film_language AS Film_Language, 
        fg.genre_id AS Film_Genre_ID, 
        g.genre_title AS Genre_Name, 
        b.budget AS Film_Budget, 
        r.rating_imdb AS Film_IMDB_Rating, 
        r.rating_rotten_tomatoes AS Film_Rotten_Tomatoes_Rating, 
        fd.director_id AS Film_Director_ID, 
        CONCAT(d.director_fName, ' ', d.director_lName) AS Film_Director_Name 
    FROM 
        films f 
    INNER JOIN 
        film_genre fg ON f.film_name = fg.film_name -- Joins films and film_genre
    INNER JOIN 
        genre g ON fg.genre_id = g.genre_id -- Joins film_genre and genre
    INNER JOIN 
        budget b ON f.film_name = b.film_name -- Joins films and budget
    INNER JOIN 
        rating r ON f.film_name = r.film_name -- Joins films and rating
    INNER JOIN 
        film_director fd ON f.film_name = fd.film_name -- Joins film and film_director
    INNER JOIN 
        director d ON fd.director_id = d.director_id; -- Joins film_director and director

-- Functions --

    -- Find all movies directed by Michael Bay
    SELECT 
        f.film_name AS Film_Name, 
        f.film_release_year AS Release_Year, 
        CONCAT(d.director_fName, ' ', d.director_lName) AS Director_Name 
    FROM 
        films f
    JOIN
        film_director fd ON f.film_name = fd.film_name -- Joins film on film_director
    JOIN 
        director d ON fd.director_id = d.director_id -- Joins film_director on director
    WHERE
        d.director_fName = 'Michael' AND d.director_lName = 'Bay';

    -- Find all movies made between 2000 and 2010
    SELECT 
        film_name AS Film_Name,
        film_release_year AS Film_Release_Year
    FROM
        films
    WHERE
        film_release_year >= 2000 AND film_release_year <= 2010;

    -- Find all movies with a budget greater than $100 million
    SELECT
        f.film_name AS Film_Name,
        b.budget AS Film_Budget
    FROM 
        films f
    JOIN
        budget b ON f.film_name = b.film_name -- Joins films on budget
    WHERE
        b.budget > 100000000;

    -- Find all movies with an imbd rating of 6.0 or less and a rotten tomatoes rating of 60 or less
    SELECT
        f.film_name AS Film_Name,
        r.rating_imdb AS IMDB_Rating,
        r.rating_rotten_tomatoes AS Rotten_Tomatoes_Rating
    FROM
        films f
    JOIN
        rating r ON f.film_name = r.film_name -- Joins films on rating
    WHERE
        r.rating_imdb <= 6.0 AND r.rating_rotten_tomatoes <= 60;

    -- Find all movies in the action genre
    SELECT
        f.film_name AS Film_Name,
        g.genre_title AS Genre_Name
    FROM
        films f
    JOIN
        film_genre fg ON f.film_name = fg.film_name -- Joins films on film_genre
    JOIN 
        genre g ON fg.genre_id = g.genre_id -- Joins film_genre on genre
    WHERE
        g.genre_title = 'Action';

-- Insert Data --

    -- Insert Movie: Barbie
    INSERT INTO films (film_name, film_release_year, film_runtime, film_language)
    VALUES ('Barbie', 2023, 114, 'English');

    INSERT INTO film_genre (film_name, genre_id) 
    VALUES ('Barbie', 3);

    INSERT INTO director (director_id, director_fName, director_Lname)
    VALUES (83, 'Greta', 'Gerwig');

    INSERT INTO film_director (director_id, film_name)
    VALUES (83, 'Barbie');

    INSERT INTO budget (film_name, budget) 
    VALUES ('Barbie', 145000000);

    INSERT INTO rating (film_name, rating_imdb, rating_rotten_tomatoes)
    VALUES ('Barbie', 6.8, 88);
