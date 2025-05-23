SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q4. Sort the previous query to show the earliest orders at the top. Also display the
     --customer who purchased these orders.

-- previous query

select order_id,order_date,name
from sales_order so
join products p on p.id = so.prod_id
where status in ('Completed','completed') 

-- to sort this query we will use order by function
-- we will apply order by in ascending order on order_date column   

select order_id,order_date,name
from sales_order so
join products p on p.id = so.prod_id
where status in ('Completed','completed') 
order by order_date asc
-- date sorted in ascending order

-- now to display customer name we will add inner join query with customers table 

select order_id,order_date,p.name as product_name,c.name as customer_name
from sales_order so
join products p on p.id = so.prod_id
join customers c on so.customer_id = c.id -- here sales_order table 'customer_id' column 
where status in ('Completed','completed')     --is same as customers table 'id' column
order by order_date asc