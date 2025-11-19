SELECT
    p.category,
    SUM(COALESCE(f.quantity_sold_after_promo,0)) 
      - SUM(COALESCE(f.quantity_sold_before_promo,0)) AS isu_lift,       
    SUM((COALESCE(f.quantity_sold_after_promo,0) 
         - COALESCE(f.quantity_sold_before_promo,0)) * f.base_price) AS ir_lift
	
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
GROUP BY p.category
ORDER BY ir_lift DESC;
