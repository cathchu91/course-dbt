SELECT
      promo_id
    , promo_discount
    , promo_status
FROM 
    {{ source('postgres', 'promos') }}