SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q3. Display the order id, order_date and product_name for all the completed orders.

-- since the question has asked to show the data from two different table 
-- that is order_id and order_date from sales_order table 
-- and product_name is only given in product table 
-- and filter of status from sales_order table
-- to fetch the data from different table
-- we have to use the concept of inner join

select order_id,order_date,name
from sales_order so
join products p on p.id = so.prod_id
where status in ('Completed','completed') 

-- here to join two table we used products table 'id' and sales order table 'prod_id' 
-- as common intersecting point of join
-- we have taken 'so' refering to sales_order table and 'p' refering to product table
-- 'p.id' refering 'id' column from product table  
-- and 'so.prod_id' refering to 'prod.id' column from sales order table