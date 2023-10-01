
--1. Arrange the ‘Orders’ dataset in decreasing order of amounts

select * from orders order by amount desc;

--2. Create a table with the name ‘Employee_details1’ consisting of these columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. 
--Create another table with the name ‘Employee_details2’ consisting of the same columns as the first table

create table Employee_details1
(
Emp_id int,
Emp_name varchar(50),
Emp_salary INT
);

create table Employee_details2
(
Emp_id int,
Emp_name varchar(50),
Emp_salary INT
);

--3. Apply the UNION operator on these two tables

select Emp_id,Emp_name,Emp_salary from Employee_details1
UNION 
select Emp_id,Emp_name,Emp_salary from Employee_details2;

--4. Apply the INTERSECT operator on these two tables
select Emp_id,Emp_name,Emp_salary from Employee_details1
INTERSECT
select Emp_id,Emp_name,Emp_salary from Employee_details2;

--5. Apply the EXCEPT operator on these two tables
select Emp_id,Emp_name,Emp_salary from Employee_details1
EXCEPT
select Emp_id,Emp_name,Emp_salary from Employee_details2;

select Emp_id,Emp_name,Emp_salary from Employee_details2
EXCEPT
select Emp_id,Emp_name,Emp_salary from Employee_details1;

