-- Q9: Average rating by product 

select product_category_name, AVG(review_score) as avg_review, Count(review_id) as number_of_reviews
from order_items
left join  products on products.product_id = order_items.product_id 
join order_reviews on order_items.order_id = order_reviews.order_id 
group by product_category_name
having number_of_reviews > 100
order by AVG(review_score) ASC;

-- moveis_escritorio leads the list with the lowest average review
-- the granularity check pointed a gap. this means some products are getting their reviews duplicated
-- Trying to figure out the least favorite category is not a great way to measure since a single review for a single product
-- in a multi-product purchase can lower other categories review 


-- granularity
select Count(review_id) as number_of_reviews
from order_items
left join  products on products.product_id = order_items.product_id 
join order_reviews on order_items.order_id = order_reviews.order_id;
-- 112371
select Count(review_id) as number_of_reviews
from order_reviews
-- 99223




