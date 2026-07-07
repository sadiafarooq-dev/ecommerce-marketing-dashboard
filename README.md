# E-Commerce Marketing Performance Dashboard

Power BI dashboard analyzing real e-commerce data from Google's public GA4 BigQuery sample dataset (Google Merchandise Store, Nov 2020). Used SQL in BigQuery to extract traffic sources, conversion funnel behavior, and revenue by channel, then connected Power BI directly to BigQuery (Import mode) to visualize the results.

![Dashboard Preview](Dashboard%20Preview.pdf)

## Key Finding
Revenue is spread fairly evenly across channels rather than dominated by paid ads, suggesting healthy channel diversity. However, the funnel reveals a steep drop-off between product views and checkout starts, with only ~4.1% of product viewers completing a purchase — pointing to a clear opportunity to investigate the product page → checkout experience.

## Tools Used
- **BigQuery** — SQL queries against Google's public GA4 e-commerce dataset
- **Power BI** — dashboard visuals, connected live via the BigQuery connector (Import mode)
- **SQL** — traffic source aggregation, funnel analysis, revenue-by-channel calculations

## Queries
See `queries.sql` for the three core SQL queries used in this project.
