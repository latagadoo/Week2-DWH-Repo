 with source as (
	select * from {{ source('main', 'central_park_weather') }}
 ),

 renamed as (
	
	select
	   station,
	   name,
           date::date as date,
           awnd::double as average_wind_speed,
           prcp::double as precipitation,
           snow::double as snow_fall,
           snwd::double as snow_wind,
           tmax::int as max_temp,
           tmin::int as min_temp,
           filename

	from source

 )

 select * from renamed
