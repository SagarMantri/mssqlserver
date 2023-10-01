--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’.
create table orders
(
order_id int,
order_date date,
amount int,
customer_id int
);


--2. Insert 5 new records.
insert into orders values (1,'2023-09-29',10000,1);
insert into orders values (2,'2023-09-29',20000,2);
insert into orders values (3,'2023-09-29',30000,6);
insert into orders values (4,'2023-09-29',14000,3);
insert into orders values (5,'2023-09-29',10500,7);

--3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column
select * from customer c INNER JOIN ORDERS o on 
c.customer_id=o.customer_id;


--4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ 

select * from customer c LEFT JOIN ORDERS o on 
c.customer_id=o.customer_id;


select * from customer c RIGHT JOIN ORDERS o on 
c.customer_id =o.customer_id;


--Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column

select * from customer c full join orders o on 
c.customer_id=o.customer_id;


--6. Update the ‘Orders’ table and set the amount to be 100 where‘customer_id’ is 3.

update orders set amount=100 where customer_id=3;



