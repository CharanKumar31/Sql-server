CREATE DATABASE JOINS
USE JOINS

/*
JOINS
1 INNER JOIN
2 OUTER JOIN
	LEFT JOIN
	RIGHT JOIN
	FULL OUTER JOIN
3 CROSS
4 SELF

*/

CREATE TABLE Table1
(
Dept_id int primary key,
Dept_name Char(50),
Dept_Location Varchar(20),
Dept_head varchar(20)
)

CREATE TABLE Table2
(
Emp_id int primary key,
Name char(20),
Salary int,
Dept_id int References Table1(Dept_id)
)
SELECT * FROM Table1

INSERT INTO Table1 VALUES (1,'IT','Chennai','Sanjay'),
(2,'IT','HYDERABAD','RAJA'),(3,'MARKETING','Chennai','Vijay'),(4,'SALES','Coimbatore','Jay')

SELECT * FROM Table2

INSERT INTO Table2 VALUES (1,'Vinay','25000','1'),(2,'Janaa','65000','2'),
(3,'Vasu','35000','2'),(4,'Vimal','45000','3'),(5,'Vinayak','15000','2'),
(6,'Mani','25000',NULL),(7,'Jarvis','50000',NULL),(8,'Sara','25000',NULL)

SELECT * FROM Table1
SELECT * FROM Table2

--INNER JOIN -- Its takes the common values on the both tables
 SELECT * FROM Table1  T
 INNER JOIN Table2 E
 ON T.Dept_id=E.Dept_id
 WHERE Salary > '30000'

 SELECT Dept_head FROM Table1  T
 INNER JOIN Table2  E
 ON T.Dept_id=E.Dept_id
 WHERE SALARY = 25000

SELECT * FROM Table1
SELECT * FROM Table2
--OUTER JOIN

--1 LEFT OUTER JOIN
 SELECT * FROM Table2 A --The first table is the left table to join on next table
 LEFT JOIN Table1 B
 ON A.Dept_id = B.Dept_id--It shows the full details of right table  

 --2 RIGHT OUTER JOIN
 SELECT * FROM Table2 a
 RIGHT JOIN Table1 b
 ON a.Dept_id=b.Dept_id --It shows the full details of right table 

 --FULL OUTER JOIN
 SELECT * FROM Table1 Aa
 FULL JOIN Table2 Bb
 ON Aa.Dept_id = Bb.Dept_id -- It shows the full details of two tables

 --CROSS JOIN -- To ckeck total records (M*N)

 SELECT COUNT(*) FROM Table1
 SELECT COUNT(*) FROM Table2

 SELECT * FROM Table2
 CROSS JOIN Table1 -- to check the Combination of two products in real life

 --SELF JOIN-- To check and modify the datas within the table

 CREATE TABLE Sjoin
 (
 Emp_id int,
 Name varchar(20),
 Mgr_id int
 )

INSERT INTO Sjoin VALUES (1,'Sneha',3),
(2,'Fazil',NULL),(3,'Ram',2),(4,'Neha',1)

/*
sneha  ram
fazil			--1st
ram fazil
neha sneha
*/

SELECT * FROM Sjoin E
LEFT JOIN Sjoin M
ON M.Emp_id = E.Mgr_id

SELECT E.Name as Employee,
M.Name as Manager
FROM
Sjoin E LEFT JOIN Sjoin M
ON E.Mgr_id = M.Emp_id



