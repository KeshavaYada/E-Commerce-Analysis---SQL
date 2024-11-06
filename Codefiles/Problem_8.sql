/*
8. Inventory Stock Alerts
Query products with stock levels below a certain threshold (e.g., less than 10 units).
Challenge: Include last restock date and warehouse information.
*/

SELECT 
	i.inventory_id,
	p.product_name,
	i.stock_remaining as current_stock_left,
	i.restock_date,
	i.ware_house_id
FROM inventory as i
join 
products as p
ON p.product_id = i.product_id
WHERE i.stock_remaining  < 10

