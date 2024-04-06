{{
  config(
    materialized='table'
  )
}}

SELECT
    o.order_id
  , o.created_at as order_placed_at
  , o.order_total
  , o.order_cost
  , o.status as order_status
  , o.promo_id as promo_code_id
  , pc.promo_code_discount
  , o.user_id
  , concat(u.first_name, ' ', u.last_name) AS user_name
  , o.address_id
  , a.address
  , a.zipcode
  , a.state
  , a.country
  , o.shipping_service
  , o.tracking_id as shipment_tracking_id
  , o.shipping_cost
  , o.estimated_delivery_at
  , DATEDIFF(day, o.created_at, o.delivered_at) AS days_to_deliver
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('dim_promo_codes') }} pc
    ON o.promo_id = pc.promo_code_id
LEFT JOIN {{ ref('dim_users') }} u
    ON o.user_id = u.user_id
LEFT JOIN {{ ref('dim_addresses' )}} a
    ON o.address_id = a.address_id