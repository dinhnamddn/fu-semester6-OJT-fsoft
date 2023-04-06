CREATE DATABASE InventorySystem
GO

USE InventorySystem
GO

CREATE TABLE [dbo].[Orders]
(
    [order_id] INT PRIMARY KEY IDENTITY(1,1),
    [customer_id] VARCHAR(5) NOT NULL,
    [order_date] DATETIME NOT NULL,
    [required_date] DATETIME NOT NULL,
    [shipped_date] DATETIME NOT NULL,
    [ship_address] VARCHAR(100)
);
GO

CREATE TABLE [dbo].[OrderDetails]
(
    [order_id] INT NOT NULL FOREIGN KEY REFERENCES Orders(order_id),
    [product_id] VARCHAR(10) NOT NULL,
    [unit_price] MONEY NOT NULL,
    [quantity] TINYINT,
    [discount] FLOAT,
    PRIMARY KEY (order_id, product_id)
);
GO

-- INSERT INTO Orders VALUES
--     ('cus01', '2022-12-12 12:12:12', '2022-12-12 12:12:12', '2022-12-12 12:12:12', 'hanoi')

-- SELECT * FROM Orders 
-- SELECT * FROM Orders WHERE order_date = '2022-12-15'

-- select GETDATE()
-- SELECT * from OrderDetails

-- select sum(unit_price * quantity) as 'total' from OrderDetails where order_id = '1'