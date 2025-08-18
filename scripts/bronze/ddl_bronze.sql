/*
=================================================
Create Bronze Tables 
=================================================
Script Purpose:
	- Creates tables in the bronze schema to store raw data from the Olist Brazilian E-Commerce dataset.
	- Drops existing tables before creation to ensure a clean schema.

Warning:
	- Running this script will drop and recreate tables in the bronze schema (e.g., bronze.olist_orders), removing all data.
	- Ensure you have a proper backup to avoid data loss.
*/


IF OBJECT_ID('bronze.olist_customers','U') IS NOT NULL 
   DROP TABLE bronze.olist_customers;
GO
CREATE TABLE bronze.olist_customers (
    Column_Row               INT,
	customer_id              NVARCHAR(200),
	customer_unique_id       NVARCHAR(200),
	customer_zip_code_prefix NVARCHAR(50),
	customer_city            NVARCHAR(200),
	customer_state           NVARCHAR(55)
);

IF OBJECT_ID('bronze.olist_geolocation','U') IS NOT NULL 
   DROP TABLE bronze.olist_geolocation;
GO
CREATE TABLE bronze.olist_geolocation (
    Column_Row               INT,
	geolocation_zip_code_prefix INT,
	geolocation_lat             FLOAT,
	geolocation_lng             FLOAT,
	geolocation_city            NVARCHAR(200),
	geolocation_state           NVARCHAR(200)
);

IF OBJECT_ID('bronze.olist_order_items','U') IS NOT NULL 
   DROP TABLE bronze.olist_order_items;
GO
CREATE TABLE  bronze.olist_order_items (
    Column_Row               INT,
	order_id             NVARCHAR(200),
	order_item_id        INT,
	product_id           NVARCHAR(200),
	seller_id            NVARCHAR(200),
	shipping_limit_date  DATETIME2,
	price                FLOAT,
	freight_value        FLOAT
);


IF OBJECT_ID('bronze.olist_order_payments','U') IS NOT NULL 
   DROP TABLE bronze.olist_order_payments;
GO
CREATE TABLE bronze.olist_order_payments (
    Column_Row               INT,
	order_id              NVARCHAR(200),
	payment_sequential    INT,
	payment_type          NVARCHAR(200),
	payment_installments  INT,
	payment_value         FLOAT
);

IF OBJECT_ID('bronze.olist_order_reviews','U') IS NOT NULL 
   DROP TABLE bronze.olist_order_reviews;
GO
CREATE TABLE bronze.olist_order_reviews (
    Column_Row               INT,
	review_id              NVARCHAR(200),
	order_id               NVARCHAR(200),
	review_score           INT ,
	review_comment_title   NVARCHAR(500),
	review_comment_message NVARCHAR(500),
	review_creation_date   DATETIME2,
	review_answer_timestamp DATETIME2
);

IF OBJECT_ID('bronze.olist_orders','U') IS NOT NULL 
   DROP TABLE bronze.olist_orders;
GO
CREATE TABLE bronze.olist_orders (
    Column_Row               INT,
	order_id NVARCHAR(200),
	customer_id NVARCHAR(200),
	order_status NVARCHAR(200),
	order_purchase_timestamp DATETIME2, 
	order_approved_at   DATETIME2,
	order_delivered_carrier_date DATETIME2,
	order_delivered_customer_date DATETIME2,
	order_estimated_delivery_date DATETIME2
);


IF OBJECT_ID('bronze.olist_products','U') IS NOT NULL 
   DROP TABLE bronze.olist_products;
GO
CREATE TABLE bronze.olist_products (
    Column_Row               INT,
	product_id              NVARCHAR(200),
	product_category_name   NVARCHAR(200),
	product_name_lenght     FLOAT,
	product_description_lenght FLOAT,
	product_photos_qty  FLOAT,
	product_weight_g    FLOAT,
	product_length_cm   FLOAT,
	product_height_cm   FLOAT,
	product_width_cm    FLOAT
);

IF OBJECT_ID('bronze.olist_sellers','U') IS NOT NULL 
   DROP TABLE bronze.olist_sellers;
GO
CREATE TABLE bronze.olist_sellers (
    Column_Row               INT,
	seller_id NVARCHAR(200),
	seller_zip_code_prefix INT,
	seller_city NVARCHAR(200),
	seller_state NVARCHAR(200)
);

IF OBJECT_ID('bronze.olist_translation_category','U') IS NOT NULL 
   DROP TABLE bronze.olist_translation_category;
GO
CREATE TABLE bronze.olist_translation_category (
	product_category_name NVARCHAR(200),
	product_category_name_english NVARCHAR(200)
);

