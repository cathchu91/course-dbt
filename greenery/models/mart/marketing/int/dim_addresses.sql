{{
  config(
    materialized='table'
  )
}}

select
      address_id
    , address
    , zipcode
    , state
    , country
from 
    {{ ref('stg_addresses') }}