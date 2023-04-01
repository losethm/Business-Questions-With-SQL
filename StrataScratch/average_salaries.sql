/*
Output the department, first name, and salary of employees along with the average salary of that department.
Tables:
Employee
*/
SELECT
    e.first_name,
    e.department,
    e.salary,
    avg_sal.department_avg
FROM employee e
JOIN (SELECT 
    department,
    AVG(salary) AS department_avg
FROM employee
GROUP BY department) avg_sal ON e.department = avg_sal.department
