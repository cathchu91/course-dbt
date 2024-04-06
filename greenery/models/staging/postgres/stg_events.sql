select
      event_id
    , session_id
    , user_id
    , page_url
    , created_at as event_created_at
    , event_type
    , order_id
    , product_id
from 
    {{ source('postgres', 'events') }}