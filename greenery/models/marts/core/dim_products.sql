{{
  config(
    materialized='table'
  )
}}

SELECT
      product_id
    , product_name
    , product_price
    , product_inventory
FROM 
    {{ ref('stg_postgres_products') }}