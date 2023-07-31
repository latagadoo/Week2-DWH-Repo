select count(*) as trips
from {{ ref('mart__fact_all_taxi_trips') }} t
left join {{ ref('mart__dim_locations') }} dl on t.PUlocationID = dl.LocationID
where dl.LocationID is null;

-- taxi trips that have no valid pick up location id


	


