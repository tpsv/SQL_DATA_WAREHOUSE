/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
This script is designed to create a new DataWarehouse database and its associated schemas. It checks if the DataWarehouse database already exists, and if so, it drops and recreates the database. 
The script then creates three schemas within the new database: bronze, silver, and gold. These schemas represent the different layers of a typical data warehousing architecture, following the Medallion Architecture.

Important Notice
Warning: This script will drop the existing DataWarehouse database if it already exists, resulting in the permanent loss of all data within that database.

Ensure that backups are taken before running this script to avoid data loss.


*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
