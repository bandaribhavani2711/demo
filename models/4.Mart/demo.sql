/*
{{ config(materialized='table') }}

SELECT
    CATEGORY,
    BRAND,
    TOTAL_PURCHASES,
    TOTAL_QUANTITY_SOLD,
    TOTAL_SALES,
    AVG_PRODUCT_PRICE
FROM {{ ref('intr_demo') }}
ORDER BY TOTAL_SALES DESC
*/


{{ config(materialized='table') }}

SELECT
    BRAND,
    TOTAL_REVENUE,
    TOTAL_QUANTITY_SOLD,
    TOTAL_CUSTOMERS
FROM {{ ref('intr_demo') }}
ORDER BY TOTAL_REVENUE DESC