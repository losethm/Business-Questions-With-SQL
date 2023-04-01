/*
Find the total number of inspections with low risk in 2017.

Table: los_angeles_restaurant_health_inspections
*/
-- Select the count of all rows from the table los_angeles_restaurant_health_inspections
-- where the activity date year is 2017 and the pe_description contains the phrase 'LOW RISK'.
SELECT 
  COUNT(*) AS total_low_risk_inspections -- Rename the resulting count to total_low_risk_inspections.
FROM 
  los_angeles_restaurant_health_inspections 
WHERE 
  YEAR(activity_date) = 2017 -- Filter by the year of activity_date being 2017.
  AND pe_description LIKE '%LOW RISK' -- Filter by pe_description containing the phrase 'LOW RISK'.
