SELECT
    orders.*,
    ship.* EXCEPT(orders_id),
    ROUND(orders.margin+ship.shipping_fee-ship.log_cost-ship.ship_cost,2) AS operational_margin
FROM {{ ref('int_orders_margin') }} AS orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
USING(orders_id)
