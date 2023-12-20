{{ config(materialized='table') }}

with source_data as (

    select * from {{ source('public', 'weather2') }}
    where
    Location = '{{check_column_name()}}'
)
select *
from source_data