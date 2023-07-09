 with source as (
	select * from {{ source('main', 'green_tripdata') }}
 ),

 renamed as (
	
	select
	   vendorid as vendor_id,
	   lpep_pickup_datetime,
           lpep_dropoff_datetime,
           payment_type,
           trip_type,
           congestion_surcharge,
           store_and_fwd_flag::boolean as store_and_fwd_flag,
           ratecodeid as rate_code_id, 
           pulocationid as pickup_location_id,
           dolocationid as dropoff_location_id, 
           passenger_count, 
           trip_distance, 
           fare_amount,
           extra,
           mta_tax, 
           tip_amount,
           tolls_amount,
           improvement_surcharge, 
           total_amount,
           filename

	from source

 )

 select * from renamed
