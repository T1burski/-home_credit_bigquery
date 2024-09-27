with prod_target as (
select
  *
from {{ ref('stg_target') }}
)
select
*
from prod_target