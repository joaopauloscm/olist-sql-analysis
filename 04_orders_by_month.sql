# Q4: orders by month 

SELECT DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS order_month, count(*) as total_monthly
FROM orders
GROUP BY order_month
ORDER BY order_month;
