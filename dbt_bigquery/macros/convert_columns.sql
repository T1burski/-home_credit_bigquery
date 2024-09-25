{% macro convert_to_numeric_except(source_schema, source_table, exceptions) %}
    {% set columns = adapter.get_columns_in_relation(source(source_schema, source_table)) %}
    {% set column_expressions = [] %}
    
    {% set exception_columns = exceptions.split(',') %}  {# Usando um método diferente para dividir a string #}

    {% for column in columns %}
        {% if column.name not in exception_columns %}
            {% if column.data_type == 'STRING' %}
                {% do column_expressions.append('SAFE_CAST(' ~ column.name ~ ' AS FLOAT64) AS ' ~ column.name) %}
            {% else %}
                {% do column_expressions.append(column.name) %}
            {% endif %}
        {% else %}
            {% do column_expressions.append(column.name) %}
        {% endif %}
    {% endfor %}

    {% do log('Generated column expressions: ' ~ (column_expressions | join(', ')), info=True) %}

    {{ column_expressions | join(', ') }}
{% endmacro %}

