# https://platform.stratascratch.com/coding/9898-unique-salaries?python=

with master as (select department, salary , dense_rank() over(partition by department order by salary desc) as rank
from twitter_employee)

select distinct department, salary
from master
where rank <=3;
