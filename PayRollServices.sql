--UC1-Create-Payroll-Service-Database--
CREATE DATABASE Payroll_Service
USE Payroll_Service

--UC2-Add Employee Table--
Create Table employee_payroll
	(
	Id int identity (1,1) primary key,
	EmpName varchar(200),
	Salary float,
	StartDate date
	)