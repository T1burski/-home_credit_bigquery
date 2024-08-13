with
    target as (
        select
            SK_ID_CURR
            , CAST(TARGET AS NUMERIC) AS TARGET
        from {{ source('raw', 'raw_target') }}
    )

select 
*
from target