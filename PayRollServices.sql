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

--UC-8-Add Employee Phone, Department(not null), Address (using default values)--
select * from employee_payroll
alter table employee_payroll add Phone bigint;
ALTER TABLE employee_payroll add Department varchar(200) not null default 'IT';
ALTER TABLE employee_payroll add Address varchar(200) default 'Bangalore';

--UC-9-Extend Table To Have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay--
alter table employee_payroll add 
								 Basic_Pay float not null default 0.00,
								 Deductions float not null default 0.00,
								 Taxable_Pay float not null default 0.00, 
								 Income_Tax float not null default 0.00,
								 Net_Pay float not null default 0.00;

--UC10-Adding-Department-of-Terisa-As-Sales-&-Marketing-Both--
INSERT INTO employee_payroll
(EmpName, Department, Gender, Basic_pay, Deductions, Taxable_Pay, Income_Tax, Net_Pay, StartDate) VALUES
('Terrisa', 'SD', 'M', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2018-01-03' );
update employee_payroll set Net_Pay = (Basic_Pay-Deductions-Taxable_Pay-Income_Tax);
select * from employee_payroll;
