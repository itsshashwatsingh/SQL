SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


-- Q17. Re-write above query so as to display only those records where the total sales
      --is above 1000


-- you might be thinking to apply where clause filter condition but that will show error
-- as the value of sales or sum we are getting is through group by function
-- to add filter condition in group by aggrigations we use 'having' clause 
-- therefore to solve this query we will use having clause


select e.name,coalesce(c.name,'_'),coalesce( sum(price * quantity),0 )as sales
from sales_order so
join products p on so.prod_id = p.id
join customers c on so.customer_id = c.id
right join employees e on so.emp_id = e.id
and status in ('Completed','completed')
group by e.name,c.name
having coalesce( sum(price * quantity),0 ) > 1000
order by 1,2