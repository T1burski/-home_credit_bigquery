with facts as (
  select
    *
  from {{ ref('prd_facts') }}
),
dimensions as (
  select
    *
  from {{ ref('prd_dimensions') }}
),
targets as (
  select
    *
  from {{ ref('prd_target') }}
),
bureau_treated as (
  select
    *
  from {{ ref('prd_bureau_credit_info') }}
)
select
  facts.SK_ID_CURR,
  facts.* except (SK_ID_CURR),
  dimensions.* except (SK_ID_CURR),
  targets.* except (SK_ID_CURR),
  bureau_treated.* except (SK_ID_CURR)
from facts
left join dimensions
on facts.SK_ID_CURR = dimensions.SK_ID_CURR
left join targets
on facts.SK_ID_CURR = targets.SK_ID_CURR
left join bureau_treated
on facts.SK_ID_CURR = bureau_treated.SK_ID_CURR