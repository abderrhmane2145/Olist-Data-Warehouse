/*
=================================================================
Generate Gold Layer Views
=================================================================
Script Objectives:
	- This script establishes views within the Gold Schema of the data warehouse.
	- The Gold layer serves as the final stage, housing dimension and fact tables (Star Schema).

	- Each view aggregates and transforms data from the silver layer 
	  to deliver clean, enriched, and business-ready datasets.

Application:
    - These views are designed to support analytics and reporting workflows.
*/

-- ==================================================
-- dim_product
-- ==================================================

IF OBJECT_ID('gold.dim_product', 'V') IS NOT NULL
   DROP VIEW gold.dim_product;
GO

CREATE VIEW gold.dim_product AS
(
SELECT 
    ROW_NUMBER() OVER(ORDER BY p.product_id) AS product_key, -- Surrogate Key
  	p.product_id,
  	t.product_category_name_english AS category_english,
    p.product_category_name AS category_portuguese,
    p.product_name_length AS name_length,
  	COALESCE(p.product_photos_qty, 0) AS photo_number,
  	p.product_weight_g AS weight_g,
  	p.product_volume_cm3 AS volume_cm3
FROM silver.olist_products p
LEFT JOIN silver.olist_translation_category t
ON p.product_category_name = t.product_category_name
WHERE p.product_id IS NOT NULL
);
GO


-- =============================================
-- dim_seller
-- =============================================

IF OBJECT_ID('gold.dim_seller', 'V') IS NOT NULL
   DROP VIEW gold.dim_seller;
GO

CREATE VIEW gold.dim_seller AS 
(
SELECT 
  	ROW_NUMBER() OVER(ORDER BY seller_id) AS seller_key, -- Surrogate Key
  	s.seller_id,
  	s.seller_city,
  	s.seller_state,
  	s.seller_zip_code_prefix,
  	g.latitude,
  	g.longitude
FROM silver.olist_sellers s
LEFT JOIN 
	(
	SELECT 
		geolocation_zip_code_prefix,
		geolocation_city,
		geolocation_state,
		AVG(geolocation_lat) AS latitude,
		AVG(geolocation_lng) AS longitude
	FROM silver.olist_geolocation
	WHERE geolocation_lat IS NOT NULL AND geolocation_lng IS NOT NULL
	GROUP BY  geolocation_zip_code_prefix, geolocation_city, geolocation_state
	) g
ON  LOWER(TRIM(s.seller_state)) = LOWER(TRIM(g.geolocation_state))
AND LOWER(TRIM(s.seller_city)) = LOWER(TRIM(g.geolocation_city))
AND s.seller_zip_code_prefix = g.geolocation_zip_code_prefix
WHERE s.seller_id IS NOT NULL 
  AND s.seller_city IS NOT NULL 
  AND s.seller_state IS NOT NULL 
  AND s.seller_zip_code_prefix IS NOT NULL
);
GO


-- =============================================
-- dim_customer
-- =============================================

IF OBJECT_ID('gold.dim_customer', 'V') IS NOT NULL
   DROP VIEW gold.dim_customer;
GO

CREATE VIEW gold.dim_customer AS 
(
SELECT 
    	ROW_NUMBER() OVER(ORDER BY customer_id) AS customer_key, -- Surrogate key
    	c.customer_id,
    	c.customer_city,
    	c.customer_state,
    	c.customer_zip_code_prefix,
    	g.latitude,
    	g.longitude
FROM silver.olist_customers c
LEFT JOIN 
	(
	SELECT 
  		geolocation_zip_code_prefix,
  		geolocation_city,
  		geolocation_state,
  		AVG(geolocation_lat) AS latitude,
  		AVG(geolocation_lng) AS longitude
	FROM silver.olist_geolocation
	GROUP BY  geolocation_zip_code_prefix, geolocation_city, geolocation_state
	) g
ON  c.customer_state = g.geolocation_state 
AND c.customer_city = g.geolocation_city
AND c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
WHERE c.customer_id IS NOT NULL 
  AND c.customer_city IS NOT NULL 
  AND c.customer_state IS NOT NULL 
  AND c.customer_zip_code_prefix IS NOT NULL
 );
 GO

-- ==================================================
-- fact_orders
-- ==================================================

IF OBJECT_ID('gold.fact_orders', 'V') IS NOT NULL
   DROP VIEW gold.fact_orders
GO

CREATE VIEW gold.fact_orders AS 
(
SELECT 
  	o.order_id,
  	c.customer_key,
  	p.product_key,
  	s.seller_key,
  	o.order_status,
  	oi.price,
  	oi.freight_value,
  	oi.total_price,
  	DATEDIFF(day, o.order_purchase_timestamp, o.order_delivered_customer_date) AS duration_sell_day,
  	DATEDIFF(day, o.order_delivered_carrier_date, o.order_delivered_customer_date) AS duration_delivery_day,
  	op.payment_sequential,
  	op.payment_type,
  	op.payment_installments,
  	op.payment_value,
  	re.review_score
FROM silver.olist_orders o
	LEFT JOIN silver.olist_order_reviews re
	   ON o.order_id = re.order_id
	LEFT JOIN silver.olist_order_payments op
	   ON o.order_id = op.order_id
	LEFT JOIN silver.olist_order_items oi
	   ON o.order_id = oi.order_id
	LEFT JOIN gold.dim_customer c
	   ON o.customer_id = c.customer_id
	LEFT JOIN gold.dim_product p
	   ON oi.product_id = p.product_id
	LEFT JOIN gold.dim_seller s
	   ON oi.seller_id = s.seller_id
);
