-- Query the data to list:
-- 1. employee data - employee number, last name, first name, gender, and salary	
SELECT "Employees".employee_number, "Employees".employee_first_name, "Employees".employee_last_name, "Employees".employee_gender, "Salaries".employee_salary
FROM "Employees" 
INNER JOIN "Salaries"  
ON "Employees".employee_number = "Salaries".employee_number;


-- 2. employees who were hired in 1986.
SELECT *
FROM "Employees"
WHERE employee_hire_date >= '1986-01-01' AND employee_hire_date <= '1986-12-31';

-- 3. the manager of each department with the following information: department_number, department_name, the manager's employee number, last name, first name, and start and end employment dates
SELECT m.employee_number, m.department_number, m.mgrdept_from_date, m.mgrdept_to_date, d.department_name, e.employee_number, e.employee_last_name, e.employee_first_name 
FROM "Departments" as d, "ManagersDepartment" as m, "Employees" as e 
WHERE d.department_number = m.department_number
AND m.employee_number = e.employee_number; 

-- 4. the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.employee_number, e.employee_last_name, e.employee_first_name, d.department_name 
FROM "Departments" as d, "EmployeesDepartment" as ed, "Employees" as e 
WHERE d.department_number = ed.department_number
AND ed.employee_number = e.employee_number; 

-- 5. all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM "Employees"
WHERE employee_first_name = 'Hercules' AND employee_last_name LIKE 'B%';

-- 6. all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.employee_number, e.employee_last_name, e.employee_first_name, d.department_name 
FROM "Departments" as d, "EmployeesDepartment" as ed, "Employees" as e 
WHERE d.department_number = ed.department_number
AND ed.employee_number = e.employee_number
AND d.department_name = 'Sales'; 

-- 7. all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.employee_number, e.employee_last_name, e.employee_first_name, d.department_name 
FROM "Departments" as d, "EmployeesDepartment" as ed, "Employees" as e 
WHERE d.department_number = ed.department_number
AND ed.employee_number = e.employee_number
AND d.department_name IN('Sales', 'Development');

-- 8. in descending order, the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employee_last_name, count(*)
FROM "Employees"
GROUP BY employee_last_name
ORDER BY count DESC;