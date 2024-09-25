with facts as (
    select
        {% set excluded_columns = 'SK_ID_CURR, OCCUPATION_TYPE,WEEKDAY_APPR_PROCESS_START,ORGANIZATION_TYPE' %}
        {% set converted_columns = convert_to_numeric_except('raw', 'raw_facts', excluded_columns) %}
        {{ converted_columns }}
    from {{ source('raw', 'raw_facts') }}
)

select 
    *
from facts

