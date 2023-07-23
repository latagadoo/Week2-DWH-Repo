SELECT
    tripresult.weekday,
    tripresult.startborough,
    tripresult.endborough,
    COUNT(*) AS total_trips,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS percentage
FROM
    (
    SELECT
        weekday(dropoff_datetime) AS weekday,
        st.borough AS startborough,
        en.borough AS endborough
    FROM
        {{ ref('mart__fact_all_taxi_trips') }} taxitrips
    INNER JOIN
        {{ ref('mart__dim_locations') }} st ON taxitrips.pulocationid = st.locationid
    INNER JOIN
        {{ ref('mart__dim_locations') }} en ON taxitrips.dolocationid = en.locationid
    ) AS tripresult
WHERE
    tripresult.startborough <> tripresult.endborough
GROUP BY
    tripresult.weekday,
    tripresult.startborough,
    tripresult.endborough

-- inter_borough_taxi_trips_by_weekday.sql (hard!): by weekday, 
--count of total trips, trips starting and ending in a different borough, and 
--percentage w/ different start/end
