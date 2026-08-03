SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS latest_order_date,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(net_revenue_usd) AS customer_lifetime_value_usd,
    AVG(net_revenue_usd) AS average_order_value_usd,
    CASE 
        WHEN COUNT(DISTINCT order_id) > 1 THEN 'Repeat Customer'
        ELSE 'One-Time Customer'
    END AS customer_segment
FROM `data-cleaning-and-datapiple.stg_ecommerce.stg_shopify_orders`
GROUP BY 1;
