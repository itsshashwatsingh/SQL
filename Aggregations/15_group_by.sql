SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- GROUP BY FUNCTION

-- group by function works similar to distinct function to get the distinct values of the column
-- ( distinct -->to show the repeated values of column only once in column)
-- but it comes with extra feature that allows to perform aggregation functions along with it
-- aggrigation function (COUNT,SUM,AVG,MIN,MAX)
-- which is not possible with distinct

-- lets take the previous problem statement to understand this difference

select distinct status
from sales_order 
-- using distinct we got distinct values of the column status

select status
from sales_order 
group by status

-- got the same distinct values of column using group by

-- so whats the difference

-- in group by as seen in previous question we can perform aggregation functions 
-- along side those distinct arrangement

select status,count(*) as status_count
from sales_order 
group by status 
-- performed count function here along side those distinct arrangement using group by



 -- show the customers id and their name along side their total no of purchase
select so.customer_id,c.name,sum(quantity) as total_no_of_purchase
from sales_order so
join customers c on so.customer_id = c.id
group by so.customer_id,c.name 
order by so.customer_id asc
-- performed sum function here along side those distinct arrangement using group by

