CREATE TABLE fact_orders (
	fact_orders_id INT NOT NULL , 
	order_id INT NOT NULL , 
	order_date DATE NOT NULL,
	user_id INT NOT NULL,
	product_name VARCHAR(255) NOT NULL,
    order_item_id INT,
    product_price INT NOT NULL
);