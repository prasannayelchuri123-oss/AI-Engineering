-- 1. Get all customers whose first name starts with 'J' and who are active.
select first_name,active from company_db.customer where first_name like 'j%' and active=1; 

-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
select title, description from sakila.film where title like '%action%' or description like '%war%';

-- 3.List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select first_name,last_name from company_db.customer where last_name!='smith' and first_name like '%a';

-- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
select title,rental_rate,replacement_cost from sakila.film 
where rental_rate > 3.0 and replacement_cost is not null;

-- 5. Count how many customers exist in each store who have active status = 1.
select count(*) from sakila.customer where active =1;

-- 6. Show distinct film ratings available in the film table.
select distinct rating from sakila.film;

-- 7. Find the number of films for each rental duration where the average length is more than 100 minutes.
select rental_duration,count(*),
avg(length) as average_length from sakila.film
group by rental_duration
having avg(length) > 100;

-- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
SELECT
    DATE(payment_date) AS payment_day,
    SUM(amount) AS total_amount_paid
FROM sakila.payment
GROUP BY DATE(payment_date)
HAVING COUNT(payment_id) > 100;

-- 9. Find customers whose email address is null or ends with '.org'.
select first_name,email_id from company_db.customer where email_id is null or email_id like '%.org';

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
select title from sakila.film where rating='PG' or rating='G' order by rental_rate desc;

-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
SELECT
    length,
    count(film_id) AS total_films
FROM sakila.film
WHERE title LIKE 'T%'
GROUP BY length
HAVING count(film_id) > 5;
 
-- 12. List all actors who have appeared in more than 10 films.
select first_name as actors, actor_id as films from sakila.actor where actor_id > 10;

-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, 
-- ordering by rental rate first and length second.
select title as films,rental_rate,length from sakila.film 
order by rental_rate desc, length desc limit 5;

-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
select * from sakila.rental;
select customer_name as customers,count(rental_id) as total_rentals from sakila.rental 
group by customer_name
order by total_rentals desc;

-- 15. List the film titles that have never been rented.
select title,rental_rate as rented from sakila.film where rental_rate is null;
