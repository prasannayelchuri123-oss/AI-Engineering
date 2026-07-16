-- INDEXING DEMO
-- ##################################
--  What is a Clustered Index?
-- A clustered index determines the physical order of data rows in a table. In MySQL (InnoDB), the primary key is always the clustered index.
--  Characteristics:
-- There is only one clustered index per table.
-- All rows are physically ordered by the clustered index key.
-- Very fast for range queries and primary key lookups.

-- What is a Non-Clustered Index?
-- A non-clustered index is a separate structure from the actual table data. It stores pointers (row IDs or PK values) to the actual rows in the clustered index.
--  Characteristics:
-- You can have multiple non-clustered indexes per table.
-- Ideal for filtering, searching, sorting on non-PK columns.
-- Slower than clustered index for lookups, since it adds an extra lookup step (called bookmark lookup).

-- indexes
-- 1.clustered index: 
-- using the primary key
-- 2.non-clustered index:
-- is a separate structure 
-- you can have multiple non- clustered index table per 

explain select * from sakila.sales_data; 

-- step 4: Add an index on the 'product_name' column
create index idx_product_name on sakila.sales_data(product_name);

-- step5: run the same select again after indexing
explain select * from sakila.sales_data where product_name='laptop' and amount=1300; 

drop index  idx_product_name on sakila.sales_data;
drop index idx_amount on sakila.sales_data;

-- reducing cost 

-- DISCUSSION :natural key & surrogate key
-- by nature it will be considered as unique indentifiers as primary key ex: ssn,adhar,passport

-- duplicate primary key
-- surrogate key : system generated primary keys

-- SQL Query Fine-Tuning Techniques
-- 1.use only necessary columns(avoid select *)
-- 2.use where before group by and having
-- 3.use join instead of subquery
-- 4.avoid functions on indexed columns
-- bad: cannot use index
-- better: preserves index
-- 5. use limit effectively
-- 6. use cte for readable query breakdown
-- 7.use expalin to understand query execution plan
-- 8.maintanence commands(run periodically)
-- 9.avoid large offsets in pagination
-- inefficient
-- efficient









