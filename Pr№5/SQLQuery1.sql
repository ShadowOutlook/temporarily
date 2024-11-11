USE IAb221_SabirovU;

CREATE TABLE [Group] (
	GroupId INT IDENTITY(1,1) PRIMARY KEY,
	GroupName VARCHAR(50) NOT NULL
);

CREATE TABLE Discipline (
	DisciplineId INT IDENTITY(1,1) PRIMARY KEY,
	DisciplineName VARCHAR(100) NOT NULL,
	CountOfHours INT NOT NULL

);

CREATE TABLE Teacher (
	TeacherId INT IDENTITY(1,1) PRIMARY KEY,
	TeacherSurname VARCHAR(50) NOT NULL,
	TeacherName VARCHAR(50) NOT NULL,
	TeacherPatronymic VARCHAR(50)
);

CREATE TABLE Student (
	StudentId INT IDENTITY(1,1) PRIMARY KEY,
	StudentSurname VARCHAR(50) NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	StudentPatronymic VARCHAR(50),
	DateOfBirth DATE NOT NULL,
	HomeAdress VARCHAR(100),
	Email VARCHAR(100) DEFAULT 'student@kuzstu.ru',
	DateOfAdmissionToUniversity DATE,
	School VARCHAR(100),
	GroupId INT,
	FOREIGN KEY (GroupId) REFERENCES [Group](GroupId) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Award (
	AwardId INT IDENTITY(1,1) PRIMARY KEY,
	AwardName VARCHAR(100) NOT NULL
);

CREATE TABLE Grade (
	GradeId INT IDENTITY(1,1) PRIMARY KEY,
	GradeName VARCHAR(50) NOT NULL
);

CREATE TABLE TeacherDisciplineGroup (
	TeacherId INT,
	DisciplineId INT,
	GroupId INT,
	PRIMARY KEY (TeacherId, DisciplineId, GroupId),
	FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DisciplineId) REFERENCES Discipline(DisciplineId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (GroupId) REFERENCES [Group](GroupId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AwardStudent (
	AwardId INT,
	StudentId INT,
	DateOfDelivery DATE NOT NULL,
	PlaceOfDelivery VARCHAR(100),
	PRIMARY KEY (AwardId, StudentId),
	FOREIGN KEY (AwardId) REFERENCES Award(AwardId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (StudentId) REFERENCES Student(StudentId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Performance (
	DisciplineId INT,
	TeacherId INT,
	StudentId INT,
	GradeId INT,
	DateGrade DATE,
	PRIMARY KEY (DisciplineId, TeacherId, StudentId, GradeId),
	FOREIGN KEY (DisciplineId) REFERENCES Discipline(DisciplineId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (TeacherId) REFERENCES Teacher(TeacherId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (StudentId) REFERENCES Student(StudentId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (GradeId) REFERENCES Grade(GradeId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Hobbies (
	HobbieId INT IDENTITY(1,1) PRIMARY KEY,
	HobbieName VARCHAR(100) NOT NULL
);

CREATE TABLE HobbieStudent (
	HobbieId INT,
	StudentId INT,
	PRIMARY KEY (HobbieId, StudentId),
	FOREIGN KEY (HobbieId) REFERENCES Hobbies(HobbieId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (StudentId) REFERENCES Student(StudentId) ON DELETE CASCADE ON UPDATE CASCADE
);
