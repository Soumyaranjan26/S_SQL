--------------------------SQL Assinment Module 1.0 -------------------
 --SELECT * FROM STUDIES ;
 --SELECT * FROM SOFTWARE;
 --Select * from PROGRAMMER;
--1. Find out the selling cost AVG for packages developed in Pascal.
--3066
Select Avg(SCOST) selling_cost_avg From SOFTWARE Where DEVELOPIN= 'PASCAL';

--2. Display Names, Ages of all Programmers.
Select PNAME,DATEDIFF(year,DOB,'2023/06/15')AS Age FROM PROGRAMMER;

--3. Display the Names of those who have done the DAP Course.
Select PNAME FROM STUDIES Where COURSE='DAP'

--4. Display the names and date of birth of all programmers born in January.
Select PNAME,DOB From PROGRAMMER 
Where Month(DOB)=1

--5. Display the Details of the Software Developed by Ramesh.
Select DEVELOPIN as software_developed_by_Ramesh From SOFTWARE Where PNAME='RAMESH'

--6. Display the Details of Packages for which Development Cost have been recovered.
Select * From SOFTWARE Where SCOST*SOLD >= DCOST

--7. Display the details of the Programmers Knowing C.
Select PNAME FROM PROGRAMMER Where PROF1 = 'C' OR PROF2 = 'C'

--8. What are the Languages studied by Male Programmers?
Select PROF1 AS Language_studied FROM PROGRAMMER
union
Select PROF2 AS Language_studied FROM PROGRAMMER
Where GENDER = 'M'

--9. Display the details of the Programmers who joined before 1990.
Select * from PROGRAMMER Where DOJ <('1990-01-01');

--10. Who are the authors of the Packages, which have recovered more than double the Development cost?
Select PNAME From SOFTWARE Where SCOST*SOLD > 2*DCOST