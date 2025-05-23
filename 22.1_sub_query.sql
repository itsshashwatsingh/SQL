--SUB QUERY EXAMPLE

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- 7. Find the total no of orders corresponding to each delivery status by ignoring
   -- the case in delivery status. Status with highest no of orders should be at the
   -- top.


-- from Q5
select status,count(*) as status_count
from sales_order
group by status --> getting one different lowercase 'complete' seperate from 'Complete'



-- to resolve the 'Complete' and 'complete' confusion of the database we will use

-- 1st method --> using sub query


-- outer query
select status,count(*) as status_count
from sales_order
group by status

-- inner query
select status,
case when status = 'completed'
		then 'Completed'
			 else status
		end as updated_status
from sales_order
-- this will be our inner query what it basically does is it creates a table 
-- where there are two columns one is our status cloumn from sales_order table 
-- second column is our own created updated_status column that follows a case to store values
-- i.e. when status column value is 'completed' then 'Completed' will be stored in updated_status
-- else it will be stored as it is in status column


-- now lets use this as inner sub query inside our main outer query to fetch status 
-- record from updated_status column 

select updated_status as status,count(*) as status_count
from (
select status,
case when status = 'completed'
		then 'Completed'
			 else status
		end as updated_status
from sales_order)
group by updated_status
order by status_count desc


-- Q13. Identify the customers who have not purchased any product yet.

-- using sub query

-- we can use subqueries in many places(from clause,where clause,having clause,select clause, etc.)


-- inner query
select distinct customer_id
from sales_order

-- outer query
select *
from customers
where id is not in ()


-- lets join the above inner and outer query
select *
from customers
where id not in (select distinct customer_id
from sales_order)
