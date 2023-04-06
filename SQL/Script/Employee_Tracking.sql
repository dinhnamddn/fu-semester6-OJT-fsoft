-- Create a new database called 'Employee_Tracking'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Employee_Tracking'
)
CREATE DATABASE Employee_Tracking
GO

USE Employee_Tracking

-- Create a new table called '[Department]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Department]', 'U') IS NOT NULL
DROP TABLE [dbo].[Department]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Department]
(
    [dept_no] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [dept_name] VARCHAR(50) NOT NULL,
    [description] VARCHAR(100) NOT NULL
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
    [emp_no] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [birth_date] DATE NOT NULL,
    [first_name] VARCHAR(50) NOT NULL CHECK(LEN(first_name) <= 50),
    [last_name] VARCHAR(50) NOT NULL CHECK(LEN(last_name) <= 50),
    [gender] CHARACTER(1) NOT NULL,
    [hire_date] DATE NOT NULL
);
GO

-- Create a new table called '[Working_History]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Working_History]', 'U') IS NOT NULL
DROP TABLE [dbo].[Working_History]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Working_History]
(
    [dept_no] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Department],
    [emp_no] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Employee],
    [from_date] DATE NOT NULL,
    [to_date] DATE NOT NULL
);
GO

ALTER TABLE Working_History ADD CONSTRAINT ck_date CHECK ([to_date] > [from_date])

select * from Department

INSERT INTO [Employee]([birth_date],[first_name],[last_name],[gender],[hire_date]) 
VALUES  ('2022-12-12', 'dsfasdf', 'csds', 'F', '2020-12-12')

insert into Employee (birth_date, first_name, last_name, gender, hire_date)
values ('2022-12-12', 'dsfasdf', 'csds', 'F', '2020-12-12')

select * from Working_History