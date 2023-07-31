WITH PrecipitationSnowDays AS (
    SELECT
        date,
        precipitation,
        snow_fall
    FROM {{ ref('stg__central_park_weather') }}
    WHERE precipitation > 0 OR snow_fall > 0
),
BikeTripsPerDay AS (
    SELECT
        date_trunc('day', started_at_ts) AS date,
        count(*) AS total_trips
    FROM {{ ref('mart__fact_all_bike_trips') }}
    GROUP BY date_trunc('day', started_at_ts)
),
BikeTripsWithLag AS (
    SELECT 
        date_trunc('day', started_at_ts) AS date,
        count(*) AS num_trips,
        LAG(count(*)) OVER (ORDER BY date_trunc('day', started_at_ts)) AS prev_num_trips,
        LEAD(count(*)) OVER (ORDER BY date_trunc('day', started_at_ts)) AS next_num_trips,
        LAG(date_trunc('day', started_at_ts)) OVER (ORDER BY date_trunc('day', started_at_ts)) AS prev_date,
        LEAD(date_trunc('day', started_at_ts)) OVER (ORDER BY date_trunc('day', started_at_ts)) AS next_date
    FROM {{ ref('mart__fact_all_bike_trips') }}
    GROUP BY date_trunc('day', started_at_ts)
)
SELECT 
    AVG(CASE WHEN bt.date = psd.date THEN bt.num_trips END) AS avg_trips_on_precip_snow_day,
    AVG(CASE WHEN bt.prev_date = psd.date - INTERVAL '1 day' THEN bt.prev_num_trips END) AS avg_trips_before_precip_snow,
    AVG(CASE WHEN bt.next_date = psd.date + INTERVAL '1 day' THEN bt.next_num_trips END) AS avg_trips_after_precip_snow
FROM PrecipitationSnowDays psd
JOIN BikeTripsWithLag bt ON bt.date = psd.date
GROUP BY psd.date;
