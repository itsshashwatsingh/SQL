SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q19. Identify the customers who have purchased more than 5 products

select c.name,sum(quantity) as total_purchase
from sales_order so
join customers c on so.customer_id = c.id
join products p on so.prod_id = p.id
group by c.name
having sum(quantity) >5