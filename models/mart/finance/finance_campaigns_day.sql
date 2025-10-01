{{ config( materialized='view')}}
WITH campaigns AS(
    SELECT
    *
    FROM {{ ref('finance_days') }} AS f
    LEFT JOIN {{ ref('int_campaigns_day') }} AS c 
    USING (date_date)
)
SELECT
    date_date,
    ROUND(operational_margin-ads_cost,2) AS ads_margin,
    avg_basket,
    operational_margin,
    ads_cost,
    impression AS ads_impression,
    click AS ads_clicks,
    total_quantity_products AS quantity,
    total_revenue AS revenue,
    total_purchase_cost AS purchase_cost,
    ROUND(operational_margin-total_shipping_fee+total_log_cost+total_ship_cost,2) AS margin,
    total_shipping_fee AS shipping_fee,
    total_log_cost AS log_cost,
    total_ship_cost AS ship_cost
FROM campaigns