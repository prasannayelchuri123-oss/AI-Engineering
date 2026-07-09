create database  company_db;

-- creating a table
create table company_db.customer(
id int ,
name varchar(100)
);

-- alter is to add new column in existing table
alter table company_db.customer add email varchar(100);
-- rename to change existing column name
alter table company_db.customer rename column email to email_id;
alter table company_db.customer rename column id to customer_id;
alter table company_db.customer add primary key(customer_id);
select * from company_db.customer;

-- inserting new values to the exixting table
insert into company_db.customer(id,name,email_id) values('1','john','john123@gmail.com');
insert into company_db.customer(id,name,email_id) values('2','joe','joe4567@gmail.com'),
('3','ramya','ramya6789@gmail.com');
-- safe update mode is turned off, if primary key is not specified in table might get error so we are using it
SET SQL_SAFE_UPDATES = 0;

-- update is used to modify existing data in a table,use when you want to change values that are already stored
update  company_db.customer set name ='ravi' where id= 3;

-- delete is used to remove one or more rows from a table (remove specific rows using a where clause)
delete from company_db.customer where id= 3;

-- drop removes entire table from database
drop table company_db.customer;

-- removes all rows. from a table but keeps the table structure
truncate table company_db.customer;
select * from company_db.customer;

-- primary key : 1) values must be unique
--               2) only one primary key per table
--               3) exists in parent table
CREATE TABLE company_db.order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);
select * from company_db.order;

insert into company_db.order(order_id,customer_id,order_date,order_amount)
values('101','1','2025-02-06','300'),('102','2','2024-11-19','400'),('103','3','2025-05-16','500');

-- foreign key: 1) creates a relationship between two tables
--              2) table can have multiple foreign keys
--              3) references the primary key of another table
--              4) values can be duplicate


















