select id,email,name,gender,age,city
from(
select
replace(split_part(email, '@', 1),'.',' ') AS name,
case
when num = 1 then 'MALE'
when num = 2 then 'FEMALE'
when num = 3 then 'OTHERS'
end as gender,
case
when number = 1 then 'INDORE'
when number = 2 then 'BHOPAL'
when number = 3 then 'JABALPUR'
when number = 4 then 'GWALIOR'
when number = 5 then 'REWA'
when number = 6 then 'UJJAIN'
when number = 7 then 'PUNE'
when number = 8 then 'MUMBAI'
when number = 9 then 'DELHI'
when number = 10 then 'NOIDA'
end as city,
*
from(
select
rand_pattern ('CUST-#####') as id,
rand_email () as email,
rand (1,4) as num,
rand (1,11) as number,
rand (20,100) as age
from(
values (sequence (cast('2019-8-01 00:00' AS timestamp), cast('2019-11-13 03:59' AS timestamp),
INTERVAL '15' MINUTE))) AS t1 (date_array)
CROSS JOIN UNNEST(date_array) AS t2 (order_date)));