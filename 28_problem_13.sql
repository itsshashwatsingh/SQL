SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


-- Q13. Identify the customers who have not purchased any product yet.

-- we can solve this problem using multiple methods


--1. using sub query

--2. using left join

--3. using right join

-- lets use left join method

  select c.*,so.*
  from customers c
  left join sales_order so on so.customer_id = c.id
  where so.customer_id is null



-- lets use right join method
  select c.*
  from sales_order so
  right join customers c  on so.customer_id = c.id
  where so.customer_id is null


