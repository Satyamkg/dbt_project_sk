
{{ config(materialized='table') }}

with min_temp as 
(
select Location, min(cast(Replace(MaxTemp,'NA','0') as int)) as min_temp_location

from 
    {{ source('public', 'weather2') }}
GROUP BY 
    Location
)
select * from min_temp