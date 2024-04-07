{{
  config(
    materialized='table'
  )
}}

with

events as (
	select * from {{ ref('stg_events') }}
),

order_items as (
	select * from {{ ref('stg_order_items') }}
)

{% set event_types = dbt_utils.get_column_values(table=ref('fact_events'), column='event_type') %}

SELECT
      ev.session_id
    , ev.user_id
    , ev.page_url
    , ev.event_created_at
    , ev.order_id
    , COALESCE(ev.product_id,oi.product_id) as product_id
    {% for event_type in event_types %}
    , {{ sum_of('ev.event_type',event_type)}} as {{event_type}}s
    {% endfor %}
  FROM
    events ev
  LEFT JOIN
    order_items oi
    on oi.order_id = ev.order_id
  GROUP BY
      ev.session_id
    , ev.user_id
    , ev.page_url
    , ev.event_created_at
    , ev.order_id
    , COALESCE(ev.product_id,oi.product_id)
