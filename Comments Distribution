#https://platform.stratascratch.com/coding/10297-comments-distribution?python=

select c.user_id,c.created_at, u.joined_at
from fb_comments c
join fb_users u
on c.user_id = u.id
AND c.created_at > u.joined_at
AND extract (YEAR from u.joined_at) between 2018 AND 2020
AND c.created_at between '2020-01-01' AND '2020-01-31';
