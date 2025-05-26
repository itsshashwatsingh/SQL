select * from employee;
select * from department;
select * from employee_history;
select * from sales;

-- Q 1. find the employees whose salary is more than average salary earned by all employees


-- inner sub query
select avg(salary) as average_salary
from employee


-- outer main query + inner sub query
select emp_name,salary
from employee
where salary > (select avg(salary) as average_salary
from employee)


-- we have three types of sub query



--1) scalar subquery --> returns one row and one column ex. in Q1 we used a subquery which has 
-- only one value (or one row and one column)

--2) multiple row and column subquery 


--3) corelated subquery

-- we can use subquery in different places like where, from ,join ,having ,select etc

-- ex lets use the above subquery in join of main query and try to get same result

   select emp_name,salary
from employee e
join (select avg(salary) as average_salary from employee) avg_sal
on e.salary  > avg_sal.average_salary --(here we used non-equi join condition 
--    to make the join work or it will not show any value with traditional equi join
--     on e.salary  = avg_sal.average_salary)

 -- when suquery used in join sql treats the the subquery result as a different table



-- multiple row & column subquery -->
--subquery which returns multiple columns and multiple row
--subquery which returns one column and multiple rows

-- multiple columns and multiple row
-- QUESTION: Find the employees who earn the highest salary in each department. */
-- 1) find the highest salary in each department and use it as subquery.



-- inner subquery
select dept_name,max(salary) as max_sal 
from employee 
group by dept_name


-- outer main query
select emp.emp_name,d_name.*
from (select dept_name,max(salary) as max_sal 
        from employee 
          group by dept_name) d_name 
join employee emp
on emp.dept_name = d_name.dept_name
and emp.salary = d_name.max_sal

-- can also solve this by placing subquery inside the where clause filter condition

select emp_name,dept_name,salary
from employee
where (dept_name,salary) in (select dept_name,max(salary) 
                             from employee 
                             group by dept_name)


							 


-- one column and multiple rows

-- Q Find department who do not have any employees


-- inner sub query
select distinct dept_name
from employee

-- outer main query
select dept_name
from department 
where dept_name not in (select distinct dept_name
from employee)
	 
-- corelated subquery

-- A subquery which is related to the Outer query
--Q : Find the employees in each department who earn more than the average salary in that 
--department. 
  --1) find the avg salary per department
  --2) filter data from employee tables based on avg salary from above result.


-- using group by and join

-- inner sub query
select avg(salary) as avg_sal
from employee
group by dept_name


-- outer main query
select e.*
from employee e
join ( select dept_name,avg(salary) as avg_sal
from employee
group by dept_name 
)d on e.dept_name = d.dept_name
where e.salary > d.avg_sal

-- using corelated subquery

-- Insight 1 — What we don’t have:
-- We don’t have the average salary per department already stored in the table.

-- Insight 2 — How to calculate this average salary per department:

--We know this works for one known department (like HR)
select avg(salary)
from employee
where dept_name = 'HR'

-- Insight 3 — How to apply this to every row dynamically:

-- where clause can apply the filter condition on multiple row(or a whole column) so if written   
where e2.dept_name = e1.dept_name 
-- it checks if dept_name in e1 is there in dept_name in e2 
-- (which is always true since both dept_name in e1 and dept_name in e2 are same here) 
-- if yes it performs the avg(salary) 
e2.dept_name = e1.dept_name 
--is true for every row we will get avg salary of department column in each row

-- Insight 4 - applying this with filter condition that is 
-- salary > average salary of that row department

-- Final Working Query:

SELECT e1.*
FROM employee e1
WHERE e1.salary > (
  SELECT AVG(e2.salary)
  FROM employee e2
  WHERE e2.dept_name = e1.dept_name
);


-- QUESTION: Find department who do not have any employees



select dept_name
from department d
where not exists (select dept_name
                  from employee e
				  where e.dept_name = d.dept_name)

-- what suquery fetch is records that exist in both table
 where e.dept_name = d.dept_name -- checks if dept_name in employee table is there in dept_name
 -- in department table if yes it returns that department to create subquery table

-- what "not exist" does is it filters the values that not exist in subquery table
-- if there is no record of any department in  subquery table 
-- that is in department table it will filter that department out


-- nested subquery (subquery inside subquery)

--  QUESTION: Find stores who's sales where better than the average sales across all stores

      select *
      from (select store_name, sum(price*quantity) as total_sales -- this is our usual subquery
      from sales 
	  group by store_name)x
	  join(select avg(total_sales) as avg_sales -- this is our nested subquery
		 from(select store_name ,sum(price*quantity) as total_sales
         from sales 
		 group by store_name)x)y
		 on x.total_sales > y.avg_sales


-- using with clause

       with x as (select store_name, sum(price*quantity) as total_sales
                  from sales 
	              group by store_name)  -- named or repeted subquery 'x' using with clause
			                                     
		select *
      from x --called the named sub query
	  join(select avg(total_sales) as avg_sales
		   from x)y
	  on x.total_sales > y.avg_sales
 
-- we can use subquery in 
- select
- from -- previously seen
- where -- previously seen
- having

-- subquery in select clause (not recommended)

--QUESTION: Fetch all employee details and add remarks to those employees who earn 
          --more than the average pay. 


select *,
 (case when salary > (select avg(salary)from employee)
				      then 'no no no no'
				else null
				end ) as remarks
from employee

-- not recommended (as better alternative always use the subquery in join)


select *,
 (case when salary >  avg_sal.sal
	  then 'no no no no'
		else null
		end ) as remarks
from employee
cross join (select avg(salary) sal from employee) avg_sal

-- sub query in having clause

-- QUESTION: Find the stores who have sold more units than the average units 
          --sold by all stores. 

select store_name,sum(quantity)
from sales
group by store_name
having sum(quantity)>(select avg(quantity) from sales)

select avg(quantity) from sales

-- we can use sql subuery in different statements aswell such as 

insert
update
delete


-- subquery in insert
-- QUESTION: Insert data to employee history table. Make sure not insert duplicate records.


select * from employee_history


insert into employee_history
select e.emp_id,e.emp_name,d.dept_name,e.salary,d.location
from employee e
join department d on d.dept_name = e.dept_name
where not exists ( select 1 -- 1 is only for readeblity you can use any thing here like * ,' '
                  from employee_history eh
				  where eh.emp_id = e.emp_id)

				  
-- we can insert values into table using select query as well

-- we can perform joins of different table and subqueries to enter values in a table

-- here the above corelated subquery checks for repeated values ->if emp_id from employee table
-- is not there in already inserted values of emp_id in employee_history table it insert further
-- as per the not exist
-- if emp_id from employee table already exists in employee_history table it fails the 
-- not exist condition and no records will be inserted at all
-- this ensures that record only be inserted once 
-- you can check it by running the query twice
-- it will not repeat the insertion second time



-- subquery in update
-- QUESTION: Give 10% increment to all employees in Bangalore location based on the maximum
-- salary earned by an emp in each dept. Only consider employees in employee_history table.		  

update employee e
set salary = (select max(salary) + (max(salary)*0.1)
     from employee_history eh
	 where eh.dept_name=e.dept_name
	 )
where e.dept_name in (select dept_name 
                      from department 
					  where location ='Banglore')
and e.emp_id in (select emp_id from employee_history)	


-- subquery in delete                                                                                                                                                   

-- QUESTION: Delete all departments who do not have any employees. 

delete from department
where dept_name in (select dept_name
                    from department
					where dept_name not in (select distinct dept_name
					                        from employee))


-- can also write

delete from department
where dept_name in(select dept_name
                   from department d
				   where not exists(select 1
                                    from employee e
					                where e.dept_name = d.dept_name))

