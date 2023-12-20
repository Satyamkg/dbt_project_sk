{% set sql_statement %}
    select 
        max(DATE) 
    from 
        {{ source('public', 'weather2') }}
{% endset %}
{%- set max_date_filter = dbt_utils.get_single_value(sql_statement, default="'1999-01-01'") -%}
select
    *
FROM 
    {{ source('public', 'weather2') }}
WHERE
    DATE =  '{{max_date_filter}}' 

