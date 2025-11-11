--finding the null and duplicate values

select 
customer_id,
count(*) as flagnumber
from Bronze.crm_customerinfo
group by customer_id
having count(*)>1 OR customer_id=null;

----for finding values with empty spaces for customer firstname, customer latsname and the customer gender

select 
Customer_fistnamex
from Bronze.crm_customerinfo
where Customer_fistname!= trim(Customer_fistname);

