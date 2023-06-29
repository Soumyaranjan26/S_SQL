
                -----------------------------ASSIGNMENT SQL QUERY 4.0 -----------------------------------------
USE assignments
GO

 SELECT * FROM STUDIES ;
 SELECT * FROM SOFTWARE;
 Select * from PROGRAMMER;

--1. What is the cost of the costliest software development in Basic?
SELECT MAX(DCOST) AS COSTLIEST_SOFTWARE_COST FROM SOFTWARE WHERE DEVELOPIN LIKE 'BASIC';            --------------------- 6000 -----------------------

--2. Display details of Packages whose sales crossed the 2000 Mark.
SELECT * FROM SOFTWARE WHERE (SCOST*SOLD) > 2000  ;

--3. Who are the Programmers who celebrate their Birthdays during the Current Month?
SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB) = '06';                                        ------------------------ MARY --------------------------                   
--4. Display the Cost of Package Developed By each Programmer.
SELECT PNAME AS NAME,SUM(DCOST)COST_OF_PACKAGE FROM SOFTWARE GROUP BY PNAME;

--5. Display the sales values of the Packages Developed by each Programmer.
SELECT PNAME AS NAME,SUM(SCOST*SOLD)SALES_VALUE FROM SOFTWARE GROUP BY PNAME;

--6. Display the Number of Packages sold by Each Programmer.
SELECT PNAME AS NAME,COUNT(SOLD)SOLD FROM SOFTWARE GROUP BY PNAME;

--7. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
SELECT PNAME AS NAME,MAX(DCOST)COSTLIEST_PACKAGE,MIN(DCOST)CHEAPEST_PACKAGE FROM SOFTWARE GROUP BY PNAME;

--8. Display each institute name with the number of Courses, Average Cost per Course.
SELECT INSTITUTE AS INSTITUTE ,COUNT(COURSE)NO_OF_COURSE,AVG(COURSE_FEE)AVG_COST_PER_COURSE FROM STUDIES GROUP BY INSTITUTE;

--9. Display each institute Name with Number of Students.
SELECT INSTITUTE AS INSTITUTE ,COUNT(PNAME)NO_OF_STUDENTS FROM STUDIES GROUP BY INSTITUTE;

--10. List the programmers (form the software table) and the institutes they studied.
SELECT PNAME,INSTITUTE FROM STUDIES WHERE PNAME NOT IN (SELECT PNAME FROM SOFTWARE);

--11. How many packages were developed by students, who studied in institute that charge the lowest course fee?
SELECT COUNT(S.PNAME)
FROM SOFTWARE S,STUDIES ST
WHERE S.PNAME=ST.PNAME GROUP BY S.PNAME,COURSE_FEE HAVING MIN(COURSE_FEE)=(SELECT MIN(COURSE_FEE) FROM STUDIES);

--12. What is the AVG salary for those whose software sales is more than 50,000/-.
SELECT AVG(SALARY)AVG_SALARY FROM PROGRAMMER P ,SOFTWARE S WHERE P.PNAME = S.PNAME AND SOLD*SCOST>50000 ;    ----------------3775-------------------

--13. Which language listed in prof1, prof2 has not been used to develop any package.
SELECT PROF1 as language FROM PROGRAMMER WHERE PROF1 NOT IN(SELECT DEVELOPIN FROM SOFTWARE)
UNION
SELECT PROF2 FROM PROGRAMMER WHERE PROF2 NOT IN(SELECT DEVELOPIN FROM SOFTWARE);             --------------- CLIPPER , FOXPRO ----------------------------

--14. Display the total sales value of the software, institute wise.
SELECT S1.INSTITUTE ,SUM(S2.SCOST*S2.SOLD)SALES FROM STUDIES S1,SOFTWARE S2 WHERE S1.PNAME = S2.PNAME GROUP BY S1.INSTITUTE;

--15. Display the details of the Software Developed in C By female programmers of Pragathi.
SELECT S2.* FROM SOFTWARE S2,STUDIES S1,PROGRAMMER P WHERE S1.PNAME=S2.PNAME AND P.PNAME=S2.PNAME AND GENDER='F' AND INSTITUTE='PRAGHATI';   --------------NO ONE ----------------

--16. Display the details of the packages developed in Pascal by the Female Programmers.
SELECT S2.* FROM SOFTWARE S2,PROGRAMMER P WHERE P.PNAME=S2.PNAME AND GENDER='F' ;

--17. Which language has been stated as the proficiency by most of the Programmers?
SELECT PROF1,PROF2,COUNT(PNAME) AS NUMBER FROM PROGRAMMER GROUP BY PROF1,PROF2 ORDER BY NUMBER DESC  ---'PASCAL','COBOL'FROM PROF1 AND'BASIC','DBASE'FROM PROF2 ARE MOST PROFICIENCY BY PROGRAMMER- ---

--18. Who is the Author of the Costliest Package?
SELECT PNAME AS NAME,DCOST AS COST FROM SOFTWARE WHERE DCOST LIKE (SELECT MAX(DCOST) FROM SOFTWARE);      --------------------MARY (85000) --------------------
--19. Which package has the Highest Development cost?
SELECT TITLE AS PACKAGES FROM SOFTWARE WHERE DCOST LIKE (SELECT MAX(DCOST) FROM SOFTWARE) ;    -------------------FINANCIAL ACCT.----------------------------
--20. Who is the Highest Paid Female COBOL Programmer?
SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';   -------------JULIANA --------------

--21. Display the Name of Programmers and Their Packages.
SELECT PNAME AS NAME,SALARY AS PACKAGE FROM PROGRAMMER ORDER BY SALARY DESC;

--22. Display the Number of Packages in Each Language Except C and C++.
SELECT DEVELOPIN AS LANGUAGE ,COUNT(TITLE)NO_OF_PACKAGE FROM SOFTWARE GROUP BY DEVELOPIN HAVING DEVELOPIN NOT IN ('C','C++')

--23. Display AVG Difference between SCOST, DCOST for Each Package.
SELECT TITLE AS PACKAGE,AVG(DCOST-SCOST)AVARAGE_DIFF FROM SOFTWARE GROUP BY TITLE;

--24. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
SELECT SUM(DCOST)TOTAL_DCOST,SUM(SCOST)TOTAL_SCOST,SUM(DCOST-(SOLD*SCOST))AMOUNT_RECOVER FROM SOFTWARE GROUP BY PNAME HAVING SUM(DCOST)>SUM(SOLD*SCOST);

--25. Who is the Highest Paid C Programmers?
SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'C' OR PROF2 LIKE 'C'))          ----------------------REMITA-----------------------------

--26. Who is the Highest Paid Female COBOL Programmer?
SELECT PNAME FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';   ------------JULIANA---------------