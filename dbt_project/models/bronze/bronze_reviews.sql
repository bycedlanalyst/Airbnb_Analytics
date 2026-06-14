{{ config(materialized='view') }}

SELECT
    listing_id,
    date,
    reviewer_name,
    comments,
    sentiment
FROM read_csv_auto(
    'C:\Users\boimi\Downloads\Projet_Airbnb_Analytics\data\raw\reviews.csv',
    header=True
)