select count(*) as trips, dl.zone
from {{ ref('mart__fact_all_taxi_trips') }} t
join {{ ref('mart__dim_locations') }} dl on t.DOlocationID = dl.LocationID
group by dl.zone
having trips < 100000


-- total number of zones with trips less than 100K	
-- not catering for the rows that have null LocationID in locations table

