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
    c.customer_id,
    c.customer_name,
    c.product_id,
    c.purchase_date,
    c.quantity,
    c.total_amount,
    c.city,

    p.product_name,
    p.category,
    p.brand,
    p.unit_price,
    p.stock_quantity,
    p.created_date

FROM {{ source('demo_sources', 'CUSTOMER') }} AS c
INNER JOIN {{ source('demo_sources', 'PRODUCTS') }} AS p
    ON c.PRODUCT_ID = p.PRODUCT_ID