-- Q6: Does payment method influence size of purchase?
describe order_payments;

select payment_type, AVG(payment_value) as avg_payment_value
from order_payments
group by payment_type
order by avg_payment_value DESC;


-- Limitations: I cannot measure with confidence if payment method influences size of purchase.
-- What I was able to do was to generate an average per transaction 


-- Granularity check
SELECT COUNT(*) FROM order_payments;
-- 103886
SELECT COUNT(*) FROM orders;
-- 99441

-- There is a gap between orders and payments made. I was not able to answer the question because  
-- a single order can have more than one payment method



