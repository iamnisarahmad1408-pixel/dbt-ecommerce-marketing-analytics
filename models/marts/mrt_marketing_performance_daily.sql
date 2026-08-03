SELECT
    CAST(spend_date AS DATE) AS spend_date,
    LOWER(TRIM(platform)) AS ad_platform,
    LOWER(TRIM(campaign_id)) AS campaign_id,
    COALESCE(impressions, 0) AS impressions,
    COALESCE(clicks, 0) AS clicks,
    CAST(COALESCE(spend_usd, 0) AS NUMERIC) AS spend_usd,
    CASE 
        WHEN spend_usd < 0 OR impressions < 0 OR clicks < 0 THEN TRUE 
        ELSE FALSE 
    END AS has_invalid_metrics
FROM `data-cleaning-and-datapiple.raw_ecommerce.raw_ad_spend`;
