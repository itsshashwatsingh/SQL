SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- HAVING CLAUSE

-- to apply filter conditions with group by aggrigations we use having clause

-- for example here is a query to fetch the total products purchased by each customer

select c.name,sum(quantity) as total_no_of_purchase
from sales_order so
join customers c on so.customer_id = c.id
group by c.name 
order by total_no_of_purchase desc

-- now i want to apply filter condition in total_no_of_purchase
-- for that we will apply having clause

select c.name,sum(quantity) as total_no_of_purchase
from sales_order so
join customers c on so.customer_id = c.id
group by c.name 
having sum(quantity) > 5
order by total_no_of_purchase desc

-- this having filter condition will only give the records of total_no_of_purchase column
-- which are grater than 5