CREATE DATABASE Assignment_2
USE Assignment_2

-- Question 1:

CREATE TABLE EMPLOYEE(
	EmpNo           int                 PRIMARY KEY NOT NULL,
	EmpName         varchar(255),
	BirthDay        date,
	DeptNo          int,
	MgrNo           int                 NOT NULL,
	StartDate       date,
	Salary          MONEY,
	[Level]         tinyint             CHECK ([Level] >= 1 AND [Level] <= 7),
	[Status]        int                 CHECK ([Status] = 0 OR [Status] = 1 OR [Status] = 2),
	Note            varchar(max)
)

CREATE TABLE SKILL(
	SkillNo         int                 NOT NULL IDENTITY(1,1) PRIMARY KEY,
	SkillName       varchar(255),
	Note            varchar(max)
)

CREATE TABLE DEPARTMENT(
	DeptNo          int                 NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DeptName        nvarchar(255),
	Note            varchar(max)
) 

CREATE TABLE EMP_SKILL(
	SkillNo         int                 FOREIGN KEY REFERENCES SKILL(SkillNo),
	EmpNo           int                 FOREIGN KEY REFERENCES EMPLOYEE(EmpNo),
	SkillLevel      int,
	RegDate         date,
	[Description]   varchar(max),
	PRIMARY KEY( SkillNo, EmpNo),
)

--=========================================================================================================
-- Question 2:

-- a:
ALTER TABLE EMPLOYEE ADD Email nvarchar(255) UNIQUE

-- b:
ALTER TABLE EMPLOYEE ADD CONSTRAINT df_MgrNo DEFAULT '0' FOR MgrNo

ALTER TABLE EMPLOYEE ADD CONSTRAINT df_Status DEFAULT '0' FOR [Status]


--=========================================================================================================
--Question 3:

--a
ALTER TABLE EMPLOYEE ADD CONSTRAINT fk_EMPLOYEE FOREIGN KEY (DeptNo) REFERENCES DEPARTMENT(DeptNo)

--b
ALTER TABLE EMP_SKILL DROP COLUMN [Description]

--=========================================================================================================
--Question 4:

--a
INSERT INTO DEPARTMENT(DeptName, Note)
VALUES  ( 'FGC', 'abcd'),
		( 'FA', 'xyzt'),
		( 'DPS', 'qwerty'),
		( 'EC', 'asdfg'),
		( 'FHM', 'blabla')

INSERT INTO EMPLOYEE (EmpNo, EmpName, BirthDay, DeptNo, MgrNo, StartDate, Salary, [Level], [Status], Note, Email)
VALUES  (1, 'Dinh Nam', '2001-07-27', 2, 3, '2022-04-01', '1234567', 1, 1, 'ok', 'dinhnam@gmail.com'),
		(2, 'Loi Nha', '2008-03-21', 3, 2, '2022-05-01', '1234567', 3, 0, 'ok', 'loinha@gmail.com'),
		(3, 'Nha Vuong', '2000-10-19', 4, 1, '2022-06-01', '1234567', 4, 1,'ok', 'nhavuong3@gmail.com'),
		(4, 'Trieu Ha', '2001-12-05', 1, 4, '2022-07-01', '1234567', 2, 2, 'ok', 'trieuha@gmail.com'),
		(5, 'Giai Tue', '1999-08-12', 5, 5, '2022-08-01', '1234567', 5, 2, 'ok', 'giaitue@gmail.com')

INSERT INTO SKILL(SkillName, Note)
VALUES  ('CSS','Good'),
		( 'JavaScript', 'verry good'),
		( 'C#', 'Bad'),
		('C++', 'Nomal'),
		( 'HTML', 'exellent')
		
INSERT INTO EMP_SKILL(SkillLevel, RegDate,SkillNo, EmpNo)
VALUES  (1, '2022-04-01', 1, 1),
		(2, '2022-05-01', 2, 2),
		(3, '2022-06-01', 3, 3),
		(4, '2022-07-01', 4, 4),
		(5, '2022-08-01', 5, 5)
		
--b
CREATE VIEW EMPLOYEE_TRACKING
AS
SELECT EmpNo, EmpName, [Level]
FROM Employee
WHERE [Level] >=3 AND [Level]<=5