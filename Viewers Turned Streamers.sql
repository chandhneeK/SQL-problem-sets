with ranked as( select *, rank() over(partition by user_id order by session_start asc) as rank from twitch_sessions),

viewers as (select user_id from ranked where rank = 1 AND session_type = 'viewer')

select user_id, count(session_id) from twitch_sessions where user_id in (select * from viewers) AND session_type ='streamer' group by 1;
