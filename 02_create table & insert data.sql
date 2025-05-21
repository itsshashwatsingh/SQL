create database demo;

-- creating a table

create table products
(
 	product_code	int,
	product_name	varchar(50),
	price			float,
	released_date	date
);



-- inserting data into the table

insert into products (product_code,product_name,price,released_date)
values(001,'Iphone 15 pro max',999.5,to_date('22-04-2023','dd-mm-yyyy'));
                              -- to_date function--
							  
insert into products (product_code,product_name,price,released_date)
values(002,'Iphone 15 pro',599.5,to_date('21-04-2023','dd-mm-yyyy'));

insert into products (product_code,product_name,price,released_date)
values(003,'macbook pro',1499.5,to_date('22-07-2022','dd-mm-yyyy'));

insert into products (product_code,product_name,price,released_date)
values(004,'Ipad pro max',899.5,to_date('27-01-2023','dd-mm-yyyy'));


-- viewing table 

select * from products;