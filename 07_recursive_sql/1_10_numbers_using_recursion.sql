select * from emp_details

-- Display number the number from 1 to 10 without using any buit in functions.

with recursive cte as(

select 1 as n

union 

select n + 1
from cte
where n < 10
)

select * from cte

