#https://platform.stratascratch.com/coding/9637-growth-of-airbnb?python=

with yearly_count as (select extract(year from host_since) as year_registered, count(id) as n_hosts from airbnb_search_details group by 1)

select year_registered as year, n_hosts as current_year,
        lag(n_hosts, 1) over(order by year_registered asc) as previous_year, 
      round( ( n_hosts - lag(n_hosts, 1) over(order by year_registered asc))*100::float/lag(n_hosts, 1) over(order by year_registered asc)) as rate
from yearly_count;
