/*
11. Top Performing Sellers
Find the top 5 sellers based on total sales value.
Challenge: Include both successful and failed orders, and display their percentage of successful orders.
*/
WITH top_sellers
AS
(SELECT 
	s.sellar_id,
	s.sellar_name,
	SUM(oi.total_sale) as total_sale
FROM orders as o
JOIN
sellers as s
ON o.seller_id = s.sellar_id
JOIN 
order_items as oi
ON oi.order_id = o.order_id
GROUP BY s.sellar_id,
	s.sellar_name
ORDER BY SUM(oi.total_sale) DESC
LIMIT 5
),

sellers_reports
AS
(SELECT 
	o.seller_id,
	ts.sellar_name,
	o.order_status,
	COUNT(*) as total_orders
FROM orders as o
JOIN 
top_sellers as ts
ON ts.sellar_id = o.seller_id
WHERE 
	o.order_status NOT IN ('Inprogress', 'Returned')
	
GROUP BY o.seller_id,
	ts.sellar_name,
	o.order_status
)
SELECT 
	seller_id,
	sellers_reports.sellar_name,t.total_sale,
	SUM(CASE WHEN order_status = 'Completed' THEN total_orders ELSE 0 END) as Completed_orders,
	SUM(CASE WHEN order_status = 'Cancelled' THEN total_orders ELSE 0 END) as Cancelled_orders,
	SUM(total_orders) as total_orders,
	SUM(CASE WHEN order_status = 'Completed' THEN total_orders ELSE 0 END)::numeric/
	SUM(total_orders)::numeric * 100 as successful_orders_percentage
	
FROM sellers_reports 
join top_sellers as t
on sellers_reports.seller_id = t.sellar_id
GROUP BY seller_id,
	sellers_reports.sellar_name,t.total_sale