-- 1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, s.salary
FROM employees AS emp
JOIN salaries AS s ON emp.emp_no = s.emp_no;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date LIKE '%1986';

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    D.dept_no,
    D.dept_name,
    DM.emp_no AS manager_emp_no,
    E.last_name,
    E.first_name
FROM
    Department D
INNER JOIN
    Dept_Manager DM ON D.dept_no = DM.dept_no
INNER JOIN
    Employees E ON DM.emp_no = E.emp_no
ORDER BY
	D.dept_no; --the order by is not part of the requirements but added for better visual results.

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
    E.emp_no,
    E.last_name,
    E.first_name,
    DE.dept_no,
    D.dept_name
FROM
    Employees E
INNER JOIN
    Dept_Employee DE ON E.emp_no = DE.emp_no
INNER JOIN
    Department D ON DE.dept_no = D.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name; --the order by is not part of the requirements but added for better visual results.

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	D.dept_name,
    E.emp_no,
    E.last_name,
    E.first_name
FROM
    Employees E
INNER JOIN
    Dept_Employee DE ON E.emp_no = DE.emp_no
INNER JOIN
    Department D ON DE.dept_no = D.dept_no
WHERE
    D.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    E.emp_no,
    E.last_name,
    E.first_name,
    D.dept_name
FROM
    Employees E
INNER JOIN
    Dept_Employee DE ON E.emp_no = DE.emp_no
INNER JOIN
    Department D ON DE.dept_no = D.dept_no
WHERE
    D.dept_name IN ('Sales', 'Development');

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS name_count
FROM
    Employees
GROUP BY
    last_name
ORDER BY
    name_count DESC, last_name;


