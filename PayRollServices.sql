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

--UC3-Create-Employee-Payroll-Data-As-Part-Of-CURD-Operation--
INSERT INTO employee_payroll (EmpName, Salary, StartDate) VALUES
	('Hitesh', 40000.00, '2005-12-05'),
	('Dheeraj', 50000.00, '2008-03-02'),
	('Vishnu', 60000.00, '2007-04-07'),
	('Umang', 40000.00, '2016-01-03'),
	('Rahul', 50000.00, '2018-06-10')

--UC4-Retrieve-Employee-Payroll-Data--
SELECT * FROM employee_payroll;

--UC5-Retrieve-Salary-Of-Particular-Employee-And-Particular-Date-Range--
SELECT salary FROM employee_payroll WHERE EmpName = 'Vishnu'
SELECT * FROM employee_payroll WHERE StartDate between cast ('2015-07-01' as date) and GETDATE();

--UC6-Add-Gender-To-Employee-Payroll-Table-And-Update--
ALTER TABLE employee_payroll ADD Gender char(1)
update employee_payroll set Gender = 'M' where Id in (1,2,3,4,5) 

--UC-7-Find-Sum, Average, Min, Max And Number Of Male And Female Employees--
select sum(Salary) as SumSalary,Gender from employee_payroll WHERE Gender = 'M' group by Gender;
select avg(Salary) as AvgSalary,Gender from employee_payroll WHERE Gender = 'M' group by Gender; 
select max(Salary) as MaxSalary,Gender from employee_payroll WHERE Gender = 'M' group by Gender; 
select min(Salary) as MinSalary,Gender from employee_payroll WHERE Gender = 'M' group by Gender; 
select count(EmpName) as EmployeeCount,Gender from employee_payroll WHERE Gender = 'M' group by Gender;