# WEEK 1

How many users do we have? **130 users**

```sql
select
    count(distinct user_id)
from 
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.STG_POSTGRES_USERS
```

On average, how many orders do we receive per hour? **7.520833**
```sql
SELECT
    avg(orders)
FROM(
SELECT 
    DATE_TRUNC('hour',created_at) as hour_created,
    COUNT(ORDER_ID) as orders
FROM 
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.STG_POSTGRES_ORDERS
GROUP BY
    1
    )
```

On average, how long does an order take from being placed to being delivered? **3.89 Days**

```sql
SELECT
    AVG(time_to_deliver)/86400 as avg_days
FROM (
SELECT 
    ORDER_ID,
    CREATED_AT,
    DELIVERED_AT,
    DATEDIFF('seconds',created_at,delivered_at) as time_to_deliver
FROM DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.STG_POSTGRES_ORDERS
)
```

How many users have only made one purchase? Two purchases? Three+ purchases?
*Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.*

ONE_PURCHASES | TWO_PURCHASES | THREE_PLUS_PURCHASES
------------- | ------------- | -------------------
25 | 28 | 71

```sql
SELECT
    COUNT_IF(no_orders=1) as one_purchases,
    COUNT_IF(no_orders=2) as two_purchases,
    COUNT_IF(no_orders>=3) as three_plus_purchases
FROM (
SELECT 
    USER_ID,
    COUNT(DISTINCT ORDER_ID) AS no_orders
FROM DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.STG_POSTGRES_ORDERS
GROUP BY
    1
    )
```
     
On average, how many unique sessions do we have per hour? **16.327586**

```sql
SELECT
    avg(sessions)
FROM(
SELECT 
    DATE_TRUNC('hour',created_at) as hour_created,
    COUNT(DISTINCT session_id) as sessions
FROM 
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.STG_POSTGRES_EVENTS
GROUP BY
    1
    )
```