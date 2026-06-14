{{ config(materialized='view') }}

SELECT
    id,
    listing_url,
    name,
    room_type,
    minimum_nights,
    host_id,
    CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS FLOAT) AS price,
    CAST(created_at AS TIMESTAMP) AS created_at,
    CAST(updated_at AS TIMESTAMP) AS updated_at
FROM {{ ref('bronze_listings') }}
WHERE id IS NOT NULL