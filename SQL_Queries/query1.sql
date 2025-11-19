SELECT DISTINCT
    p.product_code,
    p.product_name,
    p.category,
    f.base_price,
    f.promo_type
FROM 
    fact_events f
INNER JOIN 
    dim_products p ON f.product_code = p.product_code
WHERE 
    f.base_price > 500
    AND f.promo_type = 'BOGOF'
ORDER BY 
    f.base_price DESC;

