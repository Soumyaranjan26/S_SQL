
---------------------------------------------SQL QUERY NEW ASSIGNMENT  ---------------------------------------------------

--Create the following Tables and insert the values accordingly and Perform the tasks mentioned below


     ---------Employee_Table----------

CREATE TABLE Employee_Table(
Employee_id INT PRIMARY KEY ,First_name varchar(30),Last_name varchar(30),Salary INT,Joining_date Date,Department Varchar(30))
Insert into Employee_Table values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupali','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')
Select * From Employee_Table ;


     --------Employee_Bonus_Table----------

Create table Employee_Bonus_Table(
Employee_ref_id INT FOREIGN KEY REFERENCES Employee_Table(Employee_id),Bonus_Amount Int,Bonus_Date Date )
Insert into Employee_Bonus_Table values
(1,5000,'2020-02-16'),
(2,3000,'2011-06-16'),
(3,4000,'2020-02-16'),
(1,4500,'2020-02-16'),
(2,3500,'2011-06-16')
Select * from Employee_Bonus_Table;


     ---------Employee_Title_Table-------

Create table Employee_Title_Table(
Employee_ref_id int,Employee_title varchar(30),Affective_Date Date)
Insert into Employee_Title_Table values
(1,'Manager','2016-02-20'),
(2,'Executive','2016-06-11'),
(8,'Executive','2016-06-11'),
(5,'Manager','2016-06-11'),
(4,'Asst.Manager','2016-06-11'),
(7,'Executive','2016-06-11'),
(6,'Lead','2016-06-11'),
(3,'Lead','2016-06-11')
Select * from Employee_Title_Table ;

    ----Task to perform ---
Select * From Employee_Table ;
Select * from Employee_Bonus_Table;
Select * from Employee_Title_Table ;

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
Select First_name as Employee_name from Employee_Table;

--2 Display “LAST_NAME” from Employee table in upper case.
Select UPPER(Last_name)Employee_name from Employee_Table;

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
Select distinct Department from Employee_Table;

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
Select SUBSTRING(Last_name,1,3) from Employee_Table;

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
Select distinct Department,len(Department)Its_length from Employee_Table group by Department;

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. a space char should separate them.
Select concat(First_name,' ',Last_name) as FULL_NAME From Employee_Table ;

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
Select * From Employee_Table order by First_name ASC;

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * From Employee_Table order by First_name ASC ,Department DESC;

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
Select * From Employee_Table Where First_name in ('Veena','Karan');

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
Select * From Employee_Table where Department like 'Admin' ;

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
Select * From Employee_Table where First_name like 'V%';

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000. 
Select * From Employee_Table where Salary between 100000 and 500000 ;

--13 Display details of the employees who have joined in Feb-2020. 
Select * From Employee_Table where month(Joining_date) = 02 and year(Joining_date) = 2020 ;

--14 Display employee names with salaries >= 50000 and <= 100000.
Select * From Employee_Table where Salary >= 50000 and Salary <= 100000 ;

--15 Display the number of Employees for each department in the descenting order.
Select Department as Department ,COUNT(First_name)no_of_employee  from Employee_Table GROUP BY Department order by Department desc ;

--16 DISPLAY details of the EMPLOYEES who are also Managers. 
Select e1.* from Employee_Table e1,Employee_Title_Table e2 where  e1.Employee_id = e2.Employee_ref_id and e2.Employee_title = 'Manager' ;  

--17 DISPLAY duplicate records having matching data in some fields of a table. 
Select Employee_title,Affective_Date from Employee_Title_Table group by Employee_title,Affective_Date having count(*)>1 ;

--18 Display only odd rows from a table. 
Select * from Employee_Table where Employee_id in (select Employee_id from Employee_Table where Employee_id%2<>0);

--19 Clone a new table from EMPLOYEE table. 
SELECT * INTO EMPLOYEE_CLONE_t FROM Employee_Table 
select * from EMPLOYEE_CLONE_t;

--20 DISPLAY the TOP 2 highest salary from a table. 
Select TOP(2) Salary From Employee_Table Order by Salary desc ; 

--21. DISPLAY the list of employees with the same salary.
SELECT A.First_name,A.Salary FROM Employee_Table A,Employee_Table B WHERE A.Salary=B.Salary AND A.First_name <> B.First_name ;

--22 Display the second highest salary from a table. 
SELECT MAX(SALARY)second_highest_salary FROM Employee_Table WHERE SALARY < (SELECT MAX(SALARY) FROM Employee_Table);

--23 Display the first 50% records from a table. 
select top 50 PERCENT * from Employee_Table ;

--24. Display the departments that have less than 4 people in it.
select Department,count(First_name) as cnt from Employee_Table group by Department having Count(First_name)<4;

--25. Display all departments along with the number of people in there.
select Department,count(First_name) as cnt from Employee_Table group by Department ;

--26 Display the name of employees having the highest salary in  each department. 
select concat(First_name,' ',Last_Name) as Full_Name,Department,Salary from Employee_Table where Salary in(select max(Salary) from Employee_Table group by Department); 

--27 Display the names of employees who earn the highest salary.
Select First_name from Employee_Table where Salary in (SELECT MAX(Salary) FROM Employee_Table)

--28  Diplay the average salaries for each department 
Select Department,avg(Salary)Avg_SALARY from Employee_Table Group by Department;

--29 display the name of the employee who has got maximum bonus 
select e1.First_name,e2.Bonus_Amount from Employee_Table e1,Employee_Bonus_Table e2 where e1.Employee_id=e2.Employee_ref_id and Bonus_Amount in (select max(Bonus_Amount) from Employee_Bonus_Table);

--30 Display the first name and title of all the employees
select e1.First_name ,e2.Employee_title from Employee_Table e1,Employee_Title_Table e2 where e1.Employee_id=e2.Employee_ref_id ;
