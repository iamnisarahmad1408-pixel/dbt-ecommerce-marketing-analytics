E-Commerce & Marketing Analytics Pipeline (dbt + BigQuery)
Overview
An end-to-end modern data stack project designed to ingest, clean, and transform raw e-commerce sales (Shopify) and multi-channel ad spend (Meta, Google) into standardized data marts. 

Built using dbt modeling patterns, Google BigQuery, and Python.

Architecture & Data Lineage
- **Raw Layer (`raw_ecommerce`)**: Ingestion of multi-channel ad spend and order transaction data.
- **Staging Layer (`stg_ecommerce`)**: Schema standardization, deduplication, type casting, and data quality checks.
- **Intermediate Layer (`int_ecommerce`)**: Attribution logic, aggregation by spend platform, and outer-joins across spend/revenue channels.
- **Mart Layer (`mrt_ecommerce`)**: Final reporting tables optimized for BI tools and calculating key marketing metrics:
  - ROAS (Return on Ad Spend)
  - CAC (Customer Acquisition Cost)
  - CPA (Cost Per Acquisition)
  - LTV (Customer Lifetime Value Cohorts)

## Data Quality Assertions
Includes automated SQL test suites verifying:
1. Primary key uniqueness (`order_id`).
2. Foreign key and null integrity (`spend_date`).
3. Business logic boundaries (non-negative spend and anomaly assertions).
