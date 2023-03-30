/*
At the end of the month, salespeople are likely to try much harder to get
orders, to meet their month-end quotas. Show all orders made on the last
day of the month. Order by EmployeeID and OrderID
*/
SELECT 
  EmployeeID, 
  OrderID, 
  OrderDate 
FROM 
  Orders 
WHERE 
  DAY(OrderDate) = DAY(
    EOMONTH(OrderDate)
  ) 
ORDER BY 
  EmployeeID, 
  OrderDate
