--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

select min(amount),max(amount),avg(amount) from orders;

--2. Create a user-defined function which will multiply the given number with 10

create FUNCTION dbo.multiply(@x INT)
	RETURNS INT
	AS 
	BEGIN 
		DECLARE @Z INT;
		select @Z=@x*10;
		return @Z;	
	END;

select [dbo].multiply(9) as result;

--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and print the corresponding value
select CASE
WHEN 100<200 THEN '100 is less than 200'
WHEN 100>200 THEN '100 is greater than 200'
ELSE '100 is equal to 200'
END AS CASE_RESULT;



--4. Using a case statement, find the status of the amount. Set the status of the amount as high amount, low amount or medium amount based upon the condition.
select amount,CASE
WHEN amount<10000 THEN 'Low Amount'
When amount >10000 and amount <20000 then 'Medium Amount'
ELSE 'High Amount' 
END as Status from orders;


--5. Create a user-defined function, to fetch the amount greater than then given input.

create function dbo.greater(@x INT)
RETURNS TABLE
AS 
return (select * from orders where amount > @x);


