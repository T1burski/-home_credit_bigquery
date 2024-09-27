with prod_bureau as (
select
  *
from {{ ref('stg_bureau') }}
)
select
*
from prod_bureau