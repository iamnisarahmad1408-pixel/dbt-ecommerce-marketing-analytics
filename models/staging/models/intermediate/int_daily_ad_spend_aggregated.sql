SELECT
    spend_date,
    ad_platform,
    SUM(impressions) AS total_impressions,
    SUM(clicks) AS total_clicks,
    SUM(spend_usd) AS total_spend_usd,
    SAFE_DIVIDE(SUM(clicks), SUM(impressions)) AS ctr
FROM `data-cleaning-and-datapiple.stg_ecommerce.stg_ad_spend`
GROUP BY 1, 2;
