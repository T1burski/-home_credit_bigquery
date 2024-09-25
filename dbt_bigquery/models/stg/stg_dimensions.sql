with
    dimensions as (
        select
            SK_ID_CURR
            , CODE_GENDER
            , FLAG_OWN_CAR
            , FLAG_OWN_REALTY
            , CAST(CNT_CHILDREN AS INT64) AS CNT_CHILDREN
            , NAME_CONTRACT_TYPE
            , NAME_TYPE_SUITE
            , NAME_INCOME_TYPE
            , NAME_EDUCATION_TYPE
            , NAME_FAMILY_STATUS
            , NAME_HOUSING_TYPE
        from {{ source('raw', 'raw_dimensions') }}
    )

select 
*
from dimensions