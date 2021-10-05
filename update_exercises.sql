USE codeup_test_db;


SELECT 'Selecting all albums';
SELECT * FROM albums;
UPDATE albums SET sales = (sales * 10);
SELECT * FROM albums;