CREATE NONCLUSTERED INDEX IX_StudentSecondName
ON Student (StudentSurname);

CREATE NONCLUSTERED INDEX IX_DateGrade
ON Performance (DateGrade);

CREATE NONCLUSTERED INDEX IX_DsiciplineName
ON Discipline (DisciplineName);

CREATE NONCLUSTERED INDEX IX_GroupName
ON [GROUP] (GroupName);

SET SHOWPLAN_ALL ON;

SET SHOWPLAN_ALL OFF;

SELECT StudentSurname FROM Student WHERE StudentSurname = 'Стинтлеров';

SELECT DateGrade FROM Performance WHERE DateGrade = '14.11.2024';

SELECT DisciplineName FROM Discipline WHERE DisciplineName = 'Физика';

SELECT GroupName FROM [Group] WHERE GroupName = 'ИАб-221';

SET QUOTED_IDENTIFIER ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET ANSI_NULLS ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET NUMERIC_ROUNDABORT OFF;

CREATE VIEW ViewGoToExam
WITH SCHEMABINDING
AS
SELECT
    Performance.DateGrade,
    Student.StudentSurname,
    Student.StudentName,
    Student.StudentPatronymic,
    Grade.GradeName,
    Discipline.DisciplineName,
    COUNT_BIG(*) AS [RowCount]
FROM dbo.Performance
    INNER JOIN dbo.Student ON Performance.StudentId = Student.StudentId
    INNER JOIN dbo.Grade ON Performance.GradeId = Grade.GradeId
    INNER JOIN dbo.Discipline ON Performance.DisciplineId = Discipline.DisciplineId
GROUP BY
    Performance.DateGrade,
    Student.StudentSurname,
    Student.StudentName,
    Student.StudentPatronymic,
    Grade.GradeName,
    Discipline.DisciplineName;

DROP VIEW ViewGoToExam;

SELECT 
    v.name AS ViewName, 
    i.name AS IndexName
FROM sys.views v
JOIN sys.indexes i ON v.object_id = i.object_id
WHERE v.name = 'ViewGoToExam';

CREATE UNIQUE CLUSTERED INDEX IX_ViewGoToExam
ON ViewGoToExam (DateGrade, StudentSurname, StudentName, StudentPatronymic, GradeName, DisciplineName);

DROP INDEX IX_ViewGoToExam ON ViewGoToExam;
DROP INDEX IX_DateGrade ON Performance;

CREATE NONCLUSTERED INDEX IX_DateGrade_View
ON ViewGoToExam (DateGrade)
INCLUDE (StudentSurname, StudentName, StudentPatronymic, GradeName, DisciplineName);

DROP INDEX IX_DateGrade_View ON ViewGoToExam;

SELECT StudentSurname, StudentName, StudentPatronymic, GradeName, DisciplineName
FROM ViewGoToExam
WHERE DateGrade BETWEEN '2024-01-01' AND '2024-12-12';

CREATE NONCLUSTERED INDEX IX_StudentName_AvgGrade
ON ViewGoToExam (StudentSurname, StudentName, StudentPatronymic);

SELECT StudentSurname, StudentName, StudentPatronymic, AVG(GradeName) AS СреднийБалл
FROM ViewGoToExam
GROUP BY StudentSurname, StudentName, StudentPatronymic;
