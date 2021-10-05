# MySQL Clauses Exercise

USE employees;

SHOW TABLES;

DESCRIBE employees;

# Part One

# find all employees with first names 'Irena', 'Vidya', or 'Maya'
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

# find all employees whose last name starts with 'E'
SELECT first_name, last_name FROM employees
WHERE last_name LIKE ('E%');

# find all employees with a 'q' in their last name
SELECT first_name, last_name FROM employees
WHERE last_name LIKE ('%q%')

# Part Two

SELECT * FROM employees
WHERE (first_name = 'Irena' OR
       first_name = 'Vidya' OR
       first_name = 'Maya');

SELECT first_name, last_name, gender FROM employees
WHERE (first_name = 'Irena' OR
       first_name = 'Vidya' OR
       first_name = 'Maya') AND
      gender = 'M';

# SELECT * FROM employees
# WHERE last_name LIKE ('%E%');

SELECT * FROM employees
WHERE last_name LIKE '%E' OR last_name LIKE 'E%';


