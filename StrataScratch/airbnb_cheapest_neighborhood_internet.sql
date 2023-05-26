select 
  neighbourhood 
from 
  airbnb_search_details 
where 
  property_type = 'Villa' 
  AND bed_type = 'Real Bed' 
  AND amenities like '%Internet%' 
order by 
  price 
limit 
  1
