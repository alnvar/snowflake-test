WITH CTE AS (
    SELECT
        DATE(TO_TIMESTAMP(STARTED_AT)),
        MONTH(TO_TIMESTAMP(STARTED_AT)),
        {{GET_DAYTYPE('STARTED_AT')}},
        {{GET_SEASON('STARTED_AT')}},
        {{GET_ACTUALDATE('STARTED_AT')}}
        --ROW_NUMBER() OVER (PARTITION BY 1 ORDER BY 1 ASC) AS rn
    FROM {{ source('demo', 'bike') }}

)
SELECT *
FROM CTE