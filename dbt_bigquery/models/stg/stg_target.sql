with
    target as (
        select
            SK_ID_CURR
            , CAST(TARGET AS INT64) AS TARGET
        from {{ source('raw', 'raw_target') }}
    )

select 
*
from target