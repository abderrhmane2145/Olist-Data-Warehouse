/*
=================================================
Create Silver Tables 
=================================================
Script Purpose:
	- Creates tables in the silver schema to store raw data after cleaning it from bronze schema.
	- Drops existing tables before creation to ensure a clean schema.

Warning:
	- Running this script will drop and recreate tables in the silver schema (e.g., silver.olist_orders), removing all data.
	- Ensure you have a proper backup to avoid data loss.
*/

IF OBJECT_ID('silver.olist_customers','U') IS NOT NULL 
   DROP TABLE silver.olist_customers;
GO
CREATE TABLE silver.olist_customers (
	customer_id              NVARCHAR(200),
	customer_zip_code_prefix NVARCHAR(50),
	customer_city            NVARCHAR(200),
	customer_state           NVARCHAR(55),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_geolocation','U') IS NOT NULL 
   DROP TABLE silver.olist_geolocation;
GO
CREATE TABLE silver.olist_geolocation (
	geolocation_zip_code_prefix INT,
	geolocation_lat             FLOAT,
	geolocation_lng             FLOAT,
	geolocation_city            NVARCHAR(200),
	geolocation_state           NVARCHAR(200),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_order_items','U') IS NOT NULL 
   DROP TABLE silver.olist_order_items;
GO
CREATE TABLE  silver.olist_order_items (
	order_id             NVARCHAR(200),
	order_item_id        INT,
	product_id           NVARCHAR(200),
	seller_id            NVARCHAR(200),
	shipping_limit_date  DATETIME2,
	price                FLOAT,
	freight_value        FLOAT,
	total_price          FLOAT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.olist_order_payments','U') IS NOT NULL 
   DROP TABLE silver.olist_order_payments;
GO
CREATE TABLE silver.olist_order_payments (
	order_id              NVARCHAR(200),
	payment_sequential    INT,
	payment_type          NVARCHAR(200),
	payment_installments  INT,
	payment_value         FLOAT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_order_reviews','U') IS NOT NULL 
   DROP TABLE silver.olist_order_reviews;
GO
CREATE TABLE silver.olist_order_reviews (
	review_id              NVARCHAR(200),
	order_id               NVARCHAR(200),
	review_score           INT ,
	review_comment_title   NVARCHAR(500),
	review_comment_message NVARCHAR(500),
	review_creation_date   DATETIME2,
	review_answer_timestamp DATETIME2,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_orders','U') IS NOT NULL 
   DROP TABLE silver.olist_orders;
GO
CREATE TABLE silver.olist_orders (
	order_id NVARCHAR(200),
	customer_id NVARCHAR(200),
	order_status NVARCHAR(200),
	order_purchase_timestamp DATETIME2, 
	order_approved_at   DATETIME2,
	order_delivered_carrier_date DATETIME2,
	order_delivered_customer_date DATETIME2,
	order_estimated_delivery_date DATETIME2,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);


IF OBJECT_ID('silver.olist_products','U') IS NOT NULL 
   DROP TABLE silver.olist_products;
GO
CREATE TABLE silver.olist_products (
	product_id              NVARCHAR(200),
	product_category_name   NVARCHAR(200),
	product_name_length     FLOAT,
	product_photos_qty  FLOAT,
	product_weight_g    FLOAT,
	product_length_cm   FLOAT,
	product_height_cm   FLOAT,
	product_width_cm    FLOAT,
	product_volume_cm3  FLOAT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_sellers','U') IS NOT NULL 
   DROP TABLE silver.olist_sellers;
GO
CREATE TABLE silver.olist_sellers (
	seller_id NVARCHAR(200),
	seller_zip_code_prefix INT,
	seller_city NVARCHAR(200),
	seller_state NVARCHAR(200),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

IF OBJECT_ID('silver.olist_translation_category','U') IS NOT NULL 
   DROP TABLE silver.olist_translation_category;
GO
CREATE TABLE silver.olist_translation_category (
	product_category_name NVARCHAR(200),
	product_category_name_english NVARCHAR(200),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);

