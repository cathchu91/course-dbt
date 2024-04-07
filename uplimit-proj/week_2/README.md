# Week 2 Project Submission

** What is the repeat user rate? **
19.67%

```SELECT
    COUNT_IF(no_orders>2)/SUM(no_orders)
FROM (
SELECT 
    USER_ID,
    COUNT(DISTINCT ORDER_ID) AS no_orders
FROM DEV_DB.DBT_CATHERINECHUSIGMACOMPUTINGCOM.FACT_ORDERS
GROUP BY
    1
    )```


**Business Process**
We have business stakeholders coming to us with the following questions.
- what are good indicators of a user who will likely purchase again
- what about indicators of users likely not to purchase again?

**Explain the product mart models you added. Why did you organize the models in the way you did?**
I chose to break out my intermediate models by each event type, to help prepare for an eventual funnel analysis. Breaking out each of the event types will allow me to create custom joins and pathways when creating an analysis.

**DBT Testing. How I found bad data**
I identified the key granularity I want for each dimension and fact table and assigned them tests for not_null and unique values
I found that that anytime my models did not pass tests, was due to incorrect joins. Identifying the right joins helped to resolve id duplication.