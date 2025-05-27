SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- ORDER BY --> ASCENDING / DESCENDING


-- ascending order by
select * from sales_order
order by quantity asc --> this will sort the order_sales table on the basis of 
                       -- ascending order of quantity sold

-- descending order by
select * from products 
order by price desc --> this will sort the products table on the basis of 
                     -- descending order of price sold
					 -- highest to lowest