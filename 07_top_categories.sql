-- Q7: Top 10, most sold categories 

select product_category_name, count(product_category_name) as order_quantity 
from products
join order_items on  order_items.product_id = products.product_id
group by product_category_name
order by order_quantity DESC
limit 10;

-- cama_mesa_banho leads the category with the most items sold
-- If I were to put on the catalog taking into account only volume
-- the top three cama_mesa_banho,beleza_saude,esporte_lazer would definitely be there
-- but we can't be sure if it is the most profitable category since we don't know the average ticket
-- another query calculating the average ticket per category would give us this insight 


-- Granularity check
select count(product_category_name) 
from products
join order_items on  order_items.product_id = products.product_id;
-- 112650


select count(*) 
from products
join order_items on order_items.product_id = products.product_id
-- 112650



