create SCHEMA IF NOT EXISTS MovieDB;
USE MovieDB;
-- Drop tables if they exist
DROP TABLE IF EXISTS Oscar;
DROP TABLE IF EXISTS Director;
DROP TABLE IF EXISTS Actor;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Person;

-- Create Person table
CREATE TABLE Person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    pob VARCHAR(100)
);

-- Create Movie table
CREATE TABLE Movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    year INT,
    rating DECIMAL(3,1),
    runtime INT, -- in minutes
    genre VARCHAR(50),
    earnings_rank INT
);

-- Create Actor table
CREATE TABLE Actor (
    actor_id INT,
    movie_id INT,
    PRIMARY KEY (actor_id, movie_id),
    FOREIGN KEY (actor_id) REFERENCES Person(id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

-- Create Director table
CREATE TABLE Director (
    director_id INT,
    movie_id INT,
    PRIMARY KEY (director_id, movie_id),
    FOREIGN KEY (director_id) REFERENCES Person(id),
    FOREIGN KEY (movie_id) REFERENCES Movie(id)
);

-- Create Oscar table
CREATE TABLE Oscar (
    movie_id INT,
    person_id INT,
    type ENUM('Best Actor', 'Best Actress', 'Best Director', 'Best Picture'),
    year INT,
    PRIMARY KEY (movie_id, person_id, type, year),
    FOREIGN KEY (movie_id) REFERENCES Movie(id),
    FOREIGN KEY (person_id) REFERENCES Person(id)
);

-- Insert into Person (at least one from Boston, one from California, and James Cameron)
INSERT INTO Person (name, dob, pob) VALUES
('Sam Worthington', '1976-08-02', 'Godalming, Surrey, England'),
('Zoe Saldana', '1978-06-19', 'Passaic, NJ, USA'),
('James Cameron', '1954-08-16', 'Kapuskasing, Ontario, Canada'),
('John Doe', '1980-01-01', 'Boston, MA, USA'),
('Jane Smith', '1990-04-04', 'Los Angeles, California, USA'), -- for Oscar/California query
('Leonardo DiCaprio', '1974-11-11', 'Los Angeles, California, USA');


INSERT INTO Person (name, dob, pob) VALUES ('new guy', '1980-01-01', 'Boston, MA, USA');

-- Insert into Movie (include Avatar and other diverse ratings/runtimes)
INSERT INTO Movie (name, year, rating, runtime, genre, earnings_rank) VALUES
('Avatar', 2009, 7.8, 162, 'Sci-Fi', 1),
('Inception', 2010, 8.8, 148, 'Sci-Fi', 2),
('Titanic', 1997, 7.8, 195, 'Romance', 3),
('Short Film', 2022, 6.5, 90, 'Drama', 10);

-- Actor links (include at least Sam Worthington and Zoe Saldana in Avatar)
INSERT INTO Actor (actor_id, movie_id) VALUES
(1, 1), -- Sam Worthington in Avatar
(2, 1), -- Zoe Saldana in Avatar
(4, 1), -- John Doe in Avatar (Boston guy)
(6, 2); -- Leo in Inception

-- Director links
INSERT INTO Director (director_id, movie_id) VALUES
(3, 1), -- James Cameron directed Avatar
(3, 3), -- James Cameron directed Titanic
(3, 2); -- James Cameron directed Inception (for overlap)

-- Oscar data (for CA-born person and Leo)
INSERT INTO Oscar (movie_id, person_id, type, year) VALUES
(3, 6, 'Best Actor', 1998), -- Leo
(2, 5, 'Best Actress', 2020); -- Jane Smith from California

