CREATE DATABASE ASSIGNMENT_3
USE ASSIGNMENT_3

-- Question 1:

CREATE TABLE Movie (
    movieID                 INT                     PRIMARY KEY IDENTITY(1,1),
    movie_name              VARCHAR(255),
    duration                FLOAT                   CHECK (duration >= 1),
    genre                   INT                     CHECK (genre >= 1 AND genre <= 8),
    director                VARCHAR(255)            NOT NULL,
    amount_of_money         FLOAT                   NOT NULL,
    comments                VARCHAR(255)
)

CREATE TABLE Actor (
    actorID                 INT                     PRIMARY KEY IDENTITY(1,1),
    actor_name              VARCHAR(255),
    age                     INT                     NOT NULL,
    average_movie_salary    FLOAT                   NOT NULL,
    nationality             VARCHAR(255)            NOT NULL
)

CREATE TABLE ActedIn (
    movieID                 INT                     FOREIGN KEY REFERENCES Movie(movieID),
    actorID                 INT                     FOREIGN KEY REFERENCES Actor(actorID),
                                                    PRIMARY KEY (movieID, actorID)
)

--=====================================================
-- Question 2:

-- a.
ALTER TABLE Movie ADD ImageLink VARCHAR(255) UNIQUE

-- b.
INSERT INTO Movie(movie_name, duration, genre, director, amount_of_money, comments, ImageLink) 
VALUES  ('Star War1', 2,   1, 'Dinh Nam', 1000, 'i have not watched yet', 'this is the link of movie image1'),
        ('Star War2', 1,   2, 'Dinh Nam', 1023, 'i have not watched yet', 'this is the link of movie image2'),
        ('Star War3', 2.5, 5, 'Dinh Nam', 1045, 'i have not watched yet', 'this is the link of movie image3'),
        ('Star War4', 3,   7, 'Dinh Nam', 1067, 'i have not watched yet', 'this is the link of movie image4'),
        ('Star War5', 1.2, 4, 'Dinh Nam', 1078, 'i have not watched yet', 'this is the link of movie image5')

INSERT INTO Actor(actor_name, age, average_movie_salary, nationality)
VALUES  ('Tom Cruse1', 33, 2900, 'England'),
        ('Tom Cruse2', 24, 2800, 'England'),
        ('Tom Cruse3', 56, 2700, 'England'),
        ('Tom Cruse4', 37, 2400, 'England'),
        ('Tom Cruse5', 68, 2200, 'England')

INSERT INTO ActedIn(movieID, actorID)
VALUES  (1, 3),
        (1, 2),
        (1, 4),
        (5, 1),
        (4, 2),
        (3, 3),
        (2, 4),
        (1, 5)

UPDATE Actor
SET actor_name = 'Tom Cruse6'
WHERE actor_name = 'Tom Cruse3'

--===================================================
-- Question 3:

-- c.
SELECT * FROM Actor WHERE (age < 50)

-- d.
SELECT actor_name, average_movie_salary 
FROM Actor 
ORDER BY average_movie_salary DESC

-- e.
SELECT movie_name 
FROM (ActedIn AS ai JOIN Actor AS a ON ai.actorID = a.actorID) JOIN Movie AS m ON ai.movieID = m.movieID 
WHERE actor_name = 'Tom Cruse1'

-- f.
SELECT movie_name 
FROM Movie 
WHERE movieID = (
    SELECT m.movieID 
    FROM Movie as m JOIN ActedIn as ai ON m.movieID = ai.movieID 
    WHERE (genre >= 1)
    GROUP BY m.movieID
    HAVING COUNT(actorID) > 3
)