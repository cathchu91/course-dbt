{{
  config(
    materialized='table'
  )
}}

with events AS (
  SELECT * FROM {{ ref('fact_events') }}
  ),

page_views as (
    SELECT *, 1 as page_view FROM events WHERE event_type = 'page_view'
    ),

add_to_cart as (
    SELECT *, 1 as add_to_cart FROM events WHERE event_type = 'add_to_cart'
    ),

checkout as (
    SELECT *, 1 as checkout FROM events WHERE event_type = 'checkout'
    )

SELECT
      pv.event_id
    , pv.session_id
    , pv.user_id
    , pv.page_url
    , pv.event_created_at
    , pv.order_id
    , pv.product_id
    , pv.product_name
    , SUM(pv.page_view) as page_views
    , SUM(ad.add_to_cart) as add_to_cart
    , SUM(ct.checkout) as checkout
  FROM page_views pv
  LEFT JOIN add_to_cart ad
    ON pv.session_id = ad.session_id
  LEFT JOIN checkout ct
    ON ad.session_id = ct.session_id
  GROUP BY
      pv.event_id
    , pv.session_id
    , pv.user_id
    , pv.page_url
    , pv.event_created_at
    , pv.order_id
    , pv.product_id
    , pv.product_name
    