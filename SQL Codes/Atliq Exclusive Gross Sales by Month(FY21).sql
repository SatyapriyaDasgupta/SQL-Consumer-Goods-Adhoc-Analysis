SELECT
MONTH(s.date) AS Month,
s.fiscal_year,
ROUND(SUM(s.sold_quantity*g.gross_price),2) AS Gross_Sales_Amount
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code=g.product_code
AND s.fiscal_year=g.fiscal_year
JOIN dim_customer c
ON s.customer_code=c.customer_code
WHERE customer='Atliq Exclusive'
GROUP BY s.date;