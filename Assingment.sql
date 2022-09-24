CREATE DATABASE Sql_Assignment

USE Sql_Assignment

CREATE TABLE Employee
( Employee_id int primary key,
First_name varchar(25),
Last_name Varchar(25),
Salary int,
Joining_date date,
Department varchar(20)
)

INSERT INTO Employee VALUES
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Deeraj','Dhiwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')

CREATE TABLE Employee_bonus (
Employee_ref_id int Foreign key references Employee (Employee_id),
Bonus_amount int,
Bonus_date date
)

INSERT INTO Employee_bonus VALUES 
(1,5000,'2020-02-16'),
(2,3000,'2011-06-16'),
(3,4000,'2020-02-16'),
(1,4500,'2020-02-16'),
(2,3500,'2011-06-16')

CREATE TABLE Employee_Title
( Employee_ref_id int Foreign key references Employee (Employee_id),
Employee_title varchar(20),
Affective_date date
)

INSERT INTO Employee_Title VALUES
(1,'Manager','2020-02-16'),
(2,'Executive','2011-06-16'),
(8,'Executive','2020-02-16'),
(5,'Manager','2020-02-16'),
(4,'Asst manager','2011-06-16'),
(7,'Executive','2020-02-16'),
(6,'Lead','2011-06-16'),
(3,'Lead','2020-02-16')


SELECT* FROM Employee
SELECT* FROM Employee_Title
SELECT* FROM Employee_bonus

--1) Display the “FIRST_NAME” from Employee table using the alias name as Employee_name
SELECT First_name FROM Employee As Employee_name

--2) Display “LAST_NAME” from Employee table in upper case
SELECT UPPER(Last_name) FROM Employee Name

--3)  Display unique values of DEPARTMENT from EMPLOYEE table.
SELECT DISTINCT Department FROM Employee

--4) Display the first three characters of LAST_NAME from EMPLOYEE table
 SELECT LEFT(Last_name,3) FROM Employee

--5)Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
SELECT DISTINCT LEN(Department) AS Length_of_Dept
,Department FROM Employee

--6) Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.
SELECT CONCAT(First_name,' ',Last_name) AS FULL_NAME FROM Employee

--7)  DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
SELECT * FROM Employee
ORDER BY First_name

--8)Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending
SELECT * FROM Employee ORDER BY Department DESC, First_name

--9) Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table..

SELECT * FROM Employee 
WHERE First_name IN ( 'VEENA','KARAN')

--10)Display details of EMPLOYEE with DEPARTMENT name as “Admin”

SELECT * FROM Employee
WHERE Department = 'ADMIN'

--11)DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
SELECT * FROM Employee
WHERE First_name LIKE '%v%'

--12) DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000

SELECT * FROM Employee
WHERE Salary BETWEEN 100000 AND 500000;

--13) Display details of the employees who have joined in Feb-2020.

SELECT * FROM Employee
WHERE Joining_date BETWEEN '2020-02-01' AND '2020-02-29'

--14)Display employee names with salaries >= 50000 and <= 100000.

SELECT * FROM Employee
WHERE Salary  >= 50000 AND Salary <= 100000

--15) DISPLAY details of the EMPLOYEES who are also Managers.
SELECT * FROM Employee A
JOIN Employee_Title B
ON A.Employee_id = B.Employee_ref_id
WHERE Employee_title LIKE '%Manager%'

--16) DISPLAY duplicate records having matching data in some fields of a table
SELECT Employee_Title,COUNT(*) AS Mul_Records
FROM Employee_Title
GROUP BY Employee_title
HAVING COUNT(*)>1

--17) Display only odd rows from a table

SELECT * FROM Employee WHERE Employee_id % 2 = 1

--18)Clone a new table from EMPLOYEE table

SELECT * INTO Clone_Emp FROM Employee


--19) DISPLAY the TOP 2 highest salary from a table

SELECT TOP 2* FROM Employee 
ORDER BY Salary DESC;

--20) DISPLAY the list of employees with the same salary.

SELECT * FROM Employee WHERE SALARY =(
SELECT Salary FROM Employee
GROUP BY Salary
HAVING COUNT(*)>1)

--21)Display the second highest salary from a table.

SELECT MAX(Salary) FROM Employee WHERE Salary <
(SELECT MAX(Salary) FROM Employee)


--22) Display the first 50% records from a table.
SELECT TOP 50 PERCENT * FROM Employee 

--23) Display the departments that have less than 4 people in it
SELECT Department FROM Employee 
GROUP BY Department
HAVING COUNT(Department) < 4

 --24) Display all departments along with the number of people in there
 SELECT DISTINCT(Department),COUNT(Department)
 OVER (PARTITION BY Department) AS Total_People
 FROM Employee

 --25) Display the name of employees having the highest salary in each department

 SELECT First_name,Department FROM Employee
 WHERE Salary
 IN (SELECT MAX(Salary) OVER(PARTITION BY Department) AS Max_salary 
 FROM Employee)

 --26) Display the names of employees who earn the highest salary.
 
 SELECT First_name FROM Employee WHERE SALARY IN(
 SELECT MAX(Salary) FROM Employee)

 --27) Diplay the average salaries for each department
 SELECT DISTINCT(Department),AVG(Salary) 
 OVER(PARTITION BY Department) AS AVG_Salary
 FROM Employee
 --IN GROUP BY
 SELECT AVG(Salary) AS AVG_Salary, Department FROM Employee
 GROUP BY Department

 --28)Display the name of the employee who has got maximum bonus

 SELECT MAX(Bonus_amount) FROM Employee A
 JOIN Employee_bonus B ON
 A.Employee_id = B.Employee_ref_id

--29) Display the first name and title of all the employees

SELECT First_name,Employee_Title FROM Employee A
JOIN Employee_Title B ON
A.Employee_id = B.Employee_ref_id













