with source as (

    select * from {{ source('main', 'fhv_tripdata') }}

),

renamed as (

    select
        TRIM(UPPER(COALESCE(dispatching_base_num, ''))) AS dispatching_base_num,
        pickup_datetime,
        dropoff_datetime,
        pulocationid,
        dolocationid,
        --sr_flag, always null so chuck it
        affiliated_base_number,
        filename

    from source

)

select * from renamed