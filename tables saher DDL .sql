CREATE TABLE branch (
    Branch_ID int identity(1,1),
    Branch_Name VARCHAR(100),
    Branch_Address VARCHAR(255),
    Branch_Phone char(11) not null,
    CONSTRAINT pk_branch PRIMARY KEY (Branch_ID),
CONSTRAINT chk_phone_length CHECK (LEN(Branch_Phone) = 11)
);

ALTER TABLE branch
ADD ManagerID INT;
ALTER TABLE branch
ADD CONSTRAINT FK_trainingMangerbranch_TrainingManager 
FOREIGN KEY (ManagerID) REFERENCES TrainingManager(ManagerID)
ON DELETE CASCADE
ON UPDATE CASCADE;
----------------------------------------------------------------------------
CREATE TABLE Question_pool (
    Question_ID int identity(1,1) primary key,
    Question_Degree int not null)
------------------------------------------------------------------------------
CREATE TABLE BranchIntakeTrack (
    Branch_ID INT NOT NULL,
    intake_id INT NOT NULL,
    TrackID INT NOT NULL,
    -- Primary Key Constraint
    CONSTRAINT PK_BranchIntakeTrack PRIMARY KEY (Branch_ID, intake_id),
    -- Foreign Key Constraints
    CONSTRAINT FK_BranchIntakeTrack_Branch FOREIGN KEY (Branch_ID)REFERENCES branch(Branch_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_BranchIntakeTrack_Intake FOREIGN KEY (intake_id) REFERENCES intake(intake_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_BranchIntakeTrack_Track FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
       ON DELETE CASCADE
        ON UPDATE CASCADE
);
-------------------------------------------------------------------------------
CREATE TABLE CourseInstructor (
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    -- Primary Key Constraint
    CONSTRAINT PK_CourseInstructor PRIMARY KEY (CourseID, InstructorID),
    -- Foreign Key Constraints
    CONSTRAINT FK_CourseInstructor_Course FOREIGN KEY (CourseID)REFERENCES Course(CourseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_CourseInstructor_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-----------------------------------------------------------------------------------------------
CREATE TABLE BranchIntakeTrack (
    Branch_ID INT NOT NULL,
    intake_id INT NOT NULL,
    TrackID INT NOT NULL,
    -- Primary Key Constraint
    CONSTRAINT PK_BranchIntakeTrack PRIMARY KEY (Branch_ID, intake_id),
    -- Foreign Key Constraints
    CONSTRAINT FK_BranchIntakeTrack_Branch FOREIGN KEY (Branch_ID)REFERENCES branch(Branch_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_BranchIntakeTrack_Intake FOREIGN KEY (intake_id) REFERENCES intake(intake_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_BranchIntakeTrack_Track FOREIGN KEY (TrackID) REFERENCES Track(TrackID)
       ON DELETE CASCADE
        ON UPDATE CASCADE
);
-----------------------------------------------------------------------------
CREATE TABLE ExamInstructorQuestion (
    ExamID INT NOT NULL,
    InstructorID INT NOT NULL,
    QuestionID INT NOT NULL,
    -- Primary Key Constraint
    CONSTRAINT PK_ExamInstructorQuestion PRIMARY KEY (ExamID, InstructorID),
    -- Foreign Key Constraints
    CONSTRAINT FK_ExamInstructorQuestion_Exam FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_ExamInstructorQuestion_Instructor FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,    
    CONSTRAINT FK_ExamInstructorQuestion_Question FOREIGN KEY (QuestionID) REFERENCES Question_pool(Question_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-------------------------------------------------------------------------------------------