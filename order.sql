select order_ts,order_id,customer_id,product_id,order_amount,payment_method
from(
select
case
when num = 1 then 'via Cash'
when num = 2 then 'via UPI'
when num = 3 then 'via NetBanking'
when num = 4 then 'via OnlineTransfer'
when num = 5 then 'via IMPS'
when num = 6 then 'via NEFT'
when num = 7 then 'others'
end as payment_method,
*
from(
select
rand_pattern ('CUST-#####') as customer_id,
rand_pattern ('PRO-#######') as product_id,
rand_pattern ('ORD-2022-#####') as order_id,
rand (1,8) as num,
rand (999,9999) as order_amount,
order_date as order_ts
from(
values (sequence (cast('2019-8-01 00:00' AS timestamp), cast('2019-11-13 03:59' AS timestamp),
INTERVAL '15' MINUTE))) AS t1 (date_array)
CROSS JOIN UNNEST(date_array) AS t2 (order_date)))