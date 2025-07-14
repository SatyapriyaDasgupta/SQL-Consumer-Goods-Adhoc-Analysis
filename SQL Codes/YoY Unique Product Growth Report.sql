WITH
up20 AS
(
SELECT
COUNT(DISTINCT(product_code)) AS unique_products_2020
FROM fact_sales_monthly
WHERE fiscal_year=2020
),
up21 AS
(
SELECT
COUNT(DISTINCT(product_code)) AS unique_products_2021
FROM fact_sales_monthly
WHERE fiscal_year=2021
)
SELECT
up20.unique_products_2020,
up21.unique_products_2021,
ROUND((unique_products_2021-unique_products_2020)*100/unique_products_2020,2) AS percentage_chg
FROM up20
CROSS JOIN up21;