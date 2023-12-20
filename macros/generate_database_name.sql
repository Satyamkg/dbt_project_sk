{% macro generate_database_name(custom_database_name, node) -%}

    {%- set default_database = target.database -%}
    {% do log(node, info=true) %}
    {%- if custom_database_name is none -%}
        {%- if 'analytics' in node.path -%}

            {{'analytics_sk'}}

        {%- elif 'reporting' in  node.path -%}
            {{'reporting_sk'}}      
        {%- elif 'transforming' in node.path -%}
            {{'transforming_sk'}}
        {%- elif 'staging' in node.path -%}
            {{'transforming_sk'}}

        {%- else -%}
            {{'raw_sk'}}
        {%- endif -%}

    {%- else -%}
        {{ default_database }}

    {%- endif -%}

{%- endmacro %}


