WITH gs_mln AS
(
SELECT
c.channel,
ROUND(SUM(s.sold_quantity*g.gross_price)/1000000,2) AS gross_sales_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code=g.product_code
AND s.fiscal_year=g.fiscal_year
JOIN dim_customer c
ON s.customer_code=c.customer_code
WHERE s.fiscal_year=2021
GROUP BY c.channel
)
SELECT
channel,
gross_sales_mln,
ROUND(gross_sales_mln*100/SUM(gross_sales_mln)OVER(),2) AS percentage
FROM gs_mln
ORDER BY percentage DESC;