/*
In the Customers table, show the total number of customers per Country
and City.
*/
SELECT 
  Country, 
  City, 
  COUNT(*) AS num_customers 
FROM 
  Customers 
GROUP BY 
  Country, 
  City 
ORDER BY 
  num_customers DESC;
