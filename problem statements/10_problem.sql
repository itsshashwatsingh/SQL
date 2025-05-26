SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q10. Display the customer name, employee name and total sale amount of all
       --orders which are either on hold or pending.


select c.name as customer_name,e.name as employee_responsible,sum(price*quantity) as total_sale_amount
from sales_order so
join customers c on so.customer_id = c.id
join employees e on so.emp_id = e.id
join products p on so.prod_id = p.id
where so.status in ('On Hold','Pending')
group by c.name,e.name
