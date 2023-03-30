/*
A salesperson for Northwind is going on a business trip to visit
customers, and would like to see a list of all customers, sorted by
region, alphabetically.
However, he wants the customers with no region (null in the Region
field) to be at the end, instead of at the top, where you’d normally find
the null values. Within the same region, companies should be sorted by
CustomerID.
*/
SELECT 
  Region, 
  CustomerID, 
  ContactName 
FROM 
  Customers 
ORDER BY 
  COALESCE(Region, 'zzzzzz') ASC, 
  CustomerID
