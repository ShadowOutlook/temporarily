CREATE VIEW StudentsMathExam AS
SELECT
	Student.StudentId,
	CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	Performance.DateGrade,
	Grade.GradeName
FROM Performance
				INNER JOIN Student ON Performance.StudentId = Student.StudentId
				INNER JOIN Discipline ON Performance.DisciplineId = Discipline.DisciplineId
				INNER JOIN Grade ON Performance.GradeId = Grade.GradeId
WHERE Discipline.DisciplineName = '����������' AND Performance.DateGrade = '2024-06-20';

SELECT * FROM StudentsMathExam;

CREATE VIEW StudentTotalScholarship AS
SELECT
	Student.StudentId,
	CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	SUM(Student.Scholarship) AS TotalScholarship
FROM Student
WHERE Student.StudentId = 1
GROUP BY Student.StudentId, Student.StudentSurname, Student.StudentName, Student.StudentPatronymic;

SELECT * FROM StudentTotalScholarship;

CREATE VIEW ActiveStudents AS
SELECT
	Student.StudentId,
	Student.StudentSurname,
	Student.StudentName,
	Student.Scholarship
FROM Student
WHERE Scholarship > 0;

INSERT INTO ActiveStudents (StudentId, StudentSurname, StudentName, Scholarship)
VALUES (101, '������', '������', 0);

INSERT INTO ActiveStudents (StudentId, StudentSurname, StudentName, Scholarship)
VALUES (102, 'C���������', '������', 1941);

SELECT * FROM ActiveStudents;

SELECT * FROM Student;

CREATE VIEW ActiveScholarshipStudents AS
SELECT
	Student.StudentId,
	Student.StudentSurname,
	Student.StudentName,
	Student.Scholarship
FROM Student
WHERE Scholarship > 0
WITH CHECK OPTION;

INSERT INTO ActiveScholarshipStudents (StudentId, StudentSurname, StudentName, Scholarship)
VALUES
(201, '��������', '����', 0);

INSERT INTO ActiveScholarshipStudents (StudentId, StudentSurname, StudentName, Scholarship)
VALUES
(277, '��������', '����', 7777);