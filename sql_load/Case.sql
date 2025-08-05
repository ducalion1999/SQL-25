/*
eg new columns - is to get job in NY and anywhere jobs as REMOTE
Other locations jobs will be onsite
*/

select 
   count(job_id) as no_of_jobs,
    case
        when job_location = 'Anywhere' then 'Remote'
        when job_location = 'New York, NY' then 'Local'
        else 'Onsite'
        End as location_category
from 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
group by 
    location_category;