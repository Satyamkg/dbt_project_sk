{{ config(materialized='table') }}



with max_temperature as 
(
select Location, max(cast(Replace(MaxTemp,'NA','0') as int)) as max_temp_location

from 
    {{ source('public', 'weather2') }}
GROUP BY 
    Location
)
select * from max_temperature