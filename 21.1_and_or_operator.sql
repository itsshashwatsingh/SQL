SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- AND & OR OPERATOR

-- and operator --> all the filter condition will get fulfill

select *
from sales_order
where prod_id = 1
and status = 'Pending'
-- here it fulfilled both the filter condition giving exact values where prod_id = 1 
-- and status is pending


-- or operator --> either one of the filter condition will get fulfill 

select *
from sales_order
where prod_id = 1
or status = 'Pending'
-- here it fulfilled the filter condition where prod_id = 1 and also end up giving status 
-- that are not pending
