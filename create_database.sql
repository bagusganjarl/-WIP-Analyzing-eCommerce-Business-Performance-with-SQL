--STEP 1
--Create 9 new table with the following columns and determine primary key and foreign key each table.
--Make sure the data type match with dataset in csv file.
CREATE TABLE customers(
	customer_id VARCHAR,
	customer_unique_id VARCHAR,
	customer_zip_code_prefix INT,
	customer_city VARCHAR,
	customer_state VARCHAR
);
CREATE TABLE geolocation(
	geo_zip_code_prefix VARCHAR,
	geo_lat VARCHAR,
	geo_lng VARCHAR,
	geo_city VARCHAR,
	geo_state VARCHAR
);
CREATE TABLE order_items(
	order_id VARCHAR,
	order_item_id INT,
	product_id VARCHAR,
	seller_id VARCHAR,
	shipping_limit_date TIMESTAMP WITHOUT TIME ZONE,
	price FLOAT,
	freight_value FLOAT
);
CREATE TABLE order_payments(
	order_id VARCHAR,
	payment_sequential INT,
	payment_type VARCHAR,
	payment_installments INT,
	payment_value FLOAT
);
CREATE TABLE order_reviews(
	review_id VARCHAR,
	order_id VARCHAR,
	review_score INT,
	review_comment_title VARCHAR,
	review_comment_message TEXT,
	review_creation_date TIMESTAMP WITHOUT TIME ZONE,
	review_answer TIMESTAMP WITHOUT TIME ZONE
);
CREATE TABLE orders(
	order_id VARCHAR,
	customer_id VARCHAR,
	order_status VARCHAR,
	order_purchase_timestamp TIMESTAMP WITHOUT TIME ZONE,
	order_approved_at TIMESTAMP WITHOUT TIME ZONE,
	order_delivered_customer_date TIMESTAMP WITHOUT TIME ZONE,
	order_estimated_delivery_date TIMESTAMP WITHOUT TIME ZONE,
);
CREATE TABLE product(
	num INT,
	product_id VARCHAR,
	product_category_name VARCHAR,
	product_name_length FLOAT,
	product_description_length FLOAT,
	product_photos_qty FLOAT,
	product_weight_g FLOAT,
	product_length_cm FLOAT,
	product_height_cm FLOAT,
	product_width_cm FLOAT
);
CREATE TABLE sellers(
	seller_id VARCHAR,
	seller_zip_code_prefix VARCHAR,
	seller_city VARCHAR,
	seller_state VARCHAR
);

--STEP 2
--Import csv data to the database.
--Make sure dataset path (in local storage) must be complete until the file_name.csv.
COPY customers(
	customer_id,
	customer_unique_id,
	customer_zip_code_prefix,
	customer_city,
	customer_state
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\customers_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY geolocation(
	geo_zip_code_prefix,
	geo_lat,
	geo_lng,
	geo_city,
	geo_state
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY order_items(
	order_id,
	order_item_id,
	product_id,
	seller_id,
	shipping_limit_date,
	price,
	freight_value
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY order_payments(
	order_id,
	payment_sequential,
	payment_type,
	payment_installments,
	payment_value
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\order_payments.csv'
DELIMITER ','
CSV HEADER;

COPY order_reviews(
	review_id,
	order_id,
	review_score,
	review_comment_title,
	review_comment_message,
	review_creation_date,
	review_answer
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY orders(
	order_id,
	customer_id,
	order_status,
	order_purchase_timestamp,
	order_approved_at,
	order_delivered_customer_date,
	order_estimated_delivery_date
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\orders_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE product(
	num,
	product_id,
	product_category_name,
	product_name_length,
	product_description_length,
	product_photos_qty,
	product_weight_g,
	product_length_cm,
	product_height_cm,
	product_width_cm
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\product_dataset.csv'
DELIMITER ','
CSV HEADER;

COPY sellers(
	seller_id,
	seller_zip_code_prefix,
	seller_city,
	seller_state
)
FROM 'E:\Rakamin\JAP\Mini Project 1 - Analyzing eCommerce Business 
Performance with SQL\Task 1\Dataset\sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

--STEP 3
--Determine primary key and foreign key for relation in each data and create ERD.
--Make sure primary key is unique value.
--Make sure primary key and foreign key between dataset match the data type.

--Primary Key
ALTER TABLE customers ADD CONSTRAINT customers_pkey ADD PRIMARY KEY(customer_id);
ALTER TABLE orders ADD CONSTRAINT orders_pkey ADD PRIMARY KEY(order_id);
ALTER TABLE product ADD CONSTRAINT product_pkey ADD PRIMARY KEY(product_id);
ALTER TABLE sellers ADD CONSTRAINT sellers_pkey ADD PRIMARY KEY(seller_id);

--Foreign Key
ALTER TABLE order_items ADD FOREIGN KEY(order_id) REFERENCES orders;
ALTER TABLE order_items ADD FOREIGN KEY(product_id) REFERENCES product;
ALTER TABLE order_items	ADD FOREIGN KEY(seller_id) REFERENCES sellers;
ALTER TABLE order_payments ADD FOREIGN KEY(order_id) REFERENCES orders;
ALTER TABLE order_reviews ADD FOREIGN KEY(order_id) REFERENCES orders;
ALTER TABLE orders ADD FOREIGN KEY(customer_id) REFERENCES customers;
