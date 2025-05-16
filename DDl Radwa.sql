CREATE TABLE course
(
	CourseID INT,
	CourseName VARCHAR(20) NOT NULL,
	CourseStartDate DATE,
	CourseEndDate DATE,
	CourseDescription VARCHAR(30)

	CONSTRAINT PK_Course PRIMARY KEY (CourseID)
)
-------------1-------------

CREATE TABLE TrainingManager
( 
     ManagerID INT,
	 ManagerFname  VARCHAR(20) NOT NULL,
	 ManagerLname VARCHAR(20) NOT NULL,
	 ManagerEmail VARCHAR(255) NOT NULL ,
	 ManagerPhone CHAR(11)  NOT NULL

	 CONSTRAINT PK_Manager PRIMARY KEY (ManagerID)
)
----------------2--------------
CREATE TABLE Track
(
  TrackID INT ,
  TrackName VARCHAR(20) NOT NULL,
  DeptID INT

CONSTRAINT PK_Track PRIMARY KEY (TrackID ),
CONSTRAINT FK_DeptTrack FOREIGN KEY (DeptID) REFERENCES Department (DeptID)
)
-----------3-----------
CREATE TABLE ExamStudentCourse 
(
   ExamID INT,
   StudentID INT,
   CourseID INT ,
   Grade FLOAT

CONSTRAINT FK_Exam FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
CONSTRAINT FK_Student FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
CONSTRAINT FK_Course FOREIGN KEY(CourseID) REFERENCES Course(CourseID),
CONSTRAINT PK_ExamStudent PRIMARY KEY (ExamID ,StudentID )
)






---------------4--------------
CREATE TABLE McqQuestion (
    McqID INT,
    Question NVARCHAR(500) NOT NULL,
    CorrectAnswer NVARCHAR(500) NOT NULL,
    Question_ID INT,
    
CONSTRAINT PK_Mcq PRIMARY KEY (McqID),
CONSTRAINT FK_Question FOREIGN KEY (Question_ID) REFERENCES Question_Pool (Question_ID)
)

---------------5---------------------

CREATE TABLE McqAnswer 
( 
  McqID INT,
  AnswerID INT,
  Answer1 VARCHAR(50) NOT NULL,
  Answer2 VARCHAR(50) NOT NULL,
  Answer3 VARCHAR(50) NOT NULL,
  Answer4 VARCHAR(50) NOT NULL

CONSTRAINT PK_McqAnswer PRIMARY KEY (AnswerID,  McqID),
CONSTRAINT FK_Mcq FOREIGN KEY ( McqID) REFERENCES McqQuestion (McqID)
)




 