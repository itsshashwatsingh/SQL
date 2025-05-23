SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- 7. Find the total no of orders corresponding to each delivery status by ignoring
   -- the case in delivery status. Status with highest no of orders should be at the
   -- top.

-- 2nd method --> using lower case
select lower(status) as status , count(*) as status_count
from sales_order
group by lower(status)
order by status_count desc











