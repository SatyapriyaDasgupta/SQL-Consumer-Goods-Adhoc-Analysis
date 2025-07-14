WITH
up20 AS
(
SELECT
p.segment,
COUNT(DISTINCT(s.product_code)) AS unique_products_2020
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code=p.product_code
WHERE fiscal_year=2020
GROUP BY p.segment
),
up21 AS
(
SELECT
p.segment,
COUNT(DISTINCT(s.product_code)) AS unique_products_2021
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code=p.product_code
WHERE fiscal_year=2021
GROUP BY p.segment
)
SELECT
up21.segment,
up20.unique_products_2020,
up21.unique_products_2021,
unique_products_2021-unique_products_2020 AS difference
FROM up21
JOIN up20
ON up21.segment=up20.segment
ORDER BY difference desc;