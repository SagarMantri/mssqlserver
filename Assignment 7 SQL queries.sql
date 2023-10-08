--Tasks To Be Performed:
--1. Find out the selling cost average for packages developed in Pascal.

select avg(cast(SCOST as float)) from software s inner join programmer p
on s.pname =p.pname
where p.PROF1='PASCAL'
--2. Display the names and ages of all programmers.
select PNAME,datediff(year, DOB,getdate()) as Age  from programmer;

--3. Display the names of those who have done the DAP Course.
select PNAME from studies where COURSE='DAP';

--4. Display the names and date of birth of all programmers born in January.
select PNAME from programmer where DATENAME(month,DOB)='January';


--5. What is the highest number of copies sold by a package?

select max(sold) from software

--6. Display lowest course fee.
select course from studies where [course fee] in (select min([course fee]) from studies);
select * from software;

--7. How many programmers have done the PGDCA Course?
select Count(1) from studies where course='PGDCA';

--8. How much revenue has been earned through sales of packages developed in C?
select developin,sum(cast(SCOST as float)) As 'Revenue earned' from software group by developin having developin='C'

--9. Display the details of the software developed by Ramesh.
select * from software where PNAME='RAMESH';

--10. How many programmers studied at Sabhari?
select * from studies where institute = 'SABHARI';

--11. Display details of packages whose sales crossed the 2000 mark.
select TITLE from software where SOLD >2000;

--12. Display the details of packages for which development costs have beenrecovered.
select title from software where cast(dcost as float) <= (cast(scost as float)*cast(sold as float))
select * from programmer
--13. What is the cost of the costliest software development in Basic?
select cast(dcost as float) from software where developin = 'Basic';
--14. How many packages have been developed in dBase?
select count(1) from programmer where PROF2='DBASE';

--15. How many programmers studied in Pragathi?
select * from studies where institute='PRAGATHI'

--16. How many programmers paid 5000 to 10000 for their course?

--17. What is the average course fee?
select avg(cast([course fee] as FLOAT)) from studies;

--18. Display the details of the programmers knowing C.
select * from programmer where PROF1 ='C' OR PROF2='C';

--19. How many programmers know either COBOL or Pascal?
select count(PNAME) from programmer where PROF1 in ('COBOL','PASCAL') or PROF2 in ('COBOL','PASCAL');

--20. How many programmers don’t know Pascal and C?
select count(PNAME) from programmer where PROF1 not in ('COBOL','PASCAL') or PROF2 not in ('COBOL','PASCAL');

--21. How old is the oldest male programmer?
select datediff(year,DOB,getdate()) from programmer where dob in (select min(dob) from programmer);

--22. What is the average age of female programmers?
select avg(datediff(year,dob,getdate())) as 'Average age of Femlae programmers' from programmer where GENDER='F';

--23. Calculate the experience in years for each programmer and display with their names in descending order.
select PNAME,datediff(year,doj,getdate()) as 'Years of experience' from Programmer order by PNAME desc;

--24. Who are the programmers who celebrate their birthdays during the current month?
select PNAME from programmer where datename(month,DOB)=DATENAME(month,getdate());

--25. How many female programmers are there?
select count(PNAME) from Programmer where GENDER='F';

--26. What are the languages studied by male programmers?
select PROF1 As 'Language Studied' from programmer where GENDER='M'
UNION
select PROF2 as 'Language Studied' from programmer where GENDER='M';

--27. What is the average salary?
select avg(cast(salary as float)) from programmer;

--28. How many people draw a salary between 2000 to 4000?
select count(PNAME) from programmer where salary between 2000 and 4000;

--29. Display the details of those who don’t know Clipper, COBOL or Pascal.
select * from programmer where PROF1 in ('Clipper','COBOL','Pascal') OR PROF2 in ('Clipper','COBOL','Pascal');

--30. Display the cost of packages developed by each programmer.
select sum(cast(scost as float)*cast(sold as float)) as cost_of_package,title,pname from software group by pname,title; 
--31. Display the sales value of the packages developed by each programmer.
select pname,sum(cast (SCOST as FLOAT)) from software group by pname;


--32. Display the number of packages sold by each programmer.
select pname,count(title) from software group by pname;

--33. Display the sales cost of the packages developed by each programmer language wise.
select sum(cast(scost as float)*cast(sold as float)) as Sales_Cost, pname,developin from software group by pname,developin;

--34. Display each language name with the average development cost, average selling cost and average price per copy.

--35. Display each programmer’s name and the costliest and cheapest packages developed by him or her.
select pname,min(cast(dcost as float)),max(cast(scost as float)) from software group by pname;

--36. Display each institute’s name with the number of courses and the average cost per course.
select institute,count([course]),avg(cast([course fee] as float)) from studies group by institute;
--37. Display each institute’s name with the number of students.
select institute,count(pname) as counts_of_pname from studies group by institute;
--38. Display names of male and female programmers along with their gender.
select pname,gender from programmer;
--39. Display the name of programmers and their packages.
select pname,title from software;

--40. Display the number of packages in each language except C and C++.
select Developin, count(title) from software group by developin having developin <> 'C' and developin <>'C++' 

--41. Display the number of packages in each language for which development cost is less than 1000.
select count(title) as counts_of_package ,developin from software where cast(dcost as float) <1000 group by developin;

--42. Display the average difference between SCOST and DCOST for each package.
select title,avg(cast(SCOST as float) -cast(dcost as float)) as differences from software group by title
--43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.
select pname,sum(cast(SCOST as float)) as scost_sum,SUM(cast(DCOST as float)) as sum_dcost,
(sum(cast(dcost as float)) - sum(cast(SCOST as float)*cast(SOLD as float))) as dcost_sum
from software 
group by pname having (sum(cast(SCOST as float))) < (SUM (cast(DCOST as float)))

 
--44. Display the highest, lowest and average salaries for those earning more than 2000.
select max(cast(salary as INT)) as 'Max Salary',min(cast(salary as INT)) as 'Min Salary',avg(cast (salary as INT)) as 'Avg Salary' from programmer where salary > 2000;
--45. Who is the highest paid C programmer?
select pname from programmer where salary in (select max(Salary) from programmer where PROF1 ='C' or PROF2='C');
--46. Who is the highest paid female COBOL programmer?
select pname from programmer where salary in (select maX(salary) from programmer where PRof1='COBOL' or PROF2='COBOL') and GENDER='F'; 

--47. Display the names of the highest paid programmers for each language.
select pname,PROFmax(salary) from programmer 
--48. Who is the least experienced programmer?
select Pname from programmer where datediff(month,DOJ,getdate()) in (select min(datediff(month,DOJ,getdate())) as 'Least experienced' from programmer);
--49. Who is the most experienced male programmer knowing PASCAL?

select PNAME from programmer where datediff(month,DOJ,getdate()) in ( select max(datediff(month,doj,getdate())) from programmer where PROF1='PASCAL' OR PROF2='PASCAL') AND GENDER='M'; 

--50. Which language is known by only one programmer?
select PROF1 from programmer group by prof1 having PROF1 not in (select PROF2 from programmer) and count(PROF1)=1
UNION 
select PROF2 from programmer group by prof2 having PROF2 not in (select PROF1 from programmer) and count(PROF2)=1
--51. Who is the above programmer referred in 50?
select * from programmer where datename(YYYY,DOB)='1950';

--52. Who is the youngest programmer knowing dBase?

select PNAME from programmer where datediff(year,DOB,getdate())  in (select min(datediff(year,DOB,getdate())) from programmer where  PROF1='DBASE' or PROF2='DBASE');


--53. Which female programmer earning more than 3000 does not know C,C++, Oracle or dBase?
select * from programmer where gender='F' and PROF1 NOT IN ('C','C++','Oracle','Dbase') 
UNION 
select * from programmer where gender='F' and PROF2 NOT IN ('C','C++','Oracle','Dbase')

--54. Which institute has the most number of students?
SELECT FIRST(INSTITUTE) from (select Institute,Count(PNAME) as 'Occurences' from studies group by institute order by Occurences desc)
--55. What is the costliest course?
select COURSE from studies where [course fee] = (select max([course fee]) from studies)
--56. Which course has been done by the most number of students?
CREATE TABLE course_summ (CourNam VARCHAR(20), StdNo INT)

INSERT INTO course_summ
SELECT COURSE,COUNT(PNAME) FROM studies GROUP BY COURSE

select * from course_summ

SELECT CourNam,StdNo AS COUNT_OF_STUDENTS FROM course_summ WHERE StdNo = 
(SELECT MAX(StdNo) FROM course_summ)

--57. Which institute conducts the costliest course?
select institute from studies where [course fee] = (select max([course fee]) from studies)


select * from studies 

--58. Display the name of the institute and the course which has below average course fee.
select institute,course from studies where cast([COURSE FEE] as float) < (select avg(CAST([COURSE FEE] as float)) from studies)

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.

select course from studies where cast([COURSE FEE] as float) between (select (avg(CAST([COURSE FEE] as float)) +1000) from studies) and
(select (avg(CAST([COURSE FEE] as float)) - 1000) from studies)

--60. Which package has the highest development cost?
select title from software where DCOST in (select max(cast (DCOST as FLOAT)) from software)

--61. Which course has below average number of students?
create table avgcnt (CRS varchar(50),counts FLOAT);
insert into avgcnt select COURSE,count(PNAME) as count_of_students from studies group by course

select crs,counts from avgcnt where counts <=(select avg(counts) from avgcnt);

--62. Which package has the lowest selling cost?
select TITLE,SCOST from software where SCOST=(select MIN(SCOST) from software)


--63. Who developed the package that has sold the least number of copies?
select title,pname, sold from software where SOLD = (select min(SOLD)  from software);


--64. Which language has been used to develop the package which has the highest sales amount?

select developin,title from software where cast(scost as float) = (select max(cast(scost as float)) from software)

--65. How many copies of the package that has the least difference between development and selling cost were sold?
select sold,title from Software where title in (select title from programmer where  (cast(scost as float) - cast(dcost as float))
=(select min(cast(scost as float) - cast(dcost as float)) from software))

--66. Which is the costliest package developed in Pascal?
select title from software where cast(dcost as float) in (select max(cast(dcost as float)) from software) 

--67. Which language was used to develop the most number of packages?
select developin from software group by developin having developin in (select max(developin) from software);
--68. Which programmer has developed the highest number of packages?
select PNAME,(count(title)) as counts_of_package from software  group by pname order by counts_of_package desc 
--69. Who is the author of the costliest package?
select PNAME from software where (cast(SCOST as float)) In (select max(cast(SCOST as float)) from programmer)

--70. Display the names of the packages which have sold less than the average number of copies.
select title from software where cast(sold as float) < (select avg(cast(sold as float)) from software)

--71. Who are the authors of the packages which have recovered more than double the development cost?
select PNAME from software where cast(SCOST as float) <= cast((DCOST*2) as float)
--72. Display the programmer names and the cheapest packages developed by them in each language.
select title,pname from software where DCOST In (select min(cast(dcost as int)) from software)

--73. Display the language used by each programmer to develop the highest selling and lowest selling package.

select s.title,p.prof1 as 'First Language',p.prof2 as 'Second Language'  from software s inner join programmer p on s.pname= p.pname where sold in (select max(sold) from software)
UNION 
select s.title,p.prof1 as 'First Language',p.prof2 as 'Second Language' from software s inner join programmer p on s.pname= p.pname where sold in (select min(sold) from software)


--74. Who is the youngest male programmer born in 1965?
select PNAME from programmer where datepart(month,DOB) in (select max(datepart(month,DOB)) from programmer where GENDER ='M' and DATEPART(YEAR,DOB)=1965);

--75. Who is the oldest female programmer who joined in 1992?
select * from programmer where datepart(month,DOB) in (select min(datepart(month,DOB)) from programmer where GENDER ='F' and DATEPART(YEAR,DOJ)=1992);

--76. In which year was the most number of programmers born?
select max(DATEPART(Year,DOB)) from programmer; 
--77. In which month did the most number of programmers join?
select max(DATEPART(Year,DOJ)) from programmer; 
--78. In which language are most of the programmer’s proficient?
select PROF1,count(pname) from programmer group by PROF1
UNION 
select PROF2,count(pname) from programmer group by PROF2

--79. Who are the male programmers earning below the average salary of female programmers?
select PNAME from programmer where GENDER = 'M' and cast(salary as float) < (select avg(cast(salary as FLOAT)) from programmer where GENDER='F');


--80. Who are the female programmers earning more than the highest paid?
select PNAME from programmer p where p.GENDER = 'F' and p.salary > (select max(salary) from programmer)

--81. Which language has been stated as the proficiency by most of the programmers?
select PROF1 from programmer group by PROF1 having prof1 = (select max(PROF1) from programmer)
UNION
select prof2 from programmer group by prof2 having prof2 = (select max(prof2) from programmer)
--82. Display the details of those who are drawing the same salary.
select p.PNAME,ps.pname,p.salary,ps.salary from programmer p inner join programmer ps on p.pname=ps.pname where p.SALARY=ps.SALARY

--83. Display the details of the software developed by the male programmers earning more than 3000.
select * from programmer p inner join studies s on p.pname=s.pname where p.GENDER='M' and p.salary > 3000

--84. Display the details of the packages developed in Pascal by the female programmers.
select * from software s inner join programmer p on s.pname=p.pname where p.gender='F' and s.developin='PASCAL';
--85. Display the details of the programmers who joined before 1990.
select * from programmer where datepart(year,doj) < 1990;

--86. Display the details of the software developed in C by the female programmers at Pragathi.
select * from software s inner join  programmer p on s.pname=p.pname inner join studies st on st.pname=p.pname where p.gender='F' and st.institute='Pragathi'; 

--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.
select title,count(sold),sum(cast(scost as float)) from software s inner join studies st on s.pname=st.pname group by title
--88. Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.
select * from  programmer p inner join software s on p.pname=s.pname where p.GENDER='M' and s.DEVELOPIN='DBASE'; 
--89. Display the details of the software developed by the male programmers born before 1965 and female programmers born after 1975.
select * from programmer p inner join software s on p.pname=s.pname where (p.GENDER='M' and DATEPART(year,DOB) < 1965) 
UNION
select * from programmer p inner join software s on p.pname=s.pname where (p.GENDER='F' and DATEPART(year,DOB) > 1975); 

--90. Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of the programmers.
select * from programmer p inner join software s on p.pname=s.pname where (s.DEVELOPIN <> p.PROF1) AND (s.DEVELOPIN <> p.PROF1) 

--91. Display the details of the software developed by the male students at Sabhari.
select * from software s inner join studies st on s.pname = st.pname inner join programmer p on p.pname=st.pname where st.institute in ('Sabhari') and GENDER='M'

--92. Display the names of the programmers who have not developed any packages.
select * from programmer p LEFT OUTER JOIN software s on p.pname=s.pname where s.pname is NULL 

--93. What is the total cost of the software developed by the programmers of Apple?
select SUM(cast(SCOST as float)) from software s inner join studies st on s.pname = st.pname  where st.institute in ('Apple')

--94. Who are the programmers who joined on the same day?
select * from programmer where dob=doj
--95. Who are the programmers who have the same Prof2?
select * from programmer where PROF1=PROF2
--96. Display the total sales value of the software institute wise.
select st.institute,SUM(cast(SCOST as float)) as 'Total Cost' from software s inner join studies st on s.pname = st.pname group by st.institute
--97. In which institute does the person who developed the costliest package study?
select institute from software st,studies s
where s.pname=st.pname group by institute,dcost having cast(dcost as float)=(select max(cast(dcost as float)) from software);

--98. Which language listed in Prof1, Prof2 has not been used to develop any package?
select p.prof1 from programmer p where p.prof1 not in(select developin from software) 
union
select p2.prof2 from programmer p2 where p2.prof2 not in(select developin from software);


--99. How much does the person who developed the highest selling package earn and what course did he/she undergo?
select p1.salary,s2.course from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(cast(scost as float)) from software);

--100. What is the average salary for those whose software sales is more than50,000?
select avg(cast(p.salary as INT)) from programmer p inner join software s on p.pname=s.pname 
where s.sold>50000

--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?
select count(s.title) from software s inner join studies st on s.pname=st.pname  where st.[COURSE FEE] in
(select min([COURSE fee]) from studies)


--102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?
select * from programmer where GENDER='F' where 
--103. How many packages were developed by female programmers earning more than the highest paid male programmer?
select count(TITLE) from software where PNAME in (select PNAME from programmer where GENDER='F' and salary > ( select max(salary) from programmer where GENDER='M'));
--104. How many packages are developed by the most experienced programmers from BDPS?
select Count(Title) as 'Count of package' from software s inner join  programmer p on s.pname= p.pname where  datediff(month,p.DOJ,getdate()) in 
( select max(datediff(month,p.DOJ,getdate())) from programmer p inner join studies st on p.pname=st.pname where st.institute='BDPS')

--105. List the programmers (from the software table) and the institutes they studied at.
select st.PNAME,st.institute from  studies st where st.pname not in (select pname from programmer) 

--106. List each PROF with the number of programmers having that PROF and the number of the packages in that PROF.
select count(*),sum(cast(scost as FLOAT) *cast(sold as float)-cast(dcost as float)) "PROFIT" from software
where developin in (select prof1 from programmer) group by developin;
--107. List the programmer names (from the programmer table) and the number of package each has developed

select s.pname,count(title) as No_of_package from programmer p1 inner join software s on
 p1.pname=s.pname group by s.pname
