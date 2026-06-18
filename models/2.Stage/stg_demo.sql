/*{{ config(materialized='view') }}

SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.PURCHASE_DATE,
    c.QUANTITY,
    c.TOTAL_AMOUNT,
    c.CITY,

    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.BRAND,
    p.UNIT_PRICE,
    p.STOCK_QUANTITY,
    p.CREATED_DATE

FROM {{ source('demo_sources', 'CUSTOMER') }} c

INNER JOIN {{ source('demo_sources', 'PRODUCTS') }} p
    ON c.PRODUCT_ID = p.PRODUCT_ID
*/
{{ config(materialized='view') }}

SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    c.PRODUCT_ID,
    c.PURCHASE_DATE,
    c.QUANTITY,
    c.TOTAL_AMOUNT,
    c.CITY,

    p.PRODUCT_NAME,
    p.CATEGORY,
    p.BRAND,
    p.UNIT_PRICE,
    p.STOCK_QUANTITY,
    p.CREATED_DATE

FROM {{ source('demo_sources', 'CUSTOMER') }} c
INNER JOIN {{ source('demo_sources', 'PRODUCTS') }} p
    ON c.PRODUCT_ID = p.PRODUCT_ID