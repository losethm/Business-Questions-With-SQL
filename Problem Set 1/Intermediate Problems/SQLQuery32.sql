/*
One employee (Margaret Peacock, EmployeeID 4) has placed the most
orders. However, there are some customers who've never placed an order
with her. Show only those customers who have never placed an order
with her
*/
SELECT 
  c.CustomerID, 
  o.CustomerID 
FROM 
  Customers c 
  LEFT JOIN (
    SELECT 
      DISTINCT CustomerID 
    FROM 
      Orders 
    WHERE 
      EmployeeID = 4
  ) o ON c.CustomerID = o.CustomerID 
WHERE 
  o.CustomerID IS NULL;
