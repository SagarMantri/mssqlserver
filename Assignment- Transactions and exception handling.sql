--1. Create a view named ‘customer_san_jose’ which comprises of only those customers who are from San Jose


CREATE OR ALTER VIEW customer_san_jose
As
select * from customer where city='San Jose';

select * from customer_san_jose;

/*2. Inside a transaction, update the first name of the customer to Francis where the last name is Jordan:
a. Rollback the transaction
b. Set the first name of customer to Alex, where the last name is Jordan*/

begin transaction
update customer set first_name='Francis' where last_name='Jordan';
rollback transaction

begin transaction 
update customer set first_name='Alex' where last_name='Jordan';

--3. Inside a TRY... CATCH block, divide 100 with 0, print the default error message


declare @X INT
declare @y INT
begin try
set @x=80
set @y=@x/0
end try
begin catch
print error_message()
end catch


--4. Create a transaction to insert a new record to Orders table and save

begin transaction
insert into orders values(6,'2023-09-30',40000,4);
commit;

