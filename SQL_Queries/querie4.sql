WITH category_sales AS (
    SELECT 
        p.category,
        SUM(f.quantity_sold_before_promo) AS qty_before,
        SUM(f.quantity_sold_after_promo)  AS qty_after
    FROM fact_events f
    JOIN dim_products p   ON f.product_code = p.product_code
    JOIN dim_campaigns c  ON f.campaign_id  = c.campaign_id
    WHERE c.campaign_name = 'Diwali'
    GROUP BY p.category
),
isu_calc AS (
    SELECT 
        category,
        ROUND(
            ((qty_after - qty_before) * 100.0 / qty_before),
            2
        ) AS isu_percentage
    FROM category_sales
)
SELECT 
    category,
    isu_percentage,
    RANK() OVER (ORDER BY isu_percentage DESC) AS rank_order
FROM isu_calc
ORDER BY rank_order;

	
