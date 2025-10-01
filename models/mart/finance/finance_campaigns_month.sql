SELECT
    EXTRACT( MONTH FROM date_date) AS date_month,
    ROUND(SUM(ads_margin),2) AS ads_margin,
    ROUND(SUM(avg_basket),2) AS avg_basket,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    ROUND(SUM(ads_cost),2) AS ads_cost,
    ROUND(SUM(ads_impression),2) AS ads_impression,
    ROUND(SUM(ads_clicks),2) ads_clicks,
    SUM(quantity) AS quantity,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(margin),2) AS margin,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(log_cost),2) AS log_cost,
    ROUND(SUM(ship_cost),2) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY date_month
ORDER BY date_month DESC