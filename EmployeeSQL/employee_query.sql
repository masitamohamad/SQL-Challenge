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


-- ALTER table to create new foreign key 
ALTER TABLE dept_manager
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (id);

ALTER TABLE child_table 
ADD CONSTRAINT constraint_name FOREIGN KEY (c1) REFERENCES parent_table (p1);

