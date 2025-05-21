-- REMOVE DATA -> use delete command or truncate

-- to delete all the entries of table we use this

delete from products -- can also use filter queries with delete command

truncate from products -- filter queries does not work with truncate

-- if you want to delete a row of the table lets suppose 'Iphone 15 pro' row 
--use filter queries with delete command
delete from products
where product_name like '%15 pro'
-- this will delete the entries of 'Iphone 15 pro' row

-- if we want to delete all the row or records except the selected one row or record we use
-- Not like '%'
delete from products
where product_name not like 'Iphone%'
-- this will delete all row or records except 'Iphone 15 pro max' record

select * from products

