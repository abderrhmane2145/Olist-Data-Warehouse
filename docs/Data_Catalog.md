# Data Catalog for Gold Layer 

  ##OVERIVEW : 
        Gold Layer contains the dimensions and fact tables which are clean, enriched and business-ready data for doing Dashboards and ad-hoc reporting.
 
   --- 

 ## 1. **gold.dim_product**:
     
	**purpose** : this dimension table show the details about the product such as category,weight,name ..etc
  
  
    | Column Name           |  Data Type    |                Description                                                                          |
	|-----------------------|---------------|-----------------------------------------------------------------------------------------------------|
	| product_key           |    INT        |  A surrogate key, unique identifier for each product.                                               |
	| product_id            |    INT        |  A unique identifier assigned  for each product.                                                    |
	| category_english      | NVARCHAR(200) |  A classification of product in English to group the same items .                                   |
	| category_portuguese   | NVARCHAR(200) |  A classification of product in Portuguese to group the same items.                                 |
    | name_length           |   FLOAT       |  A number represents how many characters are involved in the name of category in Portuguese.        |
	| photo_number          |   FLOAT       |  A number represents how many pictures are available for the product.                               |
	| weight_g              |   FLOAT       |  A measure that represents the weight of product (gram).                                            |
	| volume_cm3            |   FLOAT       |  A measure that represents the volume of the product (cm3).                                         |
	 
	 
	---
