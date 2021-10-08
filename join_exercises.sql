USE employees;

#1: write query that shows each department along with the name of the current manager for that department
    # ---> rephrase the question in terms of the tables and columns in your database

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE to_date >= NOW();
# ORDER BY dept_name; <= you would've needed to add this if the output was out of order from the solution on the curriculum


#2: find the name of all departments currently managed by women

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE to_date >= NOW()
AND e.gender = 'F';

#3: find the current titles of employees currently working in the Customer Service department
    # ---> start by getting all the titles for everyone in Customer Service;
    # next, clump the titles together (i can use GROUP BY or i can use SELECT DISTINCT but if I use DISTINCT i won't be able to use COUNT later on)
    # now i get the count
    # now limit it to current title holders

SELECT title, COUNT(t.emp_no) AS 'Total Employees' FROM titles t
JOIN dept_emp de
ON t.emp_no = de.emp_no
WHERE dept_no = 'd009'
AND t.to_date >= NOW()
AND de.to_date >= NOW()
GROUP BY title;

#4: find the current salary of all current managers
# i know I need department names, department manager names, and salaries, so I know I have to join the departments table, the department managers table, and the salaries table. but i notice that the department managers table does not have the manager's names. manager's names are in the employees table. manager's identities, identified by employee number, are in the department managers table. therefore i need to include the employees table in my join chain.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager', s.salary AS 'Salary' FROM departments d
JOIN dept_manager dm
ON dm.emp_no = e.emp_no
JOIN employees e
ON dm.emp_no = d.emp_no
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE s.to_date >= NOW()
ORDER BY dept_name;

SELECT dept_name AS 'Department', CONCAT(first_name, ' ', last_name) AS 'Manager Name', salary AS 'Salary' FROM salaries s
JOIN dept_manager dm
ON s.emp_no = dm.emp_no
JOIN employees e
ON dm.emp_no = e.emp_no
JOIN departments d
ON dm.dept_no = d.dept_no
WHERE s.to_date LIKE '9%'
AND dm.to_date LIKE '9%'
ORDER BY dept_name;


