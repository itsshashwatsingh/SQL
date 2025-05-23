SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q5. Display the total no of orders corresponding to each delivery status

-- to solve this problem we have to use the concept of group by 
-- we will group by the status column to get distinct arrangrment of values and 
-- use count function to work along side status column group by


select status,count(*) as status_count
from sales_order 
group by status
