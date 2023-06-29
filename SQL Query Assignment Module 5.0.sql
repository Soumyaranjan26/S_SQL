use assignments
go
---------------------------------------------SQL QUERY ASSIGNMENT 5.0 ---------------------------------------------------
 SELECT * FROM STUDIES ;
 SELECT * FROM SOFTWARE;
 Select * from PROGRAMMER;
--1. Display the names of the highest paid programmers for each Language.
SELECT PNAME,PROF1,PROF2,SALARY FROM PROGRAMMER  WHERE SALARY IN (SELECT MAX(SALARY) FROM PROGRAMMER) ----------------------MARY (4500) -----------------------

--2. Display the details of those who are drawing the same salary.
SELECT A.PNAME,A.SALARY FROM PROGRAMMER A,PROGRAMMER B WHERE A.SALARY=B.SALARY AND A.PNAME <> B.PNAME;
                                 ----OR------
SELECT PNAME, SALARY FROM PROGRAMMER WHERE
SALARY = ANY(SELECT SALARY FROM PROGRAMMER P GROUP BY SALARY HAVING
              SALARY=P.SALARY AND COUNT(*)>1)

--3. Who are the programmers who joined on the same day?
SELECT A.PNAME,A.DOJ FROM PROGRAMMER A,PROGRAMMER B WHERE A.DOJ=B.DOJ AND A.PNAME <> B.PNAME ORDER BY A.DOJ;   -------JULIANE AND PATRICK(1990-04-21) ,REBATI AND KAMALA(1992-01-02) -----

--4. Who are the programmers who have the same Prof2?
SELECT A.PNAME,A.PROF2 FROM PROGRAMMER A,PROGRAMMER B WHERE A.PROF2=B.PROF2 AND A.PNAME <> B.PNAME ORDER BY PROF2 ;

--5. How many packages were developed by the person who developed the cheapest package,where did he/she study?
SELECT COUNT(*)
FROM PROGRAMMER P,SOFTWARE S
WHERE S.PNAME=P.PNAME GROUP BY DEVELOPIN HAVING MIN(DCOST)=(SELECT MIN(DCOST) FROM SOFTWARE);