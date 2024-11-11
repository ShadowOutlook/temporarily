SELECT COUNT(*) AS КоличествоСтудентов
FROM Student
WHERE YEAR(DateOfBirth) BETWEEN 1995 AND 1999
	AND HomeAdress LIKE '%Кемерово%';