
-- KEY CONSTRAINTS -> Primary key / forign key
-- we have used product_code as unique identifier 
-- but to make sure that each row has there unique value of product_code 
-- we use 'primary key constraint'


-- drop the previous table
drop table if exists products 

-- creating a new product table with primary key constraints

create table products
(
 	product_code	int primary key,
	product_name	varchar(50),
	price			float,
	released_date	date
);


-- inserting data into the table with unique product_code value on each row
-- or it will show error

insert into products (product_code,product_name,price,released_date)
values(001,'Iphone 15 pro max',999.5,to_date('22-04-2023','dd-mm-yyyy'));
                              -- to_date function--
							  
-- insert into products (product_code,product_name,price,released_date)
-- values(001,'Iphone 15 pro',599.5,to_date('21-04-2023','dd-mm-yyyy')); ---> error

insert into products (product_code,product_name,price,released_date)
values(002,'macbook pro',1499.5,to_date('22-07-2022','dd-mm-yyyy'));

insert into products (product_code,product_name,price,released_date)
values(003,'Ipad pro max',899.5,to_date('27-01-2023','dd-mm-yyyy'));


-- or we can also add primary key constraint like this

create table products
(
 	product_code	int,
	product_name	varchar(50),
	price			float,
	released_date	date,
	constraint pk_product primary key (product_code,product_name)--> two column combination of primary keys added
); -- the advantage of using this is ->
-- we can add primary keys to the combination of multiple column in our table
-- we can can set custom constraint name 
-- knowing the constraint name will be useful to later drop the primary key constraint

-- the downside of using multiple primary keys is that 
-- any one of two column combination of primary key can have similar values in there rows
-- this kills the purpose of having unique identifiers in each row
-- if both the column combination of primary key contains similar values in there rows then there will be an error


insert into products (product_code,product_name,price,released_date)
values(001,'Iphone 15 pro max',999.5,to_date('22-04-2023','dd-mm-yyyy'));
                              -- to_date function--
							  
insert into products (product_code,product_name,price,released_date)
values(001,'Iphone 15 pro',599.5,to_date('21-04-2023','dd-mm-yyyy')); ---> this will work here

insert into products (product_code,product_name,price,released_date)
values(002,'macbook pro',1499.5,to_date('22-07-2022','dd-mm-yyyy'));

insert into products (product_code,product_name,price,released_date)
values(003,'Ipad pro max',899.5,to_date('27-01-2023','dd-mm-yyyy'));


--insert into products (product_code,product_name,price,released_date)
--values(004,'macbook pro',1499.5,to_date('22-07-2022','dd-mm-yyyy'));
                                                                      ---> this will show error
--insert into products (product_code,product_name,price,released_date)
--values(004,'macbook pro',899.5,to_date('27-01-2023','dd-mm-yyyy'));




-- we can add primary key constraints using alter command as well
alter table products
add primary key (product_code)


-- we can drop the primary key constraint using alter command as well
alter table products
drop constraint pk_product -->constraint name 

-- if we are working on a very large database where we have to enter 100s of values 
-- to keep track of 100 of unique identifiers is very challenging task
-- for that we can create primary key such that primary key unique values will be added automatically
create table products
(
 	product_code	int primary key generated always as identity,
	product_name	varchar(50),
	price			float,
	released_date	date
);

insert into products (product_code,product_name,price,released_date)
values(001,'Iphone 15 pro max',999.5,to_date('22-04-2023','dd-mm-yyyy')); 
--this will show error--                          
							  
insert into products (product_code,product_name,price,released_date)
values(default,'Iphone 15 pro',599.5,to_date('21-04-2023','dd-mm-yyyy'));
--instead of adding values manually
--we have to add the primary key value default to add values automatically

insert into products (product_code,product_name,price,released_date)
values(default,'macbook pro',1499.5,to_date('22-07-2022','dd-mm-yyyy'));

insert into products (product_code,product_name,price,released_date)
values(default,'Ipad pro max',899.5,to_date('27-01-2023','dd-mm-yyyy'));



-- viewing table 

select * from products;