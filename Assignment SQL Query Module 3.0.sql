

----------------------------------------------ASSIGNMENT SQL QUERY 3.0 -----------------------------------------------------
 SELECT * FROM STUDIES ;
 SELECT * FROM SOFTWARE;
 Select * from PROGRAMMER;

--1. How many Programmers Don’t know PASCAL and C
SELECT COUNT(PNAME) FROM PROGRAMMER
WHERE (PROF1 NOT IN('C','PASCAL')
       AND PROF2 NOT IN('C','PASCAL'))   ------------------- 5 -----------------

--2. Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT * FROM PROGRAMMER
WHERE (PROF1 NOT IN('CLIPPER','COBOL','PASCAL')
       AND PROF2 NOT IN('CLIPPER','COBOL','PASCAL'))      ---------KAMALA,MARY,QADIR,REMITA,VIJAY-------------------------
 
--3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT DEVELOPIN AS LANGUAGE ,AVG(SCOST) AS AVG_SELLING_COST,AVG(DCOST) AS AVG_DEVELOPING_COST,AVG(SOLD) AS AVG_PRICE_PER_COPY FROM SOFTWARE GROUP BY DEVELOPIN ;

--4. List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT S.PNAME,COUNT(DEVELOPIN)NO_OF_PACKAGE FROM PROGRAMMER P,SOFTWARE S WHERE P.PNAME=S.PNAME GROUP BY S.PNAME ;

--5. List each PROFIT with the number of Programmers having that PROF and the number of the packages in that PROF.
SELECT COUNT(*)NO_OF_PROGRAMER,SUM(SCOST*SOLD-DCOST)PROFIT FROM SOFTWARE WHERE DEVELOPIN IN (SELECT PROF1 FROM PROGRAMMER UNION SELECT PROF2 FROM PROGRAMMER) GROUP BY DEVELOPIN ;

--6. How many packages are developed by the most experienced programmer form BDPS.
SELECT COUNT(*)PACKAGES FROM SOFTWARE S,PROGRAMMER P
WHERE P.PNAME=S.PNAME GROUP BY DOJ HAVING MIN(DOJ)=(SELECT MIN(DOJ)
FROM STUDIES ST,PROGRAMMER P, SOFTWARE S
WHERE P.PNAME=S.PNAME AND ST.PNAME=P.PNAME AND (INSTITUTE='BDPS'));   -----------------------2 -------------------------------

--7. How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT COUNT(DEVELOPIN)PACKAGE FROM PROGRAMMER P,SOFTWARE S
WHERE S.PNAME=P.PNAME AND GENDER='F' AND SALARY>(SELECT MAX(SALARY) FROM PROGRAMMER P
WHERE GENDER='M');                                                                       -------------------- 3 -------------------------

--8. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
SELECT P1.SALARY,S2.COURSE FROM PROGRAMMER P1,SOFTWARE S1,STUDIES S2
WHERE P1.PNAME=S1.PNAME AND S1.PNAME=S2.PNAME AND SCOST=(SELECT MAX(SCOST) FROM SOFTWARE);   ----------------------4500-PGDCA----------------------------

--9. In which institute did the person who developed the costliest package study?
SELECT INSTITUTE FROM  STUDIES S1,SOFTWARE S2 WHERE S1.PNAME = S2.PNAME AND DCOST = (SELECT MAX(DCOST) FROM SOFTWARE)   -----------------SABHARI-(DEVELOPED BY 'MARRY') -------------------

--10. Display the names of the programmers who have not developed any packages.
SELECT PNAME FROM PROGRAMMER WHERE PNAME NOT IN(SELECT PNAME FROM SOFTWARE);                     --------------------------------ALTAF,NELSON,REBACA,REMITA,REBATI,VIJAY----------------------------

--11. Display the details of the software that has developed in the language which is neither the first nor the second proficiency
SELECT S.* FROM SOFTWARE S,PROGRAMMER P WHERE S.PNAME = P.PNAME AND (DEVELOPIN <> PROF1 AND DEVELOPIN <> PROF2)

--12. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975
SELECT S.*, YEAR(DOB),GENDER FROM PROGRAMMER P,SOFTWARE S 
WHERE S.PNAME=P.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975));  ---------------------NO ONE----------------------------

--13. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
SELECT STUDIES.INSTITUTE, COUNT(SOFTWARE.DEVELOPIN) AS DEVELOPIN, COUNT(SOFTWARE.SOLD) AS SOLD, SUM(SOFTWARE.SOLD*SOFTWARE.SCOST) AS SALES FROM SOFTWARE,STUDIES
WHERE SOFTWARE.PNAME =STUDIES.PNAME GROUP BY STUDIES.INSTITUTE;

--14. Display the details of the Software Developed by the Male Programmers Earning More than 3000/
SELECT * FROM PROGRAMMER P,SOFTWARE S
WHERE P.PNAME=S.PNAME AND SALARY>3000 AND GENDER ='M';

--15. Who are the Female Programmers earning more than the Highest Paid male?
SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');

--16. Who are the male programmers earning below the AVG salary of Female Programmers?
SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'M' AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE GENDER = 'F');

--17. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

--18. Display the names of the packages, which have sold less than the AVG number of copies.
SELECT TITLE AS NAME_OF_PACKAGES FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

--19. Which is the costliest package developed in PASCAL.
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL');          ------------------HOSPITAL MGMT. --------------------------
--20. How many copies of the package that has the least difference between development and selling cost were sold.
SELECT SOLD,TITLE FROM SOFTWARE WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));                                      -----------------------TSR EDITOR(6)-----------------------

--21. Which language has been used to develop the package, which has the highest sales amount?
SELECT DEVELOPIN AS LANGUAGE FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE) ;      ------------------ORACLE-----------------------------

--22. Who Developed the Package that has sold the least number of copies?
SELECT PNAME FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE) ;                         -------------------------JULIANA ------------------------

--23. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
SELECT COURSE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE)+1000 FROM STUDIES) AND COURSE_FEE > (SELECT AVG(COURSE_FEE)-1000 FROM STUDIES);     --------------DCAP -----------------

--24. Display the name of the Institute and Course, which has below AVG course fee.
SELECT PNAME,INSTITUTE FROM STUDIES WHERE COURSE_FEE < (SELECT AVG(COURSE_FEE) FROM STUDIES) ;   

--25. Which Institute conducts costliest course.
SELECT INSTITUTE FROM STUDIES WHERE COURSE_FEE IN (SELECT MAX(COURSE_FEE)COSTLIEST_COURSE FROM STUDIES) ;                       -------BDPS------------

--26. What is the Costliest course?
SELECT COURSE FROM STUDIES WHERE COURSE_FEE IN (SELECT MAX(COURSE_FEE)COSTLIEST_COURSE FROM STUDIES) ;                        ----------DCA---------------