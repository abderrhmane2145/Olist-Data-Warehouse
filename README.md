# Olist-Data-Warehouse
## **Overview:**
Build  a SQL Server DWH analyze Olist's E-ecommerce performance for inventory, marketing and logistics insights

## **Tools & Links:**
- **[Datasets](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)** 
- **[Sql Server:](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)**
- **[SQL Server Managment Studio (SSMS):](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)**
- **[Git Repository:](https://github.com/abderrhmane2145/Olist-Data-Warehouse)**

## **Part 1: Data Engineering**
### **Objective:** 
Build a SQL Server Data Warehouse to support e-commerce analytics.
- **Data Source:** Import Olist Brazilian E-Commerce Dataset (9 CSV files) from Kaggle.
- **Data Quality:** Fix missing values, standardize dates, remove duplicates.
- **Integration:** Join tables (e.g., orders, customers) using SSIS ETL.
- **Scope:** Exclude irrelevant data (e.g., canceled orders).
- **Documentation:** Include ER diagram and metric definitions in GitHub repo.

	Setup: Uses a layered data structure (raw, cleaned, aggregated) and a data model for analytics.

## **Part 2: Data Analyst**
### **Objective:** 
Run T-SQL queries for e-commerce insights.

- **Customer Analysis Dashboard** 
- **Seller Performance Overview** 
- **Product & Category Insights** 
- **Order & Revenue Metrics** 

```
## Olist-Data-Warehouse/
  │
  ├── datasets/                           # Raw datasets used for the project (Csv Files)
  │
  ├── docs/                               # Project documentation and architecture details
  │   ├── data_integration.jpg           # jpg image by Draw.io file shows all integration between the tables
  │   ├── data_architecture.jpg          # jpg image by Draw.io file shows the project's architecture
  │   ├── data_catalog.md                # Catalog of datasets, including field descriptions and metadata
  │   ├── data_flow.jpg                  # jpg image by Draw.io file for the data flow diagram
  │   ├── data_model.jpg                 # jpg image by Draw.io file for data models (star schema)
  │   ├── Naming_Convention.md           # Consistent naming guidelines for tables, columns, and files
  │
  ├── scripts/                            # SQL scripts for ETL and transformations
  │   ├── bronze/                         # Scripts for extracting and loading raw data
  │   ├── silver/                         # Scripts for cleaning and transforming data
  │   ├── gold/                           # Scripts for creating analytical models
  │
  ├── tests/                              # Test scripts and quality files
  |
  ├── LICENSE                             # License information for the repository
  └── README.md                           # Project overview and instructions
```
---

## Communication :
- if there any problems you find it or questions, I will be extremly glad to share this with me following telegram :

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/Abderhh)


