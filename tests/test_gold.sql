/*
==================================================
dim_customer
==================================================
*/
-- Check for uniquness of the customer_key
SELECT 
	customer_key, 
	COUNT(*) AS count_customerkey 
FROM gold.dim_customer
GROUP BY customer_key
HAVING COUNT(*) > 1;

/*
==================================================
dim_seller
==================================================
*/
-- Check for uniquness of the seller_key
SELECT 
	seller_key, 
	COUNT(*) AS count_sellerkey 
FROM gold.dim_seller
GROUP BY seller_key
HAVING COUNT(*) > 1;

/*
==================================================
dim_product
==================================================
*/
-- Check for uniquness of the product_key
SELECT 
	product_key, 
	COUNT(*) AS count_productkey 
FROM gold.dim_product
GROUP BY product_key
HAVING COUNT(*) > 1;


/*
==================================================
fact_orders
==================================================
*/

-- Check the connectivity between dimensions and fact tables 

SELECT * 
FROM gold.fact_orders f
 LEFT JOIN gold.dim_customer c
   ON f.customer_key = c.customer_key
 LEFT JOIN gold.dim_seller s
   ON f.seller_key = s.seller_key
 LEFT JOIN gold.dim_product p
   ON f.product_key = p.product_key;
