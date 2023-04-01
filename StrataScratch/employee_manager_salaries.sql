/*
Find employees who are earning more than their managers.
Output the employee's first name along with the corresponding salary.

Table: employee
*/
SELECT 
  e.first_name, 
  -- Select the employee's first name from the employee table.
  e.salary -- Select the employee's salary from the employee table.
FROM 
  employee e 
  JOIN employee m ON e.manager_id = m.id -- Join the employee table to itself on the manager_id and id fields.
WHERE 
  e.salary > m.salary -- Filter the results to only show employees who earn more than their managers.
