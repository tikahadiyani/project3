SELECT  a.order_id, 
	    order_date,
	    b.user_id,
        c.order_item_id,
        c.product_price,
        d.product_name
FROM tb_orders a
LEFT JOIN tb_users b ON a.user_id = b.user_id
LEFT JOIN tb_order_items c ON a.order_id = c.order_id
LEFT JOIN tb_products d ON c.product_id = d.product_id;