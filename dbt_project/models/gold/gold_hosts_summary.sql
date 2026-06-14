{{ config(materialized='table') }}

SELECT
    h.id AS host_id,
    h.name AS host_name,
    h.is_superhost,
    COUNT(l.id) AS total_listings,
    ROUND(AVG(l.price), 2) AS avg_price,
    ROUND(MIN(l.price), 2) AS min_price,
    ROUND(MAX(l.price), 2) AS max_price
FROM {{ ref('silver_hosts') }} h
LEFT JOIN {{ ref('silver_listings') }} l
    ON h.id = l.host_id
GROUP BY h.id, h.name, h.is_superhost
ORDER BY total_listings DESC