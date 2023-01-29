--UC1-Create-Payroll-Service-Database--
CREATE DATABASE Payroll_Service
USE Payroll_Service

--UC2-Add Employee Table--
CREATE TABLE employee_payroll
	(
	Id int identity (1,1) primary key,
	EmpName varchar(200),
	Salary float,
	StartDate date
	)

--UC-3-Create-Employee-Payroll-Data-As-Part-Of-CURD-Operation--
INSERT INTO employee_payroll (EmpName, Salary, StartDate) VALUES
	('Hitesh', 40000.00, '2005-12-05'),
	('Dheeraj', 50000.00, '2008-03-02'),
	('Vishnu', 60000.00, '2007-04-07'),
	('Umang', 40000.00, '2016-01-03'),
	('Rahul', 50000.00, '2018-06-10')

--UC-4-Retrieve-Employee-Payroll-Data--
SELECT * FROM employee_payroll;