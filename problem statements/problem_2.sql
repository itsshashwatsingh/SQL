SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


-- Q2. Other than Completed, display the available delivery status's

select status 
from sales_order
where status not like 'Completed'



--or
select status
from sales_order
where status <> 'Completed' -- '<>' means not equal to can also write '!='

--or

select distinct status
from sales_order
where status != 'Completed' -- 'distinct' will show the repeated values only once

--or 

select status 
from sales_order
where status not in ('Completed','completed') 
-- this will check for both uppercase 'Completed' and lower case 'completed'


