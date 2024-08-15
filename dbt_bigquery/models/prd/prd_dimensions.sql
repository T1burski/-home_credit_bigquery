with prod_dimensions as (
select
  *
from {{ source('stg', 'stg_dimensions') }}
)
select
*
from prod_dimensions