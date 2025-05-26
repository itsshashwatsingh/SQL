SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q11. Fetch all the orders which were neither completed/pending or were handled by
      --the employee Abrar. Display employee name and all details of order.

	  select e.name,so.*
	  from sales_order so
	  join employees e on so.emp_id = e.id
	  where status not in ('Completed','completed','Pending')
	  or e.name = 'Abrar Khan'