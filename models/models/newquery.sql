{{
    config(
        materialized='table'
    )


}}

SELECT
  c.customer_id,
  c.full_name,
  c.email_address,
  COUNT(o.CUSTOMER_ID) AS total_orders
FROM
  `adept-amp-428807-c9.Customer_Sales.Customers` c
LEFT JOIN
  `adept-amp-428807-c9.Customer_Sales.Orders` o
ON
  c.customer_id = o.customer_id
GROUP BY
  c.customer_id,
  c.FULL_NAME,
  c.EMAIL_ADDRESS order by total_orders desc