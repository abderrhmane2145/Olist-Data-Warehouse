# **Naming Convention**
This document show the naming convention of used for schemas, tables, views, columns, and other objects in the data warehouse. 

## **Table Of Content**

- 1.[General](#general)
- 2.[Bronze Layer](#bronze-layer)
- 3.[Silver Layer](#silver-layer)
- 4.[Gold Layer](#gold-layer)
- 5.[Columns](#columns)
- 6.[Stored Procedure](#stored-procedure)
- 7.[Others](#others)

---

## General : 
- Use Snake Case.
- Language : English.
- Clear & Consistent Names.

## Bronze Layer :
- **Format** : **`bronze_<entity>`**.
- **Example** : bronze_product.

## Silver Layer :
- **Format** : **`silver_<entity>`**.
- **Example** : silver_sales.

## Gold Layer :
- **Format** : **`dim_<entity>`**, **`fact_<entity>`** .
- **Example** : dim_factory, fact_sales.

## Columns :
- **Format** : snake_case(e.g. order_id,).
- **Surrogate Keys** : **`<table_name>_key`** (e.g., factory_key)

## Stored Procedure :
- **Format** : **`load_<layer>`** (e.g. load_silver)

## Others :
- **Test Quality** : **`test_<layer>`** (e.g. test_silver)
- **schema & database** : **`create_DBS`**
- **tables of schema** : **`ddl_<layer>`** (e.g. ddl_bronze)
