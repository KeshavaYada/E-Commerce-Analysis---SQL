/*
4. Monthly Sales Trend
Query monthly total sales over the past year.
Challenge: Display the sales trend, grouping by month, return current_month sale, last month sale!
*/


select  year, month, current_months_sale,lag(current_months_sale,1) OVER (order by year,month) as last_month_sale
from 
(select extract(month from order_date) as month,extract(year from order_date) as year,round(sum(total_sale::numeric),2) as current_months_sale
from orders as od
join order_items as oi
on od.order_id = oi.order_id
where order_date >= CURRENT_DATE - interval '1 year'
group by month,year
)
