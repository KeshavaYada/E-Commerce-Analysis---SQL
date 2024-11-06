/*20. Final Task: Stored Procedure
Create a stored procedure that, when a product is sold, performs the following actions:
Inserts a new sales record into the orders and order_items tables.
Updates the inventory table to reduce the stock based on the product and quantity purchased.
The procedure should ensure that the stock is adjusted immediately after recording the sale.
*/

CREATE OR REPLACE PROCEDURE Add_sales_Instance
(
    p_order_id INT,
    p_customer_id INT,
    p_seller_id INT,
    p_order_item_id INT,
    p_product_id INT,
    p_quantity INT
)
LANGUAGE plpgsql
AS $$
DECLARE 
    v_count INT;
    v_price FLOAT;
    v_product VARCHAR(50);
BEGIN
    -- Fetching product name and price based on product_id entered
    SELECT 
        price, product_name
    INTO
        v_price, v_product
    FROM products
    WHERE product_id = p_product_id;
    
    -- Checking stock and product availability in inventory    
    SELECT 
        COUNT(*) 
    INTO
        v_count
    FROM inventory
    WHERE 
        product_id = p_product_id
        AND 
        inventory.stock_remaining >= p_quantity;
        
    IF v_count > 0 THEN
        -- Add into orders and order_items table, then update inventory
        INSERT INTO orders(order_id, order_date, customer_id, seller_id)
        VALUES
            (p_order_id, CURRENT_DATE, p_customer_id, p_seller_id);

        INSERT INTO order_items(order_item_id, order_id, product_id, quantity, price_per_unit, total_sale)
        VALUES
            (p_order_item_id, p_order_id, p_product_id, p_quantity, v_price, v_price * p_quantity);

        UPDATE inventory
        SET stock_remaining = stock_remaining - p_quantity
        WHERE product_id = p_product_id;
        
        RAISE NOTICE 'Thank you, product: % sale has been added and inventory stock updated', v_product; 
    ELSE
        RAISE NOTICE 'Thank you for your info, the product: % is not available', v_product;
    END IF;
END;
$$;




-- Testing Store Procedure**
call add_sales_instance
(
25005, 2, 5, 25004, 1, 14
);


