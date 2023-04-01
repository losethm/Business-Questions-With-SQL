-- Query that calculates the difference between the highest salaries found in the marketing and engineering departments
-- Tables: db_employee, db_dept

-- First, calculate the highest salary in the Engineering department and store it in a Common Table Expression (CTE) called max_eng
WITH max_eng AS (
  SELECT 
    MAX(salary) AS max_eng 
  FROM 
    db_employee e 
    JOIN db_dept d ON e.department_id = d.id 
  WHERE 
    department = 'Engineering'
), 

-- Next, calculate the highest salary in the Marketing department and store it in a CTE called max_marketing
max_marketing AS (
  SELECT 
    MAX(salary) AS max_marketing 
  FROM 
    db_employee e 
    JOIN db_dept d ON e.department_id = d.id 
  WHERE 
    department = 'Marketing'
) 

-- Finally, calculate the absolute difference between the two maximum salaries and output it as salary_difference
SELECT 
  ABS(
    (
      SELECT 
        * 
      FROM 
        max_marketing -- Subquery that selects the maximum salary in the Marketing department from the max_marketing CTE
    ) - (
      SELECT 
        * 
      FROM 
        max_eng -- Subquery that selects the maximum salary in the Engineering department from the max_eng CTE
    )
  ) AS salary_difference;
