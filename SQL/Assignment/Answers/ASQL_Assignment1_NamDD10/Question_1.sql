-- Question 1.1 Create table and add >=3 records into each table

Create database Order_Management
go

use Order_Management
go

IF OBJECT_ID('[dbo].[San_Pham]', 'U') IS NOT NULL
DROP TABLE [dbo].[San_Pham]
GO
CREATE TABLE [dbo].[San_Pham]
(
    [Ma_SP]         INT                 PRIMARY KEY IDENTITY(1,1),
    [Ten_SP]        NVARCHAR(50)        NOT NULL,
    [Don_Gia]       MONEY               NOT NULL
);
GO

IF OBJECT_ID('[dbo].[Khach_Hang]', 'U') IS NOT NULL
DROP TABLE [dbo].[Khach_Hang]
GO
CREATE TABLE [dbo].[Khach_Hang]
(
    [Ma_KH]         INT                 PRIMARY KEY IDENTITY(1,1),
    [Ten_KH]        NVARCHAR(50)        NOT NULL,
    [Phone_No]      VARCHAR(10)         NOT NULL,
    [Ghi_Chu]       VARCHAR(max) 
);
GO

IF OBJECT_ID('[dbo].[Don_Hang]', 'U') IS NOT NULL
DROP TABLE [dbo].[Don_Hang]
GO
CREATE TABLE [dbo].[Don_Hang]
(
    [Ma_DH]         INT                 PRIMARY KEY IDENTITY(1,1),
    [Ngay_DH]       DATE                NOT NULL,
    [Ma_SP]         INT                 NOT NULL FOREIGN KEY REFERENCES San_Pham(Ma_SP),
    [So_Luong]      INT                 NOT NULL,
    [Ma_KH]         INT                 NOT NULL FOREIGN KEY REFERENCES Khach_Hang(Ma_KH)
);
GO

insert into San_Pham(Ten_SP, Don_Gia) values 
('San pham 1', 2000),
('San pham 2', 5000),
('San pham 3', 3000),
('San pham 4', 1000),
('San pham 5', 1500)
go

insert into Khach_Hang(Ten_KH, Phone_No, Ghi_Chu) values 
('Khach hang 1', '0123456781','Day la ghi chu'),
('Khach hang 2', '0123456782','Day la ghi chu'),
('Khach hang 3', '0123456783','Day la ghi chu'),
('Khach hang 4', '0123456784','Day la ghi chu'),
('Khach hang 5', '0123456785','Day la ghi chu')
go

insert into Don_Hang(Ngay_DH, Ma_SP, So_Luong, Ma_KH) values 
('2022-12-02', 1, 1, 1),
('2022-12-03', 2, 2, 2),
('2022-12-04', 3, 3, 3),
('2022-12-05', 4, 4, 4),
('2022-12-06', 5, 5, 5)
go

-- Question 1.2. Create VIEW which has same number of lines as the Don_Hang

Create View Order_list as 
select k.Ten_KH, d.Ngay_DH, s.Ten_SP, d.So_Luong, d.So_Luong * s.Don_Gia as 'Thanh_Tien'
from Don_Hang d join San_Pham s on d.Ma_SP = s.Ma_SP join Khach_Hang k on d.Ma_KH = k.Ma_KH