{{ config(materialized='view') }}

SELECT
    id,
    listing_url,
    name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
FROM read_csv_auto(
    'C:\Users\boimi\Downloads\Projet_Airbnb_Analytics\data\raw\listings.csv',
    header=True
)