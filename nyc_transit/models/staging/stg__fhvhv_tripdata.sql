 with source as (
	select * from {{ source('main', 'fhvhv_tripdata') }}
 ),

 renamed as (
	
	select
	   hvfhs_license_num,
	   dispatching_base_num,
           originating_base_num,
           wav_request_flag::boolean as wav_request_flag,
           wav_match_flag::boolean as wav_match_flag,
           request_datetime,
           on_scene_datetime, 
           pickup_datetime, 
           dropoff_datetime, 
           pulocationid as pickup_location_id,
           dolocationid as dropoff_location_id,
           trip_miles, 
	   trip_time, 
           base_passenger_fare,
           tolls, 
           bcf as black_car_fund, 
           sales_tax, 
           congestion_surcharge,
           airport_fee, 
           tips, 
           driver_pay,
           shared_request_flag::boolean as shared_request_flag,
           shared_match_flag::boolean as shared_match_flag,
           access_a_ride_flag::boolean as access_a_ride_flag,
           filename

	from source

 )

 select * from renamed
