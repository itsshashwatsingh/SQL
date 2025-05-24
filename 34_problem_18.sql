SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q18. Identify employees who have served more than 2 customer.

select  e.name,count(distinct c.name)
from sales_order so
join customers c on so.customer_id = c.id
join employees e on so.emp_id = e.id
group by e.name
having count(distinct c.name) > 2
