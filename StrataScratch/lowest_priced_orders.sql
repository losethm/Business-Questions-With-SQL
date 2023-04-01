/*
Find the lowest order cost of each customer.
Output the customer id along with the first name and the lowest order price.

Tables: customers, orders
*/
SELECT 
  c.id, 
  -- Select the customer ID from the customers table.
  c.first_name, 
  -- Select the customer first name from the customers table.
  MIN(o.total_order_cost) AS lowest_order -- Select the minimum order cost from the orders table, and rename it to lowest_order.
FROM 
  customers c 
  JOIN orders o ON c.id = o.cust_id -- Join the customers and orders table on the customer ID.
GROUP BY 
  c.id, 
  c.first_name -- Group the results by customer ID and first name.
