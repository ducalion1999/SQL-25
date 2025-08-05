/*
find job postings in 1 quater that have salary > 70000
*/
select 
    q1_job_postings.job_title_short,
    q1_job_postings.job_location,
    q1_job_postings.job_via,
    q1_job_postings.job_posted_date::DATE,
    q1_job_postings.salary_year_avg
    FROM (
SELECT *
    from january_jobs
    union ALL
    select * FROM feb_jobs
    union ALL
    select * from march_jobs
) as q1_job_postings
WHERE 
    q1_job_postings.salary_year_avg > 70000
    AND
    q1_job_postings.job_title_short = 'Data Analyst';