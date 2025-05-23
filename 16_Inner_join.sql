select * from european_countries;
select * from asian_countries;

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
-- inner join joins the table on the basis of mathcing records if there is no matching records 
-- inner join will show no records (shows only intersecting value)
