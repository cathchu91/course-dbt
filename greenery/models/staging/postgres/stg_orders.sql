SELECT
      order_id
    , user_id
    , promo_id as promo_code_id
    , address_id
    , created_at as order_placed_at
    , order_cost
    , shipping_cost
    , order_total
    , tracking_id
    , shipping_service
    , estimated_delivery_at
    , delivered_at
    , status
FROM 
    {{ source('postgres', 'orders') }}