USE Master;
GO

CREATE DATABASE SQLPractice;

USE SqlPractice;
GO

-- 1. Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE,
    TrainingHours INT
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary, JoinDate, TrainingHours) VALUES
(1, 'Employee_1', 'IT', 62098, '2008-01-24', 28),
(2, 'Employee_2', 'Marketing', 101482, '2009-12-04', 11),
(3, 'Employee_3', 'HR', 42280, '2023-07-02', 27),
(4, 'Employee_4', 'HR', 103563, '2012-09-20', 25),
(5, 'Employee_5', 'Finance', 107236, '2022-07-08', 35),
(6, 'Employee_6', 'Finance', 93359, '2009-07-14', 50),
(7, 'Employee_7', 'Sales', 51134, '2021-03-25', 78),
(8, 'Employee_8', 'Logistics', 31632, '2023-05-15', 62),
(9, 'Employee_9', 'IT', 105673, '2010-06-01', 33),
(10, 'Employee_10', 'Marketing', 67821, '2019-01-21', 16),
(11, 'Employee_11', 'Sales', 55139, '2015-09-08', 8),
(12, 'Employee_12', 'Logistics', 91144, '2007-04-28', 40),
(13, 'Employee_13', 'Finance', 45011, '2017-07-18', 20),
(14, 'Employee_14', 'Sales', 117947, '2011-02-09', 45),
(15, 'Employee_15', 'HR', 33305, '2020-11-02', 19),
(16, 'Employee_16', 'Marketing', 69012, '2016-10-19', 38),
(17, 'Employee_17', 'Finance', 79888, '2018-06-26', 64),
(18, 'Employee_18', 'Logistics', 72943, '2013-03-30', 70),
(19, 'Employee_19', 'IT', 94322, '2014-08-23', 22),
(20, 'Employee_20', 'Sales', 58231, '2021-12-10', 55);

-- 2. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    Stock INT,
    MaxStock INT
);

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice, Stock, MaxStock) VALUES
(1, 'Product_1', 'Electronics', 310, 480, 500),
(2, 'Product_2', 'Sports', 455, 222, 500),
(3, 'Product_3', 'Clothing', 94, 19, 500),
(4, 'Product_4', 'Furniture', 207, 156, 500),
(5, 'Product_5', 'Clothing', 221, 317, 500),
(6, 'Product_6', 'Food', 350, 465, 500),
(7, 'Product_7', 'Electronics', 498, 8, 500),
(8, 'Product_8', 'Furniture', 75, 230, 500),
(9, 'Product_9', 'Sports', 180, 305, 500),
(10, 'Product_10', 'Electronics', 422, 12, 500),
(11, 'Product_11', 'Food', 57, 450, 500),
(12, 'Product_12', 'Furniture', 260, 51, 500),
(13, 'Product_13', 'Clothing', 132, 287, 500),
(14, 'Product_14', 'Food', 25, 499, 500),
(15, 'Product_15', 'Sports', 470, 401, 500);

-- 3. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    JoinDate DATE
);

INSERT INTO Customers (CustomerID, CustomerName, City, JoinDate) VALUES
(1, 'Customer_1', 'Lagos', '2019-06-24'),
(2, 'Customer_2', 'Abuja', '2015-04-15'),
(3, 'Customer_3', 'Kano', '2023-01-09'),
(4, 'Customer_4', 'Ibadan', '2020-11-19'),
(5, 'Customer_5', 'Port Harcourt', '2016-03-14'),
(6, 'Customer_6', 'Abuja', '2024-07-02'),
(7, 'Customer_7', 'Lagos', '2017-05-08'),
(8, 'Customer_8', 'Kano', '2022-02-13'),
(9, 'Customer_9', 'Ibadan', '2018-08-30'),
(10, 'Customer_10', 'Port Harcourt', '2021-09-21');

-- 4. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    ExpectedDelivery DATE,
    DeliveryDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate, ExpectedDelivery, DeliveryDate) VALUES
(1, 4, 5, 10, '2024-01-11', '2024-01-16', '2024-01-18'),
(2, 6, 3, 17, '2024-02-19', '2024-02-24', '2024-02-24'),
(3, 1, 7, 19, '2024-03-03', '2024-03-08', '2024-03-12'),
(4, 8, 9, 3, '2024-04-20', '2024-04-25', '2024-04-25'),
(5, 2, 10, 15, '2024-05-12', '2024-05-17', '2024-05-20'),
(6, 9, 1, 5, '2024-06-01', '2024-06-06', '2024-06-05'),
(7, 5, 14, 2, '2024-07-07', '2024-07-12', '2024-07-12'),
(8, 3, 2, 8, '2024-08-15', '2024-08-20', '2024-08-25'),
(9, 10, 4, 9, '2024-09-09', '2024-09-14', '2024-09-16'),
(10, 7, 12, 6, '2024-10-22', '2024-10-27', '2024-10-30');

-- 5. Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    TransactionDate DATE,
    Refund BIT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Transactions (TransactionID, CustomerID, Amount, TransactionDate, Refund) VALUES
(1, 4, 250.00, '2024-01-14', 0),
(2, 6, 1800.00, '2024-01-25', 0),
(3, 1, 299.99, '2024-02-10', 0),
(4, 8, 600.00, '2024-02-20', 1),
(5, 2, 1200.00, '2024-03-02', 0),
(6, 9, 500.00, '2024-03-16', 0),
(7, 5, 1000.00, '2024-04-11', 1),
(8, 3, 750.00, '2024-04-21', 0),
(9, 10, 400.00, '2024-05-04', 0),
(10, 7, 1500.00, '2024-05-19', 0);


-- Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Finance'),
(5, 'Logistics'),
(6, 'Marketing');


---------------------------------
SELECT 
	Name as EmployeeName,
	Department as JobTitles
FROM Employees;

---------------------------------
SELECT *
FROM Products
WHERE UnitPrice > 100;

---------------------------------
SELECT *
FROM Customers
WHERE City = 'Lagos';

---------------------------------
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-06-30';

---------------------------------
SELECT *
FROM Customers
WHERE CustomerName LIKE 'A%';

---------------------------------

--SORTING, DISTINCT AND LIMITING
SELECT 
	DISTINCT DepartmentName
FROM Departments

---------------------------------

SELECT 
	TOP 5 ProductName,
	ProductID
FROM Products
ORDER BY UnitPrice ASC;

---------------------------------

SELECT
	CustomerID,
	CustomerName
FROM Customers
ORDER BY CustomerName ASC;

---------------------------------

SELECT 
	*
FROM Products
WHERE Category = 'Electronics'
ORDER BY UnitPrice DESC;

---------------------------------

-- AGGREGATIONS & GROUP BY

SELECT
	COUNT(EmployeeID),
	Department
FROM Employees
GROUP BY Department
	
---------------------------------

--SELECT 
--	p.Category,
--	p.UnitPrice * o.quantity AS TotalSalesAmount
--FROM Products as p
--JOIN Orders as o
--	ON p.ProductID = o.ProductID
--ORDER BY TotalSalesAmount;

SELECT 
	p.Category,
	SUM(p.UnitPrice * o.quantity) AS TotalSalesAmount
FROM Products as p
JOIN Orders as o
	ON p.ProductID = o.ProductID
GROUP BY p.Category
ORDER BY TotalSalesAmount;

---------------------------------

SELECT 
	Department,
	AVG(Salary) as AverageSalary
FROM Employees
GROUP BY Department

---------------------------------

SELECT 
	CustomerID,
	MAX(Quantity) AS HighestOrderQuantity
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID;

---------------------------------

--HAVING AND FILTERING GROUPS

SELECT 
	Department,
	COUNT(EmployeeID) as TotalEmployee
FROM Employees
GROUP BY Department
HAVING COUNT(EmployeeID) > 5;

---------------------------------
SELECT
	p.ProductID,
	p.ProductName,
	Category,
	SUM(p.UnitPrice * o.Quantity) as TotalSales
FROM Products as p
JOIN Orders as o
	ON p.ProductID = o.ProductID
GROUP BY
	p.ProductID,
	p.ProductName,
	Category
HAVING SUM(p.UnitPrice * o.Quantity) > 100;


--JOIN Basics
SELECT
	o.OrderID,
	o.CustomerID,
	o.Quantity,
	c.CustomerName
FROM Orders as o
JOIN Customers as c
	ON o.CustomerID = c.CustomerID;

---------------------------------
SELECT 
	p.ProductName,
	p.Category,
	s.Supplier
FROM Products as p
JOIN Supplier as s
	ON p.ProductID = s.productID;

---------------------------------

SELECT
	e.Name as EmployeeName,
	m.manager as ManagerName
FROM Employees as e
JOIN Employees as m
	ON m.ManagerID = e.EmployeeID;


--STRING AND DATE FUNCTIONS
SELECT
	SUBSTRING(CustomerName, 1,3) as Cust3Alphabet
FROM Customers;

---------------------------------
SELECT
	EmployeeID,
	Name as EmployeeName,
	JoinDate 
FROM Employees
WHERE YEAR(JoinDate) = YEAR(GETDATE());

