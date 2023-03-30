/*
Andrew, the VP of sales, has been doing some more thinking some more
about the problem of late orders. He realizes that just looking at the
number of orders arriving late for each salesperson isn't a good idea. It
needs to be compared against the total number of orders per
salesperson. Return results like the following:

EmployeeID LastName AllOrders LateOrders
----------- -------------------- ----------- -----------
1 Davolio 123 3
2 Fuller 96 4
3 Leverling 127 5
4 Peacock 156 10
6 Suyama 67 3
7 King 72 4
8 Callahan 104 5
9 Dodsworth 43 5

*/
WITH TotalOrders AS (
  SELECT 
    e.EmployeeID, 
    e.LastName, 
    COUNT(e.EmployeeID) AS TotalOrders 
  FROM 
    Employees e 
    JOIN Orders o ON e.EmployeeID = o.EmployeeID 
  GROUP BY 
    e.EmployeeID, 
    e.LastName
), 
LateOrders AS (
  SELECT 
    e.EmployeeID, 
    e.LastName, 
    COUNT(*) AS TotalLateOrders 
  FROM 
    Orders o 
    JOIN Employees e ON o.EmployeeID = e.EmployeeID 
  WHERE 
    RequiredDate <= ShippedDate 
  GROUP BY 
    e.EmployeeID, 
    e.LastName
) 
SELECT 
  tot.EmployeeID, 
  tot.LastName, 
  tot.TotalOrders, 
  lat.TotalLateOrders 
FROM 
  TotalOrders AS tot 
  JOIN LateOrders AS lat ON tot.EmployeeID = lat.EmployeeID;

/*
There's an employee missing in the answer from the problem above. Fix
the SQL to show all employees who have taken orders.
*/
WITH TotalOrders AS (
  SELECT 
    e.EmployeeID, 
    e.LastName, 
    COUNT(e.EmployeeID) AS TotalOrders 
  FROM 
    Employees e 
    JOIN Orders o ON e.EmployeeID = o.EmployeeID 
  GROUP BY 
    e.EmployeeID, 
    e.LastName
), 
LateOrders AS (
  SELECT 
    e.EmployeeID, 
    e.LastName, 
    COUNT(*) AS TotalLateOrders 
  FROM 
    Orders o 
    JOIN Employees e ON o.EmployeeID = e.EmployeeID 
  WHERE 
    RequiredDate <= ShippedDate 
  GROUP BY 
    e.EmployeeID, 
    e.LastName
) 
SELECT
	e.EmployeeID,
	e.LastName,
	tot.TotalOrders,
	lat.TotalLateOrders,
    (CAST(lat.TotalLateOrders AS FLOAT) / tot.TotalOrders) * 100 AS PercentLate
FROM Employees e
JOIN TotalOrders tot ON e.EmployeeID = tot.EmployeeID
JOIN LateOrders lat ON tot.EmployeeID = lat.EmployeeID