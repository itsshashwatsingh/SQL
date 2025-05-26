SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- 15. Corresponding to each employee, display the total sales they made of all the
-- completed orders. Display total sales as 0 if an employee made no sales yet.


select e.name,coalesce( sum(price * quantity),0 )as sales
from sales_order so
join products p on so.prod_id = p.id
right join employees e on so.emp_id = e.id
where status in ('Completed','completed')
group by e.name
-- here if we apply filter condition it will cancel the right join that we are appling to 
-- get the emplyee data irrespective of having no 'Completed' sales status
-- but we cant remove the condition which helps calculate only the completed sales record
-- therefore we append the condition inside the join itself


select e.name,coalesce( sum(price * quantity),0 )as sales
from sales_order so
join products p on so.prod_id = p.id
right join employees e on so.emp_id = e.id
and status in ('Completed','completed')
group by e.name -- now this will show the employee with completed status as 
-- well an not completed ones




