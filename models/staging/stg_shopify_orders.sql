SELECT
    TRIM(order_id) AS order_id,
    TRIM(customer_id) AS customer_id,
    CAST(created_at AS TIMESTAMP) AS order_created_at,
    CAST(created_at AS DATE) AS order_date,
    CAST(COALESCE(subtotal_usd, 0) AS NUMERIC) AS subtotal_usd,
    CAST(COALESCE(discount_usd, 0) AS NUMERIC) AS discount_usd,
    CAST(COALESCE(subtotal_usd, 0) - COALESCE(discount_usd, 0) AS NUMERIC) AS net_revenue_usd,
    LOWER(TRIM(COALESCE(utm_source, 'direct'))) AS attribution_channel
FROM `data-cleaning-and-datapiple.raw_ecommerce.raw_shopify_orders`;
