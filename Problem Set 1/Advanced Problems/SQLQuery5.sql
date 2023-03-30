/*
We want to send all of our high-value customers a special VIP gift.
We're defining high-value customers as those who've made at least 1
order with a total value (not including the discount) equal to $10,000 or
more. We only want to consider orders made in the year 1998.
*/
SELECT 
  c.CustomerID, 
  c.CompanyName, 
  o.OrderID, 
  SUM(od.Quantity * od.UnitPrice) AS TotalOrderAmount 
FROM 
  Customers c 
  JOIN Orders o ON c.CustomerID = o.CustomerID 
  JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE 
  YEAR(o.OrderDate) = 1998 
GROUP BY 
  c.CustomerID, 
  c.CompanyName, 
  o.OrderID 
HAVING 
  SUM(od.Quantity * od.UnitPrice) >= 10000 
ORDER BY 
  TotalOrderAmount DESC;
