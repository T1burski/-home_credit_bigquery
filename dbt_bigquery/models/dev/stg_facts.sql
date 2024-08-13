with
    facts as (
        select
            *
        from {{ source('raw', 'raw_facts') }}
    )

select 
*
from facts