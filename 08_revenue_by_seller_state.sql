-- Q8: Revenue by seller in each state 

select seller_state,SUM(price) as total_revenue
from sellers 
left join order_items on sellers.seller_id = order_items.seller_id
group by seller_state
order by SUM(price) DESC;

-- The revenue concentrates towards the south and southeast region of the country with some exceptions BA,PE 
-- North and Northeast states are found on the bottom of the list 
-- We can visualize that states with most revenue are the states that also receive the most orders, states with low revenue might 
-- be explained by higher shipping fees. If the company can attract more qualified local sellers in those areas
-- the customers would be less affected by the high shipping fees


-- granularity 
select SUM(price) 
from sellers 
left join order_items on sellers.seller_id = order_items.seller_id;
-- 13591643.70

select SUM(price) as total_revenue
from order_items 
-- 13591643.70

