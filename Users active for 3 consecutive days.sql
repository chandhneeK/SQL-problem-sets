https://platform.stratascratch.com/coding/2054-consecutive-days?python=


with main as (select user_id, lag(date,1)over(partition by user_id order by date) as last, date, lead(date,1) over(partition by user_id order by date) as next from sf_events)

select distinct user_id from main where date-last = 1 AND next - date = 1;
