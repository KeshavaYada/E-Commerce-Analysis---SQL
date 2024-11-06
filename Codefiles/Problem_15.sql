/*
15. Inactive Sellers
Identify sellers who haven’t made any sales in the last 6 months.
Challenge: Show the last sale date and total sales from those sellers.
*/

WITH cte1
AS
(SELECT * FROM sellers
WHERE sellar_id NOT IN (SELECT seller_id FROM orders WHERE order_date >= CURRENT_DATE - INTERVAL '6 month')
)

SELECT 
od.seller_id,
MAX(od.order_date) as last_sale_date,
MAX(oi.total_sale) as last_sale_amount
FROM orders as od
JOIN 
cte1
ON cte1.sellar_id = od.seller_id
JOIN order_items as oi
ON od.order_id = oi.order_id
GROUP BY od.seller_id

