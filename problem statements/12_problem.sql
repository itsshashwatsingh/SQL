SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q12. Fetch the orders which cost more than 2000 but did not include the macbook
       --pro. Print the total sale amount as well.


select so.*,(price*quantity) as total_price
from sales_order so
join products p on so.prod_id = p.id
where (price*quantity) > 2000
and lower(p.name) <> 'macbook pro'
