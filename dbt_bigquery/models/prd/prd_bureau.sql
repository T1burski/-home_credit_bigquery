with prod_bureau as (
select
  *
from {{ source('stg', 'stg_bureau') }}
)
select
*
from prod_bureau