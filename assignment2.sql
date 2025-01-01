-- task 1  Which five employees are the highest-paid employees in the company?
-- Make sure that you pay attention to your GROUP BY clause and that your results do not include duplicate employees who have been promoted or received raises.
-- Your results should show the following columns:
-- ● Employee number
-- ● First Name
-- ● Last Name
-- ● Highest Salary
use employees;
SELECT employees.emp_no AS Employee_number,first_name AS First_name, last_name  AS Lastirst_name,max(salary) AS Highest_Salary
FROM employees.employees
JOIN salaries
ON  employees.emp_no = salaries.emp_no
GROUP BY employees.emp_no
ORDER BY max(salary)DESC
LIMIT 5;


-- Task 2 (20 points): Which department has the fewest employees? Your results should show the following columns:
-- ● Department name
-- ● Count of employees in a given department 

use employees;
SELECT departments.dept_name AS Department_name,
COUNT(dept_emp.dept_no) AS countEmployees
FROM employees.departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
GROUP BY  Department_name
ORDER BY countEmployees DESC;

-- Task 3 (20 points): Show all employees who are at the 'Senior' level. In other words, find all employees who have the word “senior” in their title(s). Your results should show the following columns:
-- ● Employee number 
-- ● First name
-- ● Last name
-- ● Title
use employees;
SELECT titles.emp_no as Employee_number ,titles.title as Title,
employees.first_name as First_name,employees.last_name as Last_name
FROM employees JOIN titles
ON employees.emp_no = titles.emp_no 
WHERE titles.title LIKE '%Senior%';

-- Task 4 (20 points): Which department has the highest-paid employees? Your results should show the following columns:
-- ● Department name
-- ● Highest maximum salary
-- ● Highest average salary
use employees;
SELECT dept_name as Department_name, max(salary) as Highest_maximum_salary, avg(salary) as Highest_average_salary 
FROM departments 
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN salaries ON employees.emp_no = salaries.emp_no
GROUP BY dept_name
ORDER BY max(salary) DESC;

-- Task 5 (20 points): What is the average salary for Senior Engineers? Your results should show the following columns: 
-- ● Title
-- ● Average salary 

use employees;
SELECT AVG(salary) AS averageSalary,
titles.title AS Title
FROM employees.salaries JOIN titles
ON salaries.emp_no = titles.emp_no 
WHERE titles.title LIKE 'Senior Engineer'
GROUP BY title;
