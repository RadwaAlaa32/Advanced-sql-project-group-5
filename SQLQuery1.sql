CREATE TABLE Department
(
DeptID  INT IDENTITY(1, 1) NOT NULL,
DeptName varchar(50) NOT NULL
CONSTRAINT Dept_PK PRIMARY KEY (DeptID) 
)
---------------------------------------
CREATE TABLE Instructor
(
InstructorID  INT IDENTITY(1, 1) NOT NULL,
InstructorFName varchar(50) NOT NULL ,
InstructorLName varchar(50) NOT NULL,
InstructorEmail varchar(100) NOT NULL  unique ,
HairDate date  default getdate(),
InstructorPhone char(11) NOT NULL,
CONSTRAINT check_Email check(InstructorEmail like '(%gmail.com' or InstructorEmail like '(%yahoo.com' )
,
CONSTRAINT Instructor_PK PRIMARY KEY (InstructorID) 
)
---------------------------------------------------------
CREATE  TABLE TextQuestion
(
TextID  INT IDENTITY(1, 1) NOT NULL,
Question nvarchar(max) NOT NULL,
CorrectAnswer nvarchar(max) NULL ,
Question_ID INT ,
CONSTRAINT TextQuestion_fK foreign KEY (Question_ID) REFERENCES Question_pool( Question_ID),
CONSTRAINT TextQuestion_PK PRIMARY KEY (TextID) 
)

ALTER TABLE TextQuestion
DROP COLUMN Question_ID 

ALTER TABLE TextQuestion
DROP CONSTRAINT TextQuestion_fK

ALTER TABLE TextQuestion
ADD Question_ID INT NOT NULL 

ALTER TABLE TextQuestion
ADD CONSTRAINT TextQuestion_fK foreign KEY (Question_ID) REFERENCES Question_pool( Question_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
----------------------------------------------------------------------------------------------
CREATE TABLE ExamStudentAnswer
(
ExamID  INT not null,
StudentID  char(14) not null ,
StuAnsID INT not null,
Grade float(7) not null ,
CONSTRAINT ExamStudentAnswer_fK1 foreign KEY (ExamID) REFERENCES Exam(ExamID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT ExamStudentAnswer_fK2 foreign KEY (StudentID) REFERENCES Student(StudentID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT ExamStudentAnswer_fK3 foreign KEY (StuAnsID) REFERENCES studentanswer(stuans)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT ExamStudentAnswer_PK PRIMARY KEY (ExamID,StudentID) 
)
------------------------------------------------------------------------
CREATE TABLE DepartmentTrack
(
DeptID  INT not null,
TrackID  INT not null,
CONSTRAINT DepartmentTrack_fK1 foreign KEY (DeptID) REFERENCES Department(DeptID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT DepartmentTrack_fK2 foreign KEY (TrackID) REFERENCES Track (TrackID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT  DepartmentTrack_PK PRIMARY KEY (DeptID,TrackID)
)
-----------------------------------------------------------------------------