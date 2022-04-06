# https://platform.stratascratch.com/coding/9784-time-between-two-events?python=

with master as (select a. user_id ,a.timestamp as ld_ts, b.timestamp as sc_ts, (b.timestamp - a.timestamp)::TIME as duration, rank() over(order by (b.timestamp - a.timestamp)::TIME asc) as rank
from facebook_web_log a
join facebook_web_log b
on a.user_id = b.user_id
AND a.action = 'page_load'
AND b.action = 'scroll_down'
AND b.timestamp > a.timestamp
)

select user_id, ld_ts, sc_ts, duration, rank
from master
where rank = 1
;
