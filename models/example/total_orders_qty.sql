SELECT
  n.full_name,
  n.email_address,
  n.total_orders,
  oi.order_id,
  SUM(oi.quantity) AS total_qty
FROM
  Customer_Sales.Order_items oi
JOIN
 Customer_Sales.Orders o
 on oi.order_id = o.order_id
 join
  {{ ref("newquery")}} n
ON
  o.customer_id = n.customer_id
GROUP BY
  n.full_name,
  n.email_address,
  n.total_orders,
  oi.order_id 
  order by total_orders desc, total_qty desc