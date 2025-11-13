WITH TRIPS AS (
    SELECT
        ride_id,
        rideable_type,
        DATE(TO_TIMESTAMP(started_at)) as TRIP_DATE,
        start_station_id,
        end_station_id,
        member_causal,
        TIMESTAMPDIFF(second,TO_TIMESTAMP(ended_at),TO_TIMESTAMP(started_at)) as TRIP_DURATION_SECONDS
    FROM {{ source('demo', 'bike') }}
    limit 10
)
SELECT *
FROM TRIPS