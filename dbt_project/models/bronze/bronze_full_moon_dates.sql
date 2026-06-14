{{ config(materialized='view') }}

SELECT
    full_moon_date
FROM read_csv_auto(
    'C:\Users\boimi\Downloads\Projet_Airbnb_Analytics\data\raw\seed_full_moon_dates.csv',
    header=True
)