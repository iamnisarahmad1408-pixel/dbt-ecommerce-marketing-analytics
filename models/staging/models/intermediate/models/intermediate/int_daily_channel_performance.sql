WITH daily_orders AS (
    SELECT
        order_date,
        attribution_channel,
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT customer_id) AS total_customers,
        SUM(net_revenue_usd) AS total_net_revenue_usd
    FROM `data-cleaning-and-datapiple.stg_ecommerce.stg_shopify_orders`
    GROUP BY 1, 2
)
SELECT
    COALESCE(s.spend_date, o.order_date) AS metric_date,
    COALESCE(s.ad_platform, o.attribution_channel) AS channel,
    COALESCE(s.total_spend_usd, 0) AS daily_spend_usd,
    COALESCE(s.total_impressions, 0) AS daily_impressions,
    COALESCE(s.total_clicks, 0) AS daily_clicks,
    COALESCE(o.total_orders, 0) AS daily_orders,
    COALESCE(o.total_customers, 0) AS daily_customers,
    COALESCE(o.total_net_revenue_usd, 0) AS daily_net_revenue_usd
FROM `data-cleaning-and-datapiple.int_ecommerce.int_daily_ad_spend_aggregated` s
FULL OUTER JOIN daily_orders o
    ON s.spend_date = o.order_date 
   AND s.ad_platform = o.attribution_channel;
