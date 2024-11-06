/*
6. Least-Selling Categories by State
Identify the least-selling product category for each state.
Challenge: Include the total sales for that category within each state.
*/

WITH ranking_table
AS
(
SELECT 
	cu.state,
	cat.category_name,
	SUM(oi.total_sale) as total_sale,
	RANK() OVER(PARTITION BY cu.state ORDER BY SUM(oi.total_sale) ASC) as rank
FROM orders as od
JOIN 
customers as cu
ON od.customer_id = cu.customer_id
JOIN
order_items as oi
ON od.order_id = oi. order_id
JOIN 
products as p
ON oi.product_id = p.product_id
JOIN
category as cat
ON cat.category_id = p.category_id
GROUP BY 1, 2
)
SELECT 
*
FROM ranking_table
WHERE rank = 1


-- listing the categories and their count of states it is leading 
WITH ranking_table
AS

(
SELECT 
	cu.state,
	cat.category_name,
	SUM(oi.total_sale) as total_sale,
	RANK() OVER(PARTITION BY cu.state ORDER BY SUM(oi.total_sale) ASC) as rank
FROM orders as od
JOIN 
customers as cu
ON od.customer_id = cu.customer_id
JOIN
order_items as oi
ON od.order_id = oi. order_id
JOIN 
products as p
ON oi.product_id = p.product_id
JOIN
category as cat
ON cat.category_id = p.category_id
GROUP BY 1, 2
)
select Category_name,count(*) as Leading_in_No_of_States
from ranking_table
group by category_name

