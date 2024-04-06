SELECT
      promo_id as promo_code_id
    , discount as promo_code_discount
    , status as promo_code_status
FROM 
    {{ ref('stg_promo_codes') }}