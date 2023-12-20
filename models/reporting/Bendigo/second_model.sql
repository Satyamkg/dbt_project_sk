{{ config(materialized='table') }}

with source_data2 as (

    select * from {{ source('public', 'weather2') }}
    where Location = 'Bendigo'

)
select *
from source_data2