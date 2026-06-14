{{ config(materialized='table') }}

SELECT
    room_type,
    COUNT(*) AS total_listings,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(MIN(price), 2) AS min_price,
    ROUND(MAX(price), 2) AS max_price,
    ROUND(AVG(minimum_nights), 1) AS avg_minimum_nights
FROM {{ ref('silver_listings') }}
GROUP BY room_type
ORDER BY total_listings DESC