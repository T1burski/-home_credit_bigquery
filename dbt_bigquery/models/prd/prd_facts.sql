with prod_facts as (
select
  *
from {{ ref('stg_facts') }}
)
select
*
from prod_facts