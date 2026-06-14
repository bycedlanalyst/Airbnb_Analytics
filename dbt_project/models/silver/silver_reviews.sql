{{ config(materialized='view') }}

SELECT
    listing_id,
    CAST(date AS DATE) AS date,
    reviewer_name,
    comments,
    sentiment
FROM {{ ref('bronze_reviews') }}
WHERE listing_id IS NOT NULL
AND comments IS NOT NULL