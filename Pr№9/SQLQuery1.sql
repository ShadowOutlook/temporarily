SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   [Group].GroupName AS ������
FROM Student INNER JOIN [Group]
ON Student.GroupId = [Group].[GroupId]
WHERE [Group].GroupName = '���-221';

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   Hobbies.HobbieName AS �����
FROM Student
			INNER JOIN HobbieStudent ON Student.StudentId = HobbieStudent.StudentId
			INNER JOIN Hobbies ON HobbieStudent.HobbieId = Hobbies.HobbieId
WHERE Hobbies.HobbieName IN ('������', '�����������');

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   Grade.GradeName AS ������
FROM Student
			INNER JOIN Performance ON Student.StudentId = Performance.StudentId
			INNER JOIN Discipline ON Performance.DisciplineId = Discipline.DisciplineId
			INNER JOIN Grade ON Performance.GradeId = Grade.GradeId
WHERE Discipline.DisciplineId = 2;

INSERT INTO AwardStudent (AwardId, StudentId, DateOfDelivery, PlaceOfDelivery) VALUES (2, 8, GETDATE(), '�����������');

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   HomeAdress AS �������������
FROM Student
			INNER JOIN AwardStudent ON Student.StudentId = AwardStudent.StudentId
			INNER JOIN Award ON AwardStudent.AwardId = Award.AwardId
WHERE AwardStudent.DateOfDelivery = CONVERT(DATE, GETDATE());

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   COUNT(Performance.GradeId) AS ����������5
FROM Student INNER JOIN Performance ON Student.StudentId = Performance.StudentId
WHERE Performance.GradeId = 1
GROUP BY StudentSurname, StudentName, StudentPatronymic;

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   COUNT(AwardStudent.AwardId) AS ����������_������
FROM Student
			INNER JOIN HobbieStudent ON Student.StudentId = HobbieStudent.StudentId
			INNER JOIN AwardStudent ON Student.StudentId = AwardStudent.StudentId
WHERE HobbieStudent.HobbieId = 2
GROUP BY StudentSurname, StudentName, StudentPatronymic;

SELECT [Group].GroupName AS ������,
	   SUM(Scholarship) AS �������������
FROM Student
			INNER JOIN [Group] ON Student.GroupId =  [Group].GroupId
GROUP BY [Group].GroupName;

SELECT [Group].GroupName AS ������,
	   COUNT(StudentId) AS �������������������
FROM Student
			INNER JOIN [Group] ON Student.GroupId = [Group].GroupId
GROUP BY [Group].GroupName;

SELECT CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   Discipline.DisciplineName AS �������,
	   AVG(CAST(Grade.GradeName AS FLOAT)) AS ������
FROM Student
			INNER JOIN Performance ON Student.StudentId = Performance.StudentId
			INNER JOIN Discipline ON Discipline.DisciplineId = Performance.DisciplineId
			INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
GROUP BY StudentSurname, StudentName, StudentPatronymic, DisciplineName
HAVING AVG(CAST(Grade.GradeName AS FLOAT)) < 4;

SELECT TOP 1
	   CONCAT(StudentSurname, ' ', StudentName, ' ', StudentPatronymic) AS ���,
	   AVG(CAST(Grade.GradeName AS FLOAT)) AS �����������
FROM Student
			INNER JOIN Performance ON Student.StudentId = Performance.StudentId
			INNER JOIN Grade ON Grade.GradeId = Performance.GradeId
GROUP BY StudentSurname, StudentName, StudentPatronymic
ORDER BY AVG(CAST(Grade.GradeName AS FLOAT)) ASC;