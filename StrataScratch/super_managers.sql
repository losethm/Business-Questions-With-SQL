/*
Find managers with at least 7 direct reporting employees.
In situations where a user is reporting to himself/herself, count that also.
Output first names of managers.

Table: employee
*/
SELECT 
  m.first_name AS ManagerName -- Select the manager's first name from the employee table and rename it to ManagerName.
FROM 
  employee m 
  JOIN employee e ON m.id = e.manager_id -- Join the employee table to itself on the manager_id and id fields.
GROUP BY 
  m.id, 
  m.first_name -- Group the results by manager ID and first name.
HAVING 
  COUNT(*) >= 7 -- Filter the results to only show managers with at least 7 direct reports.
ORDER BY 
  COUNT(*) -- Order the results by the count of direct reports.
