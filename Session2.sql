CREATE DATABASE sakila;
USE sakila;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50)
);


INSERT INTO student VALUES
(101, 'John', 'Computer Science'),
(102, 'Alice', 'Mathematics');
(103, 'Bob', 'Physics'),
(104, 'Eve', 'Chemistry');