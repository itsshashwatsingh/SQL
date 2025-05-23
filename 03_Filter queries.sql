
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

-- Aggrigation function (count , sum , avg)

-- Count function

-- to display total number of records or rows entered we can use count(*) function 

select count(*) from products -- 3 , got count of total rows entered

-- we can also use count with filter

select count(*) from products -- 1 , got count from products with price >1000
where price > 1000

-- Sum Function 
--> sum(column name of which you want total sum)

-- we can also find the sum of values in a float or int column using 'sum() function'

select sum(price) from products -- 3998 , got total price

--Avg function 
--> avg(column name of which you want average)

-- similarly , we can also find average using avg function

select avg(price) from products -- 999.5, got average of price


drop table products -- to completly delete a table from database

drop table if exists products -- this will not show error if table doesnot exist