--Create a customer table which comprises of these columns: ‘customer_id’,‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip

create table customer
(
customer_id INT NOT NULL,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
addresss varchar(50),
city varchar(25),
states varchar(25),
zip varchar(10)
);

--Insert 5 new records into the table
insert into customer values (1,'Raghu','Gadgil','raghu@gmail.com','Malad West','Mumbai','Maharastra','4000024');
insert into customer values (2,'Ganesh','Gadgil','raghu@yahoo.com','Wakad','Pune','Maharastra','4000025');
insert into customer values (3,'Ganu','Joshua','raghu@gmail.com','Malad West','San Jose','Texas','4000024');
insert into customer values (4,'Rudra','Maharana','raghu@gmail.com','Malad West','San Jose','Chicago','4000045');
insert into customer values (5,'Maha','Rana','raghu@gmail.com','Malad West','San Jose','Washington','4000010');

-- Select only the ‘first_name’ and ‘last_name’ columns from the customer table
select first_name,last_name from customer;

-- Select those records where ‘first_name’ starts with “G” and city is ‘SanJose'
select * from customer where first_name LIKE 'G%' and CITY='SAN JOSE';

-- Select those records where  Email has only ‘gmail’
select * from customer where email LIKE '%gmail%';

--Select those records where the ‘last_name’ doesn't end with “A”
select * from customer where last_name NOT LIKE '%A';