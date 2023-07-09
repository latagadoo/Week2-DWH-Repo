 with source as (
	select * from {{ source('main', 'daily_citi_bike_trip_counts_and_weather') }}
 ),

 renamed as (
	
	select
	   date as date,
	   trips::int64 as trips,
	   precipitation::double as precipitation,
	   snow_depth::int64 as snow_depth,
           snowfall::int64 as snow_fall,
           max_temperature::double as max_temperature,
           min_temperature::double as min_temperature,
           average_wind_speed::double as average_wind_speed,
           dow::int64 as dow,
           year::int64 as year,
	   month::int64 as month,
	   holiday::boolean as holiday,
	   stations_in_service::int64 as stations_in_service,
	   weekday::boolean as weekday,
	   weekday_non_holiday::boolean as weekday_non_holiday,
           filename

	from source

 )

 select * from renamed
