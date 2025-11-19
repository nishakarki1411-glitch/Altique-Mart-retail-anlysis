SELECT
  f.store_id,
  SUM( (COALESCE(f.quantity_sold_after_promo,0) - COALESCE(f.quantity_sold_before_promo,0)) * COALESCE(f.base_price,0) ) AS incremental_revenue
FROM fact_events f
GROUP BY f.store_id
ORDER BY incremental_revenue DESC
LIMIT 10
