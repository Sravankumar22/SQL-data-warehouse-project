/*
creating tables for silver 
*/

create table silver.crm_customerinfo(
customer_id INT,
customer_key nvarchar(50),
customer_firstname nvarchar(50),
customer_lastaname nvarchar(50),
customer_maritalstatus nvarchar(50),
customer_gender nvarchar(50),
customer_createdate date
);

create table silver.crm_product_info (
prd_id INT,
prd_key nvarchar(50),
prd_name nvarchar(50),
prd_cost INT,
prd_line nvarchar(50),
prd_startdate date,
prd_enddate date
);

create table silver.crm_salesinfo (
sales_order_num nvarchar(50),
sales_prd_key nvarchar(50),
sales_cst_id INT,
sales_order_dt date,
sales_ship_date date,
sales_due_dt date,
sales_quant INT,
sales_price INT
);


create table silver.erp_categoryinfo(
id nvarchar(50),
CAT nvarchar(50),
SUBCAT nvarchar(50),
MAINTENANCE nvarchar(50)
);

create table silver.erp_custinfo(
cst_CID nvarchar(50),
bdate date,
cst_Gen nvarchar(15)
);

create table silver.erp_locationinfo(
CID nvarchar(50),
country nvarchar(50)
);
