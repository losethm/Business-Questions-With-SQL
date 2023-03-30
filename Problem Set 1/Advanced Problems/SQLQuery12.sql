/*
Some customers are complaining about their orders arriving late. Which
orders are late?
*/
SELECT 
  OrderID, 
  OrderDate, 
  RequiredDate, 
  ShippedDate 
FROM 
  Orders 
WHERE 
  RequiredDate <= ShippedDate;
