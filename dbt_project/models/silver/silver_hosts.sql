{{ config(materialized='view') }}

SELECT
    id,
    name,
    CAST(is_superhost AS BOOLEAN) AS is_superhost,
    CAST(created_at AS TIMESTAMP) AS created_at,
    CAST(updated_at AS TIMESTAMP) AS updated_at
FROM {{ ref('bronze_hosts') }}
WHERE id IS NOT NULL