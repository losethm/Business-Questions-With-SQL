/*
For this problem, we’d like to see the total number of products in each
category. Sort the results by the total number of products, in descending
order.
*/
SELECT 
  c.CategoryName, 
  COUNT(p.ProductID) AS NumProducts 
FROM 
  Products p 
  JOIN Categories c ON p.CategoryID = c.CategoryID 
GROUP BY 
  c.CategoryName 
ORDER BY 
  NumProducts DESC;
