CREATE TABLE olist.sellers (
  seller_id VARCHAR(50) PRIMARY KEY,
  seller_zip_code_prefix VARCHAR(10),
  seller_city VARCHAR(100),
  seller_state CHAR(2)
);

CREATE TABLE olist.products (
  product_id VARCHAR(50) PRIMARY KEY,
  product_category_name VARCHAR(100),
  product_name_lenght INT,
  product_description_lenght INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
);

CREATE TABLE olist.customers (
  customer_id VARCHAR(50) PRIMARY KEY,
  customer_unique_id VARCHAR(50),
  customer_zip_code_prefix VARCHAR(10),
  customer_city VARCHAR(100),
  customer_state CHAR(2)
);

CREATE TABLE olist.orders (
LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_sellers_dataset.csv'
INTO TABLE olist.sellers CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_products_dataset.csv'
INTO TABLE olist.products CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES
(product_id, product_category_name, @a,@b,@c,@d,@e,@f,@g)
SET product_name_lenght=NULLIF(@a,''), product_description_lenght=NULLIF(@b,''),
    product_photos_qty=NULLIF(@c,''), product_weight_g=NULLIF(@d,''),
    product_length_cm=NULLIF(@e,''), product_height_cm=NULLIF(@f,''),
    product_width_cm=NULLIF(@g,'');

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_customers_dataset.csv'
INTO TABLE olist.customers CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_orders_dataset.csv'
INTO TABLE olist.orders CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES
(order_id, customer_id, order_status, @t1,@t2,@t3,@t4,@t5)
SET order_purchase_timestamp=NULLIF(@t1,''), order_approved_at=NULLIF(@t2,''),
    order_delivered_carrier_date=NULLIF(@t3,''), order_delivered_customer_date=NULLIF(@t4,''),
    order_estimated_delivery_date=NULLIF(@t5,'');

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_order_payments_dataset.csv'
INTO TABLE olist.order_payments CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_order_items_dataset.csv'
INTO TABLE olist.order_items CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/Users/joaopaulo/Downloads/olist_data/olist_order_reviews_dataset.csv'
INTO TABLE olist.order_reviews CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' IGNORE 1 LINES
(review_id, order_id, review_score, review_comment_title, review_comment_message, @r1,@r2)
SET review_creation_date=NULLIF(@r1,''), review_answer_timestamp=NULLIF(@r2,'');