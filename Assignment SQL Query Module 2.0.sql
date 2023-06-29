---------------------SQL ASSIGNMENT 2.0---------------------
SELECT * FROM STUDIES ;
 SELECT * FROM SOFTWARE;
 Select * from PROGRAMMER;

--1) What is the Highest Number of copies sold by a Package?
--ANS - 84
Select Max(SOLD) AS highest_copies_sold From SOFTWARE

--2) Display lowest course fee.
------- SELECT * FROM STUDIES ;
 Select min(COURSE_FEE) As lowest_course_fee From STUDIES 

--3) How old is the Oldest Male Programmer.
Select MAX(DATEDIFF(year,DOB,GETDATE()))AS oldest_male From PROGRAMMER Where GENDER = 'M'      ----------59-----------

--4) What is the AVG age of Female Programmers?
Select Avg(DATEDIFF(YEAR,DOB,GETDATE()))AS Avg_age_F_Progammer From PROGRAMMER Where GENDER = 'F'  --------56---------

--5) Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
Select PNAME,(DATEDIFF(YEAR,DOB,DOJ))as Experience From PROGRAMMER Order by DATEDIFF(YEAR,DOB,DOJ) DESC

--6) How many programmers have done the PGDCA Course?
Select COUNT(PNAME)AS PGDCA_course_by From STUDIES Where COURSE='PGDCA' ---------3------------

--7) How much revenue has been earned through sales of Packages Developed in C.
Select SUM(SCOST*SOLD) AS REVENUE_C From SOFTWARE Where DEVELOPIN='C'    ---------185775----------

--8) How many Programmers Studied at Sabhari?
Select COUNT(PNAME) AS Studied_at_Sabhari From STUDIES Where INSTITUTE='SABHARI' -----------4----------

--9) How many Packages Developed in DBASE?
Select count(DEVELOPIN)AS Packages_DBASE FROM SOFTWARE WHERE DEVELOPIN ='DBASE' -------2---------

--10) How many programmers studied in Pragathi?
SELECT COUNT(PNAME)AS STUDED_IN_PRGATHI FROM STUDIES WHERE INSTITUTE='PRGATHI';   ---------3----------

--11) How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(COURSE_FEE)AS PAID_BETWEEN_5K_TO_10K FROM STUDIES WHERE COURSE_FEE BETWEEN 5000 AND 10000;   ----------6 ------------

--12) How many Programmers know either COBOL or PASCAL?
SELECT COUNT(PNAME)AS know_COBOL_OR_PASCAL FROM PROGRAMMER WHERE PROF1 = 'COBOL' OR PROF2 = 'PASCAL' OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL';    ------------8-------------

--13) How many Female Programmers are there?
SELECT COUNT(PNAME) AS FEMALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER='F'; -------------7----------------
--14) What is the AVG Salary?
SELECT AVG(SALARY)AS AVG_SALARY FROM PROGRAMMER;         ------------------3169----------------------

--15) How many people draw salary 2000 to 4000?
SELECT COUNT(PNAME) AS TWO_K_TO_FOUR_K_SALARY FROM PROGRAMMER WHERE SALARY BETWEEN 2000 AND 4000; ----------------------12-----------------------------

--16) Display the sales cost of the packages Developed by each Programmer Language wise
SELECT PNAME,DEVELOPIN,SCOST FROM SOFTWARE ORDER BY DEVELOPIN;

--17) Display the details of the software developed by the male students of sabhari
SELECT DEVELOPIN,P.PNAME,GENDER,INSTITUTE 
FROM PROGRAMMER p,SOFTWARE s,STUDIES st
     WHERE p.PNAME=s.PNAME AND s.PNAME=st.PNAME AND GENDER='M' AND INSTITUTE='SABHARI'; ------BASIC(ANAND),PASCAL(ANAND),DBASE(RAMESH),PASCAL(RAMESH)-------
  --SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'M' UNION  SELECT DEVELOPIN FROM SOFTWARE WHERE   SELECT INSTITUTE FROM STUDIES WHERE INSTITUTE = 'SABHARI'; -------NOT WORKING-----------DOUBT---------

--18) Who are the oldest Female Programmers who joined in 1992?
SELECT PNAME
FROM PROGRAMMER
WHERE DOJ=
           (SELECT (MIN(DOJ))                                 ------------SUB QUERY------------
            FROM PROGRAMMER
	        WHERE CONVERT(VARCHAR(4), DOJ, 112) LIKE '1992')   ----------------KAMALA,REBATI-------

  --DOUBT(Select PNAME ,DATEDIFF(year,DOB,GETDATE())AS oldest_Female From PROGRAMMER Where GENDER = 'F' AND YEAR(DOJ)='1992' ORDER BY PNAME DESC)    ----------------VIJAY,KAMALA,REBATI---According to their DOB

--19) Who is the youngest male Programmer born in 1965?
SELECT PNAME
FROM PROGRAMMER
WHERE DOB=
           (SELECT (MAX(DOB))                                 ------------SUB QUERY------------
            FROM PROGRAMMER
	        WHERE CONVERT(VARCHAR(4), DOB, 112) LIKE '1965')   ----------------------VIJAY -----------------------

--20) Which Package has the lowest selling cost?
SELECT DEVELOPIN FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE)    ----------CPP ------------

--21) Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT PNAME FROM PROGRAMMER 
WHERE GENDER = 'F'
AND SALARY >3000 
AND prof1<>'c' and prof1<>'c++' and prof1<>'oracle'and prof1<>'dbase' and prof2<>'c' and prof2<>'c++' and prof2<>'oracle' and prof2<>'dbase' ;  -------REBATI------------------

     ------------------OR---------------
SELECT * FROM PROGRAMMER
WHERE GENDER LIKE 'F'
AND SALARY >3000
AND (PROF1 NOT IN('C','C++','ORACLE','DBASE')
    AND PROF2 NOT IN('C','C++','ORACLE','DBASE'))      -------------------------REBATI-----------------------

--22) Who is the Youngest Programmer knowing DBASE?
select PNAME,min(2023-year(DOB)) as AGE from PROGRAMMER where (prof1='DBASE' or prof2='DBASE' ) group by PNAME order by AGE  ------------ NELSON(AGE 38)------------

--23) Which Language is known by only one Programmer?
SELECT PROF1 AS LANGUAGE_KNOWN FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 NOT IN (SELECT PROF2 FROM PROGRAMMER) AND COUNT(PROF1) = 1
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 NOT IN (SELECT PROF1 FROM PROGRAMMER) AND COUNT(PROF2)=1;    ----------------------CPP,FOXPRO,ORACLE ---------------

--24) Who is the most experienced male programmer knowing PASCAL?
SELECT PNAME,MAX(2023-year(DOJ)) as AGE from PROGRAMMER where (prof1='PASCAL' or prof2='PASCAL' ) group by PNAME order by AGE DESC      ------------PATRICK-- (AS per experience to join date)---------
SELECT PNAME,MAX(2023-year(DOB)) as AGE from PROGRAMMER where (prof1='PASCAL' or prof2='PASCAL' ) group by PNAME order by AGE DESC      ------------PATRICK-- (AS per experience to Date of birth date)---------

--25) Who is the least experienced Programmer?
SELECT PNAME,MIN(2023-year(DOJ)) as AGE from PROGRAMMER group by PNAME order by AGE ;   ---------------------REMITA-----------------

--26) Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT  COUNT(DEVELOPIN)AS LANGUAGE_ FROM SOFTWARE WHERE DCOST < 1000              ---------------------1------------------

--27) Display Highest, Lowest and Average Salaries for those earning more than 2000
SELECT MAX(SALARY)HIGHEST_SALARY ,MIN(SALARY)LOWEST_SALARY, AVG(SALARY)AVARAGE_SALARY FROM PROGRAMMER WHERE SALARY >2000   ------------------4500,2500,3169----------------------

