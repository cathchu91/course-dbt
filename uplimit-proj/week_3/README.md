# Week 3

**What is our overall conversion rate?**

Answer: 0.624567

```sql
SELECT
    SUM(CHECKOUTS)/COUNT(DISTINCT SESSION_ID)
FROM
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.PRODUCT_FUNNEL
```

**What is our conversion rate by product?**

```sql
SELECT
    fun.product_id,
    prod.product_name,
    SUM(checkouts)/SUM(page_views) as conversion_rate
FROM
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.PRODUCT_FUNNEL fun
LEFT JOIN
    DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.DIM_PRODUCTS prod
ON
    fun.product_id = prod.product_id
GROUP BY 1,2
```

PRODUCT_NAME |CONVERSION_RATE
------------- | ------------- |
String of pearls | 0.6
Arrow Head | 0.546875
Cactus |	0.545455
ZZ Plant |	0.523077
Bamboo |	0.521739
Monstera |	0.510204
Calathea Makoyana |	0.509434
Rubber Plant |	0.5
Aloe Vera |	0.492308
Devil's Ivy |	0.488889
Jade Plant |	0.478261
Majesty Palm |	0.478261
Philodendron |	0.47619
Fiddle Leaf Fig |	0.474576
Spider Plant |	0.474576
Dragon Tree |	0.467742
Pilea Peperomioides |	0.466667
Money Tree |	0.464286
Orchid |	0.453333
Bird of Paradise |	0.45
Ficus |	0.426471
Pink Anthurium |	0.418919
Boston Fern |	0.412698
Birds Nest Fern |	0.4125
Peace Lily |	0.402985
Snake Plant |	0.39726
Ponytail Palm |	0.394366
Alocasia Polly |	0.388889
Angel Wings Begonia |	0.387097
Pothos |	0.328125