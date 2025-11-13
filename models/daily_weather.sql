WITH CTEDW AS (
    SELECT
        DATE(time) as daily_weather,
        weather,
        temp,
        pressure,
        humidity,
        clouds
    FROM {{ source('demo', 'weather') }}
),
CTEAGG AS (
    SELECT
        daily_weather,
        weather,
        //count(weather),
        //ROW_NUMBER() OVER (PARTITION BY  daily_weather ORDER BY COUNT(WEATHER) DESC ) AS row_number
        ROUND(AVG(temp), 2) as avg_temp,
        ROUND(AVG(pressure), 2) as avg_pressure,
        ROUND(AVG(humidity), 2) as avg_humidity,
        ROUND(AVG(clouds), 2) as avg_clouds,
    FROM CTEDW
    GROUP BY daily_weather, WEATHER
    qualify ROW_NUMBER() OVER (PARTITION BY  daily_weather ORDER BY COUNT(WEATHER) DESC ) = 1
)
SELECT *
FROM CTEAGG