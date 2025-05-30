-- Sales Order Dataset (for problem solving)


drop table if exists products;
create table products
(
	id				int generated always as identity primary key,
	name			varchar(100),
	price			float,
	release_date 	date
);
insert into products values(default,'iPhone 15', 800, to_date('22-08-2023','dd-mm-yyyy'));
insert into products values(default,'Macbook Pro', 2100, to_date('12-10-2022','dd-mm-yyyy'));
insert into products values(default,'Apple Watch 9', 550, to_date('04-09-2022','dd-mm-yyyy'));
insert into products values(default,'iPad', 400, to_date('25-08-2020','dd-mm-yyyy'));
insert into products values(default,'AirPods', 420, to_date('30-03-2024','dd-mm-yyyy'));


drop table if exists customers;
create table customers
(
    id         int generated always as identity primary key,
    name       varchar(100),
    email      varchar(30)
);
insert into customers values(default,'Meghan Harley', 'mharley@demo.com');
insert into customers values(default,'Rosa Chan', 'rchan@demo.com');
insert into customers values(default,'Logan Short', 'lshort@demo.com');
insert into customers values(default,'Zaria Duke', 'zduke@demo.com');


drop table if exists employees;
create table employees
(
    id         int generated always as identity primary key,
    name       varchar(100)
);
insert into employees values(default,'Nina Kumari');
insert into employees values(default,'Abrar Khan');
insert into employees values(default,'Irene Costa');



drop table if exists sales_order;
create table sales_order
(
	order_id		int generated always as identity primary key,
	order_date		date,
	quantity		int,
	prod_id			int references products(id),
	status			varchar(20),
	customer_id		int references customers(id),
	emp_id			int,
	constraint fk_so_emp foreign key (emp_id) references employees(id)
);
insert into sales_order values(default,to_date('01-01-2024','dd-mm-yyyy'),2,1,'Completed',1,1);
insert into sales_order values(default,to_date('01-01-2024','dd-mm-yyyy'),3,1,'Pending',2,2);
insert into sales_order values(default,to_date('02-01-2024','dd-mm-yyyy'),3,2,'Completed',3,2);
insert into sales_order values(default,to_date('03-01-2024','dd-mm-yyyy'),3,3,'Completed',3,2);
insert into sales_order values(default,to_date('04-01-2024','dd-mm-yyyy'),1,1,'Completed',3,2);
insert into sales_order values(default,to_date('04-01-2024','dd-mm-yyyy'),1,3,'Completed',2,1);
insert into sales_order values(default,to_date('04-01-2024','dd-mm-yyyy'),1,2,'On Hold',2,1);
insert into sales_order values(default,to_date('05-01-2024','dd-mm-yyyy'),4,2,'Rejected',1,2);
insert into sales_order values(default,to_date('06-01-2024','dd-mm-yyyy'),5,5,'Completed',1,2);
insert into sales_order values(default,to_date('06-01-2024','dd-mm-yyyy'),1,1,'Cancelled',1,1);


SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

