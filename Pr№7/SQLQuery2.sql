SELECT COUNT(*) AS КоличествоМероприятий
FROM Performance
WHERE DateGrade = CONVERT(DATE, GETDATE());