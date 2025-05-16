CREATE TABLE course
(
	CourseID INT,
	CourseName VARCHAR(20) NOT NULL,
	CourseStartDate DATE,
	CourseEndDate DATE,
	CourseDescription VARCHAR(30)

	CONSTRAINT PK_Course PRIMARY KEY (CourseID)
)

CREATE TABLE Exam
(
	ExamID INT,
	ExamStartTime TIME NOT NULL,
	ExamEndTime TIME NOT NULL,
	ExamType VARCHAR(20) NOT NULL,
	ExamDate DATE NOT NULL

	CONSTRAINT PK_Exam PRIMARY KEY (ExamID),
	CONSTRAINT CK_ExamType CHECK (ExamType in ('Corrective','Normal'))
)

CREATE TABLE ExamQuestion
(
	ExamID INT,
	QuestID INT,
	Question VARCHAR(MAX) NOT NULL,

	CONSTRAINT FK_ExamQuestion_Exam FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
	CONSTRAINT PK_ExamQuestion PRIMARY KEY (ExamID, QuestID)
)


CREATE TABLE TrackCourse
(
		CourseID INT,
		TrackID INT,

		CONSTRAINT FK_TrackCourse_Course FOREIGN KEY (CourseID) REFERENCES course(CourseID),
		CONSTRAINT FK_TrackCourse_Track FOREIGN KEY (TrackID) REFERENCES Track(TrackID),
		CONSTRAINT PK_TrackCourse PRIMARY KEY (CourseID,TrackID)
)

CREATE TABLE Student
(
	StudentID CHAR(14),
	StudentFname VARCHAR(20) NOT NULL,
	StudentLname VARCHAR(20) NOT NULL,
	StudentDOB DATE NOT NULL,
	StudentEmail VARCHAR(70) NOT NULL,
	StudentPhone CHAR(11) NOT NULL,
	StudentAddress VARCHAR(20) NOT NULL,
	TrackID INT,

	CONSTRAINT PK_Student PRIMARY KEY(StudentID),
	CONSTRAINT CK_StudentID CHECK(LEN(StudentID) = 14),
	CONSTRAINT CK_StudentPhone CHECK(LEN(StudentPhone) = 11 AND (LEFT(StudentPhone,3) IN ('010','011','012','015') )),
	CONSTRAINT CK_StudentEmail CHECK(StudentEmail LIKE '_%@_%._%'),
	CONSTRAINT FK_Stuedent_Track FOREIGN KEY(TrackID) REFERENCES Track(TrackID)
	ON DELETE SET NULL
)




