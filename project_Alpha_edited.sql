create database Project_Alpha_DB;

use Project_Alpha_DB;

create table Employees (Employee_ID INT PRIMARY KEY AUTO_INCREMENT, Employee_Name VARCHAR(50), Age INT, Department_ID INT,Salary DECIMAL(10,2));

create table departments (Department_ID INT PRIMARY KEY AUTO_INCREMENT, Department_Name VARCHAR(100) UNIQUE , Manager_ID INT);

create table Projects (Project_ID INT PRIMARY KEY AUTO_INCREMENT, Project_Name VARCHAR(100) UNIQUE , Department_ID INT, Budget INT);

create table salaries (salary_ID INT, Employee_ID INT PRIMARY KEY AUTO_INCREMENT,Base_Salary DECIMAL(10,2),Bonus INT,Deductions INT,Net_Salary DECIMAL(10,2));


-- inserting data into departments table
INSERT INTO Departments (Department_ID, Department_Name, Manager_ID) VALUES
(1, 'HR', 101),
(2, 'IT', 102),
(3, 'Finance', 103),
(4, 'Marketing', 104),
(5, 'Sales', 105),
(6, 'Operations', 106),
(7, 'Logistics', 107),
(8, 'Customer Service', 108),
(9, 'Legal', 109),
(10, 'Research', 110);

-- Inserting Data into Employees Table
INSERT INTO Employees (Employee_ID, Employee_Name, Age, Department_ID, Salary) VALUES
(101, 'Alice Johnson', 34, 1, 70000.00),
(102, 'Bob Smith', 40, 2, 80000.00),
(103, 'Charlie Davis', 29, 3, 75000.00),
(104, 'David White', 45, 4, 72000.00),
(105, 'Emma Brown', 38, 5, 77000.00),
(106, 'Frank Green', 50, 6, 81000.00),
(107, 'Grace Hall', 33, 7, 73000.00),
(108, 'Henry Adams', 41, 8, 76000.00),
(109, 'Ivy Carter', 37, 9, 79000.00),
(110, 'Jack Evans', 42, 10, 82000.00);

-- Insertng Data into Projects Table
INSERT INTO Projects (Project_ID, Project_Name, Department_ID, Budget) VALUES
(201, 'HR System Upgrade', 1, 50000.00),
(202, 'Website Redesign', 2, 75000.00),
(203, 'Financial Audit', 3, 90000.00),
(204, 'New Product Launch', 4, 120000.00),
(205, 'Sales Expansion Plan', 5, 100000.00),
(206, 'Supply Chain Optimization', 6, 85000.00),
(207, 'Fleet Management', 7, 95000.00),
(208, 'Customer Support AI', 8, 65000.00),
(209, 'Compliance Review', 9, 55000.00),
(210, 'New Research Initiative', 10, 110000.00);

-- Inserting Data into Salaries Table
INSERT INTO Salaries (Salary_ID, Employee_ID, Base_Salary, Bonus, Deductions) VALUES
(301, 101, 70000.00, 5000.00, 2000.00),
(302, 102, 80000.00, 6000.00, 2500.00),
(303, 103, 75000.00, 5500.00, 2200.00),
(304, 104, 72000.00, 5200.00, 2100.00),
(305, 105, 77000.00, 5800.00, 2300.00),
(306, 106, 81000.00, 6200.00, 2700.00),
(307, 107, 73000.00, 5400.00, 2250.00),
(308, 108, 76000.00, 5700.00, 2350.00),
(309, 109, 79000.00, 5900.00, 2400.00),
(310, 110, 82000.00, 6300.00, 2800.00);

-- 1. Retrieving all employees and their department names.
SELECT E.Employee_ID, E.Employee_Name, D.Department_Name 
FROM Employees E
JOIN Departments D ON E.Department_ID = D.Department_ID;

-- 2. Finding the total number of employees in each department.
SELECT Department_ID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Department_ID;

-- 3. Calculating the average salary of employees in each department.
SELECT Department_ID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department_ID;

-- 4. Listing all employees with a salary above the company’s average salary.
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 5. Retrieving all employees who are assigned to at least one project.
SELECT DISTINCT E.* 
FROM Employees E
JOIN Projects P ON E.Department_ID = P.Department_ID;

-- 6. Computing the total budget allocated per department.
SELECT Department_ID, SUM(Budget) AS TotalBudget
FROM Projects
GROUP BY Department_ID;

-- 7. Retrieving the top 3 highest-paid employees.
SELECT * FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- 8. Calculating each employee’s net salary.
SELECT Employee_ID, (Base_Salary + Bonus - Deductions) AS Net_Salary
FROM Salaries;

-- 9. Identifying the department with the highest budget allocation.
SELECT Department_ID 
FROM Projects
GROUP BY Department_ID
ORDER BY SUM(Budget) DESC
LIMIT 1;

-- 10. Retrieving employees who earn less than $50,000 and work in the IT department.

SELECT * FROM Employees
WHERE Salary < 50000 AND Department_ID = (SELECT Department_ID FROM Departments WHERE Department_Name = 'IT');
