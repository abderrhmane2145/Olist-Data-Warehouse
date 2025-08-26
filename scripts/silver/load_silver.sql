/*
=================================================
Load Silver Layer ( Bronze >>> Silver )
=================================================
Script Purpose:
	- Loads data into silver schema tables using INSERT method from bronze layer after cleaning the data.
	- Truncates existing data in silver tables before loading to ensure a clean refresh.

Warning:
	- Running this script will truncate all data in silver schema tables (e.g., silver.olist_orders).
	- Ensure you have a proper backup of any existing data before running.

Parameters:
	- None.

Example Usage :
    - EXEC load_silver;
*/

CREATE OR ALTER PROCEDURE load_silver AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_proc_time DATETIME, @end_proc_time DATETIME
	BEGIN TRY
		SET @start_proc_time = GETDATE()
		PRINT '============================================='
		PRINT 'Load Silver Layer'
		PRINT '============================================='

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_customers'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_customers;
		INSERT INTO silver.olist_customers
		(customer_id, customer_zip_code_prefix, customer_city, customer_state)
			SELECT 
				customer_id,
				customer_zip_code_prefix,
				UPPER(TRIM(customer_city)) AS customer_city,-- Normalize it to be more readable 
			    CASE 
					WHEN customer_state LIKE '%rio grande do sul%' THEN 'RS'
					WHEN customer_state LIKE '%rio de janeiro%' THEN 'RJ'
					ELSE LEFT(TRIM(customer_state), 2) -- Fix Culprit
			END AS geolocation_state -- Normalize it to be more readable
			FROM bronze.olist_customers;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_geolocation'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_geolocation
		INSERT INTO silver.olist_geolocation
		(
			geolocation_zip_code_prefix,
			geolocation_lat,
			geolocation_lng, 
			geolocation_city,
			geolocation_state
		)
		SELECT 
			geolocation_zip_code_prefix,
			geolocation_lat,
			geolocation_lng,
			UPPER(TRIM(geolocation_city)) AS geolocation_city,-- Normalize it to be more readable 
			CASE 
					WHEN geolocation_state LIKE '%rio grande do sul%' THEN 'RS'
					WHEN geolocation_state LIKE '%rio de janeiro%' THEN 'RJ'
					ELSE LEFT(TRIM(geolocation_state), 2) -- Fix Culprit
			END AS geolocation_state -- Normalize it to be more readable
	  FROM
	 (SELECT 
		geolocation_zip_code_prefix,
		geolocation_lat,
		geolocation_lng,
		geolocation_city,
		geolocation_state,
		COUNT(*) AS counting
	FROM bronze.olist_geolocation
	GROUP BY 
		geolocation_zip_code_prefix,
		geolocation_lat,
		geolocation_lng,
		geolocation_city,
		geolocation_state
	HAVING COUNT(*) = 1 AND
		geolocation_zip_code_prefix IS NOT NULL AND
		geolocation_lat IS NOT NULL AND
		geolocation_city IS NOT NULL AND
		geolocation_lng IS NOT NULL AND
		geolocation_state IS NOT NULL )t


		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_items'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_order_items;
		INSERT INTO silver.olist_order_items
			( 
			  order_id,
			  order_item_id,
			  product_id,
			  seller_id,
			  shipping_limit_date,
			  price,
			  freight_value,
			  total_price
			)
			SELECT
				order_id,
				order_item_id,
				product_id,
				seller_id,
				shipping_limit_date,
				price,
				freight_value,
				ROUND((price + freight_value), 1) AS total_price -- Calculate the total price 
			FROM bronze.olist_order_items;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_payments'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE  silver.olist_order_payments;
		INSERT INTO silver.olist_order_payments
			(
				order_id,
				payment_sequential,
				payment_type,
				payment_installments,
				payment_value
			)
			SELECT 
				order_id,
				payment_sequential,
				payment_type,
				payment_installments,
				payment_value
			FROM bronze.olist_order_payments;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_reviews'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_order_reviews;
		INSERT INTO silver.olist_order_reviews
			(
				review_id,
				order_id,
				review_score,
				review_comment_title,
				review_comment_message,
				review_creation_date,
				review_answer_timestamp
			)
			SELECT 
				review_id,
				order_id,
				review_score,
				review_comment_title,
				review_comment_message,
				review_creation_date,
				review_answer_timestamp
	        FROM 
			(SELECT 
				review_id,
				COUNT(review_id) OVER(PARTITION BY review_id)  AS Couting_ids,
				order_id,
				review_score,
				review_comment_title,
				review_comment_message,
				review_creation_date,
				review_answer_timestamp
			FROM bronze.olist_order_reviews 
			)t WHERE Couting_ids = 1;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_orders'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_orders;
		INSERT INTO silver.olist_orders
			(
				order_id,
				customer_id,
				order_status,
				order_purchase_timestamp,
				order_approved_at,
				order_delivered_carrier_date,
				order_delivered_customer_date,
				order_estimated_delivery_date
			)
			SELECT 
				order_id,
				customer_id,
				CASE 
					WHEN  UPPER(TRIM(order_status)) IN ('APPROVED', 'CREATED', 'INVOICED', 'PROCESSING') THEN 'processing'
					WHEN  UPPER(TRIM(order_status)) = 'DELIVERED'   THEN 'delivered'
					WHEN  UPPER(TRIM(order_status)) = 'UNAVAILABLE' THEN 'unavailable'
					WHEN  UPPER(TRIM(order_status)) = 'CANCELED'    THEN 'canceled'
				END AS order_status, -- Normalize order_status to a form readable
				order_purchase_timestamp, 
				CASE 
					WHEN 
						 order_approved_at < order_purchase_timestamp 
					THEN NULL
					ELSE order_approved_at
				END AS order_approved_at, -- Set approved dates null when the condition happen
				CASE 
					 WHEN 
						 order_delivered_carrier_date < order_purchase_timestamp OR
						 order_delivered_carrier_date < order_approved_at
					 THEN NULL
					 ELSE 
						 order_delivered_carrier_date
				END AS order_delivered_carrier_date, -- Set delivered carrier dates null when the condition happen
				CASE 
					 WHEN 
						 order_delivered_customer_date < order_purchase_timestamp  OR 
						 order_delivered_customer_date < order_approved_at        OR
						 order_delivered_customer_date < order_delivered_carrier_date
					 THEN NULL
					 ELSE 
						 order_delivered_customer_date
				END AS   order_delivered_customer_date, -- Set delivered customer dates null when the condition happen
				CASE 
					WHEN 
						 order_estimated_delivery_date < order_purchase_timestamp  OR
						 order_estimated_delivery_date < order_approved_at         OR
						 order_estimated_delivery_date < order_delivered_carrier_date
					THEN NULL
					ELSE 
						order_estimated_delivery_date
				END AS order_estimated_delivery_date -- Set estimated delivery dates null when the condition happen

			FROM  bronze.olist_orders;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_products'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_products;
		INSERT INTO silver.olist_products 
			(
				product_id,
				product_category_name,
				product_name_lenght,    
				product_photos_qty,
				product_weight_g,
				product_length_cm,
				product_height_cm,
				product_width_cm,
				product_volume_cm3  
			)
			SELECT 
				product_id,
				product_category_name,
				CASE WHEN LEN(product_category_name) != product_name_lenght THEN LEN(product_category_name)
					 ELSE product_name_lenght
				END AS product_name_length, -- Set the correct length if is false
				product_photos_qty,
				product_weight_g ,
				product_length_cm,
				product_height_cm,
				product_width_cm,
				(product_width_cm * product_height_cm  * product_length_cm) AS product_volume_cm3 -- Calcualte volume of product
			FROM bronze.olist_products;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_sellers'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_sellers;
		INSERT INTO silver.olist_sellers 
			(
				seller_id,
				seller_zip_code_prefix,
				seller_city,
				seller_state
			)
			SELECT 
				s.seller_id,
				s.seller_zip_code_prefix,
				UPPER(TRIM(s.seller_city)) AS seller_city,-- Normalize it to be more readable 
                CASE 
					WHEN s.seller_state LIKE '%rio grande do sul%' THEN 'RS'
					WHEN s.seller_state LIKE '%rio de janeiro%' THEN 'RJ'
					ELSE LEFT(TRIM(s.seller_state), 2) -- Fix Culprit
                END AS seller_state -- Normalize it to be more readable
			FROM bronze.olist_sellers s
			LEFT JOIN silver.correction_cities c
			ON c.seller_id = s.seller_id;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_translation_category'
		PRINT '---------------------------------------------'

		TRUNCATE TABLE silver.olist_translation_category
		INSERT INTO silver.olist_translation_category
			(
				product_category_name,
				product_category_name_english
			)
			SELECT 
				product_category_name,
				product_category_name_english
			FROM bronze.olist_translation_category;
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'
		SET @end_proc_time = GETDATE()
		PRINT '============================================='
		PRINT 'Total Load Duration : ' + CAST(DATEDIFF(second, @start_proc_time, @end_proc_time) AS VARCHAR) + ' seconds.' 
		PRINT '============================================='
	END TRY 
	BEGIN CATCH
		PRINT 'Error Occured.'
		PRINT 'Error Message : ' + ERROR_MESSAGE()
		PRINT 'Error Line : ' + CAST(ERROR_LINE() AS NVARCHAR)
		PRINT 'Error Number : ' + CAST(ERROR_NUMBER() AS NVARCHAR)
		PRINT 'Error Procedure : ' + ERROR_PROCEDURE()
	END CATCH
END
