SELECT 
    c.campaign_name,
    CONCAT(ROUND(SUM(f.base_price * f.quantity_sold_before_promo) / 1000000, 2),'M') AS total_revenue_before_promotion,
    CONCAT(ROUND(SUM(f.base_price * f.quantity_sold_after_promo) / 1000000, 2),'M') AS total_revenue_after_promotion
FROM 
    fact_events f
INNER JOIN 
    dim_campaigns c ON f.campaign_id = c.campaign_id
GROUP BY 
    c.campaign_name
ORDER BY 
    c.campaign_name;
