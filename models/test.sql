select *
from {{ source("demo", "bike") }}
--from {{ ref('model file name') }}
--limit 10
