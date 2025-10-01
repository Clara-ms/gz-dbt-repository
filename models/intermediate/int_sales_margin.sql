WITH cost AS(
    SELECT 
        sales.*,
        product.purchase_price,
        ROUND(sales.quantity*product.purchase_price,2) AS purchase_cost   
    FROM {{ ref('stg_raw__sales') }} AS sales
    LEFT JOIN {{ ref('stg_raw__product') }} AS product
    ON sales.products_id=product.products_id
)
SELECT
    *,
    ROUND(revenue-purchase_cost,2) AS margin,
    {{ margin_percent('revenue','purchase_cost',3) }} AS margin_percent

FROM cost