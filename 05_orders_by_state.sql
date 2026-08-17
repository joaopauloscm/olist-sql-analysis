# Q5: Orders by customer state 
select customers.customer_state, count (*) as total_orders
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.customer_state
order by total_orders DESC;

-- Validation: make sure the join does not duplicate rows.
-- Both checks below must match the row count of the orders table.

-- 1) Rows produced by the join vs. total orders — must be equal.
-- 2) customer_id is unique in customers (distinct ids = total rows),
--    so each order matches exactly one customer row and the join is 1:1.

SELECT COUNT(*) FROM orders;

select count(customers.customer_state) 
from customers
join orders on customers.customer_id = orders.customer_id;

select count(distinct customer_id) 
from customers

