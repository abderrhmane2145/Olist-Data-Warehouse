# Naming Convention

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

# Table of Contents
1. [General](#general)
2. [Bronze Layer](#bronze-layer)
3. [Silver Layer](#silver-layer)
4. [Gold Layer](#gold-layer)
5. [Columns](#columns)
6. [Stored Procedures](#stored-procedures)
7. [Others](#others)

---

## General
- **Use snake_case**.
- **Language**: English.
- **Descriptive**, **consistent names**.

## Bronze Layer
- **Format**: `olist_<entity>`
- **Example**: olist_orders, olist_customers

## Silver Layer
- **Format**: `olist_<entity>`
- **Example**: olist_orders, olist_customers

## Gold Layer
- **Format**: `dim_<entity>`, `fact_<entity>`
- **Example**: dim_customer, fact_orders

## Columns
- **Format**: snake_case (e.g., order_id, total_price)
- **Surrogate Keys**: `<table_name>_key` (e.g., customer_key)

## Stored Procedures
- **Loading**: `load_<layer>` (e.g., load_silver_orders)

## Others
- **Tables of Schema**: `dll_<layer>` (e.g., dll_gold_dim_customer)
- **Database & Schema**: Create_DBS
- **Test Quality**: `test_<layer>`
