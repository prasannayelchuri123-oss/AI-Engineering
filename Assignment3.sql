-- 1. display all customer details who have made more than 5 payments.
SELECT *
FROM customer
WHERE customer_id IN
(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING count(payment_id) > 5
);

-- 2. Find the names of actors who have acted in more than 10 films.
 WITH ActorFilmCount AS
(
    SELECT
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(f.film_id) AS total_films
    FROM actor a
    join film_actor fa
      on a.actor_id= fa.actor_id
    join film f
      on fa.film_id=f.film_id
    group by 
        a.actor_id,
        a.first_name,
        a.last_name
)
select * from ActorFilmCount
where total_films > 10;
	
-- 3. Find the names of customers who never made a payment.
CREATE VIEW CustomerPayments AS 
select c.customer_id,c.first_name,c.last_name,p.payment_id
from customer c
left join payment p
on c.customer_id=p.customer_id;

SELECT
    first_name,
    last_name
FROM CustomerPayments
WHERE payment_id IS NULL;

-- 4. List all films whose rental rate is higher than the average rental rate of all films.
SELECT title, rental_rate
FROM film
WHERE rental_rate >
(
    SELECT AVG(rental_rate)
    FROM film
);

-- 5. List the titles of films that were never rented.


-- 7. Find all staff members who handled a payment greater than the average payment amount.
SELECT staff_id,first_name,last_name
from staff
where staff_id IN
(
   SELECT staff_id
   from payment
   where amount >
   (
   SELECT AVG(amount)
   from payment
   )
);

-- 8. Show the title and rental duration of films whose rental duration is greater than the average.
SELECT title, rental_duration
FROM film
WHERE rental_duration >
(
    SELECT AVG(rental_duration)
    FROM film
);

-- 10. List all payments that are greater than the average of all payments.
select * from payment
where amount >
(
    select AVG(amount)
    from payment
);    








