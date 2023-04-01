/*
Find the most common grade earned by bakeries.

Table: los_angeles_restaurant_health_inspections
*/
SELECT 
  grade 
FROM 
  los_angeles_restaurant_health_inspections 
GROUP BY 
  grade 
ORDER BY 
  COUNT(grade) DESC 
LIMIT 
  1;
