-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
select distinct  sakila.customer; 
SELECT 
    last_name,
    COUNT(*) AS duplicate_count
FROM sakila.customer
GROUP BY 
    last_name
HAVING COUNT(*) > 1;

-- 2. Number of times letter 'a' is repeated in film descriptions
select length(description) - length(replace(description,'a','')) as a_count,description 
from sakila.film;

-- 3. Number of times each vowel is repeated in film descriptions 
select description,
       length(description) - length(replace(description,'a','')) as a_count, 
       length(description) - length(replace(description,'e','')) as e_count,
       length(description) - length(replace(description,'i','')) as i_count, 
       length(description) - length(replace(description,'o','')) as o_count,
       length(description) - length(replace(description,'u','')) as u_count 
from sakila.film;

-- 4. Display the payments made by each customer
--        1. Month wise
--        2. Year wise
--        3. Week wise
SELECT
    customer_id,payment_date,
    week(payment_date) AS payment_week,
    SUM(amount) AS total_payment
FROM sakila.payment
GROUP BY customer_id, YEAR(payment_date);
 
-- 5. Check if any given year is a leap year or not. You need not consider any table from sakila database. 
-- Write within the select query with hardcoded date
select '2024' as year,
       case
           when mod(2024,400) = 0 or (mod(2024,4) = 0 and mod(2024,100) <>0)
           then 'Leap Year'
           else 'Not a leap year'
       end as result;

-- 6. Display number of days remaining in the current year from today.
select datediff('2026-12-31',curdate())  as days;

-- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
SELECT
    payment_date,
    CONCAT('Q', QUARTER(payment_date)) AS quarter_number
FROM sakila.payment order by quarter_number asc;



