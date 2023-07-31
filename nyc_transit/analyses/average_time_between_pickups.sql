WITH next_trip_data AS (
  SELECT
    pl.zone,
    pickup_datetime,
    LEAD(pickup_datetime) OVER (PARTITION BY pl.zone ORDER BY pickup_datetime) AS next_pickup_datetime
  FROM
    {{ ref('mart__fact_all_taxi_trips') }} t
  JOIN
    {{ ref('mart__dim_locations') }} pl ON t.PUlocationID = pl.LocationID
  WHERE
    pl.zone IN ('Greenpoint', 'Lower East Side', 'Old Astoria', 'Manhattanville', 'Central Harlem', 'Richmond Hill', 'Union Sq', 'Yorkville West', 'Highbridge', 'Roosevelt Island', 'Red Hook', 'East Village')
)
SELECT
  zone,
  pickup_datetime,
  next_pickup_datetime AS time_to_next_pickup,
  EXTRACT(EPOCH FROM (next_pickup_datetime - pickup_datetime)) AS time_diff_pickup,
  AVG(EXTRACT(EPOCH FROM (next_pickup_datetime - pickup_datetime))) AS avg_time_diff_pickup
FROM
  next_trip_data
GROUP BY
  zone, pickup_datetime, next_pickup_datetime;
