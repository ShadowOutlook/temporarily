SELECT DisciplineId, COUNT(GradeId) AS  оличествоќценок
FROM Performance
GROUP BY DisciplineId;