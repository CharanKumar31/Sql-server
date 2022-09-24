--CONSTRAINTS in SQL It is used to restrict the unwanted data in any coloumns

/*
NOT NULL -- TO Create an Attribute that not contains Not null
DEFAULT -- To have an Default Value in the attribute if or if not we insert an value
UNIQUE -- Ensures that every values are diffrent
PRIMARY KEY -- Combination of NOT NULL and Unique
CHECK -- To check an value that not exceeds the Check constraints
FORIEGN KEY -- To establish the values B/W the two tables


*/

CREATE DATABASE Constraints
USE Constraints

-- NOT NULL
CREATE Table Customers 
(
Id int not null,
name varchar(10) not null,
age int not null,
Address char(30),
Gender char(5)
)

INSERT INTO Customers(Id, name, age) values (101,'Varun',29)
INSERT INTO Customers(Id, name) values (102,'Tharun') -- It will give error because the values of the age column is represented as NOT NULL

-- DEFAULT CONSTRAINTS

CREATE TABLE sales
(
Id int not null,
Name char (30),
age int default '25',
address char(50),
gender char (5)
)

INSERT INTO sales (Id,Name,address) values (101,'Kumar','CBE')
SELECT * FROM sales -- even after not giving the values in the AGE attribute it takes it as '25' default value

--UNIQUE CONSTRAINT

CREATE TABLE Hr
(
Id int unique,
Name char(30) not null,
age int default '25',
address char(50),
gender char(5)
)

INSERT INTO Hr (Id,Name,gender,address) values (101,'jay','Male','Salem')
INSERT INTO Hr (Id,Name,gender,address) values (101,'Vivek','Male','Salem') --It shows error b'coz of the value should be differ in the particular column
INSERT INTO Hr (Id,Name,gender,address) values (102,'Vivek','Male','Salem') -- Id value is differed and must not use two null values
SELECT * FROM Hr

--PRIMARY KEY
CREATE TABLE Marketing
(
Id int primary key,
Name char(30) not null,
age int default '25',
address char(50),
gender char(5)
) 

SELECT * FROM Marketing

INSERT INTO Marketing (Id,Name,address,gender) values (1,'Kala','CBE','Male'),
(1,'Bala','CBE','Male') -- Gives error because the primary key constraints will not accept same values

INSERT INTO Marketing (Id,Name,address,gender) values (1,'Kala','CBE','Male'),
(NULL,'Bala','CBE','Male') -- NOT NULL constraint also applicable here. Its an combination of both the Unique and Not null Constraints

CREATE TABLE Accounts
(
Id int primary key,
Name char(50) not null,
age int check (age >=25),
address char(50),
gender Char(5)
)


SELECT * FROM Accounts

INSERT INTO Accounts values (1,'Sekar',27,'Trichy','Male'),(2,'Babu',21,'Trichy','Male') --Check constraint shows that the values are not in the limit of check.
INSERT INTO Accounts values (1,'Sekar',25,'Trichy','Male'),(2,'Babu',27,'Trichy','Male') --No errors

--Foreign key
-- IT is used to establish the relation B/W two tables
-- We cannot insert a record in foreign key if not available in primary key
-- We cannot delete a record from primary key if not deleted in foreign key  
-- 1st is parent table/Reference table 2nd is child table/Foriegn table

--PARENT TABLE / Reference

CREATE TABLE Author
(
authour_id int primary key,
authour_name char(30)
)

--CHILD TABLE / FOREIGN TABLE

CREATE TABLE Books
(
Book_id int,
booktitle char(30),
book_price int,
authour_id int references Author(authour_id)
)

SELECT * FROM Author
SELECT * FROM Books

INSERT INTO Author VALUES (101,'Potter')
INSERT INTO Books VALUES (101,'Harry Potter',55,101)

DELETE FROM Author WHERE authour_id = 101 --It shows error bcoz of the values are in the Primary key
DELETE FROM Books WHERE authour_id = 101 -- It will be Deleted.., ie.,In Child table the values can be deleted

INSERT INTO Books VALUES (1,'Harry Potter',55,102) -- It Shows Error where the values are not presented in Parent table
INSERT INTO Author VALUES (103,'Potter')
INSERT INTO Books VALUES (3,'Potter',55,103)--It Runs as We created a value reference

EXEC sp_help Marketing