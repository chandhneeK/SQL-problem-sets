#https://platform.stratascratch.com/coding/9899-percentage-of-total-spend?python=

with total as (select cust_id, sum(total_order_cost) as totals
from orders
group by 1)

select c.first_name, o.order_details, o.total_order_cost::float /totals as perc
from orders o
join total p
on o.cust_id = p.cust_id
join customers c
on p.cust_id = c.id
order by 1,2;
