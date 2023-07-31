select fare_amount, avg(fare_amount), pl.borough, pl.zone
from {{ ref('stg__yellow_tripdata') }} t
join "main"."mart"."mart__dim_locations" pl on t.PUlocationID = pl.LocationID
group by all
-- compare an individual fare to the zone, borough and overall 
-- average fare using the fare_amount in yellow taxi trip data.
	


