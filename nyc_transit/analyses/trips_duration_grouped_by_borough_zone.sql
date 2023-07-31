
select 
    borough, 
    zone,
    count(*) trips,
    avg(case when duration_min between 0 and 9000 then duration_min else NULL end)
    from "main"."mart"."mart__fact_all_taxi_trips" t
    join "main"."mart"."mart__dim_locations" pl on t.PUlocationID = pl.LocationID
    group by all;
    

-- Calculate the number of trips and average duration by borough and zone 
-- not catering for scenarios where matching location id might be null
