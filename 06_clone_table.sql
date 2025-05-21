select * from products

-- Clone table

--we can clone a table and its data exact copy using alias 'as' command

create table products_clone
as
select * from products
-- now we have exact copy of products table we can use as a backup

select * from products_clone -- to view the clone table

-- now i just want to clone a table columns but not its values in rows or records 
--for that we use a filter query statement 'where 1=2'

create table products_bkp
as
select * from products 
where 1 = 2 -- the logic behind using this filter statement is -> 1 = 2 is mathematically not true 
-- thus no records will be fetched because of false condition in filter query to fetch data

select * from products_bkp