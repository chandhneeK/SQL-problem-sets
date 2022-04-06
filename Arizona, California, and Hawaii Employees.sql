# https://platform.stratascratch.com/coding/9918-arizona-california-and-hawaii-employees?python=

with arizona as (select first_name, row_number() over(order by first_name) as number
from employee
where city = 'Arizona'),
california as (select first_name, row_number() over(order by first_name) as number
from employee
where city = 'California'),
hawaii as (select first_name, row_number() over(order by first_name) as number
from employee
where city = 'Hawaii')

select a.first_name as arizona, c.first_name as california, h.first_name as hawaii
from arizona a
full outer join hawaii h
on a.number = h.number
full outer join california c
on h.number = c.number
