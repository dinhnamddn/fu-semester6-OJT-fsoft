CREATE DATABASE SMS
USE SMS

-- Create a new table called '[Customer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Customer]', 'U') IS NOT NULL
DROP TABLE [dbo].[Customer]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Customer]
(
    [customer_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [customer_name] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Employee]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Employee]', 'U') IS NOT NULL
DROP TABLE [dbo].[Employee]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Employee]
(
    [employee_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [employee_name] NVARCHAR(50) NOT NULL,
    [salary] MONEY NOT NULL,
    [supervisor_id] INT NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Product]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Product]', 'U') IS NOT NULL
DROP TABLE [dbo].[Product]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Product]
(
    [product_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [product_name] NVARCHAR(50) NOT NULL,
    [list_price] MONEY NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[Orders]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Orders]', 'U') IS NOT NULL
DROP TABLE [dbo].[Orders]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Orders]
(
    [order_id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [order_date] DATE NOT NULL,
    [customer_id] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Customer],
    [employee_id] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Employee],
    [total] MONEY NOT NULL
    -- Specify more columns here
);
GO

-- Create a new table called '[LineItem]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[LineItem]', 'U') IS NOT NULL
DROP TABLE [dbo].[LineItem]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[LineItem]
(
    [order_id] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Orders],
    [product_id] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Product],
    [quantity] INT NOT NULL,
    [price] MONEY NOT NULL,
    PRIMARY KEY (order_id, product_id)
    -- Specify more columns here
);
GO

select cus.customer_name, od.* from Customer AS cus JOIN Orders AS od ON cus.customer_id = od.customer_id

INSERT into Employee 
VALUES  (1, 'anh', 123, 2),
        (2, 'em', 1234, 1)

INSERT into Product
VALUES  (1, 'tao', 123),
        (2, 'le', 124)

SELECT * from Customer
SELECT * FROM Orders

SELECT TB.customer_name, TA.supervisor_name, TB.order_id, TB.order_date, TB.customer_id, TB.employee_id, TB.total FROM (
SELECT a.employee_id, b.employee_name AS supervisor_name FROM Employee AS a JOIN Employee AS b ON a.employee_id = b.supervisor_id) AS TA
JOIN (SELECT cus.customer_name, od.* FROM Customer AS cus JOIN Orders AS od ON cus.customer_id = od.customer_id) AS TB
ON TA.employee_id = TB.employee_id
WHERE customer_id = 1