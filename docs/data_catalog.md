# Data Catalog for Gold Layer 

## Overview :  
Gold Layer contains the dimensions and fact tables which are clean, enriched and business-ready data for doing Dashboards 
and ad-hoc reporting.
 
   --- 

### 1. **gold.dim_product**:
     
- **Purpose:** this dimension table show the details about the product such as category,weight,name ...etc.
- **Columns:** 
  
  
| Column Name           |  Data Type    |                Description                                                                  |
|-----------------------|---------------|---------------------------------------------------------------------------------------------|
| product_key           |    INT        |  A surrogate key, unique identifier for each product.                                       |
| product_id            | NVARCHAR(35)  |  A unique identifier assigned  for each product.                                            |
| category_english      | NVARCHAR(50)  | A classification of product in English to group the same items .                            |
| category_portuguese   | NVARCHAR(50)  | A classification of product in Portuguese to group the same items.                          |
| name_length           |   FLOAT       |  A number represents how many characters are involved in the name of category in Portuguese.|
| photo_number          |   FLOAT       |  A number represents how many pictures are available for the product.                       |
| weight_g              |   FLOAT       |  A measure that represents the weight of product (gram).                                    |
| volume_cm3            |   FLOAT       |  A measure that represents the volume of the product (cm3).                                 |
	 	 
---

### 2. **gold.dim_customer**
- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name               | Data Type     | Description                                                                              |
|---------------------------|---------------|------------------------------------------------------------------------------------------|
| customer_key              | INT           | Surrogate key uniquely identifying each customer record in the dimension table.          |
| customer_id               | NVARCHAR(35)  | Unique identifier assigned to each customer.                                             |
| customer_city             | NVARCHAR(35)  | A string representing the city of the customer.                                          |
| customer_state            | NVARCHAR(35)  | A string representing the state of the customer.                                         |
| customer_zip_code_prefix  | INT           | A nuemrical code represents the zip code prefix of the city.                             |
| latitude                  | FLOAT         | A number represents the latitude of the customer's location.                             |
| longitude                 | FLOAT         | A number represents the longitude of the customer's location.                            |


---

### 3. **gold.dim_seller**
- **Purpose:** Stores seller details enriched with demographic and geographic data.
- **Columns:**

| Column Name               | Data Type     | Description                                                                              |
|---------------------------|---------------|------------------------------------------------------------------------------------------|
| seller_key                | INT           | Surrogate key uniquely identifying each seller record in the dimension table.            |
| seller_id                 | NVARCHAR(35)  | Unique identifier assigned to each seller.                                               |
| seller_city               | NVARCHAR(35)  | A string representing the city of the seller.                                            |
| seller_state              | NVARCHAR(35)  | A string representing the state of the seller.                                           |
| seller_zip_code_prefix    | INT           | A nuemrical code represents the zip code prefix of the city.                             |
| latitude                  | FLOAT         | A number represents the latitude of the seller's location.                               |
| longitude                 | FLOAT         | A number represents the longitude of the seller's location.                              |


---

 ### 4. **gold.fact_orders**
- **Purpose:** Stores many metrics (e.g.price, frieght_value..etc) that are required in analytics and reports purposes.
- **Columns:**

| Column Name               | Data Type     | Description                                                                                |
|---------------------------|---------------|--------------------------------------------------------------------------------------------|
| order_id                  | NVARCHAR(35)  | A unique string assigned to each order.                                                    |
| customer_key              | INT           | A surrogate key, linking the customer record to the gold.dim_customer table.               |
| product_key               | INT           | A surrogate key, linking the product record to the gold.dim_product table.                 |
| seller_key                | INT           | A surrogate key, linking the seller record to the gold.dim_seller table.                   |
| order_status              | NVARCHAR(35)  | A string describeing the status of the order (e.g.delivered, unavailable...etc).           |
| price                     | FLOAT         | A number representing the cost of selling the product.                                     |
| freight_value             | FLOAT         | A number representing the cost of shipping  the product.                                   |
| total_price               | FLOAT         | A number representing the total cost of product,calculated as  price + freight_value       |
| shipping_date             | DATETIME2     | A date representing the date of shipping the product.                                      |
| duration_sell_day         | INT           | A number representing number of days taken to finish entire sales process.                 |
| duration_delivery_day     | INT           | A number representing number of days taken to deliver product to customer.                 |
| payment_sequential        | INT           | A number representing the count of different payment types used for the order.             |
| payment_type              | NVARCHAR(35)  | A string representing payment method used (e.g.credit_card, voucher...etc).                |
| payment_installments      | INT           | A number representing the number of payment installments.                                  | 
| payment_value             | FLOAT         | A number representing the total amount paid by the customer.                               |
| review_score              | INT           | A number representing the rating provided by the customer.                                 |
  


---

