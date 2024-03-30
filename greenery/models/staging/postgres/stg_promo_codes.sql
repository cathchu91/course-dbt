SELECT
      promo_id as promo_code_id
    , discount as promo_code_discount
    , status
FROM 
    {{ source('postgres', 'promos') }}