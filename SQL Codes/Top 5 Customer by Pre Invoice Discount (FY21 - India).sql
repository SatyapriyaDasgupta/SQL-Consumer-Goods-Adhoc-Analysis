SELECT
pre.customer_code,
cus.customer,
ROUND(AVG(pre.pre_invoice_discount_pct)*100,2) AS average_discount_percentage
FROM fact_pre_invoice_deductions pre
JOIN dim_customer cus
ON pre.customer_code=cus.customer_code
WHERE pre.fiscal_year=2021
AND market='India'
GROUP BY pre.customer_code, cus.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;