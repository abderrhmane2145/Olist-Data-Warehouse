/*
============================================================
Check For Table  : olist_customers
============================================================
*/
-- Check for duplicates and  null values
USE [Olist_DWH];
GO
SELECT 
	customer_id,
	COUNT(customer_id) AS counting_id
FROM silver.olist_customers 
GROUP BY customer_id HAVING COUNT(customer_id) > 1 OR customer_id IS NULL;

-- Check for unwnated space in columns : customer_city and customer_state
SELECT 
  customer_city,
  customer_state
FROM silver.olist_customers
WHERE customer_city != TRIM(customer_city) OR customer_state != TRIM(customer_state);

/*
============================================================
Check For Table  : olist_geolocation
============================================================
*/
-- Check for duplicates and null values
SELECT 
	geolocation_zip_code_prefix, 
    geolocation_lat,
	geolocation_lng,
	geolocation_city,
	geolocation_state,
	COUNT(*) AS counting_all
FROM silver.olist_geolocation
GROUP BY 
        geolocation_zip_code_prefix, 
		geolocation_lat,
		geolocation_lng,
		geolocation_city,
		geolocation_state
HAVING  COUNT(*) > 1;
-- Check for unwanted space in columns : geolocation_city and geolocation_state
SELECT
	geolocation_city,
	geolocation_state
FROM silver.olist_geolocation
WHERE geolocation_city != TRIM(geolocation_city) OR geolocation_state != TRIM(geolocation_state);

/*
============================================================
Check For Table  : olist_order_items
============================================================
*/
-- check for null or duplication values 
SELECT order_id, COUNT(order_id) 
FROM silver.olist_order_items 
GROUP BY order_id
HAVING COUNT(order_id) > 1 OR order_id IS NULL;

-- check for unwanted spaces and null values in columns : order_id, product_id, seller_id
SELECT order_id, product_id, seller_id  
FROM silver.olist_order_items
WHERE order_id != TRIM(order_id) OR product_id != TRIM(product_id) OR seller_id != TRIM(seller_id)
      OR order_id IS NULL OR product_id IS NULL OR seller_id IS NULL;

-- check for the correctness calculations *** price + freight_value = total_price ***
SELECT price, freight_value, total_price
FROM silver.olist_order_items
WHERE ROUND((price + freight_value ), 1) != total_price;


/*
============================================================
Check For Table  : olist_order_payments
============================================================
*/
-- check for unwanted space for column payment_type
SELECT  payment_type 
FROM silver.olist_order_payments 
WHERE  payment_type != TRIM(payment_type);

/*
============================================================
Check For Table  : olist_order_reivews
============================================================
*/
-- no null or duplicated values
SELECT review_id, COUNT(review_id) AS counting_ids FROM silver.olist_order_reviews
GROUP BY review_id HAVING COUNT(review_id) > 1 OR review_id IS NULL;
-- check the logic order of dates
SELECT review_creation_date, review_answer_timestamp FROM silver.olist_order_reviews
WHERE review_creation_date > review_answer_timestamp;

/*
============================================================
Check For Table  : olist_orders
============================================================
*/
-- check duplication and no null values
SELECT 
	order_id,
	COUNT(order_id) AS counting_orders
FROM silver.olist_orders 
GROUP BY order_id HAVING COUNT(order_id) > 1 OR order_id IS NULL;

-- check for unwanted space for column order_status
SELECT 
order_status 
FROM silver.olist_orders
WHERE order_status != TRIM(order_status);
-- check the logic order of dates
SELECT 
	order_purchase_timestamp,  
	order_approved_at, 
	order_delivered_carrier_date, 
	order_delivered_customer_date,
	order_estimated_delivery_date
FROM silver.olist_orders
WHERE
     order_delivered_carrier_date < order_purchase_timestamp      OR
     order_delivered_carrier_date < order_approved_at             OR
	 order_estimated_delivery_date < order_purchase_timestamp     OR
	 order_estimated_delivery_date < order_approved_at            OR
	 order_estimated_delivery_date < order_delivered_carrier_date OR
	 order_delivered_customer_date < order_purchase_timestamp     OR
	 order_delivered_customer_date < order_approved_at            OR
	 order_delivered_customer_date < order_delivered_carrier_date
/*
============================================================
Check For Table  : olist_products
============================================================
*/
--  No Null Or Duplication
SELECT product_id, COUNT(product_id) AS counting_ids FROM silver.olist_products
GROUP BY product_id HAVING COUNT(product_id) > 1 OR product_id IS NULL;
--  No Unwanted Space
SELECT product_category_name FROM silver.olist_products
WHERE product_category_name != TRIM(product_category_name);
-- Check if product_name_lenght is correct 
SELECT product_category_name, LEN(product_category_name), product_name_length 
FROM silver.olist_products WHERE LEN(product_category_name) != product_name_length;

/*
============================================================
Check For Table  : olist_sellers
============================================================
*/
--  No Null Or Duplication
SELECT seller_id, COUNT(seller_id) AS counting_ids 
FROM silver.olist_sellers
GROUP BY seller_id HAVING COUNT(seller_id) > 1 OR seller_id IS NULL;

-- Check for unwatned space in columns : seller_city, selller_state
SELECT seller_city, seller_state FROM silver.olist_sellers
WHERE seller_city != TRIM(seller_city) OR seller_state != TRIM(seller_state)

/*
============================================================
Check For Table  : olist_translation_category
============================================================
*/
-- -- Check for unwanted space in columns : product_category_name, product_category_name_english
SELECT
product_category_name,
product_category_name_english
FROM silver.olist_translation_category
WHERE product_category_name != TRIM(product_category_name) 
OR product_category_name_english != TRIM(product_category_name_english);

