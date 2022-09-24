CREATE DATABASE Emp --- to create dataabase
USE emp --- to use the database

--- use for sinle line comments
/*
multiple
lines
*/

SP_HELPDB emp --- Shows the information of the Database

SP_RENAMEDB emp , Employee --TO rename the database name
SP_HELPDB EMployee 

DROP DATABASE Employee ---It used to delete the full database completely but it cannot be done while using

CREATE DATABASE EE-- Created

DROP DATABASE EE --- Deleted

/* 
DDL - Data Defenition Language--It deals with the stucture/skeleton of the table.
1 CREATE
2 RENAME
3 ALTER
4 TURNCATE
5 DROP

With ALTER we can also use as,
1 ALTER ADD
2 ALTER DROP
3 ALTER RENAME
4 ALTER ALTER

*/
--CREATE COMMAND
CREATE TABLE emp (
	EmpID int,				--Coloumn name and assinging the data type
	EmpName char(50),		--() Assinging length of the datatype charecters upto 50
	Lname char(50),
	Age int,
	Department char(100),
	Salary decimal(8,2)
	)						--Created an table named emp

EXEC sp_help emp  --Shows the info of table --EXEC use to execute

INSERT INTO emp values (10011,'Abi','S',25,'HR',35000.50) -- INSERT values into the table

SELECT * FROM emp --To Select the specified table

--ALTER COMMAND use to modify the Table

ALTER TABLE emp ALTER column Department char(50) --Alter Alter command is used to change the data type

EXEC sp_help emp -- To check the info

ALTER TABLE emp ADD DOJ date -- To add new Attribute
ALTER TABLE emp ADD Gender char
sp_rename 'emp.Department','Dept'

SELECT * FROM emp -- Changed the Attribute name

ALTER TABLE emp DROP column Gender -- To delete the selected Attribute

-- RENAME COMMAND
sp_rename emp,emp1

SELECT * FROM emp1

--DROP COMMAND

DROP table emp  -- it will delete the table

--TRUNCATE Command

TRUNCATE table emp -- it removes the data in the table


CREATE TABLE emp (
	EmpID int,				
	EmpName char(50),		
	Lname char(50),
	Age int,
	Department char(100),
	Salary decimal(8,2),
	DOJ date
	)

/* 
DML-Data Manipulation Language

1 INSERT
2 UPDATE
3 DELETE

*/

EXEC sp_help emp
--INSERT command
INSERT INTO emp values (101,'Abi','S',25,'HR',35000.50,'2002-05-21'),
(102,'Anand','M',24,'Developer',50000.50,'2019-01-20'),
(103,'Akil','S',25,'Tester',45000.50,'2022-05-19'),
(104,'JANA','J',25,'Programmer',50000.50,'2021-08-22'),
(105,'PRASANTH','S',25,'Developer',5000.50,'2020-08-02')


INSERT INTO emp (EmpID,Lname,Age)values ('101','S','25')  --To add specify values to the table other Attributes will be NULL

SELECT * FROM emp

--UPDATE command
UPDATE emp set Salary = 100000.50 WHERE EmpName = 'Abi'  -- to update the exsisting value

--DLELTE command
DELETE FROM emp WHERE Salary = '100000.50' -- its used to delete the multiple/specific values.

INSERT INTO emp values (10126,'Viswak','D',19,'Architect',15000.47,'02-01-2022')

DELETE FROM emp where salary = 15000.47