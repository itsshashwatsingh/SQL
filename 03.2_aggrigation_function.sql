-- AGGRIGATION FUNCTIONS (count , sum , avg , min, max)

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

select min(price) from products -- got the minimum price from price column

select max(price) from products -- got the maximum price from price column

drop table products -- to completly delete a table from database

drop table if exists products -- this will not show error if table doesnot exist