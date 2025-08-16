/*
=================================================
Create Database & Schemas
=================================================
Script Purpose:
	- Creates the 'Olist_DWH' database, dropping any existing version.
	- Creates three schemas: bronze, silver, gold for Medallion Architecture.

Warning:
	- Running this script will drop the existing 'Olist_DWH' database and all its data (tables, schemas, etc.).
	- Before running, ensure you have a proper backup to avoid data loss.
*/

USE master;
GO

-- Drop DB if exists.
  IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'Olist_DWH')
  BEGIN 
     ALTER DATABASE Olist_DWH SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
     DROP DATABASE Olist_DWH;
  END
GO
  
-- Create DB & Use it.
  CREATE DATABASE Olist_DWH;
  GO
  
  USE [Olist_DWH];
  GO

--Create Schemas
  CREATE SCHEMA bronze;
  GO
    
  CREATE SCHEMA silver;
  GO
    
  CREATE SCHEMA gold;
  GO
