/* 
Janet Leverling, one of the salespeople, has come to you with a request.
She thinks that she accidentally double-entered a line item on an order,
with a different ProductID, but the same quantity. She remembers that
the quantity was 60 or more. Show all the OrderIDs with line items that
match this, in order of OrderID.
*/
SELECT 
  OrderID 
FROM 
  [Order Details] 
WHERE 
  Quantity >= 60 
GROUP BY 
  OrderID, 
  Quantity 
HAVING 
  COUNT(*) > 1;
/*
  Based on the previous question, we now want to show details of the
order, for orders that match the above criteria.
*/
WITH PossibleDuplicates AS (
  SELECT 
    OrderID 
  FROM 
    [Order Details] 
  WHERE 
    Quantity >= 60 
  GROUP BY 
    OrderID, 
    Quantity 
  HAVING 
    COUNT(*) > 1
) 
SELECT 
  OrderID, 
  ProductID, 
  UnitPrice, 
  Quantity, 
  Discount 
FROM 
  [Order Details] 
WHERE 
  OrderID IN (
    SELECT 
      OrderID 
    FROM 
      PossibleDuplicates
  ) 
ORDER BY 
  OrderID, 
  Quantity
