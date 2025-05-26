SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q14. Write a query to identify the total products purchased by each customer.
      --Return all customers irrespective of wether they have made a purchase or not.
      --Sort the result with highest no of orders at the top.

-- we will use full join to get all customers irrespective of wether they have made a purchase 
-- or not.
select c.name,coalesce (sum(quantity),0) as total_purchase
from sales_order so
full join customers c on so.customer_id = c.id
group by c.name
order by total_purchase desc

-- coalesce function takes argument and pass the argument based on value is null or not
-- it returns 0 at the null value  , if not null it returns the aggrigation or any task given
