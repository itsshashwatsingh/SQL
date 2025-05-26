SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q8. Write a query to identify the total products purchased by each customer

select c.name,sum(quantity) as total_no_of_purchase
from sales_order so
join customers c on so.customer_id = c.id
group by c.name 
order by total_no_of_purchase desc