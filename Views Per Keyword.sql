# https://platform.stratascratch.com/coding/9791-views-per-keyword?python=


with master as (select unnest(string_to_array(btrim(post_keywords,'[]#'),',')) as keyword, v.viewer_id from facebook_posts p
left join facebook_post_views v
on p.post_id = v.post_id)

select keyword, count(viewer_id) from master 
group by keyword;
