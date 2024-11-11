SELECT YEAR(DateOfAdmissionToUniversity) AS ГодПоступления, COUNT(*) AS КоличествоСтудентов
FROM Student
GROUP BY YEAR(DateOfAdmissionToUniversity)
HAVING COUNT(*) < 1000;