USE employees;

#1: find all the employees with the same hire date as employee 101010 using a subquery.

SELECT emp_no, hire_date
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
    );

#2: find all the titles held by all employees with the first name Aamod....

SELECT title
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
    );

#3: find all the current department managers that are female
SELECT first_name, last_name FROM employees
WHERE gender = 'F'
AND emp_no
IN (SELECT emp_no FROM dept_manager WHERE to_date > NOW());