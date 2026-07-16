# 'strings'
select title from sakila.film;
-- align a text to center /right/left
select title, lpad(rpad(title, 20, '*'),25,'*') as left_padded
from sakila.film limit 5;
select title,LPAD(title,10,'*') from sakila.film;

select title, rpad(title, 20, '*') as left_padded
from sakila.film limit 5;

#substring
-- lower limits and upper limits
select title,substring(title,5,9) as short_titlke from sakila.film;

#concatination
-- when you generate emailid with characters
select concat(first_name,'.',last_name) as full_name
from company_db.customer;

# reverse
select title,reverse(title) as reversed_title
from sakila.film limit 5;

#length
select title,length(title) as title_length
from sakila.film where length(title) >=8;

#substring with locate
select email from company_db.customer;
-- @ index postition 
select email,substring(email,locate('@',email) +1) as domain
from comapny_db.customer;
select email,substring_index(substring(email,locate('@',email) +1), '.',-1) as domain
from company_db.customer;

select substring_index(email,'@',1) from company_db.customer;

select title,upper(title),lower(title) from sakila.film
where upper(title) like '%LOVELY' or upper(title) like '%MAN';

select left(title,2) as first_letter, right(title,3) as last_letter, count(*);

#case
select last_name,
       case
           when left(last_name,1) between 'A' and 'M' then 'Group A-M'
           when left(last_name,1) between 'N' and 'Z' then 'Group N-Z'
           else 'other'
       end as group_label
from company_db.customer;     

select title,replace(title,'A','x') as cleaned_title
from sakila.film
where title like '%' '%';

-- not contains 3 consecutive vowels
select customer_id,last_name
from company_db.customer where last_name not REGEXP '[^aeiouAEIOU]{3}';

-- ENDS WITH VOWELS
select lower(title) from sakila.film
where title REGEXP '[^aeiouAEIOU]{3}';

select title,right(title,2) from sakila.film
where title REGEXP '[eE]$';

-- count
-- string built in functions in sql

#math
select title, rental_rate, rental_rate ^ 2 as double_rate -- debug why its allowing string + integer
from sakila.film;

-- select customer_id,
--       count(payment_id) as payments,
--       sum(amount) as total_paid,
--       sum(amount) 
       
-- rand,floor
select customer_id, (RAND() * 100), FLOOR(RAND() * 100) AS random_score     
from customer_db.customer  limit 5;

-- power,mod,ceil,round 

SELECT film_id,rental_duration, POWER(rental_duration, 2) AS squared_duration
FROM sakila.film
LIMIT 5;

------
SELECT film_id,length, MOD(length, 60) AS minutes_over_hour
FROM sakila.film;
-------------
SELECT rental_rate, CEIL(rental_rate) AS ceil_value, FLOOR(rental_rate) AS floor_value
FROM sakila.film;
----------
SELECT rental_rate, ROUND(replacement_cost / rental_rate, 0),ROUND(replacement_cost / rental_rate, 0) AS ratio
FROM sakila.film;

---------------------------------
#date diff 

SELECT rental_id, return_date,rental_date, DATEDIFF(return_date, rental_date) AS days_rented
FROM sakila.rental
WHERE return_date IS NOT NULL;

#date time 

select last_update,dayofyear(last_update),month(last_update) from sakila.film;

SELECT 
    rental_date, year(rental_date)
FROM
   sakila.rental;


SELECT payment_date FROM sakila.payment;

SELECT payment_date, date(payment_date) AS pay_date, SUM(amount) AS total_paid
FROM sakila.payment
GROUP BY DATE(payment_date),payment_date
ORDER BY pay_date DESC;

#Find Customers Who Paid in the Last 24 Hours

select * from sakila.payment;

SELECT customer_id, amount, payment_date
FROM sakila.payment
WHERE payment_date >= NOW() - INTERVAL 1 DAY;

select max(payment_date) FROM sakila.payment;

SELECT customer_id, amount, payment_date
FROM sakila.payment
WHERE payment_date >= (
    SELECT MAX(payment_date) - INTERVAL 10 day
    FROM sakila.payment
);

select now()  - INTERVAL 1 DAY as yesterday;


SELECT CONCAT('Today is: ', CURDATE()) AS message;
SELECT CONCAT('Today is: ', now()) AS message;

SELECT NOW(), CURDATE(), CURRENT_TIME;

select date_add(payment_date,Interval 5 day) from sakila.payment;

-- SELECT payment_date, DATE_ADD(payment_date, INTERVAL 7 DAY) FROM sakila.payment;
-- SELECT payment_date, DATE_ADD(payment_date, INTERVAL -7 DAY) FROM sakila.payment;

select payment_date,date_format(payment_date,('%d-%m-%Y')) as formated_date  from sakila.payment;




