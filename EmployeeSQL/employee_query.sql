-- 1. List the following details of each employee: 
-- employee number, last name, first name, gender, and salary

-- Perform a LEFT JOIN of employees and salaries table
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

-- 2. List employees who were hired in 1986.

CREATE VIEW employees_eightysix AS
     SELECT first_name, last_name
     FROM employees
     WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
	 
SELECT * FROM employees_eightysix

-- 3. List of manager of each department with the following information: 
-- department number, department name, employee number, last name, first name and start & end employment dates

CREATE VIEW deptmgr_info AS
SELECT dm.dept_no
     ,d.dept_name
     ,dm.emp_no
     ,e.last_name
     ,e.first_name
     ,e.hire_date
     ,dm.to_date

FROM dept_manager AS dm 
JOIN departments AS d 
ON (dm.dept_no = d.dept_no)

     JOIN employees as e
     ON (dm.emp_no = e.emp_no)

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

CREATE VIEW dept_emp_info AS
SELECT e.emp_no
     ,e.last_name
     ,e.first_name
     ,d.dept_name

FROM dept_emp AS de 
JOIN departments AS d 
ON (de.dept_no = d.dept_no)

     JOIN employees as e
     ON (de.emp_no = e.emp_no)

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND left(last_name,1) = 'B'

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT * FROM dept_emp_info
WHERE dept_name = 'Sales';
-- (dept_emp_info View created in question #4)

-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

SELECT * FROM dept_emp_info
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC