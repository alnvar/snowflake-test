WITH BIKE AS (
    SELECT
        start_station_id,
        start_station_name,
        start_lat,
        start_lng
    FROM {{ source('demo', 'bike') }}
    //WHERE 
    //limit 10
)
SELECT *
FROM BIKE