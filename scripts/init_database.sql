/* create a database as DataWareHouse with three layers Bronze, Silver and Gold.
Create individual Schema for Bronze, Silver and Gold..
*/

USE master ;
Go
--Drop and recreate the 'DataWarehouse' database
IF exists (Select 1 from sys.databases where name = 'DataWareHouse')
Begin
 Alter DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
 DROP DATABASE DataWareHouse;
 END;
 Go

 --create the database 'Datawarehouses'
 create Database DataWareHouse;
 Go

 USE DataWareHouse;
 Go

 --create Schemas
 create Schema Bronze;
 Go

 create schema Silver;

 Go

 create Schema Gold;
 Go
