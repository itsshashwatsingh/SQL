SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

--Q16. Re-write the above query so as to display the total sales made by each
     --employee corresponding to each customer. If an employee has not served a
     --customer yet then display "-" under the customer.

select e.name,coalesce(c.name,'_'),coalesce( sum(price * quantity),0 )as sales
from sales_order so
join products p on so.prod_id = p.id
join customers c on so.customer_id = c.id
right join employees e on so.emp_id = e.id
and status in ('Completed','completed')
group by e.name,c.name
order by 1,2

-- here new order by functionality is used it basically orders the records such that similar 
-- value are seen together 