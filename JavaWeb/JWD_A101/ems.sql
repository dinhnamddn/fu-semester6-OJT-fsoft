USE master
DROP DATABASE IF EXISTS ems
GO

CREATE DATABASE ems
GO

USE ems
GO

CREATE TABLE Employee (
    employee_id     INT             IDENTITY(1,1)       PRIMARY KEY ,
    first_name      VARCHAR(255)                        NOT NULL    ,
    last_name       VARCHAR(255)                        NOT NULL    ,
    gender          INT                                 NOT NULL    ,
    date_of_birth   DATE                                NOT NULL    ,
    phone           VARCHAR(20)                         NOT NULL    ,
    address         VARCHAR(255)                                    ,
    department_name VARCHAR(255)                        NOT NULL    ,
    remark          VARCHAR(1000)
)
GO

CREATE TABLE Account (
    account_id      INT             IDENTITY(1,1)       PRIMARY KEY ,
    account         VARCHAR(255)    UNIQUE              NOT NULL    ,
    email           VARCHAR(255)    UNIQUE              NOT NULL    ,
    password        VARCHAR(255)						NOT NULL    ,
    status          INT                                             ,
    employee_id     INT             NOT NULL            REFERENCES Employee(employee_id)
)
GO

INSERT INTO Employee (first_name, last_name, gender, date_of_birth, phone, address, department_name)
VALUES
('Nguyen', 'Trong Tuan', 1, '2001-03-11', '0925480305', 'Hai Phong', 'Fsoft Academy'),
('Nguyen', 'Hai Linh', 0, '2001-08-02', '0987654321', 'Hai Duong', 'Fsoft Academy'),
('Trinh', 'Duc Anh', 1, '2001-05-05', '0987123456', 'Hai Phong', 'Fsoft Academy'),
('Nguyen', 'Huu Trinh', 1, '2001-02-15', '0987162534', 'Bac Ninh', 'Fsoft Academy'),
('Nguyen', 'Trong Tuan', 1, '2001-03-11', '0925480305', 'Hai Phong', 'Fsoft Academy'),
('Nguyen', 'Minh Duc', 0, '2001-08-02', '0987654321', 'Hai Duong', 'Fsoft Academy'),
('Trinh', 'Van An', 1, '2001-05-05', '0987123456', 'Hai Phong', 'Fsoft Academy'),
('Nguyen', 'Huu Huy', 1, '2001-02-15', '0987162534', 'Bac Ninh', 'Fsoft Academy'),
('Dang', 'Duc Phuc', 0, '2001-09-01', '0987142536', 'Ha Noi', 'Fsoft Academy'),
('Cao', 'Van Tai', 1, '2001-09-01', '0987142536', 'Nghe An', 'Fsoft Academy'),
('Tran', 'Hong Ngoc', 0, '2001-02-15', '0987162534', 'Da Nang', 'Fsoft Academy'),
('Vu', 'Dinh Van', 0, '2001-09-01', '0987142536', 'Ha Noi', 'Fsoft Academy'),
('Vu', 'Van Nam', 1, '2001-09-01', '0987142536', 'Ha Noi', 'Fsoft Academy'),
('Dinh', 'Duy Anh', 1, '2001-09-01', '0987142536', 'Hung Yen', 'Fsoft Academy');

GO

INSERT INTO Account (account, email, password, status, employee_id)
VALUES
('tuannt', 'tuannt@fsoft.com.vn', '123456', 1, 1),
('linhnh', 'linhnh@fsoft.com.vn', '123456', 1, 2),
('anhtd', 'anhtd@fsoft.com.vn', '123456', 1, 3),
('trinhnh', 'trinhnh@fsoft.com.vn', '123456', 1, 4),
('thodd', 'thodd@fsoft.com.vn', '123456', 1, 5),
('tuannt1', 'tuannt1@fsoft.com.vn', '123456', 1, 6),
('linhnh1', 'linhnh1@fsoft.com.vn', '123456', 1, 7),
('anhtd1', 'anhtd1@fsoft.com.vn', '123456', 1, 8),
('trinhnh1', 'trinhnh1@fsoft.com.vn', '123456', 1, 9),
('thodd1', 'thodd1@fsoft.com.vn', '123456', 1, 10),
('anhtd2', 'anhtd12@fsoft.com.vn', '123456', 1, 11),
('tuannt2', 'tuannt2@fsoft.com.vn', '123456', 1, 12),
('trinhnh2', 'trinhnh12@fsoft.com.vn', '123456', 1, 13),
('thodd2', 'thodd12@fsoft.com.vn', '123456', 1, 14);

