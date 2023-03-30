/*
Now we want to get the percentage of late orders over total orders.
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
  (
    CAST(lat.TotalLateOrders AS FLOAT) / tot.TotalOrders
  ) * 100 AS PercentLate 
FROM 
  Employees e 
  JOIN TotalOrders tot ON e.EmployeeID = tot.EmployeeID 
  JOIN LateOrders lat ON tot.EmployeeID = lat.EmployeeID;


  /*So now for the PercentageLateOrders, we get a decimal value like we
should. But to make the output easier to read, let's cut the
PercentLateOrders off at 2 digits to the right of the decimal point.
*/
/*
Now we want to get the percentage of late orders over total orders.
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
  ROUND((
    CAST(lat.TotalLateOrders AS FLOAT) / tot.TotalOrders
  ) * 100, 2) AS PercentLate 
FROM 
  Employees e 
  JOIN TotalOrders tot ON e.EmployeeID = tot.EmployeeID 
  JOIN LateOrders lat ON tot.EmployeeID = lat.EmployeeID
