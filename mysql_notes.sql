USE employees;
SELECT COUNT(emp_no) FROM salaries;
SELECT COUNT(emp_no) FROM employees;

# SELECT employees.emp_no AS 'Employee #', CONCAT(first_name, ' ', last_name) AS 'Full Name', salary, from_date, to_date FROM employees JOIN salaries
# ON employees.emp_no = salaries.emp_no;

SELECT e.emp_no AS 'Employee #', CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', s.salary, e.from_date, e.to_date FROM employees e JOIN salaries s
ON e.emp_no = s.emp_no; # example of cleaning up the code to include aliases

# left join

# plain join

# inner join

# this is how I installed the join_test_db database

# CREATE DATABASE join_test_db;
#
# USE join_test_db;
#
# CREATE TABLE roles (
#    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#    name VARCHAR(100) NOT NULL,
#    PRIMARY KEY (id)
# );
#
# CREATE TABLE users (
#    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#    name VARCHAR(100) NOT NULL,
#    email VARCHAR(100) NOT NULL,
#    role_id INT UNSIGNED DEFAULT NULL,
#    PRIMARY KEY (id),
#    FOREIGN KEY (role_id) REFERENCES roles (id)
# );
#
# INSERT INTO roles (name) VALUES ('admin');
# INSERT INTO roles (name) VALUES ('author');
# INSERT INTO roles (name) VALUES ('reviewer');
# INSERT INTO roles (name) VALUES ('commenter');
#
# INSERT INTO users (name, email, role_id) VALUES
# ('bob', 'bob@example.com', 1),
# ('joe', 'joe@example.com', 2),
# ('sally', 'sally@example.com', 3),
# ('adam', 'adam@example.com', 3),
# ('jane', 'jane@example.com', null),
# ('mike', 'mike@example.com', null);

SELECT * FROM roles;

SELECT users.name AS 'Users Name', roles.name AS 'Roles' FROM roles JOIN users ON roles.id = users.role_id; # every primary key is called id, and foreign keys are ____???

# Left Join, aka Left Outer Join, shows rows in the left table that have no match in the right table
# If I say 'users LEFT JOIN roles', users is the left table and roles is the right table

# MySQL, go through the users table, find all the role_id values, for each role_id value, go through the roles table and try to find matching id values. When you find a match, retrieve the values of the name columns for me. (So far, that's just the same as a regular join). Also, retrieve any names from the users table (that is, the left table) that have no match in the right table, and display those too.

SELECT users.name AS 'Users Name', roles.name AS 'Roles' FROM users LEFT JOIN roles ON users.role_id = roles.id;

# ====================================

# right join

#MySQL, go through the users table, find all the role_id values, for each role_id value, go through the roles table and try to find matching id values. When you find a match, retrieve the values of the name columns for me. (So far, that's just the same as a regular join). Also, retrieve any names from the users table (that is, the left table) that have no match in the left table, and display those too.

SELECT users.name AS 'Users Name', roles.name AS 'Roles' FROM users RIGHT JOIN roles ON users.role_id = roles.id;

INSERT INTO users (name, email, role_id) VALUES
    ('amanda', 'amanda@example.com', 2),
    ('gilbert', 'gilbert@example.com', 2),
    ('callie', 'callie@example.com', 2),
    ('nugget', 'nugget@example.com', null);

SELECT users.name, roles.name FROM roles JOIN users ON roles.id = users.role_id;

SELECT users.id, users.name, roles.name FROM users JOIN roles ON users.role_id = roles.id;
SELECT users.id, users.name, roles.name FROM users LEFT JOIN roles ON users.role_id = roles.id;
SELECT users.id, users.name, roles.name FROM users RIGHT JOIN roles ON users.role_id = roles.id;

INSERT INTO roles (name) VALUE ('agent');

SELECT * FROM roles;

UPDATE users SET role_id = 5 WHERE name = 'nugget';

SELECT COUNT(*), roles.name FROM users
LEFT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name
ORDER BY COUNT(*);

SELECT roles.name, COUNT(*) FROM roles JOIN users ON roles.id = users.role_id GROUP BY roles.name ORDER BY COUNT(*) DESC;

USE codeup_test_db;

INSERT INTO persons (first_name, album_id) VALUES ('Amanda', 29), ('Gilbert', 27), ('Callie', 15), ('Nugget', 28);

SELECT * FROM persons;

DESCRIBE persons;

# associative table, or junction table -- contains the foreign keys to two tables. We join one table to the junction table and then the junction table to the second table, and that way we get all the tables linked. Examples:

CREATE TABLE preferences (
    person_id INT UNSIGNED NOT NULL
    album_id INT NOT NULL,
    FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

INSERT INTO preferences (person_id, album_id) VALUES (1, 12), (1, 5), (1, 22), (1, 29), (2, 1), (2, 31), (2, 30), (3, 11), (3, 26), (3, 25);

SELECT p.first_name, pref.album_id FROM persons p JOIN preferences pref ON pref.person_id = p.id;

SELECT pref.person_id, a.name FROM preferences pref JOIN albums a ON pref.album_id = a.id;

# this is the:
SELECT p.first_name, a.name FROM persons p JOIN preferences pref ON p.id = pref.person_id JOIN albums a ON pref.album_id = a.id;

# same as:

SELECT persons.first_name, album.name FROM persons JOIN preferences ON person.id = preferences.person_id JOIN albums a ON preferences.album_id = a.id;




CREATE TABLE persons (
     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
     first_name VARCHAR(25) NOT NULL,
     album_id INT UNSIGNED NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (album_id) REFERENCES albums (id)
);





# not sure what notes this is for???
# Hey MySQL, go through the employees table, retrieve the emp_no, and for each emp_no you retrieve from the employees table, search through the salaries table and look for matching emp_no values. When you find a match, retrieve the emp_no from the employees table, the first_name and last_name from the employees table, concatenated, the salary from the salaries table, the from_date from the salaries table, and the to_date from the salaries table and display them to me in one row

