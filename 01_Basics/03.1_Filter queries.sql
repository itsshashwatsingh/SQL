
--WHERE STATEMENTS
-- FILTER QUERIES 

--> to add filter in our queries (used with select,alter,update,delete)
--> use 'where' and add condition such as price > 1000 

-- to get the data from products where price is greater than 1000

select * from products
where price > 1000  --only got the data of macbook pro since price is greater than 1000


--to get only one column from products where price is greater than 1000
  --name of the column--
select product_name from products
where price > 1000 

-- now the same can be done with dates lets try
-- 'to_char' FUNCTION and 'extract' FUNCTION

select * from products 
where released_date = '2023' -- no this will throw an error because released_date and '2022'
--are of diffent datatypes to fix this we will use 'to_char function' to convert date to char

select * from products 
where to_char(released_date,'yyyy')='2022'

-- can perform the same filtering using 'extract function' in our query

select * from products
where extract(year from released_date) = '2022'
  --extract function--

--  ALIAS -> use 'as' command
--(to display a column with different name while applying filter query)

select product_name as xyproduct from products 
where price > 1000

-- we can apply filter conditions for row by comparisions of two columns of same table as well 

-- order_id	 amount_paid	total_amount
   --1	       100  	   100
   --2	        90	       100
   --3	       150	       140
   --4	        70	        70

-- Find orders where customer overpaid — i.e., amount_paid > total_amount
SELECT *
FROM orders
WHERE amount_paid > total_amount;

