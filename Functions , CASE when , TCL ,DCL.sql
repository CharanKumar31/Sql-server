/*
FUNCTIONS

1 Single row - Applies on single row at a time 
2 Multi row - Applies on Multiple rows at a time
3 Windows

*/

--Single Row functions
 
 USE student
 SELECT * FROM Stdetails
 INSERT INTO Stdetails VALUES (1,'Maths',-50)
  INSERT INTO Stdetails VALUES (1,'Maths',200)

 -- 1) MATHEMATICAL FUNCTIONS

 --ABS(Absolute) - Where values will be Show positive Absolute value
 SELECT *, ABS(Marks) as 'ABS' FROM Stdetails

 --SQRT 
 SELECT *,SQRT(ABS(Marks)) as 'Sqrt' FROM Stdetails --We use absolute because the Sqrt will not applicable on -ve Values

 --POWER
 SELECT *,POWER(Marks,2) as'Power of 2' FROM Stdetails
 SELECT POWER(5,2) -- can also use like this

 --ROUND
 SELECT ROUND(85.62256,2)

 --CEILING - Round up the values to nearest values 
 SELECT *, CEILING(Marks) FROM Stdetails
 SELECT CEILING(104.41)

 --FLOOR - Round down the values to nearest values
 SELECT FLOOR(104.41)

 --SIGN
 SELECT *, SIGN(Marks) FROM Stdetails
 SELECT SIGN(0)

--PI
SELECT PI()

--TRIGNOMENTRY Functions
SELECT SIN(90)
SELECT COS(90)
SELECT TAN(90)

--2) STRING Functions

--Length functions to find the length of the strings
SELECT * FROM St_details
SELECT *, LEN(Stname) FROM St_details

--Right Functions
SELECT RIGHT('CHARAN',3)
SELECT RIGHT(stname,3) as 'Right' FROM St_details

--LEFT functions
SELECT LEFT(stname,2) as 'LEFT' FROM St_details

--Upper
SELECT UPPER(stname) FROM St_details

--LOWER
SELECT LOWER (stname) FROM St_details

--Ltrim/Rtrim/Trim
SELECT *, LTRIM(Stname) FROM St_details
SELECT LTRIM(    'SK')
SELECT LTRIM('SK'     )
SELECT TRIM(     'SK'      )

--Charindex - To identify the charecter,s index
SELECT CHARINDEX('a','Pravin')

--REPLACE
SELECT REPLACE('DANa','A','O') --1st expression 2nd to be changed  3rd changing value

--REVERSE
SELECT REVERSE('NAMA')

--REPLICATE
SELECT REPLICATE('BOSS ',10)

--SUBSTRING
SELECT SUBSTRING('OH MY GOD',4,2)

--CONCAT
SELECT CONCAT('Rate', ' ','Cutter')

--3) DATE functions

SELECT GETDATE()

SELECT MONTH(GETDATE())

SELECT DAY(GETDATE())

SELECT YEAR(GETDATE())

SELECT DAY('2022-02-02')

--DATEADD

SELECT DATEADD(DD,15,GETDATE()) -- can add day,month,year in the interval
SELECT DATEDIFF(DD,'2022-01-01','2022-02-01') --Can change the interval

--MULTI ROW FUNCTIONS

--SUM/AVG/MAX/MIN

SELECT * FROM Stdetails
SELECT SUM(marks) as 'total',AVG(marks)as'Avg',MAX(marks)as'highest',MIN(marks)as 'lowest' FROM Stdetails

--STDEV

SELECT STDEV(marks) FROM Stdetails

USE Student

--WINDOW FUNCTIONS -- 
/*
Using windows func we can see the result at every row
We can use partition by to seperate the group values

*/

SELECT * FROM Stdetails
INSERT INTO Stdetails VALUES (3,'Eng',97)
SELECT *, SUM(Marks) OVER() FROM Stdetails
SELECT *, AVG(marks) OVER() AS 'AVG' FROM Stdetails
SELECT *, MAX(marks) OVER() AS 'max marks' FROM Stdetails

--PARTITION BY - To create subset It is always used with over()

SELECT *, SUM(marks) OVER(Partition by Sub) FROM Stdetails -- PART by Separates each and every data were as group by groups adds all the sililar value data
SELECT Sub,SUM(marks) FROM Stdetails
Group by Sub-- can also use group by clause

SELECT *, AVG(marks) OVER(partition by sub) FROM Stdetails
SELECT *, MAX(marks) OVER(partition by sub) FROM Stdetails

--RANK -Gives rank value to each data skips --order by is must
SELECT *, RANK() OVER(PARTITION BY Sub order by marks DESC) FROM Stdetails
SELECT *, RANK() OVER (PARTITION BY Stnid ORDER BY Marks DESC ) as 'RANK' FROM Stdetails
--DENSE RANK -It will not skip
SELECT *, DENSE_RANK() OVER(PARTITION BY Sub ORDER BY marks DESC) FROM Stdetails

--LAG/LEAD It leads/lags Compares the data by one another (past data)
SELECT * FROM Stdetails

SELECT *, LAG(Marks) OVER(ORDER BY Marks) FROM Stdetails
SELECT *, LAG(Marks) OVER(PARTITION BY Sub ORDER BY Marks) FROM Stdetails

--CASE WHEN

SELECT *,
CASE WHEN Marks >=80 THEN 'TOP STUDENT'
WHEN Marks >=60 AND Marks <=80 THEN 'Average Student'
ELSE 'Below average'
END as 'Student list'
FROM Stdetails

SELECT *,
CASE WHEN Sub = 'Maths' THEN Marks+10
WHEN Sub = 'Eng' THEN Marks+5
ELSE Marks 
END as 'Extra marks'
FROM Stdetails

 /*
 TCL
 TRANSACTION CONTROL LANGUAGE
 1 COMMIT - To save permanetly
 2 ROLLBACK - UNDO to restore the sys to previous command
 */

 SELECT * FROM Stdetails


 Begin Transaction
 INSERT INTO Stdetails VALUES (7,'EngL',98)
 COMMIT -- Cannot undo the data

 ROLLBACK 
 SELECT * FROM Stdetails

 Begin Transaction
 INSERT INTO Stdetails VALUES (7,'EngL',98)

 /*
 DCL
 DATA CONTROL LANGUAGE
 1)GRANT
 2)REVOKE
 */

 GRANT SELECT,UPDATE,INSERT,DELETE ON Stdetails to USERNAME
 REVOKE SELECT, UPDATE,INSERT,DELETE ON Stdetails to USERNAME -- These are used to only by DBA's To authorise users to select/modify the datasets




