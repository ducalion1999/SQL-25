/*
find the count of no of remote job postings per skill
- display top 5 skills by their demand in remote jobs
- include skill id, name, count of postings requiring the skill
*/


with remote_jobs_skills as (
    SELECT skill_id,
        count(*) as no_skills
    FROM skills_job_dim as skills_to_job
        inner join job_postings_fact as job_postings on job_postings.job_id = skills_to_job.job_id
    WHERE job_postings.job_work_from_home = TRUE and job_title_short = 'Data Analyst'
    group BY skill_id
)
select skill.skill_id,
    skills as skill_name,
    no_skills
from remote_jobs_skills
    inner join skills_dim as skill on skill.skill_id = remote_jobs_skills.skill_id
order BY no_skills desc
limit 5;
