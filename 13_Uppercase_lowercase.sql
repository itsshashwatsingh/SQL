--UPPERCASE AND LOWERCASE

select upper(status),lower(status) -- gives the uppercase and lowercase output of given column
from sales_order 

-- previous question can be done using uppercase and lowercase command aswell

-- using the lowercase function from above we will convert the complete 'status' column 
--to lowercase 
--then use the fiter condition not equal to lowercase 'completed'
select status 
from sales_order
where lower(status) <> 'completed' 
--all status to lowercase then applied filter not equal to lowercase 'completed'

--or
-- similarly using uppercase function from above

select status 
from sales_order
where upper(status) <> 'COMPLETED'
--all status to uppercase then applied filter not equal to uppercase 'COMPLETED'


