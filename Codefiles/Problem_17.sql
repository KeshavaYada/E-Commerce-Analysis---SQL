/*
17. Top 5 Customers by Orders in Each State
Identify the top 5 customers with the highest number of orders for each state.
Challenge: Include the number of orders and total sales for each customer.
*/

SELECT * FROM 
(SELECT 
	c.state,
	CONCAT(c.f_name, ' ', c.l_name) as customers,
	COUNT(o.order_id) as total_orders,
	SUM(total_sale) as total_sale,
	DENSE_RANK() OVER(PARTITION BY c.state ORDER BY COUNT(o.order_id) DESC) as rank
FROM orders as o
JOIN 
order_items as oi
ON oi.order_id = o.order_id
JOIN 
customers as c
ON 
c.customer_id = o.customer_id
GROUP BY c.state, customers
) as t1
WHERE rank <=5
