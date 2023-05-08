
--#1: List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW no_1 AS(
	SELECT e.emp_no, e.last_name, e.first_name, e.sex,s.salary
	FROM employees AS e
	INNER JOIN salaries AS s
	ON e.emp_no = s.emp_no
	ORDER BY e.emp_no
)
SELECT * FROM no_1;


--#2: List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW no_2 AS (
	SELECT e.first_name, e.last_name, e.hire_date
	FROM employees AS e
	WHERE DATE_PART('year', hire_date) = 1986;
)
SELECT * FROM no_2;


--#3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW no_3 AS (
	SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, dp.dept_name
	FROM employees AS e
	INNER JOIN dept_managers AS d
	ON d.emp_no = e.emp_no
	INNER JOIN departments AS dp
	ON d.dept_no = dp.dept_no
)
SELECT * FROM no_3;


--#4: List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW no_4 AS (
	SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, dp.dept_name
	FROM employees AS e
	INNER JOIN dept_emps AS d
	ON e.emp_no = d.emp_no
	INNER JOIN departments AS dp
	ON d.dept_no = dp.dept_no
)
SELECT * FROM no_4;


--#5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW no_5 AS (
	SELECT first_name, last_name, sex
	FROM employees
	WHERE (first_name = 'Hercules' AND last_name LIKE 'B%')
)
SELECT * FROM no_5;

--#6: List each employee in the Sales department, including their employee number, last name, and first name.
--Option 1: Creating a view because #4 already has a database that has emp_no, last name, and first name of all employees in Sales
CREATE VIEW no_6 AS (
	SELECT emp_no, last_name, first_name, dept_name
	FROM no_4
)
SELECT * FROM no_6 WHERE dept_name = 'Sales';

--Option 2:However, if I wanted to create a brand new table from scratch to answer #6, I could.  
--This code displays the same table as the one above. Not sure which one is more efficient.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emps AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS dp
ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales'


--#7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Option 1: Creating a View
CREATE VIEW no_7 AS(
	SELECT emp_no, last_name, first_name, dept_name
	FROM no_4
)
SELECT * FROM no_7 WHERE dept_name = 'Sales' OR dept_name = 'Development';

--Option 2: Creating a Table
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emps AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS dp
ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development'


--#8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(last_name) AS frequency  
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
