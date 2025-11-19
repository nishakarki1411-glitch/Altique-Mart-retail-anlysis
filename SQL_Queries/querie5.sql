WITH product_revenue AS (
    SELECT 
        p.product_name,
        p.category,
        SUM(f.quantity_sold_before_promo * base_price) AS rev_before,
        SUM(f.quantity_sold_after_promo * base_price)  AS rev_after
    FROM fact_events f
    JOIN dim_products p  ON f.product_code = p.product_code
    JOIN dim_campaigns c ON f.campaign_id = c.campaign_id
    GROUP BY p.product_name, p.category
),

ir_calc AS (
    SELECT 
        product_name,
        category,
        ROUND(
            ((rev_after - rev_before) * 100.0 / rev_before),
            2
        ) AS ir_percentage
    FROM product_revenue
    WHERE rev_before > 0 
)

SELECT 
    product_name,
    category,
    ir_percentage,
    RANK() OVER (ORDER BY ir_percentage DESC) AS rank_order
FROM ir_calc
ORDER BY rank_order
LIMIT 5;

