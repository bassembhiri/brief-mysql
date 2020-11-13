
/* crééer la base donnée */
CREATE DATABASE netflix;
USE netflix;
/* crééer la table netfix_titles */
CREATE TABLE netflix_titles( 
  show_id INT NOT NULL,
  type VARCHAR(10),
  title VARCHAR(110),
  director VARCHAR(210),
  cast VARCHAR(780),
  country VARCHAR(130),
  date_added VARCHAR(20),
  release_year INT NOT NULL,
  rating VARCHAR(10),
  duration VARCHAR(10),
  listed_in VARCHAR(80),
  description VARCHAR(280),
  PRIMARY KEY(show_id)
  );

  LOAD DATA LOCAL INFILE 'netflix_titles.csv'
INTO TABLE netflix_titles 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


/* crééer la table netfix_shows */
CREATE TABLE netflix_shows (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(64),
    rating VARCHAR(9),
    ratingLevel VARCHAR(126),
    ratingDescription INT NOT NULL,
    release year INT NOT NULL,
    user rating score VARCHAR(4),
    user rating size INT NOT NULL,
    PRIMARY KEY(id)
);

LOAD DATA LOCAL INFILE 'Netflix\ Shows.csv' 
INTO TABLE netflix_shows
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r'
IGNORE 1 LINES(title, rating, ratingLevel, ratingDescription,release year, user rating score, user rating size);

/* Q6 */
SELECT title FROM netflix_titles WHERE (type="Movie" AND show_id<80000000);

/* Q7 */
SELECT duration FROM netflix_title WHERE type='TV Show';

/* Q9 */
SELECT distinct t.title
FROM netflix_titles as t
INNER JOIN netflix_shows as s
ON t.title = s.title;

/* Q10 */

SELECT sum( CAST(SUBSTR(duration, 1,3) AS INT))  from netflix_titles WHERE type = 'Movie';

/* Q11 */
SELECT COUNT(ratingLevel) FROM netflix.netflix_shows WHERE ratingLevel <> ''


/* Q12 */
SELECT COUNT(DISTINCT netflix_titles.title)
FROM netflix_titles 
INNER JOIN netflix_shows 
ON netflix_titles.title = netflix_shows.title
WHERE netflix_shows.release_year > 2016 AND netflix_titles.release_year > 2016;

/* Q13 */
ALTER TABLE netflix_shows DROP COLUMN rating;

/* Q14 */
ALTER TABLE netflix_shows ADD id INT NOT NULL AUTO_INCREMENT primary key first
DELETE FROM netflix_shows ORDER BY id DESC LIMIT 100;