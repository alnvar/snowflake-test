WITH CTE AS (
    SELECT *
    FROM {{ ref('trip_fact') }} T
        LEFT JOIN {{ ref('daily_weather') }} W
            ON T.TRIP_DATE = W.daily_weather
    ORDER BY TRIP_DATE DESC
    --LIMIT 10
)
SELECT *
FROM CTE