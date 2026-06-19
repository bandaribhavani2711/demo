{% snapshot products_snapshot %}

{{
    config(
        target_database='DB1',
        target_schema='PUBLIC',
        unique_key='PRODUCT_ID',

        strategy='check',
        check_cols=['PRODUCT_NAME','CATEGORY','BRAND','UNIT_PRICE','STOCK_QUANTITY']
    )
}}

SELECT *
FROM {{ source('demo_sources', 'PRODUCTS') }}

{% endsnapshot %}