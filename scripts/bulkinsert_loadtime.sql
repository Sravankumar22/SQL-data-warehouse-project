/*
-----> CLEARING DATA FROM THE TABLE
-----> INSERTING LARGE DATA INTO THE ALREADY CREATED DATA IN A SINGLE TIME
-----> CREATING A STORED PROCEDURE FOR IT 
-----> CALCULATING LOAD DURATION
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	declare @starttime datetime, @endtime datetime, @overallstarttime datetime, @overallendtime datetime;

	Set @overallstarttime = GETDATE();

	PRINT '==========================================';
	PRINT 'LOADING BRONZE LAYER TABLES';
	PRINT '==========================================';


	PRINT '-------------------------------------------';
	PRINT 'LOADING CRM TABLES';
	PRINT '-------------------------------------------';

	SET @starttime = GETDATE();
	PRINT '>>>> CLEARING DATA IN CRM CUSTOMER INFO TABLE';
	TRUNCATE TABLE bronze.crm_customerinfo;

	PRINT '>>>> INSERTING DATA INTO CRM CUSTOMER INFO TABLE';
	Bulk insert bronze.crm_customerinfo
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
    SET @endtime = GETDATE();


	print 'time duration :' + cast(datediff(second, @starttime, @endtime) as nvarchar) + 'seconds';
	print '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';



	set @starttime = GETDATE();
	PRINT '>>>> CLEARING DATA IN CRM PRODUCT INFO TABLE';
	TRUNCATE TABLE bronze.crm_product_info;
	PRINT '>>>> INSERTING DATA INTO CRM PRODUCT INFO TABLE';
	BULK INSERT bronze.crm_product_info
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	) ;
	set @endtime = GETDATE();

	print 'load duration:' + cast(datediff(second,@starttime,@endtime) as nvarchar) + 'seconds';
	print'<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';

	SET @starttime = GETDATE(); 
	PRINT '>>>> CLEARING DATA IN CRM SALES INFO TABLE';
	TRUNCATE TABLE bronze.Crm_salesinfo;
	PRINT '>>>> INSERTING DATA INTO CRM SALES INFO TABLE';
	BULK INSERT bronze.Crm_salesinfo
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with
	(
	FIRSTROW =  2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	SET @endtime = GETDATE();
	PRINT 'LOAD DURATION:' + CAST(DATEDIFF(SECOND,@starttime,@endtime) AS NVARCHAR) + 'SECONDS';
	PRINT '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';


	SET @starttime= GETDATE();
	PRINT '-------------------------------------------';
	PRINT 'LOADING ERP TABLES';
	PRINT '-------------------------------------------';


	PRINT '>>>> CLEARING DATA IN ERP CUSTOMER INFO TABLE';
	TRUNCATE TABLE bronze.erp_custinfo;
	PRINT '>>>> INSERTING DATA INTO ERP CUSTOMER INFO TABLE';
	BULK INSERT bronze.erp_custinfo
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR  = ',',
	TABLOCK
	);

	SET @endtime = GETDATE();
	PRINT 'LOAD DURATION:' + cast(DATEDIFF(second,@starttime,@endtime) as nvarchar) + 'seconds';
	PRINT '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';


	SET @starttime = GETDATE();
	PRINT '>>>> CLEARING DATA IN ERP LOCATION INFO TABLE';
	TRUNCATE TABLE bronze.erp_locationinfo;
	PRINT '>>>> INSERTING DATA INTO ERP LOACTION INFO TABLE';
	BULK INSERT bronze.erp_locationinfo
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR= ',',
	TABLOCK
	);
	SET @endtime = GETDATE();
	PRINT 'LOAD DURATION:' + cast(DATEDIFF(SECOND, @starttime, @endtime) as nvarchar) + 'seconds';
	print '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';



	SET @starttime = GETDATE();
	PRINT '>>>> CLEARING DATA IN ERP CATEGORY INFO TABLE';
	TRUNCATE TABLE bronze.erp_categoryinfo;
	PRINT '>>>> INSERTING DATA INTO ERP CATEGORY INFO TABLE';
	BULK INSERT bronze.erp_categoryinfo
	from 'C:\Users\srava\OneDrive\Desktop\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
	SET @endtime = GETDATE();
	print 'load duration:' + cast(datediff(second, @starttime, @endtime) as nvarchar) + 'seconds';
	print '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<';

	Set @overallendtime = GETDATE();
	print 'overall time duration:'  + CAST(DATEDIFF(SECOND, @overallstarttime, @overallendtime) as nvarchar) + 'seconds';
	print '<<<<<<<<<<<<<<<<<<<<<<<<<<<<< THE END <<<<<<<<<<<<<<<<<<<<<<<<<<<';

END
