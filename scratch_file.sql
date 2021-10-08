USE movies;

# SELECT title, person_name, budget FROM movies m JOIN movie_cast mc ON m.movie_id = mc.movie_id JOIN person p ON mc.person_id = p.person_id WHERE person_name = 'Mark Hamill' OR person_name = 'Harrison Ford' ORDER BY budget DESC;

SHOW DATABASES;

SHOW TABLES;