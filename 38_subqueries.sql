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



-- scalar subquery -- returns one row and one column ex. in Q1 we used a subquery which has 
-- only one value (or one row and one column)

-- we can use subquery in different places like where, from ,join ,having ,select etc

-- ex lets use the above subquery in join of main query and try to get same result

   select emp_name,salary
from employee e
join (select avg(salary) as average_salary from employee) avg_sal
on e.salary  > avg_sal.average_salary --(here we used non-equi join condition 
--    to make the join work or it will not show any value with traditional equi join
--     on e.salary  = avg_sal.average_salary)

 -- when suquery used in join sql treats the the subquery result as a different table



-- multiple row subquery -->
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






-- corelated subquery