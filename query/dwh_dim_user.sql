DROP TABLE IF EXISTS dim_users;
CREATE TABLE dim_users ( 
	user_id INT NOT NULL,
	user_first_name VARCHAR(255) NOT NULL,
	user_last_name VARCHAR(255) NOT NULL,
    user_address VARCHAR(255),
    payment_name VARCHAR(255) NOT NULL,
    shipper_id INT NOT NULL
);