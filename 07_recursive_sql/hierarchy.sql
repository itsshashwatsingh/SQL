-- find the hierarchy of employees under a given manager

select * from emp_details

with recursive emp_hierarchy as(

select id,name,manager_id,designation, 1 as n
from emp_details
where manager_id is null

union

select ed.id,ed.name,ed.manager_id,ed.designation , eh.n + 1
from emp_hierarchy eh
join emp_details ed on eh.id = ed.manager_id
)

select eh1.id , eh1.name , ed1.manager_id,ed1.name as manager_name,n as level
from emp_hierarchy eh1
join emp_details ed1 on eh1.manager_id = ed1.id

