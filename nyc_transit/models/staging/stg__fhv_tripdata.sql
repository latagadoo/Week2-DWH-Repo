 with source as (
	select * from {{ source('main', 'fhv_tripdata') }}
 ),

 renamed as (
	
	select

	   pickup_datetime,
           dropoff_datetime,
           pulocationid as pickup_location_id,
           dolocationid as dropoff_location_id,
           dispatching_base_num,
           affiliated_base_number,
           filename

	from source

 )

 select * from renamed
