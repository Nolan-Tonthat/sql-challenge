DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp; 
DROP TABLE IF EXISTS dept_manager; 
DROP TABLE IF EXISTS employees; 
DROP TABLE IF EXISTS salaries; 
DROP TABLE IF EXISTS titles; 

--creates departments, dept_emps, dept_manager, employees, salaries, and titles tables
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE dept_emps(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	foreign key (emp_no) references employees(emp_no)
);

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR
);

SELECT * from departments;
SELECT * from dept_emps;
SELECT * from dept_managers;
SELECT * from employees;
SELECT * from salaries;
SELECT * from titles;
