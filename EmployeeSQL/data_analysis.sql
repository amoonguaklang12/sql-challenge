--1. emp_no, last_name, first_name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
	ON e.emp_no = s.emp_no;
	
--2. first_name, last_name, and hire_date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. Manager of each dept showing last_name, and first_name, dept_no, dept_name, and emp_no
SELECT e.last_name, e.first_name, m.dept_no, d.dept_name, m.emp_no
FROM dept_manager m
LEFT JOIN employees e
	ON m.emp_no = e.emp_no
LEFT JOIN departments d
	ON m.dept_no = d.dept_no;
	
--4. emp_no, dept_no, last_name, first_name, dept_name
SELECT de.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d
	ON de.dept_no = d.dept_no
LEFT JOIN employees e
	ON de.emp_no = e.emp_no;
	
--5. first_name, last_name, sex of employees whose first name is Hercules and last name begins with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--6. employee in the Sales deptartment showing emp_no, last_name, first_name
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
LEFT JOIN departments d
	ON de.dept_no = d.dept_no
LEFT JOIN employees e
	ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--7. employee in Sales and Development 
--depts showing emp_no, last_name, first_name, and dept_name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d
	ON de.dept_no = d.dept_no
LEFT JOIN employees e
	ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8. frequency counts in descending order of all employee last names
SELECT last_name, COUNT(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;