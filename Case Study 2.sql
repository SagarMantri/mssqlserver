

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

