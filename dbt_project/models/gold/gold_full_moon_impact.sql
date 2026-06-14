{{ config(materialized='table') }}

SELECT
    r.sentiment,
    CASE 
        WHEN f.full_moon_date IS NOT NULL THEN 'Full Moon'
        ELSE 'Normal Night'
    END AS night_type,
    COUNT(*) AS total_reviews
FROM {{ ref('silver_reviews') }} r
LEFT JOIN {{ ref('silver_full_moon_dates') }} f
    ON CAST(r.date AS DATE) = f.full_moon_date
WHERE r.sentiment IS NOT NULL
GROUP BY r.sentiment, night_type
ORDER BY night_type, total_reviews DESC