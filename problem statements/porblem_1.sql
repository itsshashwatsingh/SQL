-- PROBLEM STATEMENTS (for practical concept learning)

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- Q1. Identify the total no. of products that has been sold ?

-- since we are asked to find the total no. of products that has been sold 
-- not the total no. of products 
-- therefore we will be using sales_order table to find the no. of sold products
-- not the products table
-- to find the total no. of products sold we pick quantity column from sales_order table 
-- and find the sum of quantity from sale_order(since it describes the quantity of sales done)


--solution
select sum(quantity) as total_no_of_products_sold from sales_order
