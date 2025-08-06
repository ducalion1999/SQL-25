/*
most optimal skill to learn high demand and high pay
*/

with skill_demand as (
SELECT
    skills_dim.skills,
    skills_dim.skill_id,
    count(skills_job_dim.job_id) as demand_count
FROM
    job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' and job_work_from_home = True and salary_year_avg is not null
group by 
    skills_dim.skill_id
),
 avg_salary as (
SELECT
    skills_dim.skills,
    skills_dim.skill_id,
    round(avg(salary_year_avg),0) as avg_salary
FROM
    job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' and salary_year_avg is not null
    and job_work_from_home = True
group by 
    skills_dim.skill_id
)

select
    skill_demand.skill_id,
    skill_demand.skills,
    demand_count,
    avg_salary
from 
    skill_demand
inner join avg_salary on skill_demand.skill_id = avg_salary.skill_id
where 
    demand_count > 10
order by 
    avg_salary DESC,
    demand_count DESC
limit 15;

-- 2nd way to write it --

select 
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.skill_id) as demand_count,
    round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst' and salary_year_avg is not null and job_work_from_home = True
group by
    skills_dim.skill_id
having 
    count(skills_job_dim.skill_id) > 10
order by 
    avg_salary desc,
    demand_count desc
limit 15;