select *
from {{ source("demo", "bike") }}
--another way to reference models from this project: ref('model file name')
