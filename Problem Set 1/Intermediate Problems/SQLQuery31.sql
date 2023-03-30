/*
There are some customers who have never actually placed an order.
Show these customers.
*/
SELECT 
  c.CustomerID, 
  o.CustomerID 
FROM 
  Orders o FULL 
  OUTER JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE 
  o.CustomerID IS NULL