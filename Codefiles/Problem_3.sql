/*
3. Average Order Value (AOV)
Compute the average order value for each customer.
Challenge: Include only customers with more than 5 orders.
*/

SELECT cu.customer_id,CONCAT(cu.f_name, ' ',  cu.l_name) as full_name,
	SUM(total_sale)/COUNT(od.order_id) as AOV,
	COUNT(od.order_id) as total_orders 
FROM orders as od
JOIN 
customers as cu
ON cu.customer_id = od.customer_id
JOIN 
order_items as oi
ON oi.order_id = od.order_id
GROUP BY cu.customer_id,full_name
HAVING  COUNT(od.order_id) > 5
