select * from sales;
select * from emp;

-- CTE / WITH CLAUSE

-- lets use the with clause in a basic sql query to get the basic syntax of with clause

-- Q. fetch employees who earn more than average salary of all employee


with average_salary (avg_sal) as (select avg(salary) 
                  from emp)
				 
select *
from emp e, average_salary av
where e.salary > av.avg_sal

--Q. find the store who's sales where better than average sales across all the stores

--1)find total sales per store -- total sales

select s.store_id,sum(cost * quantity) as total_sales_per_store
from sales s
group by s.store_id


--2) find the average sales of all the stores
select avg(select s.store_id,sum(cost * quantity) as total_sales_per_store
from sales s
group by s.store_id
) as avg_sales_of_all_store
from total_sales

--3)Find the stores where total_sales > Avg_sales of all stores

select *
from(select s.store_id,sum(cost * quantity) as total_sales_per_store
from sales s
group by s.store_id
)total_sales join (select avg(total_sales_per_store) as avg_sales_of_all_store
from (select s.store_id,sum(cost * quantity) as total_sales_per_store
from sales s
group by s.store_id))avg_sales
on total_sales.total_sales_per_store > avg_sales.avg_sales_of_all_store


-- very messy nested sub query and have greater run time


-- we can make make it more clean and siple using with clause

with total_sales as (select store_name,sum(cost * quantity) as total_sales_per_store
                     from sales
					 group by store_name)
					 
select * 
from total_sales ts
join (select avg(total_sales_per_store) as avg_sales_of_all_stores from total_sales)av
on ts.total_sales_per_store > av.avg_sales_of_all_stores


-- or we can move the avg_sales subquery inside or with clause

with total_sales(store_name,total_sales_per_store) as (
                                         select s.store_name,sum(cost * quantity) as total_sales_per_store
                                         from sales s
					                     group by s.store_name),
     avg_sales(avg_sales_of_all_stores) as (
	                                        select avg(total_sales_per_store) as avg_sales_of_all_stores 
	                                        from total_sales)

select *
from total_sales ts
join avg_sales avs
on ts.total_sales_per_store > avs.avg_sales_of_all_stores

