{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.order_placed_at,
  o.order_total,
  o.order_status,
  o.promo_code_id,
  pc.promo_code_discount,
  o.user_id,
  u.first_name AS user_first_name,
  o.tracking_id as shipment_tracking_id,
  s.status AS shipment_status,
  DATEDIFF(day, o.order_placed_at, o.delivered_at) AS days_to_deliver,
  oa.order_id IS NOT NULL AS has_adjustment
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promo_codes') }} pc
  ON o.promo_code_id = pc.promo_code_id
LEFT JOIN {{ ref('stg_users') }} u
  ON o.user_id = u.user_id
LEFT JOIN {{ ref('stg_shipments') }} s
  ON o.shipment_id = s.shipment_id
LEFT JOIN {{ ref('stg_order_adjustments') }} oa
  ON o.order_id = oa.order_id