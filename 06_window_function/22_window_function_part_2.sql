select * from product

-- WINDOW FUNCTIONS (Part - 2)

-- FIRST_VALUE

-- Q.write query to display the most expensive product under each category 
-- (corresponding to each record)

select *,first_value(product_name)over(partition by product_category order by price desc)
from product
-- first value displays the first value of selected column in a seprate window
-- if seprated with partition it displays the first value of the partitioned row

-- LAST_VALUE 

--Q. Q.write query to display the least expensive product under each category 
-- (corresponding to each record)

select *,last_value(product_name)over(partition by product_category order by price desc)
from product
 
-- we will notice that the last value window is not at all giving the last value of the
-- partition
-- what it does instead is it fetches the last value of the current row which is set
-- in sql by defalt 
select *,last_value(product_name)over(partition by product_category order by price desc
range between unbounded preceding and current row) -- default 
from product

-- frame clause

-- we have to change this by default 'current row' setting to 'unbounded follwing'
select *,last_value(product_name)over(partition by product_category order by price desc
range between unbounded preceding and unbounded following)  
from product

-- let change the setting from range to some thing else
select *,last_value(product_name)over(partition by product_category order by price desc
rows between unbounded preceding and current row)  
from product
-- if i change the range with rows it will display the product of the same row
-- but in range when the products has same price it displays last product with that price
-- as their last_value
-- the default setting of last_value() window function is to get the last product with same price
-- in the window
-- we can do this as well
select *,last_value(product_name)over(partition by product_category order by price desc
range between 2 preceding and 2 following) 
from product
-- this will give the last_value 2 following the 2 peceding  of current value

--WINDOW CLAUSE --> alternative way to write window function
-- we can write the previous query in much clean way using window clause

select *,last_value(product_name) over w
from product
window w as (partition by product_category order by price desc range between 
2 preceding and 2 following)

-- Nth_value

-- write query to display the second most expensive product under each category

-- lets compare the first_value,last_value and nth_value side by side

select *,
first_value(product_name) over w as most_expensive_product,
last_value(product_name) over w as least_expensive_product,
nth_value(product_name,2) over w as second_most_expensive_product
from product
window w as (partition by product_category order by price desc
             range between unbounded preceding and unbounded following)

-- if written (product_name,8) it will give the null as there is no eight products
-- if not changed the default setting using frame clause we will not get our desired result

select *,
first_value(product_name) over w as most_expensive_product,
last_value(product_name) over w as least_expensive_product,
nth_value(product_name,2) over w as second_most_expensive_product
from product
window w as (partition by product_category order by price desc)

-- CUME_DIST (cumilative distributive)

-- value range --> 1 <= CUME_DIST > 0 <-- 0 to 1

-- formula = current row / total no of row

-- what cume_dist does is it fetches the decimal contribution from 0 to 1 
-- (can convert to percentage) of each row (as we can set the order of data using order by)
-- through out the entire table


-- Q. Query to fetch all products which are constituting the first 30% of the data in products
-- table based on price

select product_name,(cume_dist_percentage||'%')as cume_dist_percentage

from
(select *,cume_dist()over(order by price desc)as cume_distribution,
round(cume_dist()over(order by price desc)::numeric*100,2)as cume_dist_percentage
from product)x
where x.cume_dist_percentage<=30;

-- decimal to percentage -->

-- round(decimal value or values):: numeric*100,n ) where n is number of decimal point you want

 -- PERCENT_RANK(releative rank of the current row or percent ranking)

 -- value --> 1< = PERCENT_RANK > 0

-- formula = current row no -1 / Total no of rows -1

 -- what percent rank does is it ranks all the rows from 0 to 1 (or 0% to 100%)
 -- where first row would be 0 (0%) and last row would be 1 (100%)

 -- Q.Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared 
 -- to all product


select product_name,(percentage_rank||'%') as percentage_rank
from
( select *,
 percent_rank()over(order by price) ,
 round(percent_rank() over(order by price)::numeric*100,2)as percentage_rank
 from product)x
 where x.product_name='Galaxy Z Fold 3'


 -- this gives the percentage rank of Galaxy Z Fold 3 compared to all products