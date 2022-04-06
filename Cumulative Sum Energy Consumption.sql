#https://platform.stratascratch.com/coding/10084-cum-sum-energy-consumption?python=

with master as (select * from fb_eu_energy
Union All
select * from fb_na_energy
Union All
select * from fb_asia_energy),

date_con as (select date, sum(consumption) as consumption
from master
group by 1
order by date asc),
c as (select date, sum(consumption) over(order by date
range between unbounded preceding and current row
) as cum_sum
from date_con
order by date asc)
select date, cum_sum, round(cum_sum::float/(select max(cum_sum)from c)*100)
from c
order by date asc;
