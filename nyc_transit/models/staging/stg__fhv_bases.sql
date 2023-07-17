 WITH source AS (
    SELECT * FROM {{ source('main', 'fhv_bases') }}
),
renamed AS (
    SELECT
        TRIM(UPPER(COALESCE(base_number, ''))) AS base_number,
        base_name,
        dba,
        dba_category,
        filename
    FROM source
)
SELECT *
FROM renamed

