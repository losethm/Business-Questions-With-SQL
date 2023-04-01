/*
Count the number of unique facilities per municipality zip code along with the number of inspections. Output the result along with the number of inspections per each municipality zip code. Sort the result based on the number of inspections in descending order.

Table: los_angeles_restaurant_health_inspections
*/
select 
  facility_zip, 
  COUNT(DISTINCT facility_id) AS num_unique_facilities, 
  COUNT(*) 
from 
  los_angeles_restaurant_health_inspections 
GROUP BY 
  facility_zip 
ORDER BY 
  COUNT(*) DESC;
