-- find the hierarcy of manager for a given employee

select * from emp_details

with recursive emp_hierarchy as(

select id,name,manager_id,designation, 1 as n
from emp_details
where name = 'David'

union

select ed.id,ed.name,ed.manager_id,ed.designation , eh.n + 1
from emp_hierarchy eh
join emp_details ed on eh.manager_id = ed.id
)

select *
from emp_hierarchy 


