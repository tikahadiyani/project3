SELECT  b.user_id,
        user_first_name,
        user_last_name,
        user_address,
        c.shipper_id,
        d.payment_name
FROM tb_users a 
     LEFT JOIN tb_orders b ON a.user_id = b.user_id
     LEFT JOIN tb_shippers c ON b.shipper_id = c.shipper_id
     LEFT JOIN tb_payments d ON b.payment_id = d.payment_id;  