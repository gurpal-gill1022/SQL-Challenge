-- Data Analysis

-- Review each table to ensure that the data was correctly imported

SELECT * from departments;

SELECT * from dept_emp;

SELECT * from dept_manager;

SELECT * from employees;

SELECT * from salaries;

SELECT * from titles;

-- 1. List the employee number, last name, first name, sex and salary of each employee.

CREATE VIEW employee_info AS
SELECT employees.emp_no AS "Employee No.",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	employees.sex AS "Sex",
	salaries.salary AS "Salary"
FROM employees
JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT * FROM employee_info;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1996.

CREATE VIEW employees_1986 AS
SELECT first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date 1986"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' and '1986-12-31';
ORDER BY hire_date;

SELECT * FROM employees_1986;

-- results show no data.

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

CREATE VIEW department_manager AS
SELECT 	dept_manager.dept_no AS "Department Number",
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"
FROM employees
JOIN dept_manager ON 
employees.emp_no = dept_manager.emp_no
JOIN departments ON
departments.dept_no = dept_manager.dept_no;

SELECT * FROM department_manager;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

CREATE VIEW department_employee AS
SELECT dept_emp.dept_no AS "Department Number",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM employees
JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
JOIN departments ON
dept_emp.dept_no = departments.dept_no;

SELECT * from department_employee;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

CREATE VIEW employee_hercules_b AS
SELECT first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT * from employee_hercules_b

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

CREATE VIEW employee_sales_department AS
SELECT "Department Name" 
	"Employee Number",
	"Last Name",
	"First Name"
FROM department_employee
WHERE "Department Name" = 'Sales';

SELECT * FROM employee_sales_department;

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW employees_sales_development_department AS
SELECT "Department Name",
	"Employee Number",
	"Last Name",
	"First Name"
FROM department_employee
WHERE "Department Name" = 'Sales' OR "Department Name" = 'Development';

SELECT * FROM employees_sales_development_department;

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

CREATE VIEW employee_frequency_last_names AS
SELECT last_name AS "Last Name",
	COUNT(last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;

SELECT * FROM employee_frequency_last_names;

-- Download all available tables as CSV Files and store them in a folder named 'Analyzed Data'.


	