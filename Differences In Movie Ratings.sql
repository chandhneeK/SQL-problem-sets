# with lifetime as (select name, avg(rating) as lifetime_rating from nominee_filmography
where rating IS NOT NULL AND role_type = 'Normal Acting'
group by 1),

ranked as ( select name, rating, rank() over(partition by name order by id desc) as rank from nominee_filmography where rating IS NOT NULL AND role_type = 'Normal Acting' ),

second as (select name, rating as second_rating from ranked where rank =2)

select a.name, lifetime_rating, second_rating, -(lifetime_rating - second_rating) from lifetime a
join second b
on a.name = b.name
order by 1;
