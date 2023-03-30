/*
The Northwind mobile app developers would now like to just get a
random assortment of orders for beta testing on their app. Show a
random set of 2% of all orders.
*/
SELECT TOP 2 PERCENT *
FROM Orders
ORDER BY newid()