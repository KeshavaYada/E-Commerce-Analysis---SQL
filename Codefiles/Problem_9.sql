/*
9. Shipping Delays
Identify orders where the shipping date is later than 3 days after the order date.
Challenge: Include customer, order details, and delivery provider.
*/


SELECT 
	cu.*,
	od.*,
	s.shipping_providers,
s.shipping_date - od.order_date as days_took_to_ship
FROM orders as od
JOIN
customers as cu
ON cu.customer_id = od.customer_id
JOIN 
shipping as s
ON od.order_id = s.order_id
WHERE s.shipping_date - od.order_date > 3
