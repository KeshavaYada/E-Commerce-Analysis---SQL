/*
5. Customers with No Purchases
Find customers who have registered but never placed an order.
*/
-- Method 1
SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT 
					DISTINCT customer_id
				FROM orders
				);
-- Method 2

SELECT *
FROM customers as c
LEFT JOIN
orders as o
ON o.customer_id = c.customer_id
WHERE o.customer_id IS NULL