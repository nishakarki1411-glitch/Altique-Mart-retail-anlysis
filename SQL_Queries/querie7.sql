SELECT 
    promo_type,
    SUM(
        (COALESCE(quantity_sold_after_promo,0) - 
         COALESCE(quantity_sold_before_promo,0)) * 
         COALESCE(base_price,0)
    ) AS incremental_revenue
FROM fact_events
GROUP BY promo_type
ORDER BY incremental_revenue DESC
LIMIT 2;

