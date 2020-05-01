-- Drop table if exists

DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Creating tables for Pewlett-Hackard employee database

CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL
     ,dept_name VARCHAR(40) NOT NULL
);
CREATE TABLE dept_emp (
     emp_no INT NOT NULL
     ,dept_no VARCHAR(4) 
     ,from_date DATE 
     ,to_date DATE 
);
CREATE TABLE dept_manager (
     dept_no VARCHAR(4)
     ,emp_no INT
     ,from_date DATE 
     ,to_date DATE 
);
CREATE TABLE employees (
     emp_no INT PRIMARY KEY
     ,birth_date DATE 
     ,first_name VARCHAR
     ,last_name VARCHAR
     ,gender VARCHAR(1)
     ,hire_date DATE 
);
CREATE TABLE salaries (
     emp_no INT NOT NULL
     ,salary INT
     ,from_date DATE 
     ,to_date DATE 
);
CREATE TABLE titles (
     emp_no INT NOT NULL
     ,title VARCHAR
     ,from_date DATE 
     ,to_date DATE 
);

-- Import data from departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv & titles.csv
-- View the table to ensure all data has been imported correctly

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Perform a LEFT JOIN to list the following details of each employee: 
-- employee number, last name, first name, gender, and salary

CREATE VIEW detailed_salary_list AS
     SELECT employees.emp_no
          ,employees.last_name
          ,employees.first_name
          ,employees.gender
          ,salaries.salary

     FROM salaries
     LEFT JOIN employees ON
     employees.emp_no = salaries.emp_no

SELECT * FROM detailed_salary_list

-- Query employees who were hired in 1986.

CREATE VIEW employees_eightysix AS
     SELECT first_name, last_name
     FROM employees
     WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	 
SELECT * FROM employees_eightysix

-- List of manager of each department with the following information: 
-- department number, department name, employee number, last name, first name and start & end employment dates



