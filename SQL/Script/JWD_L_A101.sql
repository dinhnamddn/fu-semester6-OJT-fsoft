-- Create a new database called 'JWDLA101'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'JWDLA101'
)
CREATE DATABASE JWDLA101
GO

USE JWDLA101

-- Create a new table called '[employee]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[employee]', 'U') IS NOT NULL
DROP TABLE [dbo].[employee]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[employee]
(
    employee_id         int             PRIMARY KEY IDENTITY(1, 1),
    first_name          varchar(255)    NOT NULL,
    last_name           varchar(255)    NOT NULL,
    gender              int             NOT NULL,
    date_of_birth       date            NOT NULL,
    phone               varchar(20)     NOT NULL,
    [address]           varchar(255),
    department_name     varchar(255)    NOT NULL,
    remark              varchar(1000)
);
GO

-- Create a new table called '[account]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[account]', 'U') IS NOT NULL
DROP TABLE [dbo].[account]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[account]
(
    account_id          int             PRIMARY KEY IDENTITY(1, 1),
    account             varchar(255)    UNIQUE NOT NULL,
    email               varchar(255)    UNIQUE NOT NULL,
    [password]          varchar(255)    NOT NULL,
    [status]            int,
    employee_id         int             NOT NULL FOREIGN KEY REFERENCES employee(employee_id)
);
GO

INSERT INTO employee(first_name, last_name, gender, date_of_birth, phone, [address], department_name, remark) VALUES
    ('Do Dinh','A', 1, '2001-07-27', '0123456789', 'Ha Noi', 'Fsoft Academy', ''),
    ('Do Dinh','B', 1, '2001-07-27', '0123456789', 'Ha Noi', 'Fsoft Academy', ''),
    ('Do Dinh','C', 1, '2001-07-27', '0123456789', 'Ha Noi', 'FPT Software', ''),
    ('Do Dinh','D', 1, '2001-07-27', '0123456789', 'Ha Noi', 'FPT Software', ''),
    ('Do Dinh','E', 1, '2001-07-27', '0123456789', 'Ha Noi', 'FPT University', '')

INSERT INTO account(account, email, [password], [status], employee_id) VALUES 
    ('ADD', 'Add@gmail.com', '88888888', 1, 1),
    ('BDD', 'Bdd@gmail.com', '88888888', 1, 2),
    ('CDD', 'Cdd@gmail.com', '88888888', 1, 3),
    ('DDD', 'Ddd@gmail.com', '88888888', 1, 4),
    ('EDD', 'Edd@gmail.com', '88888888', 1, 5)
