{{ config(materialized='table') }}

SELECT
    sentiment,
    COUNT(*) AS total_reviews,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM {{ ref('silver_reviews') }}
WHERE sentiment IS NOT NULL
GROUP BY sentiment
ORDER BY total_reviews DESC