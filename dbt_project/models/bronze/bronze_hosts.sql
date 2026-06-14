{{ config(materialized='view') }}

SELECT
    id,
    name,
    is_superhost,
    created_at,
    updated_at
FROM read_csv_auto(
    'C:\Users\boimi\Downloads\Projet_Airbnb_Analytics\data\raw\hosts.csv',
    header=True
)