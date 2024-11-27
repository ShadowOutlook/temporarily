--������� 1

CREATE PROCEDURE GetStudentHobbie
	@StudentSurname NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT 1
		FROM Student
		WHERE StudentSurname = @StudentSurname
	)
	BEGIN
		PRINT '������� � ��������� �������� �� ������';
		RETURN;
	END

	SELECT
		CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
		Hobbies.HobbieName AS �����
	FROM Student
		INNER JOIN HobbieStudent ON Student.StudentId = HobbieStudent.StudentId
		INNER JOIN Hobbies ON Hobbies.HobbieId = HobbieStudent.HobbieId
	WHERE Student.StudentSurname = @StudentSurname;
END;

DROP PROCEDURE GetStudentHobbie;

EXEC GetStudentHobbie @StudentSurname = '���������';

SELECT name, object_id, create_date, modify_date
FROM sys.procedures;

--������� 2

CREATE PROCEDURE ExaminationReport
	@GroupName NVARCHAR(50), @DisciplineName NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF NOT EXISTS (
		SELECT 1
		FROM [Group]
		WHERE [Group].GroupName = @GroupName
	)
	BEGIN
		PRINT '������ � ��������� ��������� �� �������';
		RETURN
	END

	SELECT
		ROW_NUMBER() OVER (ORDER BY StudentSurname, StudentName) AS [�����������],
		GroupName AS [�������� ������],
		DisciplineName AS [�������� ����������],
		DateGrade AS [����],
		CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS [���],
		GradeName AS [������]
	FROM Student
		INNER JOIN Performance ON Student.StudentId = Performance.StudentId
		INNER JOIN Discipline ON Discipline.DisciplineId = Performance.DisciplineId
		INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
		INNER JOIN [Group] ON [Group].GroupId = Student.GroupId
	WHERE [Group].GroupName = @GroupName
		AND Discipline.DisciplineName = @DisciplineName
END;

DROP PROCEDURE ExaminationReport;

EXEC ExaminationReport @GroupName = '���-221', @DisciplineName = '����������';