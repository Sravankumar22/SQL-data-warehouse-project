/*
data standardization
clearing empty spaces
converting shortcuts to full in gender and marital status
and inserting into silver table
*/


insert into Silver.crm_customerinfo(
customer_id,
customer_key,
customer_firstname,
customer_lastname,
customer_maritalstatus,
customer_gender,
customer_createdate 
)
select 
customer_id,
Customer_key,
trim(Customer_fistname) as customer_firstname,
trim(Customer_lastname) as customer_lastname,
Case when upper(trim(Customer_maritalstatus))= 'S' then 'single'
	when upper(trim(Customer_maritalstatus))='M' then 'Married'
	else 'N/A'
	end customer_maritalstatus,
case when Upper(trim(Customer_gender))='F' then 'Female'
	when Upper(trim(Customer_gender))='M' then 'Male'
	else 'N/A'
	end customer_gender,
customer_createdate
from Bronze.crm_customerinfo
