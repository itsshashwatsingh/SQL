SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- 20. Identify customers whose average purchase cost exceeds the average sale of
     --all the orders.

     -- inner sub query
     select avg(price*quantity)
	 from sales_order so
	 join products p on so.prod_id = p.id


     -- outer query + inner sub query
	 select c.name,avg(price * quantity)
	 from sales_order so
	 join customers c on so.customer_id = c.id
	 join products p on so.prod_id = p.id
	 group by c.name
	 having avg(price * quantity) > (select avg(price*quantity)
	 from sales_order so
	 join products p on so.prod_id = p.id) -- this will return our desired result