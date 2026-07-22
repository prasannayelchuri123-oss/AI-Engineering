 -- 1. List all customers along with the films they have rented.
 select c.customer_id,c.first_name,c.last_name,f.title
 from customer c
 join rental r
 on c.customer_id=r.customer_id
 join inventory i
 on r.inventory_id=i.inventory_id
 join film f
 on i.film_id=f.film_id;
 

 
 -- 2. List all customers and show their rental count, including those who haven't rented any films.
 select c.customer_id,c.first_name,c.last_name,count(r.rental_id) 
 from customer c
 left join rental r
 on r.customer_id=c.customer_id
 group by 
 c.customer_id,c.first_name,c.last_name;
 
 -- 3. Show all films along with their category. Include films that don't have a category assigned.
 select f.film_id,f.title,f.description,
 c.name,fc.category_id
 from film f
 left join film_category fc
 on fc.film_id=f.film_id
 left join category c
 on c.category_id=fc.category_id;
 
 -- 4. Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).
select c.customer_id,c.email as customer_email,s.staff_id,s.email as staff_email
from customer c
left join staff s
on c.email=s.email

union

select c.customer_id,c.email as customer_email,s.staff_id,s.email as staff_email
from customer c
right join staff s
on c.email=s.email;

-- 5. Find all actors who acted in the film "ACADEMY DINOSAUR".
select a.actor_id,a.first_name,a.last_name,fa.actor_id,f.film_id,f.title 
from actor a
left join film_actor fa
on a.actor_id = fa.actor_id
left join film f
on fa.film_id = f.film_id
where f.title='ACADEMY DINOSAUR';

-- 6. List all stores and the total number of staff members working in each store, 
-- even if a store has no staff.
select store.store_id, count(staff.staff_id) as total_staff
 from store
left join staff
on store.store_id = staff.store_id
group by store.store_id;

-- 7. List the customers who have rented films more than 5 times. Include their name and total rental count.

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(r.rental_id) > 5;

    











