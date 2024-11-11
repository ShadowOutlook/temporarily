SELECT StudentSurname, StudentName, StudentPatronymic
FROM Student
WHERE YEAR(DateOfBirth) BETWEEN 1980 AND 1995
ORDER BY StudentSurname ASC;