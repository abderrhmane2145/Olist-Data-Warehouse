# Data Catalog for Gold Layer 

## OVERIVEW :  
         Gold Layer contains the dimensions and fact tables which are clean, enriched and business-ready data for doing Dashboards and ad-hoc reporting.
 
   --- 

 ## 1. **gold.dim_product**:
     
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


 ### 1. **gold.dim_customers**
- **Purpose:** Stores customer details enriched with demographic and geographic data.
- **Columns:**

| Column Name      | Data Type     | Description                                                                                   |
|------------------|---------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT           | Surrogate key uniquely identifying each customer record in the dimension table.               |
| customer_id      | INT           | Unique numerical identifier assigned to each customer.                                        |
| customer_number  | NVARCHAR(50)  | Alphanumeric identifier representing the customer, used for tracking and referencing.         |
| first_name       | NVARCHAR(50)  | The customer's first name, as recorded in the system.                                         |
| last_name        | NVARCHAR(50)  | The customer's last name or family name.                                                     |
| country          | NVARCHAR(50)  | The country of residence for the customer (e.g., 'Australia').                               |
| marital_status   | NVARCHAR(50)  | The marital status of the customer (e.g., 'Married', 'Single').                              |
| gender           | NVARCHAR(50)  | The gender of the customer (e.g., 'Male', 'Female', 'n/a').                                  |
| birthdate        | DATE          | The date of birth of the customer, formatted as YYYY-MM-DD (e.g., 1971-10-06).               |
| create_date      | DATE          | The date and time when the customer record was created in the system|

---
