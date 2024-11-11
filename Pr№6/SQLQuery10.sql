SELECT StudentSurname AS Фамилия, StudentName AS Имя
FROM Student
WHERE MONTH(DateOfBirth) = 5;