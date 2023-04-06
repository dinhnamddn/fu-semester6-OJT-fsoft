CREATE DATABASE Assignment_201
USE Assignment_201

-- Question 2:

-- a.
CREATE TABLE Employee
(
	EmployeeID					INT						PRIMARY KEY,
	EmployeeLastName			VARCHAR(255)			NOT NULL,
	EmployeeFirstName			VARCHAR(255)			NOT NULL,
	EmployeeHireDate			DATE					NOT NULL,
	EmployeeStatus				VARCHAR(255)			NOT NULL,
	SupervisorID				INT						FOREIGN KEY REFERENCES Employee(EmployeeID),
	SocialSecurityNumber		INT						NOT NULL
	
)

CREATE TABLE Project
(
	ProjectID					INT						PRIMARY KEY,
	ProjectName					VARCHAR(255)			NOT NULL,
	ProjectStartDate			DATE					NOT NULL,
	ProjectDescription			VARCHAR(255)			NOT NULL,
	ProjectDetail				VARCHAR(255)			NOT NULL,
	ProjectCompleteOn			DATE,
	ProjectManagerID			INT						FOREIGN KEY REFERENCES Employee(EmployeeID)
)

CREATE TABLE Project_Modules
(
	ModuleID					INT						PRIMARY KEY,
	ProjectID					INT						FOREIGN KEY REFERENCES Project(ProjectID) NOT NULL,
	EmployeeID					INT						FOREIGN KEY REFERENCES Employee(EmployeeID),
	ProjectModulesDate			DATE					NOT NULL,
	ProjectModulesCompledOn			DATE,
	ProjectModulesDescription	VARCHAR(255)			NOT NULL
)

CREATE TABLE Work_Done
(
	WorkDoneID					INT						PRIMARY KEY,
	ModuleID					INT						FOREIGN KEY REFERENCES	Project_Modules(ModuleID) NOT NULL,
	WorkDoneDate				DATE,
	WorkDoneDescription			VARCHAR(255)			NOT NULL,
	WorkDoneStatus				VARCHAR(255)			NOT NULL,
    EmployeeID					INT						FOREIGN KEY REFERENCES	Employee(EmployeeID)
)

INSERT INTO Employee(EmployeeID, EmployeeLastName, EmployeeFirstName, EmployeeHireDate, EmployeeStatus, SupervisorID, SocialSecurityNumber) 
VALUES 	(1, 'Nam1', 'Dinh1', '2022-03-03', 'ok', null, 123),
	 	(2, 'Nam2', 'Dinh2', '2022-03-04', 'ok', 1,    124),
	 	(3, 'Nam3', 'Dinh3', '2022-03-05', 'ok', 2,    125),
	 	(4, 'Nam4', 'Dinh4', '2022-03-06', 'ok', 3,    126),
	 	(5, 'Nam5', 'Dinh5', '2022-03-07', 'ok', 4,    127)

INSERT INTO Project(ProjectID, ProjectName, ProjectStartDate, ProjectDescription, ProjectDetail, ProjectCompleteOn, ProjectManagerID)
VALUES 	(1, 'p1', '2022-01-01', 'abcd', 'xyzt', '2022-05-06', 1),
		(2, 'p2', '2022-02-01', 'abcd', 'xyzt', '2022-06-06', 2),
		(3, 'p3', '2022-03-01', 'abcd', 'xyzt', '2022-07-06', 3),
		(4, 'p4', '2022-04-01', 'abcd', 'xyzt', '2022-08-06', 4),
		(5, 'p5', '2022-05-01', 'abcd', 'xyzt', null, 		  5)

INSERT INTO Project_Modules(ModuleID, ProjectID, EmployeeID, ProjectModulesDate, ProjectModulesCompledOn, ProjectModulesDescription)
VALUES 	(1, 1, 2, '2022-03-01', '2022-02-27', 'abcd'),
		(2, 1, 3, '2022-03-02', '2022-03-01', 'abcs'),
		(3, 2, 4, '2022-06-01', '2022-06-01', 'abce'),
		(4, 3, 1, '2022-07-01', '2022-06-29', 'abct'),
		(5, 3, 5, '2022-07-05', '2022-07-02', 'abcu'),
		(6, 4, 2, '2022-07-22', '2022-07-20', 'abch'),
		(7, 5, 3, '2022-09-01', '2022-08-29', 'abcv')

INSERT INTO Work_Done(WorkDoneID, ModuleID, WorkDoneDate, WorkDoneDescription, WorkDoneStatus, EmployeeID)
VALUES	(1, 1, '2022-03-03', 'xyzt', 'ok', 2),
		(2, 1, '2022-03-04', 'xyzt', 'ok', 2),
		(3, 2, '2022-04-03', 'xyzt', 'ok', 4),
		(4, 3, '2022-05-03', 'xyzt', 'ok', 1),
		(5, 4, '2022-06-03', 'xyzt', 'ok', 2),
		(6, 5, '2022-07-03', 'xyzt', 'ok', 3)

-- b.
SELECT * FROM Project_Modules WHERE EmployeeID = 3

-- c. 
SELECT P.* 
FROM Project AS P JOIN Project_Modules AS PM ON P.ProjectID = PM.ProjectID 
WHERE ProjectCompleteOn IS NULL AND (P.ProjectManagerID IS NULL OR PM.EmployeeID IS NULL)

-- d. 
SELECT WD.* 
FROM Work_Done AS WD JOIN Project_Modules AS PM ON WD.ModuleID = PM.ModuleID 
WHERE WD.EmployeeID = 3 AND PM.EmployeeID !=3

-- e.
BEGIN
	DELETE Work_Done
	FROM (Project AS P JOIN Project_Modules AS PM ON P.ProjectID = PM.ProjectID) JOIN Work_Done AS WD ON PM.ModuleID = WD.ModuleID 
	WHERE DATEDIFF(MONTH, P.ProjectCompleteOn, GETDATE()) > 3

	DELETE Project_Modules
	FROM Project AS P JOIN Project_Modules AS PM ON P.ProjectID = PM.ProjectID
	WHERE DATEDIFF(MONTH, P.ProjectCompleteOn, GETDATE()) > 3

	DELETE Project
	FROM Project
	WHERE DATEDIFF(MONTH, ProjectCompleteOn, GETDATE()) > 3
END

-- f.
SELECT PM.*, (E.EmployeeLastName + ' ' + E.EmployeeFirstName) AS EmployeeName, WD.WorkDoneDate, WD.WorkDoneDescription, WorkDoneStatus
FROM (Project_Modules AS PM JOIN Employee AS E ON PM.EmployeeID = E.EmployeeID) JOIN Work_Done AS WD ON PM.ModuleID = WD.ModuleID
WHERE PM.ProjectModulesCompledOn IS NULL

-- g.
SELECT T1.EmployeeID, T1.Supervisor_FirstName, T1.Supervisor_LastName, T2.ProjectName
FROM
	(SELECT E.EmployeeID, S.EmployeeFirstName AS Supervisor_FirstName, S.EmployeeLastName AS Supervisor_LastName, S.EmployeeID AS S_ID
	FROM Employee E JOIN Employee S ON E.EmployeeID = S.SupervisorID) AS T1
	JOIN 
	(SELECT P.ProjectManagerID, P.ProjectName, PM.EmployeeID AS PM_EID
	FROM Project AS P JOIN Project_Modules AS PM ON P.ProjectID = PM.ProjectID) AS T2
	ON T1.EmployeeID = T2.ProjectManagerID
WHERE (T1.EmployeeID = T2.ProjectManagerID OR T1.EmployeeID = T2.PM_EID) AND (T1.S_ID = T2.ProjectManagerID OR T1.S_ID = T2.PM_EID) AND T1.EmployeeID = 2