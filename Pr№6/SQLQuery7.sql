SELECT p.StudentId, s.StudentSurname, s.StudentName, g.GradeName, d.DisciplineName
FROM Performance p
JOIN Grade g ON p.GradeId = g.GradeId
JOIN Student s ON p.StudentId = s.StudentId
JOIN Discipline d ON p.DisciplineId = d.DisciplineId
WHERE p.DisciplineId = 2;