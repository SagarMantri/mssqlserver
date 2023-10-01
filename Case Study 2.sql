

Create table location
(location_id int,
city varchar(20),
constraint pk_location PRIMARY KEY(location_id)
);

create table department
(department_id int,
name varchar(20),
location_id int,
constraint pk_dept PRIMARY KEY(department_id),
constraint fk_loc FOREIGN KEY (location_id) references location(location_id)
);

create table job
( 
job_id int,
designation varchar(20),
constraint pk_job PRIMARY KEY(job_id)
);


create table employee
(
employee_id INT,
first_name varchar(50),
last_name varchar(50),
middle_name char(1),
job_id int,
hire_date date,
salary int,
comm int,
department_id int
);

insert into location values (122,'New York');
insert into location values (123,'Dallas');
insert into location values (124,'Chicago');
insert into location values (167,'Boston');

commit

insert into department values(10,'Accounting',122);
insert into department values(20,'Sales',124);
insert into department values(30,'Research',123);
insert into department values(40,'Operations',167);

insert into job values(667,'Clerk');
insert into job values(668,'Staff');
insert into job values(669,'Analyst');
insert into job values(670,'Sales Person');
insert into job values(671,'Manager');
insert into job values(672,'President');



insert into employee values (7369,'Smith','John','Q',667,'17-DEC-84',800,NULL,20);
insert into employee values (7499,'Allen','Kevin','J',670,'20-Feb-85',1600,300,30);
insert into employee values (755,'Doyle','Jean','K',671,'04-APR-85',2850,NULL,30);
insert into employee values (756,'Dennis','Lynn','S',671,'15-MAY-85',2750,NULL,30);
insert into employee values (757,'Baker','Leslie','D',671,'10-JUN-85',220,NULL,40);
insert into employee values (7521,'Wark','Cynthia','D',670,'22-FEB-85',1250,50,30);


--Simple Queries

--1. List all the employee details. 
select * from employee;

--2. List all the department details.
select * from department;

--3. List all job details. 
select * from job;

--4. List all the locations. 
select * from location;

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
select first_name,last_name,salary,comm from employee;
--6. List out the Employee ID, Last Name, Department ID for all employees and alias 
select e.employee_id,e.last_name,e.department_id from employee e;
--Employee ID as "ID of the Employee", Last Name as "Name of the Employee", Department ID as "Dep_id".
select employee_id as 'ID of the Employee',Last_name as 'Name of the Employee',department_id as 'dep_id' from employee

--7. List out the annual salary of the employees with their names only
select first_name,middle_name,Last_name,salary*12 as 'annual salary' from employee;


--WHERE Condition
--1. List the details about "Smith"
select * from employee where first_name='Smith';

--2. List out the employees who are working in department 20
select * from employee where department_id=20;

--3. List out the employees who are earning salaries between 3000 and 4500
select * from employee where salary > 3000 and salary <4500;

--4. List out the employees who are working 
select * from employee where department_id in (10,20);

--5. Find out the employees who are not working in department 10 or 30. 
select * from employee where department_id NOT IN (10,30);


--6. List out the employees whose name start with S
select * from employee where first_name LIKE 'S%';


--7. List out the employees whose name starts with 'S' and ends with 'H'. 
select * from employee where first_name LIKE 'S%H';

--8. List out the employees whose name length is 4 and start with 'S'. 
select * from employee where len(first_name)=4 and first_name LIKE 'S%';


--9. List out employees who are working in department 10 and draw salaries more than 3500. 
select * from employee where department_id=10 and salary >3500;

--10. List out the employees who are not receiving commission. 
select * from employee where comm IS NULL;

--ORDER BY Clause
--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select employee_id,last_name from employee order by employee_id asc;

--2. List out the Employee ID and Name in descending order based on salary. 
select employee_id,first_name from employee order by salary desc;
--3. List out the employee details according to their Last Name in ascending-order.
select * from employee order by last_name asc;
--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order. 
select * from employee order by last_name asc, department_id desc;


--GROUP BY and HAVING Clause

--1. How many employees are in different departments in the organization?
select department_id,count(1) from employee group by department_id;

--2. List out the department wise maximum salary, minimum salary and average salary of the employees. 
select department_id, max(salary) As 'Max Salary',min(salary) as 'Min Salary',avg(salary) as 'Avg Salary' from employee group by department_id 

--3. List out the job wise maximum salary, minimum salary and average salary of the employees. 
select job_id,max(salary) as 'Max Salary',min(salary) as 'Min Salary',avg(salary) as 'Average Salary' from employee group by job_id; 

--4. List out the number of employees who joined each month in ascending order. 
select datename(mm,hire_date) as  month,count(*) as noofemployee from employee group by Datename(mm,hire_date);

--5. List out the number of employees for each month and year in ascending order based on the year and month. 
select datename(mm,hire_date) as months,datename(yy,hire_date) as years, count(employee_id) as 'number of employee' from employee group by datename(mm,hire_date),datename(yy,hire_date); 

--6. List out the Department ID having at least four employees. 
select department_id,count(1) as 'Count of employee' from employee group by department_id having count(1)>=4 

--7. How many employees joined in the month of January?
select count(employee_id),DATENAME(mm,hire_date) as 'Month' from employee group by DATENAME(mm,hire_date) having DATENAME(mm,hire_date)='January';

--8. How many employees joined in the month of January or September?
select count(employee_id),DATENAME(mm,hire_date) as 'Month' from employee group by DATENAME(mm,hire_date) having DATENAME(mm,hire_date) in ('January','September');

--9. How many employees joinecd in 1985?
select count(employee_id) as 'No of Employee',datename(yyyy,hire_date) from employee group by DATENAME(yyyy,hire_date) having DATENAME(yyyy,hire_date)=1985; 


--10. How many employees joined each month in 1985
select count(employee_id) as 'No of Employee',datepart(yy,hire_date),datename(MM,hire_date) from employee where datepart(yy,hire_date)=1985 group by datepart(yy,hire_date), DATENAME(MM,hire_date) ; 

--11. How many employees joined in March 1985?
select count(*) as 'Number of employee', DATEPART(YY,hire_date),datename(MM,hire_date) from employee where datename(MM,hire_date)='MARCH' and datepart(YYYY,hire_date)=1985
group by DATEPART(YY,hire_date),datename(MM,hire_date);

--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985
select e.department_id, count(*) as 'Count of Employee' from employee e where datepart(YYYY,hire_date)=1985 and datename(MM,hire_date)='APRIL' group by e.department_id; 



--SET Operators:
--1. List out the distinct jobs in sales and accounting departments. 
select designation, job_id from job where  job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Sales'))
UNION
select designation, job_id from job where job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Accounting'))
--2. List out all the jobs in sales and accounting departments. 
select  designation, job_id from job where  job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Sales'))
UNION ALL
select  designation, job_id from job where job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Accounting'))

--3. List out the common jobs in research and accountingdepartments in ascending order. 
select  job_id from job where  job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Research'))
INTERSECT
select  job_id from job where job_id  in (select job_id from employee e where e.department_id in (select department_id from department where name ='Accounting'))



--Subqueries
--1. Display the employees list who got the maximum salary.
select * from employee where salary in (select max(salary) from employee);

--2. Display the employees who are working in the sales department. 
select * from employee where department_id in (select department_id from department where name='Sales');

--3. Display the employees who are working as 'Clerk'. 
select * from employee where department_id in (select department_id from department where name='Clerk');

--4. Display the list of employees who are living in "New York". 
select * from employee where department_id in (select department_id from department where location_id in (select location_id from location where city='New York' ));

--5. Find out the number of employees working in the sales department. 
select count(*) from employee where department_id in (select department_id from department where name='Sales');

--6. Update the salaries of employees who are working as clerks on the basis of10%. 
update employee set salary=(salary + (salary*10/100)) where department_id in (select department_id from department where name='Clerk'); 

--7. Delete the employees who are working in the accounting department.
delete from employee where department_id in (select department_id from department where name='Accounting');

--8. Display the second highest salary drawing employee details. 
select * from employee where salary in (select max(salary) from employee where salary < (select max(salary) from employee))


--9. Display the nth highest salary drawing employee details. 
select a.salary from employee A where N-1=(select count(distinct (b.salary)) from employee b where a.salary<b.salary)

--10. List out the employees who earn more than every employee in department 30. 
select * from employee e where salary > ALL (select salary from employee where department_id = 30);
--OR
select * from employee e where salary > ALL (select max(salary) from employee where department_id = 30);

--11. List out the employees who earn more than the lowest salary in department. Find out whose department has no employees. 
select * from employee e where salary > ANY (select min(salary) from employee where department_id = 30);

--12. Find out which department has no employees. 
select department_id,name from department where department_id not in (select department_id from employee);

--13. Find out the employees who earn greater than the average salary for their departm
select * from employee e where salary > (select avg(salary) from employee er where er.department_id=e.department_id group by er.department_id)

--Joins
--1. List out employees with their department names. 
select e.*,d.name from employee e inner join department d on e.department_id=d.department_id;

--2. Display employees with their designations. 
select e.*,j.designation from employee e inner join job j on e.job_id=j.job_id; 

--3. Display the employees with their department names and regional groups. 
select e.*,d.name,l.* from employee e inner join department d on e.department_id=d.department_id inner join location l on d.location_id=l.location_id

--4. How many employees are working in different departments? Display with department names. 
select d.name,count(*) as 'Count of employees' from department d inner join employee e on d.department_id=e.department_id group by d.name;

--5. How many employees are working in the sales department?
select count(1) from employee e inner join department d on e.department_id=d.department_id where d.name='sales';


--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
select d.name,count(*) as 'Number of Employee' from department d inner join employee e on d.department_id=e.department_id group by d.name having count(*) >=5;

--7. How many jobs are there in the organization? Display with designations. 
select j.designation,count(*) from job j inner join employee e on j.job_id=e.job_id group by j.designation;

--8. How many employees are working in "New York"?
select count(1)  as 'Count of employee' from employee e inner join department d on e.department_id=d.department_id inner join location l on d.location_id=l.location_id where l.city='New York' 

--9. Display the employee details with salary grades. Use conditional statement to create a grade column. 
select *, CASE 
WHEN salary <1000 THEN 'Low Grade'
WHEN salary >=1000 and salary< 2000 THEN 'Medium Grade'
Else 'High Grade' END As 'Salary Grades'  from employee;


--10. List out the number of employees grade wise. Use conditional statement to create a grade column. 
select *, CASE 
WHEN salary <1000 THEN 'Low Grade'
WHEN salary >=1000 and salary< 2000 THEN 'Medium Grade'
Else 'High Grade' END As 'Salary Grades'  from employee order by salary desc;


--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary. 
select  CASE 
WHEN salary <1000 THEN 'Low Grade'
WHEN salary >=1000 and salary< 2000 THEN 'Medium Grade'
Else 'High Grade' END As 'Salary Grades', count(1)  from employee where salary between 2000 and 5000 group by CASE 
WHEN salary <1000 THEN 'Low Grade'
WHEN salary >=1000 and salary< 2000 THEN 'Medium Grade'
Else 'High Grade' END ;


--12. Display all employees in sales or operation departments. 

select * from employee e inner join department d on e.department_id=d.department_id where d.name in ('sales','operation'); 
