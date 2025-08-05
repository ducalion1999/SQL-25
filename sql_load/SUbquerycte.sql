SELECT
    company_id,
    name as company_name
FROM
    company_dim
WHERE company_id in (
    select 
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
    order BY
        company_id
);


/* find the comapnies with most jobs 
*/


with company_job_count as (

select 
   company_id,
    count(*) as total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

select
    company_dim.name as company_name,
    company_job_count.total_jobs 
from
    company_dim
left join company_job_count on company_job_count.company_id = company_dim.company_id 
order by total_jobs desc;