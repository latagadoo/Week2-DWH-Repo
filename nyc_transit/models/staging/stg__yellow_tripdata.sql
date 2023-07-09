 with source as (
	select * from {{ source('main', 'yellow_tripdata') }}
 ),

 renamed as (
	
	select

	   vendorid, 
	   tpep_pickup_datetime,
           tpep_dropoff_datetime,
           passenger_count, 
           trip_distance,
           ratecodeid as rate_code_id, 
           store_and_fwd_flag:: boolean as store_and_fwd_flag,
           pulocationid as pickup_location_id,
           dolocationid as dropoff_location_id,
           payment_type,
           fare_amount,
           extra, 
           mta_tax ,
           tip_amount,
           tolls_amount,
           improvement_surcharge,
           total_amount, 
           congestion_surcharge, 
           airport_fee,
           filename

	from source

 )

 select * from renamed
