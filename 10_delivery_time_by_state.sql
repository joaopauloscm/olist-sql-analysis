-- Q10: Time orders get delivered in each state 
SELECT customer_state,AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp )) as avg_delivery_time
from
customers
join orders on customers.customer_id = orders.customer_id
group by customer_state
order by AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp )) ASC;

-- The delivery experience is not the same for each state, SP Average wait time is 8.7 while RR 29.3
-- this connects to previous query such as orders_by_state and
-- revenue_by_seller. There is a tendency for customers from the North and Northeastern region of Brazil to buy products
-- from sellers outside their state that means longer waiting times for their orders
-- the solution for this problem might be the same as for Q8 
-- If the company can attract more qualified local sellers in those areas
-- the customers would be less affected by the longer wait times 
-- The data only covers orders that have been delivered. lost or cancelled orders were left out of the query

-- Granularity check 
SELECT AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp )) as avg_delivery_time
from
orders;
-- '12.4973'

SELECT AVG(DATEDIFF(order_delivered_customer_date,order_purchase_timestamp )) as avg_delivery_time
from
customers
join orders on customers.customer_id = orders.customer_id
-- '12.4973'





