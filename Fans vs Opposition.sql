#https://platform.stratascratch.com/coding/10062-fans-vs-opposition?python=

with loves as (select employee_id, popularity , dense_rank() over (order by popularity asc, employee_id asc) as love from facebook_hack_survey),

hates as (select employee_id, popularity , dense_rank() over (order by popularity desc, employee_id asc) as hate from facebook_hack_survey)

select l.employee_id,  h.employee_id
from loves l
join hates h
on l.love = h.hate;
