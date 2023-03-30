/*
The manager has changed his mind. Instead of requiring that customers
have at least one individual orders totaling $10,000 or more, he wants to
define high-value customers as those who have orders totaling $15,000
or more in 1998. How would you change the answer to the problem
above?
*/
SELECT 
  c.CustomerID, 
  c.CompanyName, 
  SUM(od.Quantity * od.UnitPrice) AS TotalOrderAmount 
FROM 
  Customers c 
  JOIN Orders o ON c.CustomerID = o.CustomerID 
  JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE 
  YEAR(o.OrderDate) = 1998 
GROUP BY 
  c.CustomerID, 
  c.CompanyName
HAVING 
  SUM(od.Quantity * od.UnitPrice) >= 15000 
ORDER BY 
  TotalOrderAmount DESC;

/*
Change the above query to use the discount when calculating high-value
customers. Order by the total amount which includes the discount.
*/
SELECT 
  c.CustomerID, 
  c.CompanyName, 
  SUM((od.Quantity * od.UnitPrice) * (1 - od.Discount)) AS TotalOrderAmount 
FROM 
  Customers c 
  JOIN Orders o ON c.CustomerID = o.CustomerID 
  JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE 
  YEAR(o.OrderDate) = 1998 
GROUP BY 
  c.CustomerID, 
  c.CompanyName
HAVING 
  SUM(od.Quantity * od.UnitPrice) >= 15000 
ORDER BY 
  TotalOrderAmount DESC;
