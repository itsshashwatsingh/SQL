-- MODIFY DATA ->  using 'update' and 'set'



 -- we can modify the data and can make changes in values 
 -- changes are permenent once applied will reflect on actual data of the table

update products
set price = 1000
where product_name = 'Iphone 15 pro';
-- this will make realtime changes in data not just of viewing 

-- can also apply multiple changes one after the other
update products 
set price = 1200,
product_name = 'macbook air',
released_date = to_date('29-02-2020','dd-mm-yyyy')
where product_name = 'Iphone 15 pro'

-- nmake sure to add filter queries while using modify statements 
--to specify exactly which row you want to make changes 
--otherwise it will apply changes in every row 

update products 
set price = 2000
-- now all the row price turns 2000 so must specify the filter query

update products
set price = 999
where product_code = 1 -- always make sure to us unique identifiers 
--while applying filter to modify statement

-- Like '%'

-- if you are not sure about the exact name of product but want to make changes to it 
-- for that we can use like '___%' while specifying the name of identifiers

--if you know it what identifier name starts with we will use % to its end
-- product_name like 'macbook%' this will identfy the identifier we want to make changes in

update products
set price = 1200
where product_name like'Ipad%'

-- if you know the identifier name contains some character 
-- we can use '%___%' while specifying the name of identifiers
-- product_name like '%15%' this will identfy the identifier we want to make changes in
update products
set price = 1000
where product_name like '%15%'

-- similarly for end element of identifiers we use like '%___'
update products
set price = 2500
where product_name like '%pro'



select * from products