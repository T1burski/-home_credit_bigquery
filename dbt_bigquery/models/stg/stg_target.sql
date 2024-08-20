with
    target as (
        select
            SK_ID_CURR
            , TARGET
        from {{ source('raw', 'raw_target') }}
    )

select 
*
from target