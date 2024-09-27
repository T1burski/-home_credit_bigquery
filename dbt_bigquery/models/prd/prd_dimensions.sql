with prod_dimensions as (
select
  *
from {{ ref('stg_dimensions') }}
)
select
*
from prod_dimensions