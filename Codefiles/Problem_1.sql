/*
1. Top Selling Products
Query the top 10 products by total sales value.
Include product name, total quantity sold, and total sales value.
*/

select pr.product_name,sum(od.quantity) as "total quantity sold",sum(od.total_sale) as "total sales value"
from products as Pr
join order_items as od
on pr.product_id = od.product_id 
group by pr.product_name
order by sum(od.total_sale) desc
limit 10;