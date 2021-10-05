USE employees;

SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT emp_no FROM salaries
ORDER BY salary DESC
LIMIT 5;

SELECT emp_no FROM salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 45;

# output for #4 should be:
# 36219
# 254466
# 492164
# 66793
# 492164