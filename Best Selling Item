#https://platform.stratascratch.com/coding/10172-best-selling-item?python=

with main as (select extract(Month from invoicedate) as month, description, sum(unitprice*quantity) as total_invoice from online_retail
group by 1,2
order by 1,2)

,main2 as (select *, rank() over(partition by month order by total_invoice desc) as rank from main)

select month, description, total_invoice from main2 where rank = 1;
