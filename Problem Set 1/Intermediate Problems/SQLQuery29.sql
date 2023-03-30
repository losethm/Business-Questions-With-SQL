/*
We're continuing to work on high freight charges. We now want to get
the three ship countries with the highest average freight charges. But
instead of filtering for a particular year, we want to use the last 12
months of order data, using as the end date the last OrderDate in Orders.
*/
SELECT 
  TOP 3 ShipCountry, 
  AVG(Freight) AS FreightAVG 
FROM 
  Orders 
WHERE 
  OrderDate >= DATEADD(
    month, 
    -12, 
    (
      SELECT 
        MAX(OrderDate) 
      FROM 
        Orders
    )
  ) 
GROUP BY 
  ShipCountry 
ORDER BY 
  FreightAVG DESC
