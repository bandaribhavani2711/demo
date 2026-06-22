/*
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
    ON c.product_id = p.product_id
*/
{{
    config(
        materialized='incremental',
        unique_key='CUSTOMER_ID',
        incremental_strategy='merge'
    )
}}

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

FROM {{ source('demo_sources', 'CUSTOMER') }} c
INNER JOIN {{ source('demo_sources', 'PRODUCTS') }} p
    ON c.product_id = p.product_id

{% if is_incremental() %}

WHERE c.purchase_date >
(
    SELECT MAX(purchase_date)
    FROM {{ this }}
)

{% endif %}