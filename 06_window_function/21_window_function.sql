
select * from employee


-- WINDOWS FUNCTION

-- OVER() -->

-- lets find the max salary out of all employees

select max(salary) as max_salary
from employee 

-- but now i want to display this max_salary with rest of the employee data
-- for that "over()" window function is used

		--over() here is our window function --  
select *,max(salary) over() as max_salary
from employee
-- this will display the max salary out of all employee with rest of employee data in a seprate
-- window or column

-- now i want to display the max salary corresponding to each department 
-- which can be done with group by 
-- but i want to display the same with rest of the employees data
-- for that we can add partition to our window function

select *,max(salary) over(partition by dept_name) as max_salary
from employee
-- this will display the max salary corresponding to each department
-- with rest of the employees data

--ROW_NUMBER() -->

-- now instead of max_salary i want to display the row_number of each employee 
-- with rest of the employee data
-- for that we can use row_number window function

select * , row_number() over() 
from employee 
-- this will give the row number to employee table

-- now i want the row number seprated department wise

select *, row_number() over(partition by dept_name)
from employee
-- this will give row number seprated department wise

-- i noticed the sorting of emp_id inside each seprated department is not right 
select *,row_number() over(partition by dept_name order by emp_id)
from employee
-- for that we can use order by inside over() window function

-- now i want to display the first two employees based on row number from each department 

select * from 
(select *,row_number()over (partition by dept_name order by emp_id) rn
from employee) x
where x.rn < 3

-- RANK() -->

-- now i want to rank the employee based on their salary in their department 
-- instead of row_number column
-- the employee with the highest salary in the department will be at the top with rank 1
-- lowest salary in the department  at the bottom rank
-- two people with same salary in the department will be given same rank
-- for this type of ranking we use rank() window function

select *, rank() over(partition by dept_name order by salary desc)
from employee
-- now based on rank i want only top 3 employees of each department

select * from 
(select *, rank() over(partition by dept_name order by salary desc) as rnk
from employee) x
where x.rnk < 4


-- DENSE RANK() -->

-- lets try and compare rank() and dense rank() side by side


select *, rank() over(partition by dept_name order by salary desc),
dense_rank() over(partition by dept_name order by salary desc)
from employee

-- what we will notice is that in rank() is the ranking number after the repeated ranking number 
-- is not correct it skips the next rank number after the repeated rank
-- but in dense-rank() the ranking is more precise it does not skips the ranking number
-- after the repeated rank

-- compairing rank() ,dense_rank() and row_number()


select *, rank() over(partition by dept_name order by salary desc),--repeat the same ranking for 
                                                                    --same salary but skips 
															        --the rank that comes after

dense_rank() over(partition by dept_name order by salary desc),--more precise than rank() 
                                                               --with repated ranking and 
															   --what rank comes after 

row_number() over(partition by dept_name order by salary desc)-- does not do the rank 
                                                              --repeatition, assign
from employee												  --the number ranking row number
															  -- wise									


-- Lead() & Lag()

--lag() ->it displays the values previous to current row value of that row in windows column

--lead() ->it displays the values next to current row value of that row in windows column

select * ,lag(salary)over(partition by dept_name order by emp_id)
,lead(salary)over(partition by dept_name order by emp_id)
from employee

-- we can also set the range of lag & lead and can set a value in place of null as well

select * ,lag(salary,2,0)over(partition by dept_name order by emp_id)
,lead(salary,3,0)over(partition by dept_name order by emp_id)
from employee


-- Q. fetch a query to display if the salary of current employee is higher,lower or equal to the
-- previous employee

select * ,lag(salary)over(partition by dept_name order by emp_id) as previous_sal,
case when salary < lag(salary)over(partition by dept_name order by emp_id) 
     then 'lower'
	 when salary > lag(salary)over(partition by dept_name order by emp_id)
	 then 'higher'
	  when salary = lag(salary)over(partition by dept_name order by emp_id)
	 then 'equal'
	 end sal_range

from employee
