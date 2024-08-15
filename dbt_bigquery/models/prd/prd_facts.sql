with prod_facts as (
select
  *
from {{ source('stg', 'stg_facts') }}
)
select
*
from prod_facts