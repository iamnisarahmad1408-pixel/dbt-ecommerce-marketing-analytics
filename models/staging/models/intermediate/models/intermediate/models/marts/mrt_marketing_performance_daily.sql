SELECT
    metric_date,
    channel,
    daily_spend_usd,
    daily_impressions,
    daily_clicks,
    daily_orders,
    daily_customers,
    daily_net_revenue_usd,
    SAFE_DIVIDE(daily_net_revenue_usd, daily_spend_usd) AS roas,
    SAFE_DIVIDE(daily_spend_usd, daily_customers) AS cac_usd,
    SAFE_DIVIDE(daily_spend_usd, daily_orders) AS cpa_usd,
    SAFE_DIVIDE(daily_net_revenue_usd, daily_orders) AS aov_usd,
    SAFE_DIVIDE(daily_clicks, daily_impressions) AS ctr,
    SAFE_DIVIDE(daily_spend_usd, daily_clicks) AS cpc_usd
FROM `data-cleaning-and-datapiple.int_ecommerce.int_daily_channel_performance`;
