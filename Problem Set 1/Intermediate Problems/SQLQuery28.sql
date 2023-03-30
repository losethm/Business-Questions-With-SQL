/*
We're continuing on the question above on high freight charges. Now,
instead of using all the orders we have, we only want to see orders from
the year 1996.
*/
SELECT 
  TOP 3 ShipCountry, 
  AVG(Freight) FreightAVG 
FROM 
  Orders
WHERE 
  YEAR(OrderDate) = 1996
GROUP BY 
  ShipCountry 
ORDER BY 
  AVG(Freight) DESC;


