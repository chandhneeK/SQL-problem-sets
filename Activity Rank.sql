#https://platform.stratascratch.com/coding/10351-activity-rank?python=

select from_user, count(id) as sent_number, rank() over(order by count(id) desc,from_user asc) as rank
from google_gmail_emails
group by from_user;
