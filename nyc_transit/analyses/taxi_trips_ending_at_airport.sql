SELECT
    service_zone,
    COUNT(*) AS total_trips,
FROM {{ ref('mart__fact_all_taxi_trips') }} taxitrips
JOIN {{ ref('mart__dim_locations') }} locations ON taxitrips.dolocationid = locations.locationid
WHERE locations.service_zone IN ('Airports', 'EWR')
GROUP BY locations.service_zone

-- total number of trips ending in service_zones 'Airports' or 'EWR'	


