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
  │   ├── data_model.jpg                 # jpg image Draw.io file for data models (star schema)
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
if there any problems you find it or question you have it in you mind i will be extremly glad to share this with me:
[![Telegram](data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZD0iTTEyIDI0YzYuNjI3IDAgMTItNS4zNzMgMTItMTJTMTguNjI3IDAgMTIgMCAwIDUuMzczIDAgMTJzNS4zNzMgMTIgMTIgMTJaIiBmaWxsPSJ1cmwoI2EpIi8+PHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik01LjQyNSAxMS44NzFhNzk2LjQxNCA3OTYuNDE0IDAgMCAxIDYuOTk0LTMuMDE4YzMuMzI4LTEuMzg4IDQuMDI3LTEuNjI4IDQuNDc3LTEuNjM4LjEgMCAuMzIuMDIuNDcuMTQuMTIuMS4xNS4yMy4xNy4zMy4wMi4xLjA0LjMxLjAyLjQ3LS4xOCAxLjg5OC0uOTYgNi41MDQtMS4zNiA4LjYyMi0uMTcuOS0uNSAxLjE5OS0uODE5IDEuMjI5LS43LjA2LTEuMjI5LS40Ni0xLjg5OC0uOS0xLjA2LS42ODktMS42NDktMS4xMTktMi42NzgtMS43OTgtMS4xOS0uNzgtLjQyLTEuMjA5LjI2LTEuOTA4LjE4LS4xOCAzLjI0Ny0yLjk3OCAzLjMwNy0zLjIyOC4wMS0uMDMuMDEtLjE1LS4wNi0uMjEtLjA3LS4wNi0uMTctLjA0LS4yNS0uMDItLjExLjAyLTEuNzg4IDEuMTQtNS4wNTYgMy4zNDgtLjQ4LjMzLS45MDkuNDktMS4yOTkuNDgtLjQzLS4wMS0xLjI0OC0uMjQtMS44NjgtLjQ0LS43NS0uMjQtMS4zNDktLjM3LTEuMjk5LS43OS4wMy0uMjIuMzMtLjQ0Ljg5LS42NjlaIiBmaWxsPSIjZmZmIi8+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJhIiB4MT0iMTEuOTkiIHkxPSIwIiB4Mj0iMTEuOTkiIHkyPSIyMy44MSIgZ3JhZGllbnRVbml0cz0idXNlclNwYWNlT25Vc2UiPjxzdG9wIHN0b3AtY29sb3I9IiMyQUFCRUUiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMyMjlFRDkiLz48L2xpbmVhckdyYWRpZW50PjwvZGVmcz48L3N2Zz4K)](https://t.me/Abderhh)


