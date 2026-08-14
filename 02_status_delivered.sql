# Q2: how many orders have been delivered?
select count(*) AS orders_delivered 
from orders 
where order_status = 'Delivered'


