select * from european_countries;
select * from asian_countries; -- turkey and russia are two matching values from both table

-- INNER JOIN

-- understanding inner join using countries dataset

-- find the countries present in both asia and europe 

select *
from european_countries ec
inner join asian_countries ac on ac.country = ec.country

--when written just join it refers inner join
select *
from european_countries ec
join asian_countries ac on ac.country = ec.country;
--(inner join)

-- lets delete some records and check what changes it does to inner join table

delete from european_countries
where country = 'Turkey'  -- this will remove Turkey row from inner join table as well
-- since Turkey is an intersecting record

delete from asian_countries
where country = 'India'   -- this will cause no change since India is not an intersecting record

delete from european_countries
where country = 'Russia'  -- this will remove Russia row from inner join table as well
-- since Russia is an intersecting record

-- this concludes that
-- inner join joins the table on the basis of matching records if there is no matching records 
-- inner join will show no records (shows only intersecting values)

drop table european_countries
drop table asian_countries

-- LEFT JOIN = inner join + all records from left table (european_countries table)

select * from european_countries;
select * from asian_countries; -- turkey and russia are two matching values from both table

-- lets explore the left join

select *
from european_countries ec
left join asian_countries ac on ec.country = ac.country;
-- what we got is all the countries from left table (european_countries) on the left side
-- and only the matching countries (that are common on both left and right table) on right side.
-- except the matching countries i.e. turkey and russia all other records on left side is null
-- if there were no matching values i.e. turkey and russia all the records on the right side
-- should have been null

-- RIGHT JOIN = inner join + all records from right table (asian_countries table)

select * from european_countries;
select * from asian_countries; -- turkey and russia are two matching values from both table

-- lets explore the right join

select *
from european_countries ec
right join asian_countries ac on ec.country = ac.country;

-- what we got is only the matching countries (that are common on both left and right table) on
-- the left side  except the matching countries i.e. turkey and russia all other records on 
-- left side is null
-- and all the countries from right table (asian_countries) on the right side
-- if there were no matching values i.e. turkey and russia all the records on the left side
-- should have been null



