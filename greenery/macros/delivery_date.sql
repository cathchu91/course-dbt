
SELECT
    *
FROM
    {{ ref('fact_orders') }}
WHERE delivered_at < order_created_at 
