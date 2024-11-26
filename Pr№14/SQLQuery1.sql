--������� �1

SELECT @@SERVERNAME AS [��� ���������� �������], @@VERSION AS [������ SQL Server]

--������� �2

USE IAb221_SabirovU;
GO
DECLARE @EventDate DATE = '2024-11-22';
DECLARE @EventCount INT;

SELECT @EventCount = COUNT(*)
From Performance
WHERE DateGrade = @EventDate;

IF @EventCount > 30
	PRINT '���������� ����������� ��������� 30.';
ELSE
	PRINT '���������� ����������� �� ��������� 30.';

--������� �3

DECLARE @LowestStudentId INT;

SELECT TOP 1 @LowestStudentId = Student.StudentId
FROM Student
	INNER JOIN Performance ON Student.StudentId = Performance.StudentId
	INNER JOIN Discipline ON Discipline.DisciplineId = Performance.DisciplineId
	INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
GROUP BY Student.StudentId
ORDER BY AVG(Grade.GradeName);

UPDATE Student
SET Characteristic = '�� �������� � ��������'
WHERE StudentId = @LowestStudentId;

PRINT '�������������� �������� � ID ' + CAST(@LowestStudentId AS NVARCHAR) + ' ���������.';

--������� �4

WAITFOR TIME '16:26:30'
PRINT '��� ����������� ����� �����!';

--������� �5

DECLARE @GradeCounts TABLE (GradeName NVARCHAR(10), GradeCount INT);

INSERT INTO @GradeCounts
SELECT GradeName, COUNT(*)
FROM Student
	INNER JOIN Performance ON Student.StudentId = Performance.StudentId
	INNER JOIN Discipline ON Discipline.DisciplineId = Performance.DisciplineId
	INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
GROUP BY Grade.GradeName;

DECLARE @MaxGradeName NVARCHAR(10);
SELECT TOP 1 @MaxGradeName = GradeName
FROM @GradeCounts
ORDER BY GradeCount DESC;

PRINT '������ ����� � ��������� ������: ' + @MaxGradeName;

--SELECT GradeName AS [�������� ������], GradeCount AS [���-�� ������] FROM @GradeCounts;

--������� �6

DECLARE @ScholarshipChanges TABLE (StudentId INT, [���] VARCHAR(255), [������ ���������] INT, [����� ���������] INT);

INSERT INTO @ScholarshipChanges
SELECT StudentId, CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic), Scholarship, Scholarship
FROM Student;

DECLARE @StudentId INT;
DECLARE @Grade5Count INT;
DECLARE @Grade4Count INT;
DECLARE @Grade3Count INT;
DECLARE @Grade2Count INT;

DECLARE @Students TABLE (StudentId INT);

INSERT INTO @Students
SELECT DISTINCT StudentId
FROM Performance;

WHILE EXISTS (SELECT 1 FROM @Students)
BEGIN
	SELECT TOP 1 @StudentId = StudentId FROM @Students;

	SELECT
		@Grade5Count = SUM(CASE WHEN GradeName = '5' THEN 1 ELSE 0 END),
		@Grade4Count = SUM(CASE WHEN GradeName = '4' THEN 1 ELSE 0 END),
		@Grade3Count = SUM(CASE WHEN GradeName = '3' THEN 1 ELSE 0 END),
		@Grade2Count = SUM(CASE WHEN GradeName = '2' THEN 1 ELSE 0 END)
	FROM Performance
		INNER JOIN Student ON Student.StudentId = Performance.StudentId
		INNER JOIN Discipline ON Discipline.DisciplineId = Performance.DisciplineId
		INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
	WHERE Performance.StudentId = @StudentId
		AND MONTH(DateGrade) = MONTH(GETDATE())
		AND YEAR(DateGrade) = YEAR(GETDATE());
	IF @Grade5Count > 1 AND @Grade4Count = 0 AND @Grade3Count = 0 AND @Grade2Count = 0
	BEGIN
		UPDATE Student
		SET Scholarship = Scholarship * 1.05
		WHERE StudentId = @StudentId;
	END
	ELSE IF @Grade5Count > 0 AND @Grade4Count <= 5 AND @Grade3Count = 0 AND @Grade2Count = 0
	BEGIN
		UPDATE Student
		SET Scholarship = Scholarship * 1.03
		WHERE StudentId = @StudentId;
	END

	DELETE FROM @Students WHERE StudentId = @StudentId;
END;

UPDATE sc
SET [����� ���������] = Scholarship
FROM @ScholarshipChanges sc
	JOIN Student s ON sc.StudentId = s.StudentId;

SELECT * FROM @ScholarshipChanges;