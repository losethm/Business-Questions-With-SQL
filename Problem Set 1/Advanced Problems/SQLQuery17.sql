/*
Andrew Fuller, the VP of sales at Northwind, would like to do a sales
campaign for existing customers. He'd like to categorize customers into
groups, based on how much they ordered in 1996. Then, depending on
which group the customer is in, he will target the customer with
different sales materials.
The customer grouping categories are 0 to 1,000, 1,000 to 5,000, 5,000
to 10,000, and over 10,000.
Order the results by CustomerID.
*/
SELECT 
  c.CustomerID, 
  c.CompanyName, 
  SUM(od.Quantity * od.UnitPrice) AS TotalOrderAmount, 
  CASE WHEN SUM(od.Quantity * od.UnitPrice) < 1000 THEN 'Low' WHEN SUM(od.Quantity * od.UnitPrice) < 5000 THEN 'Medium' WHEN SUM(od.Quantity * od.UnitPrice) < 10000 THEN 'High' ELSE 'Very High' END AS CustomerGroup 
FROM 
  Customers c 
  JOIN Orders o ON c.CustomerID = o.CustomerID 
  JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE 
  OrderDate >= '19960101' 
  AND OrderDate <= '19970101' 
GROUP BY 
  c.CustomerID, 
  c.CompanyName 
ORDER BY 
  CustomerID;
