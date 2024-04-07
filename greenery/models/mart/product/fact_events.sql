{{
  config(
    materialized='table'
  )
}}

SELECT
      ev.event_id
    , ev.session_id
    , ev.user_id
    , ev.page_url
    , ev.event_created_at
    , ev.event_type
    , ev.order_id
    , ev.product_id
FROM 
    {{ ref('stg_events') }} ev