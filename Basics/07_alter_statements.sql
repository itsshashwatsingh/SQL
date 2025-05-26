
select * from products_clone
select * from products_bkp


-- ALTER STATEMENT
-->to modify table
-- we have deleted the products table using drop command
-- now we want our products_clone to be our products table (rename the products_clone table to products)

alter table products_clone rename to products

-- we can do more than just rename a table using alter command
-- like rename a column

alter table products rename column product_name to product_id

-- modifying the datatype of a column of the table

alter table products alter column product_code type float
-- here now decimal values can be stored in product_code

select * from products