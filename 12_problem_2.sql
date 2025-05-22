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

--UPPERCASE AND LOWERCASE
--this can be done using uppercase and lowercase command aswell
select upper(status),lower(status)
from sales_order 


-- using the lowercase function from above we will convert the complete 'status' column 
--to lowercase 
--then use the fiter condition not equal to lowercase 'completed'
select status 
from sales_order
where lower(status) <> 'completed' 
--all status to lowercase then compared not equal to lowercase 'completed'

--or
-- similarly using uppercase function from above

select status 
from sales_order
where upper(status) <> 'COMPLETED'
--all status to uppercase then compared not equal to uppercase 'COMPLETED'



