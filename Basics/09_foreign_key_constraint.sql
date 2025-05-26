-- FOREIGN KEY CONSTRAINT

-- lets create another table to get an understanding of foriegn key constraint

-- foreign key from child table
create table sales_order
(
order_id    int generated always as identity primary key,
order_date	date,
quantity 	int,
prod_id 	int references products(product_code),
--prod_name	varchar(50) references products(product_name),-->can add multiple foreign keys is product_name is 'unique constraint'
status		varchar(30)
);--here foreign key constraint on prod_id and prod_name does not allow to add the values 
--that is not in product_code and product_name column of product table


insert into sales_order (order_id,order_date,quantity,prod_id,status)
values (default,to_date('01-01-2024','dd-mm-yyyy'),2,1,'completed')

insert into sales_order (order_id,order_date,quantity,prod_id,status)
values (default,to_date('06-04-2024','dd-mm-yyyy'),2,2,'completed')

insert into sales_order (order_id,order_date,quantity,prod_id,status)
values (default,to_date('02-01-2023','dd-mm-yyyy'),2,5,'completed')--> this will not work since
-- 5 as product_code value does not exists and as per the foreign key constraint it will show error

insert into sales_order (order_id,order_date,quantity,prod_id,status)
values (default,to_date('21-01-2022','dd-mm-yyyy'),2,3,'completed')


-- can also write foreign key constraint like this


create table products --> parent table
(
 	product_code	int primary key generated always as identity,
	product_name	varchar(50),
	price			float,
	released_date	date,
);
insert into products (product_code,product_name,price,released_date)
values(default,'Ipad pro max',899.5,to_date('27-01-2023','dd-mm-yyyy'));





create table sales_order -->child table
(
order_id    int generated always as identity primary key,
order_date	date,
quantity 	int,
prod_id 	int,
status		varchar(30),
constraint fk_customer 
	foreign key (prod_id) references products(product_code)
	on delete cascade  -->this will delete the value from child if delete from parent
	on update set null -->this will set the value to null in child if updated in parent
);
insert into sales_order (order_id,order_date,quantity,prod_id,status)
values (default,to_date('01-01-2024','dd-mm-yyyy'),2,1,'completed')




select * from products
select * from sales_order
drop table sales_order