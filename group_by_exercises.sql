USE employees;

SHOW tables;

#2
SELECT DISTINCT title FROM titles;
# select * from titles;

#3 the output for me is out of order
SELECT last_name FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
GROUP BY last_name;

#4
SELECT DISTINCT first_name, last_name FROM employees
WHERE last_name LIKE 'E%e';

#5
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#6
SELECT COUNT(*)