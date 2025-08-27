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
| product_id            |    INT        |  A unique identifier assigned  for each product.                                            |
| category_english      | NVARCHAR(200) |  A classification of product in English to group the same items .                           |
| category_portuguese   | NVARCHAR(200) |  A classification of product in Portuguese to group the same items.                         |
| name_length           |   FLOAT       |  A number represents how many characters are involved in the name of category in Portuguese.|
| photo_number          |   FLOAT       |  A number represents how many pictures are available for the product.                       |
| weight_g              |   FLOAT       |  A measure that represents the weight of product (gram).                                    |
| volume_cm3            |   FLOAT       |  A measure that represents the volume of the product (cm3).                                 |
	 	 
---

### 2. **gold.dim_customer**
- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name               | Data Type     | Description                                                                                   |
|---------------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key              | INT           | Surrogate key uniquely identifying each customer record in the dimension table.               |
| customer_id               | NVARCHAR(200) | Unique identifier assigned to each customer.                                                  |
| customer_city             | NVARCHAR(200) | A string representing the city of the customer.                                               |
| customer_state            | NVARCHAR(55)  | A string representing the state of the customer.                                              |
| customer_zip_code_prefix  | NVARCHAR(50)  | A nuemrical code represents the zip code prefix of the city.                                  |
| latitude                  | FLOAT         | A number represents the latitude of the customer's location.                                  |
| longitude                 | FLOAT         | A number represents the longitude of the customer's location.                                 |


---

### 3. **gold.dim_seller**
- **Purpose:** Stores seller details enriched with demographic and geographic data.
- **Columns:**

| Column Name               | Data Type     | Description                                                                                   |
|---------------------------|---------------|-----------------------------------------------------------------------------------------------|
| seller_key                | INT            | Surrogate key uniquely identifying each seller record in the dimension table.               |
| seller_id                 | NVARCHAR(200) | Unique identifier assigned to each seller.                                                  |
| seller_city               | NVARCHAR(200) | A string representing the city of the seller.                                               |
| seller_state              | NVARCHAR(55)  | A string representing the state of the seller.                                              |
| seller_zip_code_prefix    | INT           | A nuemrical code represents the zip code prefix of the city.                                  |
| latitude                  | FLOAT         | A number represents the latitude of the seller's location.                                  |
| longitude                 | FLOAT         | A number represents the longitude of the seller's location.                                 |


---


