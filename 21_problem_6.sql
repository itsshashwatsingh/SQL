SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q6. For orders purchasing more than 1 item, how many are still not completed?

-- here we have to show the count status where there are two filter conditions 
-- one is quantity greater than 1 and other is status not equal to completed

select count (*) as not_completed
from sales_order
where quantity > 1
and lower(status) <> 'completed'