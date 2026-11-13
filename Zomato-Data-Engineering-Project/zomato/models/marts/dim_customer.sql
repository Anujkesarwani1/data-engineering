-- This model creates a dimension table for customers, including their demographic information and age segmentation.

select
customer_id,
customer_name,
email,
age,
CASE when age < 25 then 'Gen Z'
     when age < 40 then 'Millennial'
     when age < 55 then 'Gen X'
     when age is NULL then 'Unknown'
     else 'Boomer'
END as age_segment,
gender,
marital_status,
occupation,
income_band,
education,
family_size
from {{ ref('stg_users') }}