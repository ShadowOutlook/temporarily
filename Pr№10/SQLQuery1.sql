UPDATE Performance
SET Performance.GradeId = Performance.GradeId - 1
FROM Performance
				INNER JOIN Discipline ON Performance.DisciplineId = Discipline.DisciplineId
				INNER JOIN HobbieStudent ON Performance.StudentId = HobbieStudent.StudentId
				INNER JOIN Hobbies ON HobbieStudent.HobbieId = Hobbies.HobbieId
				INNER JOIN Grade ON Performance.GradeId = Grade.GradeId
WHERE Discipline.DisciplineName = 'Физика'
	  AND Hobbies.HobbieName = 'Бодибилдинг'
	  AND Grade.GradeName < 5;

ALTER TABLE Student ADD Expelled BIT;

UPDATE Student
SET Expelled = 1
WHERE DATEDIFF(YEAR, DateOfAdmissionToUniversity, GETDATE()) >= 5;

UPDATE Performance
SET DateGrade = GETDATE()
FROM Performance
				INNER JOIN Discipline ON Performance.DisciplineId = Discipline.DisciplineId
				INNER JOIN Student ON Performance.StudentId = Student.StudentId
				INNER JOIN [Group] ON Student.GroupId = [Group].GroupId
WHERE Discipline.DisciplineName = 'Математика' AND [Group].GroupName = 'ИАб-221'

ALTER TABLE Student ADD Characteristic VARCHAR(50);

UPDATE Student
SET Characterisitic = ISNULL(Characterisitic, '') + 'Старшекурсник'
WHERE YEAR(DateOfBirth) BETWEEN 1980 AND 2000;

UPDATE Student
SET Characteristic = 'Учащийся проявлял активность на занятиях, старательно выполнял домашние задания'
WHERE StudentId = 8;

UPDATE Student
SET Scholarship = Scholarship * 1.1
WHERE DateOfBirth = (SELECT MIN(DateOfBirth) FROM Student);

UPDATE Student
SET Scholarship = Scholarship + 1000
WHERE StudentId = 2 AND EXISTS (
	  SELECT 1
	  FROM HobbieStudent
						INNER JOIN Hobbies ON HobbieStudent.HobbieId = Hobbies.HobbieId
	  WHERE HobbieStudent.StudentId = Student.StudentId AND Hobbies.HobbieName = 'Танцы'
);

INSERT INTO Student (StudentSurname, StudentName, StudentPatronymic, DateOfBirth, HomeAdress, Email, DateOfAdmissionToUniversity, School, GroupId)
VALUES
('Кузнецова', 'Татьяна', 'Александровна', '2004-01-25', 'ул. Татьяны д.25', 'student25@kuzstu.ru', '2022-09-01', 'Школа №25', 1);

UPDATE Student
SET Scholarship = Scholarship + 500
WHERE StudentName = 'Татьяна' AND MONTH(GETDATE()) = 1 AND DAY (GETDATE()) = 25;

DELETE FROM Performance
WHERE GradeId = (SELECT GradeId FROM Grade WHERE GradeName = '3');

DELETE FROM Performance
WHERE StudentId IN (
	SELECT StudentId FROM Student WHERE StudentSurname LIKE 'A%'
);

DELETE FROM Student
WHERE DateOfBirth = (SELECT MIN(DateOfBirth) FROM Student);

DELETE FROM Discipline
WHERE DisciplineName = 'Математика';

DELETE FROM Student
WHERE YEAR(DateOfBirth) BETWEEN 1980 AND 2000;

DELETE FROM Student
WHERE Expelled = 1;

INSERT INTO Student (StudentSurname, StudentName, StudentPatronymic, DateOfBirth, HomeAdress, Email, DateOfAdmissionToUniversity, School, GroupId, Scholarship)
VALUES
('Воронов', 'Петр', 'Михайлович', '2006-03-11', 'г. Белово пр. Ленинградский д.99', 'student99@kuzstu.ru', '2023-09-01', 'Школа №99', 2, 4000),
('Семенов', 'Евгений', 'Васерманович', '2006-06-01', 'г. Белово ул. Сибиряков-Гвардейцев д.43', 'student34@kuzstu.ru', '2023-09-01', 'Школа №7', 2, 4000),
('Кондратьев', 'Алексей', 'Игоревич', '2006-08-09', 'г. Белово ул. Двужильного д.24', 'student6@kuzstu.ru', '2023-09-01', 'Школа №82', 2, 4000);