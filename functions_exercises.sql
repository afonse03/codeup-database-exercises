# Functions Exercise

USE employees;

#2
SELECT CONCAT(first_name, ' ', last_name) FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;

#3
SELECT * FROM employees
WHERE MONTH(birth_date) = '12' AND DAY(birth_date) = '25';

#4
SELECT * FROM employees
WHERE MONTH(birth_date) = '12'
  AND DAY(birth_date) = '25'
  AND YEAR(hire_date) BETWEEN 1990 AND 1999;

#5
SELECT * FROM employees
WHERE MONTH(birth_date) = '12'
  AND DAY(birth_date) = '25'
  AND YEAR(hire_date) BETWEEN 1990 AND 1999
  ORDER BY hire_date DESC;

#6
SELECT DATEDIFF(CURDATE(), hire_date) AS 'Days worked', first_name, last_name, hire_date FROM employees
WHERE MONTH(birth_date) = '12'
  AND DAY(birth_date) = '25'
  AND YEAR(hire_date) BETWEEN 1990 AND 1999;