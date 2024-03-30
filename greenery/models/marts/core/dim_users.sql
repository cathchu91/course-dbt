{{
  config(
    materialized='table'
  )
}}

SELECT 
      user_id
    , first_name
    , last_name
    , email
    , phone_number
    , user_created_at
    , user_updated_at
    , address_id
FROM 
    {{ ref('stg_postgres_users') }}