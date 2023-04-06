CREATE DATABASE GuitarShopDB
GO
USE GuitarShopDB
GO

CREATE TABLE Categories (
	CategoryID INT PRIMARY KEY IDENTITY(1, 1),
	CategoryName NVARCHAR(50) UNIQUE NOT NULL
)
GO

CREATE TABLE Products (
	ProductID INT PRIMARY KEY IDENTITY(1, 1),
	ProductCode CHAR(10) UNIQUE  NOT NULL CHECK(LEN(ProductCode) = 10),
	ProductName VARCHAR(50) NOT NULL,
	[Description] NVARCHAR(500),
	ListPrice MONEY NOT NULL,
	DiscountPercent MONEY NOT NULL DEFAULT '0.00',
	DateAdded DATETIME,
	CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID)
)
GO

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY IDENTITY(1, 1),
	EmailAddress VARCHAR(50) UNIQUE NOT NULL,
	[PassWord] VARCHAR(32) NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	ShippingAddressID INT,
	BillingAdressID INT
)
GO

CREATE TABLE Addresses (
	AddressID INT PRIMARY KEY IDENTITY(1, 1),
	Line1 NVARCHAR(50) NOT NULL,
	Line2 NVARCHAR(50) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	[State] CHAR(2) CHECK(LEN([State]) = 2) NOT NULL,
	ZipCode CHAR(10) CHECK(LEN(ZipCode) = 10) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
	[Disabled] CHAR(1),
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)
GO

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY IDENTITY(1, 1),
	OrderDate DATE NOT NULL,
	ShipAmount MONEY NOT NULL,
	TaxAmount MONEY NOT NULL,
	ShippingAddressID INT NOT NULL,
	BillingAdressID INT NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)
GO

CREATE TABLE OrderItems (
	ItemID INT PRIMARY KEY IDENTITY(1, 1),
	ItemPrice MONEY NOT NULL,
	DiscountAmount MONEY NOT NULL,
	Quantity INT NOT NULL,
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID)
)
GO

-- CATEGORIES -> 
INSERT INTO [dbo].[Categories]([CategoryName]) VALUES
	('Phone'), ('Laptop'), ('IPad'), ('Speaker')

INSERT INTO [dbo].[Products]([ProductCode],[ProductName],[Description]
           ,[ListPrice],[DiscountPercent],[DateAdded],[CategoryID]) VALUES
	('0000000001', 'Iphone 14', 'No', 2000, 2, '2021/01/01', 1),
	('0000000002', 'SamSung 21', 'No', 1800, 3, '2021/12/23', 1),
	('0000000003', 'Ipad Pro', 'No', 3000, 10, '2021/04/04', 2),
	('0000000004', 'Ipad Mini', 'No', 2400, 4, '2021/03/24', 2),
	('0000000005', 'Acer 5', 'No', 5000, 6, '2021/04/05', 3),
	('0000000006', 'Lenovo 21', 'No', 4300, 1, '2021/10/10', 3),
	('0000000007', 'Speaker 1', 'No', 200, 8, '2021/10/23', 4),
	('0000000008', 'Speaker 2', 'No', 300, 6, '2022/01/01', 4),
	('0000000009', 'Speaker 3', 'No', 500, 7, '2021/08/09', 4),
	('0000000010', 'Speaker 4', 'No', 100, 9, '2021/03/23', 4)

INSERT INTO [dbo].[Customers]([EmailAddress],[PassWord] ,[FirstName],
		[LastName],[ShippingAddressID],[BillingAdressID]) VALUES
		('nguyenA@gmail.com', '123456', 'Nguyen', 'A', 1, 1),
		('nguyenB@gmail.com', '123456', 'Nguyen', 'B', 1, 1),
		('nguyenC@gmail.com', '123456', 'Nguyen', 'C', 2, 2),
		('nguyenD@gmail.com', '123456', 'Nguyen', 'D', 2, 2),
		('nguyenE@gmail.com', '123456', 'Nguyen', 'E', 2, 3),
		('nguyenF@gmail.com', '123456', 'Nguyen', 'F', 2, 3),
		('nguyenG@gmail.com', '123456', 'Nguyen', 'G', 3, 3),
		('nguyenH@gmail.com', '123456', 'Nguyen', 'H', 3, 3),
		('nguyenI@gmail.com', '123456', 'Nguyen', 'I', 4, 1),
		('nguyenK@gmail.com', '123456', 'Nguyen', 'K', 4, 1)

INSERT INTO [dbo].[Addresses]([Line1],[Line2],[City],[State],
			[ZipCode],[Phone],[Disabled],[CustomerID]) VALUES
	('Line 11', 'Line 12', 'Ha Noi', 'HN', '1234567890', '01237584728', '1', 1),
	('Line 21', 'Line 22', 'Ha Noi', 'HN', '1234567890', '02948674853', '1', 2),
	('Line 31', 'Line 32', 'Ha Tay', 'HT', '0396857385', '0194725744', '1', 3),
	('Line 41', 'Line 42', 'Ha Tay', 'HT', '0396857385', '01937584735', '1', 4),
	('Line 51', 'Line 52', 'Ha Dong', 'HD', '0286748572', '01937587693', '1', 5),
	('Line 61', 'Line 62', 'Ha Dong', 'HD', '0286748572', '019358574', '1', 6),
	('Line 71', 'Line 72', 'Ha Nam', 'HN', '0123123458', '01947348463', '1', 7),
	('Line 81', 'Line 82', 'Ha Nam', 'HN', '0123123458', '01936246352', '1', 8),
	('Line 91', 'Line 92', 'Ha Nam', 'HN', '0123123458', '019365897443', '1', 9),
	('Line 101', 'Line 102', 'Ha Nam', 'HN', '0123123458', '01938489685', '1', 10)

INSERT INTO [dbo].[Orders]([OrderDate],[ShipAmount],[TaxAmount]
           ,[ShippingAddressID],[BillingAdressID],[CustomerID]) VALUES
		('20210110', '20000', '200', 1, 2, 1),
		('20210201', '18000', '200', 2, 1, 2),
		('20210302', '13000', '200', 3, 1, 3),
		('20210403', '10000', '200', 4, 2, 4),
		('20210504', '30000', '200', 4, 3, 5),
		('20210605', '23000', '200', 2, 4, 6),
		('20210706', '26000', '200', 3, 3, 7),
		('20210807', '12000', '200', 4, 1, 8),
		('20210908', '18000', '200', 1, 2, 9),
		('20211109', '20000', '200', 1, 2, 1)

INSERT INTO [dbo].[OrderItems]([ItemPrice],[DiscountAmount]
           ,[Quantity],[ProductID],[OrderID]) VALUES
		(2000, 2, 20, 10, 1),
		(1800, 1, 23, 11, 2),
		(1300, 12, 65, 12, 3),
		(3400, 32, 20, 15, 4),
		(2300, 2, 34, 14, 1),
		(6700, 6, 20, 19, 5),
		(2300, 7, 22, 16, 7),
		(6500, 9, 287, 18, 8),
		(4500, 2, 22, 11, 9),
		(2100, 12, 21, 13, 10)

-- Phần B -----
UPDATE Products SET DiscountPercent = 35 WHERE DiscountPercent = 0 
	AND DATEDIFF(MONTH, DateAdded, GETDATE()) >= 12

-- Phần C -----
UPDATE Customers SET [PassWord] = 'secret' WHERE EmailAddress = 'risk@raven.com'

-- Phần D --
SELECT c.LastName + ', ' + c.FirstName AS 'FullName'  FROM Customers c
WHERE c.LastName LIKE '[M-Z]%' ORDER BY c.LastName ASC

-- Phần E ---
SELECT 
	ProductName,
	ListPrice,
	DateAdded
FROM Products WHERE ListPrice BETWEEN 500 AND 2000 ORDER BY DateAdded DESC

-- Phần F  ---
-- 1 ---
SELECT COUNT(*) AS 'Number of Order', SUM(O.TaxAmount) AS 'Sum Of TaxAmount'
FROM Customers AS C JOIN Orders AS O
	ON C.CustomerID = O.CustomerID
	GROUP BY C.CustomerID






