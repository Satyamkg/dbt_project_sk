{{ config(materialized='table') }}

-- Define a new field for DBT_VALID_FROM
SELECT *,
       CURRENT_TIMESTAMP AS updated_at

FROM 
    {{ source('public', 'weather2') }}
