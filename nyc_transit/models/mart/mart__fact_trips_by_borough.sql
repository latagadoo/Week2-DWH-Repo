select
   count(*) as trips,
   pl.borough,
   
from "main"."mart"."mart__fact_all_taxi_trips" t
join "main"."mart"."mart__dim_locations" pl on t.PUlocationID = pl.LocationID
group by pl.borough