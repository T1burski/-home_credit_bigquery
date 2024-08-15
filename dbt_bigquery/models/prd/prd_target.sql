with prod_target as (
select
  *
from {{ source('stg', 'stg_target') }}
)
select
*
from prod_target