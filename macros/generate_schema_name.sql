
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {% do log(node, info=true) %}
    {%- if custom_schema_name is none -%}
        {{ default_schema }}

    {%- else -%}

        {%- if target.name == 'prod' -%}

            {{ custom_schema_name | trim }}

        {%- elif target.name == 'test' -%}

            {{ custom_schema_name | trim }}
        {%- elif target.name == 'dev' -%}
            {{'DEV'}}_{{custom_schema_name}}
            

        {%- else -%}

            {{ default_schema | upper }}_{{custom_schema_name | trim}}_{{'new'}}

        {%- endif -%}

    {%- endif -%}

{%- endmacro %}



