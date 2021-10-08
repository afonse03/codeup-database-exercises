USE codeup_test_db;

# write SELECT statements for: albums released after 1991, albums with the genre 'disco', albums by 'Whitney Houston'

SELECT * FROM albums;

SELECT 'Albums released after 1991';
SELECT * FROM albums WHERE release_date > 1991;

SELECT 'Albums with Disco as genre';
SELECT * FROM albums WHERE genre = 'Disco';

SELECT 'Albums by Whitney Houston';
SELECT * FROM albums WHERE artist = 'Whitney Houston'