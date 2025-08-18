/*
=================================================
Load Bronze Layer ( Source >>> Bronze )
=================================================
Script Purpose:
	- Loads data into bronze schema tables using BULK INSERT from external CSV files provided by the Olist Brazilian E-Commerce dataset.
	- Truncates existing data in bronze tables before loading to ensure a clean refresh.

Warning:
	- Running this script will truncate all data in bronze schema tables (e.g., bronze.olist_orders).
	- Ensure you have a proper backup of any existing data before running.

Parameters:
	- None.

Example Usage :
    - EXEC load_bronze;
*/


CREATE OR ALTER  PROCEDURE load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_proc_time DATETIME, @end_proc_time DATETIME
	BEGIN TRY
		SET @start_proc_time = GETDATE()
		PRINT '============================================='
		PRINT 'Load Bronez Layer'
		PRINT '============================================='

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_customers'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_customers;
		BULK INSERT bronze.olist_customers
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_customers.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'



		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_geolocation'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_geolocation;
		BULK INSERT bronze.olist_geolocation
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_geolocation.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_items'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_order_items;
		BULK INSERT bronze.olist_order_items
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_order_items.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_payments'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_order_payments;
		BULK INSERT bronze.olist_order_payments 
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_order_payments.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_order_reviews'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_order_reviews;
		BULK INSERT bronze.olist_order_reviews 
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_order_reviews.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'

		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_orders'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_orders;
		BULK INSERT bronze.olist_orders
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_orders.csv'
		WITH 
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_products'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_products;
		BULK INSERT bronze.olist_products
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_products.csv'
		WITH
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'


		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_sellers'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_sellers;
		BULK INSERT bronze.olist_sellers
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\olist_sellers.csv'
		WITH
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
		SET @end_time = GETDATE()
		PRINT 'Load Duration : ' + CAST(DATEDIFF(second, @start_time,@end_time ) AS VARCHAR) + ' seconds.'



		SET @start_time = GETDATE()
		PRINT '---------------------------------------------'
		PRINT 'Load Table olist_translation_category'
		PRINT '---------------------------------------------'
		TRUNCATE TABLE bronze.olist_translation_category;
		BULK INSERT bronze.olist_translation_category
		FROM 'C:\Users\LENOVO\Desktop\Project\datasets\Olist brazilain E-ecommerce public\product_category_name_translation.csv'
		WITH
		(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		TABLOCK
		);
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
		PRINT 'Error Number : ' + CAST(ERROR_NUMBER() AS NVARCHAR)
		PRINT 'Error Line : ' +   CAST(ERROR_LINE()   AS NVARCHAR)
		PRINT 'Procedure Name : ' + ERROR_PROCEDURE()
	END CATCH 
END

