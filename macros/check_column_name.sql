{% macro check_column_name() %}
    {% set query_to_check_column %}
			SELECT COUNT(*) AS col_count
			FROM RAW_SK.INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_SCHEMA =  'PUBLIC'
				AND TABLE_NAME = 'WEATHER2'
				AND COLUMN_NAME = 'LOCATION'
		{% endset %}
    {% set result = run_query(query_to_check_column) %}
    {% do log(node, info=true) %}
{% if execute %} 
    {% if result[0].col_count == 1 %}
        {% set col_exists = 'Albury' %}
    {% elif result[0].col_count == 0 %}
        {% set col_exists = 'Cobar' %}
    {% else %}
        {% set col_exists = 'Melbourne'%}
    {% endif %}
{% endif %}
{{ return (col_exists) }}
{% endmacro %}
