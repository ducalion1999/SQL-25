create table January_jobs as
    select *
    FROM job_postings_fact
    WHERE 
    EXTRACT(month from job_posted_date) = 1;

create table Feb_jobs as
    select *
    FROM job_postings_fact
    WHERE 
    EXTRACT(month from job_posted_date) = 2;


create table March_jobs as
    select *
    FROM job_postings_fact
    WHERE 
    EXTRACT(month from job_posted_date) = 3;


select job_posted_date
from March_jobs
LIMIT 5;