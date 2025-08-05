/*
 combine tables with similar columns and row by ROW - WISE, we can use UNION (MUST have same number of columns)
 - it removes all duplicate rows as well
*/

select 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

select 
    job_title_short,
    company_id,
    job_location
FROM
    feb_jobs

UNION

select 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

/* Union all - return all rows (includes duplicates)