-- CTE(common table expression): is a temporary result set that you reference within a sql query(select,update,insert or delete query) using with keyword.
-- It exists only during the execution of that query
-- It helps make complex queries easier to read,wite, and maintain.
-- can create multiple cte's.
-- best options for writing complex queries, especially when a query has multiple steps, joins, aggregations, or calculations.
-- reusability,readability

-- recursive : print first natural numbers 
with recursive numbers as(
-- step 1: Anchor member(starting now)
select 1 as n

union all

-- step 2: recursive number(generate next number)
select n + 1
from numbers
where n<20
)
select * from numbers;

-- recursive cte to generate the last 10 days
with recursive date as(
select date(max(rental_date))- interval 9 day as rental_day
from sakila.rental
union all
select rental_day + interval 1 day
from dates
where rental_day+interval 1 day <= (select max(rental_date) from sakila.rental)
)
 select * from sakila.rental;

-- Temporary tables
-- a table that exists only for the limited time(database session ends) or until explicity dropped.all
-- useful for storing intermediate results or testing transformations without affecting actual data
CREATE TEMPORARY TABLE high_payments as
SELECT payment_id,customer_id,amount from payment where amount >5;

select * from high_payments;

-- View: 
-- a virtual table created using a stored sql query
-- helps with simplfying complex queries(instead of writing evrytime,create a view once), data abstraction, and security (limit what users can set)
-- view for customer's most recent rental
-- helping in storing and creating as viewing global level
-- view inside the query will call every time
-- security(you can hide sensitive columns) and reusuability(create once use many times)
CREATE VIEW recent_rentals as
SELECT rental_id,rental_date,inventory_id,customer_id,return_date,staff_id
from rental
where rental_date >= DATE_SUB(CURDATE(),INTERVAL 30 DAY);

SHOW CREATE VIEW recent_rentals;

SELECT * FROM recent_rentals;

drop view sakila.recent_rentals;

create or replace view sakila.recent_rentals as 
select r.customer_id as cstd_id, max(r.rental_date) as ruchik
from sakila.rental r
group by r.customer_id;

-- stored procedures: pass parameters in dynamically
-- Group of SQL statements that are stored in the database and can be executed whenever needed.
-- Instead of writing the same query repeatedly, create a procedure once and call it many time.
-- physical blue print schema
-- input parameter
-- Delimiter is used in MySQL when creating stored procedures, functions, or triggers because they contain multiple SQL statements separated by semicolons.
--  Changing the delimiter prevents MySQL from ending the CREATE statement prematurely.
DELIMITER //
CREATE PROCEDURE sakila.GetCustomerPayments(IN cid INT)
BEGIN
    SELECT customer_id,payment_id,amount,payment_date
    from sakila.payment
    where customer_id= cid;
END //    

-- output parameter
DELIMITER //
CREATE PROCEDURE sakila.TotalPaid(IN cid INT, OUT total DECIMAL(10,2))
begin
   SELECT SUM(amount) INTO total
   FROM sakila.payment
   where customer_id = cid;
end //
-- The query is already written and stored.

-- Dynamic SQL Procedure:
-- A dynamic stored procedure in SQL is a stored procedure that builds and executes SQL statements dynamically at runtime based on input values.
-- It is commonly used when the table name, column name, filtering condition, or sorting column needs to change dynamically. 
CREATE PROCEDURE sakila.DynamicQuery(IN tbl_name VARCHAR(64))
BEGIN

END;

-- Why use Dynamic Stored Procedures?
-- Suppose you want to search customers by different columns:
-- Instead of creating three separate procedures, you can create one dynamic procedure:
-- call example:
CALL sakila.GetCustomerPayments(7);
CALL sakila.TotalPaid(7, @total);
select @total;
CALL sakila.DynamicQuery('sakila.customer');
-- The query is built while the procedure is running.

-- sql order of execution:
-- from -> join -> where -> group by -> having -> select -> distinct -> order by -> limit 
-- IN paramter -> filter data -> calculate value -> OUT parameter return result

-- Assignments
-- 2 cte
-- 2 views
-- 5 sub query
-- 1 temp table
-- top of it few stored procedured
-- 7 joins or converts joins in cte


