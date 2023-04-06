CREATE DATABASE GuitarShopDB
USE GuitarShopDB

-- a. Create database called GuitarShopDB, then:
--    - Create the table with the most appropriate column contraints & types.

CREATE TABLE Categories (
	CategoryID          INT                 PRIMARY KEY IDENTITY(1, 1),
	CategoryName        NVARCHAR(255)       UNIQUE NOT NULL
)

CREATE TABLE Products (
    ProductID           INT                 PRIMARY KEY IDENTITY(1, 1),
	ProductCode         VARCHAR(10)         UNIQUE  NOT NULL CHECK(LEN(ProductCode) = 10),
	ProductName         VARCHAR(255)        NOT NULL,
	[Description]       NVARCHAR(500),
	ListPrice           MONEY               NOT NULL,
	DiscountPercent     MONEY               NOT NULL DEFAULT '0.00',
	DateAdded           DATETIME,
	CategoryID          INT                 FOREIGN KEY REFERENCES Categories(CategoryID)
)

CREATE TABLE Customers (
	CustomerID          INT                 PRIMARY KEY IDENTITY(1, 1),
	EmailAddress        VARCHAR(255)        UNIQUE NOT NULL,
	[PassWord]          VARCHAR(32)         NOT NULL,
	FirstName           NVARCHAR(255)       NOT NULL,
	LastName            NVARCHAR(255)       NOT NULL,
	ShippingAddressID   INT                 DEFAULT NULL,
	BillingAdressID     INT                 DEFAULT NULL
)

CREATE TABLE Addresses (
	AddressID           INT                 PRIMARY KEY IDENTITY(1, 1),
	Line1               NVARCHAR(255)       NOT NULL,
	Line2               NVARCHAR(255)       DEFAULT NULL,
	City                NVARCHAR(255)       NOT NULL,
	[State]             VARCHAR(2)          NOT NULL CHECK(LEN([State]) = 2),
	ZipCode             CHAR(10)            NOT NULL CHECK(LEN(ZipCode) = 10),
	Phone               VARCHAR(15)         NOT NULL,
	[Disabled]          VARCHAR(8)          DEFAULT NULL,
	CustomerID          INT                 FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE Orders (
    OrderID             INT                 PRIMARY KEY IDENTITY(1, 1),
    OrderDate           Date                NOT NULL,
    ShipAmount          MONEY               NOT NULL,
	TaxAmount           MONEY               NOT NULL,
	ShippingAddressID   INT                 NOT NULL,
	BillingAdressID     INT                 NOT NULL,
	CustomerID          INT                 FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems (
	ItemID              INT                 PRIMARY KEY IDENTITY(1, 1),
	ItemPrice           MONEY               NOT NULL,
	DiscountAmount      MONEY               NOT NULL,
	Quantity            INT                 NOT NULL,
	ProductID           INT                 FOREIGN KEY REFERENCES Products(ProductID),
	OrderID             INT                 FOREIGN KEY REFERENCES Orders(OrderID)
)

--    - Add at least 4 records for Categories, and add at least 10 records for Products, Orders, Customers, Addresses, and OrderItems

INSERT INTO Categories(CategoryName)
VALUES  ('Bass'),
        ('Acoustic'),
        ('Electric'),
        ('Electro-acoustic')

INSERT INTO Products(ProductCode, ProductName, [Description], ListPrice, DiscountPercent, DateAdded, CategoryID)
VALUES  ('GUITAR0001', 'Guitar 01', 'abcd', 1234, 0, '2020-03-04 05:30:20', 1),
        ('GUITAR0002', 'Guitar 02', 'abcd', 1635, 15, '2020-04-04 05:31:20', 1),
        ('GUITAR0003', 'Guitar 03', 'abcd', 2236, 12, '2021-05-04 05:32:20', 1),
        ('GUITAR0004', 'Guitar 04', 'abcd', 1237, 0, '2021-06-04 05:33:20', 1),
        ('GUITAR0005', 'Guitar 05', 'abcd', 1434, 12, '2021-07-04 05:34:20', 1),
        ('GUITAR0006', 'Guitar 06', 'abcd', 1734, 12, '2022-08-04 05:35:20', 1),
        ('GUITAR0007', 'Guitar 07', 'abcd', 1934, 17, '2022-09-04 05:36:20', 1),
        ('GUITAR0008', 'Guitar 08', 'abcd', 3234, 12, '2022-10-04 05:37:20', 1),
        ('GUITAR0009', 'Guitar 09', 'abcd', 8234, 0, '2022-11-04 05:38:20', 1),
        ('GUITAR0010', 'Guitar 10', 'abcd', 1214, 12, '2022-12-04 05:39:20', 1)

INSERT INTO Customers(EmailAddress, [PassWord], FirstName, LastName, ShippingAddressID, BillingAdressID) 
VALUES  ('email1@gmail.com', '12345678', 'Nam1', 'Dinh1', NULL, NULL),
        ('email2@gmail.com', '12345678', 'Nam2', 'Dinh2', NULL, NULL),
        ('email3@gmail.com', '12345678', 'Nam3', 'Dinh3', NULL, NULL),
        ('email4@gmail.com', '12345678', 'Nam4', 'Dinh4', NULL, NULL),
        ('email5@gmail.com', '12345678', 'Nam5', 'Dinh5', NULL, NULL),
        ('email6@gmail.com', '12345678', 'Nam6', 'Dinh6', NULL, NULL),
        ('email7@gmail.com', '12345678', 'Nam7', 'Dinh7', NULL, NULL),
        ('email8@gmail.com', '12345678', 'Nam8', 'Dinh8', NULL, NULL),
        ('email9@gmail.com', '12345678', 'Nam9', 'Minh9', NULL, NULL),
        ('email10@gmail.com', '12345678', 'Nam10', 'Dinh10', NULL, NULL),
        ('risk@raven.com', '123456789', 'Nam11', 'Zinh11', NULL, NULL)

INSERT INTO Addresses(Line1, Line2, City, [State], ZipCode, Phone, [Disabled], CustomerID)
VALUES  ('abcd', NULL, 'xyzt1', 'HN', '1111100000', '0123456789', NULL, 1),
        ('abcf', NULL, 'xyzt2', 'VP', '1111100002', '0123456788', NULL, 2),
        ('abcg', NULL, 'xyzt3', 'HP', '1111100003', '0123456789', NULL, 3),
        ('abcd', NULL, 'xyzt2', 'VP', '1111100002', '0123456788', NULL, 2),
        ('abci', NULL, 'xyzt5', 'HN', '1111100004', '0123456784', NULL, 4),
        ('abck', NULL, 'xyzt6', 'HN', '1111100005', '0123456785', NULL, 5),
        ('abcl', NULL, 'xyzt7', 'HN', '1111100006', '0123456786', NULL, 6),
        ('abcm', NULL, 'xyzt8', 'HN', '1111100007', '0123456787', NULL, 7),
        ('abcn', NULL, 'xyzt9', 'HN', '1111100008', '0123456889', NULL, 8),
        ('abco', NULL, 'xyz10', 'HN', '1111100009', '0123459789', NULL, 9)

INSERT INTO Orders(OrderDate, ShipAmount, TaxAmount, ShippingAddressID, BillingAdressID, CustomerID)
VALUES
        ('2022-04-04', 1234, 12, 1, 1, 1),
        ('2022-05-04', 1234, 12, 2, 2, 2),
        ('2022-06-04', 1234, 12, 2, 4, 2),
        ('2022-07-04', 1234, 12, 5, 2, 5),
        ('2022-08-04', 1234, 12, 7, 4, 6),
        ('2022-09-04', 1234, 12, 8, 5, 8),
        ('2022-10-04', 1234, 12, 4, 6, 2),
        ('2022-11-04', 1234, 12, 8, 7, 3),
        ('2022-11-04', 1234, 12, 2, 3, 9),
        ('2022-12-04', 1234, 12, 9, 9, 7)

INSERT INTO OrderItems(ItemPrice, DiscountAmount, Quantity, ProductID, OrderID)
VALUES  (123, 1, 2, 1, 1),
        (124, 1, 3, 2, 1),
        (125, 1, 1, 3, 2),
        (126, 1, 6, 1, 3),
        (127, 1, 3, 5, 4),
        (128, 1, 4, 7, 4),
        (129, 1, 7, 3, 5),
        (110, 1, 2, 8, 6),
        (111, 1, 5, 2, 7),
        (112, 1, 1, 1, 8)


-- b. Write a query to change the DiscountPercent column from 0% to 35% of the products that added at least 12 months ago.
UPDATE Products 
SET DiscountPercent = 35 
WHERE DiscountPercent = 0 AND DATEDIFF(MONTH, DateAdded, GETDATE()) >= 12

-- c.Write the query that modifies the Customers table. Change the password column to "secret" for the customer with an email address of "rick@raven.com".
UPDATE Customers 
SET [PassWord] = 'secret' 
WHERE EmailAddress = 'risk@raven.com'

-- d. Write a query that returns one column from the Customers table named Fullname that joins the LastName and FirstName columns. Sort the result set by last name in ascending sequence. 
--    Return only the contacts whose last name begins with letters from M to Z. Format this column with the last name, a comma, a space, and the first naem.
SELECT Cus.LastName + ', ' + Cus.FirstName AS 'FullName'  
FROM Customers AS Cus
WHERE Cus.LastName LIKE '[M-Z]%' ORDER BY Cus.LastName ASC

-- e. Wtire a query that returns the columns ProductName, ListPrice, DateAdded from the Products table. 
--    Return only the rows with a list price that's greater than 500 and less than 2000. Sort the result set in descending sequence by the DateAdded column.
SELECT ProductName, ListPrice, DateAdded
FROM Products 
WHERE ListPrice > 500 AND ListPrice < 2000 
ORDER BY DateAdded DESC

-- f. Write a query that returns the count of the number of orders for each customer and the sum of the TaxAmount columns in the Orders table
SELECT COUNT(*) AS 'Number of Order', SUM(Od.TaxAmount) AS 'Sum Of TaxAmount'
FROM Customers AS Cus JOIN Orders AS Od ON Cus.CustomerID = Od.CustomerID
GROUP BY Cus.CustomerID

-- Create s View called vORDER_ITEMS that returns the total number of products for each order and total money of order
CREATE VIEW [vORDER_ITEMS] AS
SELECT T1.[Number of products], (T1.[Total] + O.ShipAmount + O.TaxAmount) as 'Total of money'
FROM (
    SELECT Oi.OrderID, SUM(Oi.Quantity) AS 'Number of products', SUM(Oi.ItemPrice * Oi.Quantity - Oi.DiscountAmount) AS 'Total'
    FROM Orders AS Od JOIN OrderItems AS Oi ON Od.OrderID = Oi.OrderID
    GROUP BY Oi.OrderID
    ) AS T1 JOIN Orders AS O ON T1.OrderID = O.OrderID

