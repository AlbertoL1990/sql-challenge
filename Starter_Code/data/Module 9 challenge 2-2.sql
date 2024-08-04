-- 1. Retrieve employee number, last name, first name, sex, and salary
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. Retrieve first name, last name, and hire date for employees hired in 1986
SELECT
    e.first_name,
    e.last_name,
    e.hire_date
FROM employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

-- 3. Retrieve department number, department name, and manager details
SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no AS manager_emp_no,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
WHERE e.emp_title_id LIKE 'm%';

-- 4. Create a view for employees and their departments
CREATE VIEW dept_employee_info AS
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_emp de
JOIN employees e ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no;

-- Retrieve employee number, last name, first name, and department name
SELECT
    emp_no,
    last_name,
    first_name,
    dept_name
FROM dept_employee_info;

-- 5. Retrieve first name, last name, and sex for employees named "Hercules" with last names starting with "B"
SELECT
    e.first_name,
    e.last_name,
    e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
  AND e.last_name LIKE 'B%';

-- 6. Create a view for employees with their departments
CREATE VIEW employee_dept_view AS
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM dept_employee_info d;

-- Retrieve employees in the Sales department
SELECT *
FROM employee_dept_view
WHERE dept_name = 'Sales';

-- 7. Retrieve employees in the Sales and Development departments
SELECT *
FROM employee_dept_view
WHERE dept_name IN ('Sales', 'Development');

-- 8. Count occurrences of each last name and order by frequency
SELECT
    e.last_name,
    COUNT(*) AS frequency
FROM employees e
GROUP BY e.last_name
ORDER BY frequency DESC;

select version ();
