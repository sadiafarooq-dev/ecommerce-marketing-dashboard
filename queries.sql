-- Query 1 — Revenue by channel
SELECT
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END) AS purchasers,
  SUM(CASE WHEN event_name = 'purchase' THEN ecommerce.purchase_revenue END) AS revenue
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20201105'
GROUP BY source, medium
HAVING revenue IS NOT NULL
ORDER BY revenue DESC

-- Query 2 — Conversion funnel
SELECT
  event_name,
  COUNT(DISTINCT user_pseudo_id) AS users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20201105'
  AND event_name IN ('view_item', 'begin_checkout', 'purchase')
GROUP BY event_name
ORDER BY users DESC

-- Query 3 — Traffic sources 
SELECT
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  COUNT(*) AS total_events
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201101' AND '20201105'
GROUP BY source, medium
ORDER BY total_events DESC
LIMIT 10
