/*
OPERATORS

1 Arthmetic operators ( + - * / % )
2 Logical Operators ( AND OR NOT )
3 Comparision Operators ( == > < <> <= >= )
4 Range operator ( Between , Not Between )
5 String Operator ( LIKE , NOT LIKE )

*/

CREATE DATABASE student

USE student

CREATE TABLE St_details (
						Stname char(50),
						StID int,
						Sub1 int,
						Sub2 int,
						Sub3 int
						)

INSERT INTO St_details values ( 'Ram', 101, 79,91,94),( 'Vel', 101, 78,100,95),( 'Karthi', 105, 75,95,98)

SELECT * FROM St_details

ALTER TABLE St_details ADD Totalmarks int 
ALTER TABLE St_details DROP column Totalmarks

--Arthmetic Operator
SELECT *, (Sub1+Sub2+Sub3) as 'Totalmarks' FROM St_details ---SELECT statement is used to select the specific Attributes to show and do operations
--here we are not changing the base table just adding the totalmarks As temproary attribute


SELECT *, (Sub1+Sub2+Sub3)/3 as Percentage FROM St_details --'Quotes are used to Identification

SELECT *,(Sub1+Sub2+Sub3)/3 as 'Percentage' ,(sub1+Sub2+Sub3) as 'Totalmarks' FROM St_details

--LOGICAL Operators
--AND both one values are TRUE the O/P will be TRUE (All condition must be TRUE)
--OR If one values are TRUE then O/P will be TRUE (Any one condition must be TRUE)
--NOT If value is TRUE then it will be FALSE (It give Opposite of the Condition)

CREATE TABLE Stdetails (
						StnID int,
						Sub char(500),
						Marks int
						)


INSERT INTO Stdetails values (01,'Maths',95),
(02,'Science',97),
(03,'Commerce',100),
(04,'Eng',75),
(05,'Commerce',95),
(06,'Maths',94),
(07,'Science',97)

SELECT * FROM Stdetails WHERE Sub = 'Eng';

SELECT StnID FROM Stdetails WHERE Sub = 'Maths' OR Sub = 'Science';

SELECT * FROM Stdetails WHERE NOT Sub = 'MATHS'
SELECT * FROM Stdetails WHERE Sub <> 'MATHS'  -- NOT equal is NOT,<>,!=
SELECT * FROM Stdetails WHERE Sub != 'MATHS'

SELECT * FROM Stdetails WHERE Sub <> 'Maths' AND Sub <> 'Eng'

SELECT * FROM Stdetails WHERE NOT Sub in ('Science','Maths')

--Comparision Operators

SELECT * FROM Stdetails WHERE Marks >90

SELECT * FROM Stdetails WHERE Marks >=90

SELECT * FROM Stdetails WHERE Marks <> 100

-- Range

SELECT * FROM Stdetails WHERE Marks BETWEEN 90 AND 100

SELECT * FROM Stdetails WHERE Marks NOT BETWEEN 90 and 100

--String

SELECT * FROM Stdetails WHERE sub like 's%i%'  -- As like we can use NOT LIKE
SELECT * FROM St_details WHERE Stname Like '___' -- _ It is used to check the Specific names 3 _ _ _ gives the name who are with 3 lettes name.

/*
Clauses

1 WHERE		
2 GROUP BY
3 HAVING 
4 ORDER BY
5 TOP N			-- these clauses should follow the order as it is.

*/

-- WHERE
SELECT * FROM Stdetails WHERE Marks >=90 --Where Clause

--GROUPBY It show into one data ie Collabrates the identical data into groups
--Aggregate func should be in group by (Count,Max,Min,Avg)
--

SELECT * FROM St_details

SELECT Stname, AVG(Sub1) as 'SubAVG'
FROM St_details
GROUP BY Stname

SELECT * FROM Stdetails

SELECT Sub, MAX(Marks) as 'Marks' 
FROM Stdetails
GROUP BY Sub

SELECT Sub, Count(*) as 'Totalcount'   -- Can use * because it counts Everything to be counted
FROM Stdetails
GROUP BY Sub

SELECT Sub, MIN(Marks) as 'Lowest_marks'
FROM Stdetails
WHERE Sub like '%E%'			--Can Use WHERE as an filter the data
GROUP BY Sub

--HAVING IT is also used to filter data
--Having will work only in the GROUP by Clause

SELECT * FROM Stdetails

SELECT Sub,AVG(Marks) as 'Avg'
FROM Stdetails
GROUP BY Sub			-- Temprory attribute cannot be used in Having Clause
HAVING AVG(marks) > 80  --Cannot use Where clause to Aggeregate func so we use Having clause

---- Diff WHERE and HAVING 
-- Aggregate func is used only in HAVING cause not in WHERE
-- WHERE comes first and Having comes after GROUP BY
-- WHERE can be used without GROUP BY but HAVING is used in GROUP BY only
  
SELECT Sub, AVG(Marks) as 'Lowest_marks'
FROM Stdetails
WHERE Sub in ('Eng','Science')		
GROUP BY Sub
HAVING AVG(Marks)>80

--ORDER BY -- Arranging in the order

SELECT * FROM Stdetails ORDER BY Marks  -- It will Give in asec order

SELECT * FROM Stdetails ORDER BY Marks desc  -- Its on Desc

-- TOP 2* -- to select top Values

SELECT TOP 3* FROM Stdetails 