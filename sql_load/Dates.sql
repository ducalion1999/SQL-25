select job_posted_date
from job_postings_fact
limit 10;

Select job_posted_date at time zone 'UTC' at Time zone 'EST' as date_time,
    EXTRACT(Month from job_posted_date) as date_month
FROM job_postings_fact;

select 
    COUNT(job_id),
    extract(month from job_posted_date) as date_month
from 
    job_postings_fact
where 
    job_title_short = 'Data Analyst'
GROUP BY
    date_month
order BY
    date_month;
