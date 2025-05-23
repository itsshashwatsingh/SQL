SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q9. Display the total sales and average sales done for each day.

select order_date,sum(price * quantity) as total_sales,avg(price * quantity) as average_sales
from sales_order so
join products p on so.prod_id = p.id
group by order_date
order by order_date asc


