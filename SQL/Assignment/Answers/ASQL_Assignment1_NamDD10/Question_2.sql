-- Question 1. create tables and add >= 3 records into each table
create database Employee_Managerment
go
use Employee_Managerment
go 

create table Department(
    Department_Number       int                 primary key identity(1,1),
    Department_Name         nvarchar(50)        not null
)
go

create table Employee_Table(
    Employee_Number         int                 primary key identity(1,1),
    Employee_Name           nvarchar(50)        not null,
    Department_Number       int                 not null foreign key references Department(Department_Number)
)
go

create table Employee_Skill_Table(
    Employee_Number         int                 not null foreign key references Employee_Table(Employee_Number),
    Skill_Code              varchar(20)         not null,
    Date_Register           date                not null,
    primary key(Employee_Number,Skill_Code)
)
go

insert into Department(Department_Name) values
('Department 1'),
('Department 2'),
('Department 3'),
('Department 4'),
('Department 5')
go

insert into Employee_Table(Employee_Name,Department_Number) values
('Employee 1', 1),
('Employee 2', 2),
('Employee 3', 3),
('Employee 4', 4),
('Employee 5', 5),
('Employee 6', 1),
('Employee 7', 1),
('Employee 8', 2)
go

insert into Employee_Skill_Table(Employee_Number,Skill_Code,Date_Register) values
(1, 'Java',       '2022-12-11'),
(2, 'Java',       '2022-12-12'),
(2, 'JavaScript', '2022-12-12'),
(3, 'SQL',        '2022-12-13'),
(4, 'C#',         '2022-12-14'),
(5, 'Java',       '2022-12-15'),
(6, 'SQL',        '2022-12-16'),
(7, 'JavaScript', '2022-12-17')
go

-- Question 2. select employees have skill = 'Java'

-- a.Use JOIN selection
select e.Employee_Number, e.Employee_Name 
from Employee_Table e join Employee_Skill_Table es on e.Employee_Number = es.Employee_Number
where es.Skill_Code like 'Java'

-- b.Use sub query
select Employee_Number, Employee_Name
from Employee_Table
where Employee_Number in
(
    select Employee_Number 
    from Employee_Skill_Table
    where Skill_Code like 'Java'
)

-- Question 3. select the departments have >= 3 employees
select d.Department_Number, d.Department_Name, e.Employee_Number, e.Employee_Name
from Employee_Table e join Department d on e.Department_Number = d.Department_Number
where d.Department_Number in 
(
    select Department_Number 
    from Employee_Table
    group by Department_Number
    having count(Department_Number)>=3
)
order by d.Department_Number asc

-- Question 4. use sub-query to list out employees have multiple skills
select Employee_Number, Employee_Name 
from Employee_Table
where Employee_Number in
(
    select Employee_Number 
    from Employee_Skill_Table 
    group by Employee_Number
    having COUNT(Skill_Code) > 1
)

-- Question 5. create view show employees have multiple skill
create View Multipe_Skills_Employee_List as
select e.Employee_Number, e.Employee_Name, d.Department_Name
from Employee_Table e join Department d on e.Department_Number = d.Department_Number
where Employee_Number in
(
    select Employee_Number
    from Employee_Skill_Table 
    group by Employee_Number
    having COUNT(Skill_Code) > 1
)
