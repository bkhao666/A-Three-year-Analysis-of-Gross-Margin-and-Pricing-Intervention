# Retail Pricing Strategy Analysis

An end-to-end retail analytics portfolio project that combines SQL data preparation, multi-year order data, and interactive dashboards to examine revenue, profit, product mix, and regional performance.

## Project overview

The project brings together 4,456 orders covering January 2023 through September 2025. The workflow cleans missing revenue values, standardizes dates, combines annual order tables, and enriches transactions with customer and product attributes.

The final deliverables include a Power BI dashboard and an Excel pricing-strategy dashboard.

## Business questions

- How do revenue and profit change over time?
- Which products and categories contribute the most value?
- How does performance differ by customer region?
- Where do missing or inconsistent revenue values need to be corrected?
- What pricing opportunities can be identified from product price, cost, demand, and profitability?

## Repository contents

| File | Description |
| --- | --- |
| `Data Preparation.sql` | Combines yearly orders and joins customer and product attributes into an analysis-ready dataset. |
| `Data Transform.sql` | Audits missing revenue, converts blanks to `NULL`, validates numeric values, and standardizes column types. |
| `Orders_2023.csv` | 1,603 order records from 2023. |
| `Orders_2024.csv` | 1,570 order records from 2024. |
| `Orders_2025.csv` | 1,283 order records through September 2025. |
| `customers.csv` | Customer region and join-date reference data. |
| `products.csv` | Product, category, price, and base-cost reference data. |
| `Portfolio Dashboard.pbix` | Interactive Power BI dashboard. |
| `outputs/Retail_Pricing_Strategy_Dashboard.xlsx` | Excel pricing-strategy dashboard. |

## Data workflow

1. Load the yearly order files and the customer and product lookup tables into MySQL.
2. Run `Data Transform.sql` to clean blank revenue fields and standardize data types.
3. Run `Data Preparation.sql` to union the yearly tables and build the enriched analysis dataset.
4. Connect the prepared data to Power BI or use the supplied Excel dashboard for analysis.

Missing revenue is estimated from product price multiplied by quantity in the analysis query. Profit is calculated as revenue less cost of goods sold.

## Tools used

- MySQL and SQL
- Microsoft Power BI
- Microsoft Excel
- Git and GitHub

## Notes

- The SQL uses MySQL-specific functions such as `DATE_SUB`, `WEEKDAY`, and `TRIM`.
- The included data is intended for portfolio and demonstration purposes.
- Power BI Desktop is required to open the `.pbix` file.

