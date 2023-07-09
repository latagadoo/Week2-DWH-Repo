 with source as (
	select * from {{ source('main', 'bike_data') }}
 ),

 renamed as (
	
	select

           coalesce(starttime, started_at)::timestamp as start_time,
	   coalesce(stoptime, ended_at)::timestamp as end_time,
           bikeid::int64 as bike_id,
           gender::int64 as gender,
           usertype,
           "birth year"::int64 as birth_year,
	   ride_id,
           rideable_type,
           coalesce(start_station_id, "start station id")::int64 as start_station_id,
	   coalesce(start_station_name, "start station name") as start_station_name,
           coalesce("start station latitude",start_lat)::double as start_station_latitude,
           coalesce("start station longitude",start_lng)::double as start_station_longitude,
           coalesce(end_station_id ,"end station id")::int64 as end_station_id,
           coalesce(end_station_name, "end station name") as end_station_name,
           coalesce("end station latitude", end_lat)::double as end_station_latitude,
           coalesce("end station longitude", end_lng)::double as end_station_longitude,
           member_casual,
           filename

	from source

 )

 select * from renamed

