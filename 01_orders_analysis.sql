# Q1: list the 10 most recent orders
describe orders;
select order_id, order_purchase_timestamp from orders 
Order by order_purchase_timestamp DESC
limit 10;